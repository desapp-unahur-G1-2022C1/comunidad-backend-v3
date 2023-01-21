"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getAll = void 0;

const models = require("../../database/models");

const getAll = async (req, res) => {
  models.estudios.findAll({
    attributes: ["id", "nombre_estudio", "estado_estudio"]
  }).then(estudios => res.send({
    estudios
  })).catch(() => res.sendStatus(500));
};

exports.getAll = getAll;
//# sourceMappingURL=estudios.js.map