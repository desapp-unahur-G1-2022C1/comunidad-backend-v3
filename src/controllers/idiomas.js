const models = require("../../database/models");

export const getAll = async (req, res) => {

  models.idiomas
    .findAll({
        attributes: ["id","nombre_idioma"]
    }).then(idiomas => res.send({
      idiomas
      
    })).catch(() => res.sendStatus(500));
};