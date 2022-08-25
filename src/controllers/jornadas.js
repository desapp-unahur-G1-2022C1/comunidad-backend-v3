const models = require("../../database/models");

export const getAll = async (req, res) => {

  models.jornadas
    .findAll({
        attributes: ["id","nombre_jornada","detalle"]
    }).then(jornadas => res.send({
      jornadas
      
    })).catch(() => res.sendStatus(500));
};