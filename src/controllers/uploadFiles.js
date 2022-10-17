const { Storage } = require("@google-cloud/storage");

let projectId = "red-seeker-365622"; // Google Cloud
let keyFilename = "red-seeker-365622-b037b7220de8.json"; // Google Cloud -> Credentials -> Service Accounts
const storage = new Storage({
  projectId,
  keyFilename,
});
const bucket = storage.bucket("comunidadstorage"); // Cloud -> Storage

export const uploadFiles = (req, res) => {
  try {
    if (req.file) {
      console.log("Se encontro el archivo");
      const blob = bucket.file(req.file.originalname);
      console.log("esto es lo que pasa como archivo", req.file.originalname);
      const blobStream = blob.createWriteStream();
      blobStream.on("finish", () => {
        res.status(200).send("Success");
        console.log("Success");
      });
      blobStream.end(req.file.buffer);
    } else throw "algun error con la subida de archivo";
  } catch (error) {
    res.status(500).send(error);
  }
};
