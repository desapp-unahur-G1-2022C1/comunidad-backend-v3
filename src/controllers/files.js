const models = require("../../database/models");
const fs = require("fs");

export const uploadLogo = async (req, res) => {
  try {
    if (req.file) {
      const fileName = req.file.filename;
      const id = req.headers.id
      updateLogo(id,fileName);
      res.status(200).send("Success");
    } else throw "algun error con la subida de archivo";
  }catch (error) {
    res.status(500).send(error);
  }
};

export const uploadFoto = async (req, res) => {
  try {
    if (req.file) {
      const fileName = req.file.filename;
      const id = req.headers.id
      updateFoto(id,fileName);
      res.status(200).send("Success");
    } else throw "algun error con la subida de archivo";
  }catch (error) {
    res.status(500).send(error);
  }
};

export const uploadCV = async (req, res) => {
  try {
    if (req.file) {
      const fileName = req.file.filename;
      const id = req.headers.id
      updateCV(id,fileName);
      res.status(200).send("Success");
    } else throw "algun error con la subida de archivo";
  }catch (error) {
    res.status(500).send(error);
  }
};

export const getFiles = async (req, res) => {
  try {
    let fileName = req.headers.file;
    console.log("este es el file", fileName);
    const downloadedImageFile = fs.createReadStream(
      `./files/${fileName}`,
    );
    res.status(200);
    res.attachment(fileName);
    downloadedImageFile.pipe(res);
  } catch (error) {
    res.status(500).send(error);
  }
};

//Con esto actualizamos la foto 
const updateFoto = (id, nombreFoto) => {
  models.postulantes.update(
    { foto: nombreFoto },
    {
      where: {
        id: id,
      },
    }
  );
};

//Con esto actualizamos el CV
const updateCV = (id, nombreCv) => {

  models.postulantes.update(
    { cv: nombreCv },
    {
      where: {
        id: id,
      },
    }
  );
};

//Con esto actualizamos el Logo
const updateLogo = (id, nombreLogo) => {

  models.empresas.update(
    { logo: nombreLogo },
    {
      where: {
        id: id,
      },
    }
  );
};