"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getAll = void 0;

const models = require("../../database/models");

const getAll = async (req, res) => {
  models.carreras.findAll({
    attributes: ["id", "nombre_carrera"]
  }).then(carreras => res.send({
    carreras
  })).catch(() => res.sendStatus(500));
};

exports.getAll = getAll;
//# sourceMappingURL=carreras.js.map