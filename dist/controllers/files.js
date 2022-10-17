"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.uploadFiles = void 0;

const {
  Storage
} = require("@google-cloud/storage");

let projectId = "red-seeker-365622"; // Get this from Google Cloud

let keyFilename = "../../red-seeker-365622-b037b7220de8.json"; // Get this from Google Cloud -> Credentials -> Service Accounts

const storage = new Storage({
  projectId,
  keyFilename
});
const bucket = storage.bucket("comunidadstorage"); // Get this from Google Cloud -> Storage

const uploadFiles = (req, res) => {
  console.log("Made it /upload");

  try {
    if (req.file) {
      console.log("File found, trying to upload...");
      const blob = bucket.file(req.file.originalname);
      console.log("esto es lo que pasa como imagen", req.file.originalname);
      const blobStream = blob.createWriteStream();
      blobStream.on("finish", () => {
        res.status(200).send("Success");
        console.log("Success");
      });
      blobStream.end(req.file.buffer);
    } else throw "error with img";
  } catch (error) {
    res.status(500).send(error);
  }
};

exports.uploadFiles = uploadFiles;
//# sourceMappingURL=files.js.map