const models = require("../../database/models");

export const getAll = async (req, res) => {

  models.contratos
    .findAll({
        attributes: ["id","nombre_contrato"]
    }).then(contratos => res.send({
      contratos
      
    })).catch(() => res.sendStatus(500));
};