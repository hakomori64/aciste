import * as admin from "firebase-admin";

admin.initializeApp();

export {
  notifyToFollowers,
} from "./modules/announcement";
