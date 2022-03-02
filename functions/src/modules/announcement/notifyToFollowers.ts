import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import {PubSub} from "@google-cloud/pubsub";
import {generateMessage, AnnouncementEvent} from "./event";
import {User} from "../../type";

type ResultType = {
  status: boolean;
  error: string | null;
};

export const notifyToFollowers = functions.https.onCall(
    async (data, context): Promise<ResultType> => {
      try {
        if (!context.auth) {
          return {
            status: false,
            error: "auth required",
          };
        }

        const userId: string = data.userId;
        const _event = data.announcementEvent;

        if (userId == null || _event == null) {
          return {
            status: false,
            error: "parameters required",
          };
        }

        let announcementEvent: AnnouncementEvent;
        try {
          announcementEvent = _event;
        } catch (e) {
          return {
            status: false,
            error: "event conversion failed",
          };
        }

        const db = admin.firestore();
        const pubsub = new PubSub();
        const notifyToFollowersTopic = pubsub.topic("notify-to-followers");
        const doc = await db.collection("users")
            .doc(userId)
            .get();

        const user = doc.data();
        if (!doc.exists || user == null) {
          return {
            status: false,
            error: "user not found",
          };
        }

        for (const followerId of user.followedBy) {
          const json = {
            userId: userId,
            user: user,
            followerId: followerId,
            announcementEvent: announcementEvent,
          };
          await notifyToFollowersTopic.publishMessage({json});
        }

        return {
          status: true,
          error: "",
        };
      } catch (e) {
        functions.logger.error(e);
        return {
          status: false,
          error: "Something went wrong",
        };
      }
    });

export const notifyToFollowersPubSub = functions.pubsub
    .topic("notify-to-followers").onPublish(
        async (message) => {
          try {
            const userId: string = message.json["userId"];
            const user: User = message.json["user"];
            const followerId: string = message.json["followerId"];
            const announcementEvent: AnnouncementEvent =
      message.json["announcementEvent"];

            const announcementMessage =
                generateMessage(user, announcementEvent);

            const db = admin.firestore();
            await db.collection("users")
                .doc(followerId)
                .collection("announcements")
                .add({
                  message: announcementMessage,
                  userId: userId,
                  announceEvent: announcementEvent,
                  createdAt: admin.firestore.FieldValue.serverTimestamp(),
                });
          } catch (e) {
            functions.logger.error(e);
          }
        });
