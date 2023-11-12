import { A, D } from "@mobily/ts-belt";

const scripts = {
  lint: [
    "cspell . --no-progress --no-summary --dot --unique",
    "eslint --ext .ts --fix",
    "tsc --noEmit",
    "trufflehog3",
  ],
  format: ["prettier . --write --loglevel warn"],
  start: ["spago run"],
  test: ["spago test"],
};

export default {
  scripts: D.map(scripts, A.join(" && ")),
  options: { scripts: false },
};
