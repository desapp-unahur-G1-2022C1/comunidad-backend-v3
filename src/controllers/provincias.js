const models = require("../../database/models");
const { Op } = require("sequelize");

//get de provincias
export const getConFiltros = async (req, res) => {
  let nombreProvincia = req.query.nombreProvincia;


  if (typeof nombreProvincia === "undefined") {
    nombreProvincia = "_";
  } else {
    nombreProvincia = req.query.nombreProvincia.replace(/\s/g, "%");
  }

  models.provincias
    .findAll({
      attributes: ["id","nombre"],
      where: {
        [Op.or]: [
          {
            nombre: {
              [Op.iLike]: `%${nombreProvincia}%`,
            },
          },
        ],
      },
      order: ["nombre"],
    })
    .then((provincias) =>
      res.send({
        provincias
      })
    )
    .catch(() => res.sendStatus(500));
};
