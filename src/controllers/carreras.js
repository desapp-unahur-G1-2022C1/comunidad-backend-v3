const models = require("../../database/models");

export const getAll = async (req, res) => {

  models.carreras
    .findAll({
        attributes: ["id","nombre_carrera"]
    }).then(carreras => res.send({
      carreras
      
    })).catch(() => res.sendStatus(500));
};