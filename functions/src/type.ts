/**
 * Userの型を表すタイプです
 */
export type User = {
  backgroundImageUrl: string;
  bio: string;
  displayName: string;
  email: string;
  followedBy: string[];
  following: string[];
  photoUrl: string;
}
