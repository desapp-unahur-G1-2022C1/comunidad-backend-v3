"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getConFiltros = void 0;

const models = require("../../database/models");

const {
  Op
} = require("sequelize"); //get de ciudades


const getConFiltros = async (req, res) => {
  let nombreCiudad = req.query.nombreCiudad;
  let idProvincia = req.query.idProvincia;

  if (typeof nombreCiudad === "undefined") {
    nombreCiudad = "_";
  } else {
    nombreCiudad = req.query.nombreCiudad.replace(/\s/g, "%");
  }

  models.ciudades.findAll({
    attributes: ["id", "nombre"],
    where: {
      [Op.and]: [{
        nombre: {
          [Op.iLike]: `%${nombreCiudad}%`
        },
        fk_id_provincia: {
          [Op.eq]: [idProvincia]
        }
      }]
    },
    order: ["nombre"]
  }).then(ciudades => res.send({
    ciudades
  })).catch(() => res.sendStatus(500));
};

exports.getConFiltros = getConFiltros;
//# sourceMappingURL=ciudades.js.map