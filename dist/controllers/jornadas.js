"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getAll = void 0;

const models = require("../../database/models");

const getAll = async (req, res) => {
  models.jornadas.findAll({
    attributes: ["id", "nombre_jornada", "detalle"]
  }).then(jornadas => res.send({
    jornadas
  })).catch(() => res.sendStatus(500));
};

exports.getAll = getAll;
//# sourceMappingURL=jornadas.js.map