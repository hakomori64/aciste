import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import {AnnouncementEvent} from "./event";

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
        const message: string = data.message;

        if (userId == null || _event == null || message == null) {
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

        await db.collection("users").doc(userId).collection("announcements")
            .add({
              message: message,
              userId: userId,
              announceEvent: announcementEvent,
              createdAt: admin.firestore.FieldValue.serverTimestamp(),
            });

        // TODO(hakomori64)
        // followedByに通知を送る

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
