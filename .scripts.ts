import { A, D } from "@mobily/ts-belt";

const scripts = {
  lint: [
    "cspell . --no-progress --no-summary --dot --unique",
    "eslint --ext .ts --fix",
    "tsc --noEmit",
    "trufflehog3",
  ],
  format: [
    "purs-tidy format-in-place src test",
    "prettier . --write --loglevel warn",
  ],
};

export default {
  scripts: D.map(scripts, A.join(" && ")),
  options: { scripts: false },
};
