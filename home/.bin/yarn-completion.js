#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

if (!process.argv[2]) {
    return;
}

const packagePath = path.join(process.argv[2], "package.json");

try {
    const packageContent = JSON.parse(fs.readFileSync(packagePath, "utf8"));

    if (packageContent.scripts) {
        process.stdout.write(Object.keys(packageContent.scripts).join(' '));
    }
}
catch (e) {}
