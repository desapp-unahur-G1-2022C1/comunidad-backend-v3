const models = require("../../database/models");

export const getAll = async (req, res) => {

    models.departamentos
      .findAll({
        include: [
          {
            as: "Provincia",
            model: models.provincias,
            attributes: ["id", "nombre"],
          }],
      }).then(departamentos => res.send({
        departamentos
        
      })).catch(() => res.sendStatus(500));
  };