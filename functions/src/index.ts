import * as admin from "firebase-admin";

admin.initializeApp();

export {
  notifyToFollowers,
  notifyToFollowersPubSub,
} from "./modules/announcement";
