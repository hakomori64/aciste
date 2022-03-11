const stringToEnum = <T extends string>(o: T[]): {[K in T]: K} => {
  return o.reduce((accumulator, currentValue) => {
    accumulator[currentValue] = currentValue;
    return accumulator;
  }, Object.create(null));
};

export const AnnouncementEvent = stringToEnum([
  "itemCreate",
  "other",
]);

export type AnnouncementEvent = keyof typeof AnnouncementEvent;
