const models = require("../../database/models");
const { Op } = require("sequelize");

  //get de departamentos
export const getConFiltros = async (req, res) => {
  let nombreDepartamento = req.query.nombreDepartamento;
  let idProvincia = req.query.idProvincia;

  if (typeof nombreDepartamento === "undefined") {
    nombreDepartamento = "_";
  } else {
    nombreDepartamento = req.query.nombreDepartamento.replace(/\s/g, "%");
  }

  models.departamentos
    .findAll({
      attributes: ["id","nombre"],
      where: {
        [Op.and]: [
          {
            nombre: {
              [Op.iLike]: `%${nombreDepartamento}%`,
            },
            fk_id_provincia: {
              [Op.eq]: [idProvincia]
            },
          },
        ],
      },
      order: ["nombre"],
    })
    .then((departamentos) =>
      res.send({
        departamentos
      })
    )
    .catch(() => res.sendStatus(500));
};