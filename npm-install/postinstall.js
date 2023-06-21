import { createWriteStream } from "fs";
import * as fs from "fs/promises";
import fetch from "node-fetch";
import { pipeline } from "stream/promises";
import tar from "tar";

import { CONFIG } from "./config.js";
import getReleaseInfo from "./getReleaseInfo.js";

async function install() {
  const packageJson = await fs.readFile("package.json").then(JSON.parse);
  let version = packageJson.version;

  if (typeof version !== "string") {
    throw new Error("Missing version in package.json");
  }

  if (version[0] === "v") version = version.slice(1);

  // Fetch Static Config
  let { name: binName, path: binPath } = CONFIG;
  const { url } = await getReleaseInfo();
  console.log(url);
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error("Failed fetching the binary: " + response.statusText);
  }

  const tarFile = "downloaded.tar.gz";

  await fs.mkdir(binPath, { recursive: true });
  await pipeline(response.body, createWriteStream(tarFile));
  await tar.x({ file: tarFile, cwd: binPath });
  await fs.rm(tarFile);
}

install()
  .then(async () => {
    process.exit(0);
  })
  .catch(async (err) => {
    console.error(err);
    process.exit(1);
  });
