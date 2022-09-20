const models = require("../../database/models");

export const getAll = async (req, res) => {

    models.provincias
      .findAll({
  
      }).then(provincias => res.send({
        provincias
        
      })).catch(() => res.sendStatus(500));
  };