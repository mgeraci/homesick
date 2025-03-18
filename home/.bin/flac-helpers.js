const execSync = require('child_process').execSync;

const checkForMetaFlac = () => {
  try {
    execSync("which metaflac");
  }
  catch(err) {
    console.log("This script requires the `metaflac` package; install it with `brew install flac`.");
    process.exit(1);
  }
};

const escapeFilename = (filename) => {
  return filename
    .replace(/ /g, "\\ ")
    .replace(/'/g, "\\'")
    .replace(/&/g, "\\&")
    .replace(/;/g, "\\;")
    .replace(/\</g, "\-")
    .replace(/\>/g, "\-")
    .replace(/\./g, "\\.")
    .replace(/\$/g, "\\$")
    .replace(/\(/g, "\\(")
    .replace(/\)/g, "\\)")
    .replace(/\|/g, "\\|");
};

const getTagFromFile = (tag, file) => {
  return execSync(`metaflac --show-tag=${tag} ${file}`)
      .toString()
      .trim()
      .replace(/^.+=/, '') // remove the tag, format: ARTIST=Deerhoof
      .replace('/', '-'); // remove invalid filename characters
};

module.exports = {
	checkForMetaFlac,
	escapeFilename,
	getTagFromFile
}
