const models = require("../../database/models");

export const getAll = async (req, res) => {

  models.niveles_idiomas
    .findAll({
        attributes: ["id","nivel"]
    }).then(niveles_idiomas => res.send({
      niveles_idiomas
      
    })).catch(() => res.sendStatus(500));
};