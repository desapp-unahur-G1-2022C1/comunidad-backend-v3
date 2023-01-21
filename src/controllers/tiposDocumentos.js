const models = require("../../database/models");


//get de tipos_documentos
export const getAll = async (req, res) => {

  models.tipos_documentos
    .findAll({
        attributes: ["id","tipo_documento"]
    }).then(tipos_documentos => res.send({
      tipos_documentos
      
    })).catch(() => res.sendStatus(500));
};