const models = require("../../database/models");
const { Storage } = require("@google-cloud/storage");
const { v4: uuidv4 } = require('uuid');


let projectId = "red-seeker-365622"; // Google Cloud
let keyFilename = "red-seeker-365622-b037b7220de8.json"; // Google Cloud -> Credentials -> Service Accounts
const storage = new Storage({
  projectId,
  keyFilename,
});
const bucket = storage.bucket("comunidadstorage"); // Cloud -> Storage

async function renameFile(srcFileName, destFileName) {
  await bucket.file(srcFileName).rename(destFileName);
  console.log(
    `${srcFileName} renamed to ${destFileName}`
  )};

export const uploadCV = async (req, res) => {
  try {
    if (req.file) {
      const originalName = req.file.originalname;
      const uuidName = uuidv4();
      const blob = bucket.file(originalName);
      const blobStream = blob.createWriteStream();
      const extension = originalName.split('.',2);
      const newFullNameFile = uuidName.concat('.', extension[1]);
      const mimeType = req.file.mimetype;
      const id = req.headers.id
      
      blobStream.on("finish", () => {
        res.status(200).send("Success");
        console.log("Success");
      });
      blobStream.end(req.file.buffer);
      setTimeout(() => {
      renameFile(originalName, newFullNameFile); }, 5000);
      updateCv(id,mimeType,newFullNameFile);
    } else throw "algun error con la subida de archivo";
  }catch (error) {
    res.status(500).send(error);
  }
};

export const uploadLogo = async (req, res) => {
  try {
    if (req.file) {
      const originalName = req.file.originalname;
      const uuidName = uuidv4();
      const blob = bucket.file(originalName);
      const blobStream = blob.createWriteStream();
      const extension = originalName.split('.',2);
      const newFullNameFile = uuidName.concat('.', extension[1]);
      const mimeType = req.file.mimetype;
      const id = req.headers.id
      
      blobStream.on("finish", () => {
        res.status(200).send("Success");
        console.log("Success");
      });
      blobStream.end(req.file.buffer);
      setTimeout(() => {
      renameFile(originalName, newFullNameFile); }, 5000);
      updateLogo(id,mimeType,newFullNameFile);
    } else throw "algun error con la subida de archivo";
  }catch (error) {
    res.status(500).send(error);
  }
};

export const uploadFoto = async (req, res) => {
  try {
    if (req.file) {
      const originalName = req.file.originalname;
      const uuidName = uuidv4();
      const blob = bucket.file(originalName);
      const blobStream = blob.createWriteStream();
      const extension = originalName.split('.',2);
      const newFullNameFile = uuidName.concat('.', extension[1]);
      const mimeType = req.file.mimetype;
      const id = req.headers.id
      
      blobStream.on("finish", () => {
        res.status(200).send("Success");
        console.log("Success");
      });
      blobStream.end(req.file.buffer);
      setTimeout(() => {
      renameFile(originalName, newFullNameFile); }, 5000);
      updateFoto(id,mimeType,newFullNameFile);
    } else throw "algun error con la subida de archivo";
  }catch (error) {
    res.status(500).send(error);
  }
};


async function fetchFileFromGoogleStorage(fileName) {
  const fileObject = bucket.file(fileName);
  const fileContents = await fileObject.download();
  return fileContents[0];
};

export const getFiles = async (req, res) => {
  let fileName = req.body.fileName;
  let type = req.body.type;
  const downloadedImageFile = await fetchFileFromGoogleStorage(fileName);
  res.status(200);
  res.type(type);
  res.send(downloadedImageFile);
};

//Con esto actualizamos la foto 
const updateFoto = (id, mimeType, nombreFoto) => {
  const foto = mimeType.concat('|', nombreFoto);

  models.postulantes.update(
    { foto: foto },
    {
      where: {
        id: id,
      },
    }
  );
};

//Con esto actualizamos el CV
const updateCv = (id, mimeType, nombreCv) => {
  const cv = mimeType.concat('|', nombreCv);

  models.postulantes.update(
    { cv: cv },
    {
      where: {
        id: id,
      },
    }
  );
};

//Con esto actualizamos el Logo
const updateLogo = (id, mimeType, nombreLogo) => {
  const logo = mimeType.concat('|', nombreLogo);

  models.empresas.update(
    { logo: logo },
    {
      where: {
        id: id,
      },
    }
  );
};