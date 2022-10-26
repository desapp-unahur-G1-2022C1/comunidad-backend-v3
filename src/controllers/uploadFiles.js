const { Storage } = require("@google-cloud/storage");
const { v4: uuidv4 } = require('uuid');


let projectId = "red-seeker-365622"; // Google Cloud
let keyFilename = "red-seeker-365622-b037b7220de8.json"; // Google Cloud -> Credentials -> Service Accounts
const storage = new Storage({
  projectId,
  keyFilename,
});
const bucket = storage.bucket("comunidadstorage"); // Cloud -> Storage



//storage.bucket(srcBucketName).file(srcFileName).rename(destFileName);


export const uploadFiles = (req, res) => {
  try {
    if (req.file) {
      console.log("Se encontro el archivo");
      const uuidName = uuidv4();
      console.log("aca imprimo el uuid", uuidName)
      const blob = bucket.file(req.file.originalname);
      //const blob = bucket.file(req.file.originalname)
      console.log("aca imprimo el bucket", blob);

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
