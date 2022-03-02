import {User} from "../../type";

const stringToEnum = <T extends string>(o: T[]): {[K in T]: K} => {
  return o.reduce((accumulator, currentValue) => {
    accumulator[currentValue] = currentValue;
    return accumulator;
  }, Object.create(null));
};

export const AnnouncementEvent = stringToEnum([
  "itemCreate",
]);

export type AnnouncementEvent = keyof typeof AnnouncementEvent;

export const generateMessage =
    (
        user: User,
        announcementEvent: AnnouncementEvent): string => {
      const userName = user.displayName !== "" ? user.displayName : "ゲスト";
      const messages: { [key in AnnouncementEvent] : string[] } = {
        itemCreate: [
          `${userName}さんが新しいアイテムを作成しました！宝探しの始まりだ！`,
          `${userName}さんが新しいアイテムを作成しました！${userName}さんの１番になりましょう！`,
        ],
      };

      const candidate = messages[announcementEvent];
      const message = candidate[Math.floor(Math.random() * candidate.length)];

      return message;
    };
