const models = require("../../database/models");

export const getAll = async (req, res) => {

  models.estudios
    .findAll({
        attributes: ["id","nombre_estudio","estado_estudio"]
    }).then(estudios => res.send({
      estudios
      
    })).catch(() => res.sendStatus(500));
};