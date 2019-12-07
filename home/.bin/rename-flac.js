#!/usr/bin/env node

const execSync = require("child_process").execSync;
const existsSync = require("fs").existsSync;
const readdirSync = require("fs").readdirSync;
const readline = require("readline");


// constants
// ----------------------------------------------------------------------------

const tags = {
  artist: 'ARTIST',
  year: 'DATE',
  album: 'ALBUM',
  trackNumber: 'TRACKNUMBER',
  title: 'TITLE',
};

const answers = new Set([
  'y',
  'yes',
  'Yes',
  'YES',
]);


// helpers
// ----------------------------------------------------------------------------

const checkForMetaflac = () => {
  try {
    execSync("which metaflac");
  }
  catch(err) {
    console.log("This script requires the `metaflac` package; install it with `brew install flac`.");
    process.exit(1);
  }
};

const getTargetFolder = () => {
  const scriptDir = process.argv[1].replace(/[^\/]+$/, '');
  const userDir = process.argv[2];

  if (!userDir) {
    console.error('You must pass a directory as the first argument.');
    process.exit(1);
  }

  const dir = userDir.indexOf("/") === 0
    ? userDir
    : `${scriptDir}${userDir}`;

  console.log(`Looking for flac files in ${dir}`);

  if (!existsSync(dir)) {
    console.error('Error: that directory does not exist.');
    process.exit(1);
  }

  return dir;
};

const getFilenameFromFlac = (inputFile) => {
  const res = {};

  Object.keys(tags).forEach((key) => {
    const tagName = tags[key];
    const tag = execSync(`metaflac --show-tag=${tagName} ${inputFile}`)
      .toString()
      .trim()
      .replace(/^.+=/, '');

    res[key] = tag;
  });

  return `${res.artist} - ${res.year} - ${res.album} - ${res.trackNumber} - ${res.title}.flac`;
};

const prepFilenameForCommand = (dir, file) => {
  return `${dir}/${file}`.replace(/ /g, "\\ ");
};

const renameFiles = (dir, files) => {
  console.log('\nRenaming...');

  files.forEach((fileTuple) => {
    const cmd = [
      'mv',
      prepFilenameForCommand(dir, fileTuple[0]),
      prepFilenameForCommand(dir, fileTuple[1]),
    ].join(' ');

    execSync(cmd);
  });

  console.log('Done!');
  process.exit(0);
};


// script
// ----------------------------------------------------------------------------

checkForMetaflac();

const renameStorage = [];
const dir = getTargetFolder();
const files = readdirSync(dir)
  .filter((file) => file.indexOf('.flac') > 0);

files.forEach((file) => {
  const preparedFile = `${dir}/${file}`.replace(/ /g, "\\ ");
  const newName = getFilenameFromFlac(
    prepFilenameForCommand(dir, file)
  );
  renameStorage.push([file, newName])
});

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

console.log("\nHere are the proposed file names:");
console.log(renameStorage.map((item) => item[1]));

rl.question("\nWould you like to rename them? [y/n] ", (answer) => {
  if (answers.has(answer)) {
    renameFiles(dir, renameStorage);
  } else {
    console.log("No action taken.");
  }

  rl.close();
  process.exit(0);
});
