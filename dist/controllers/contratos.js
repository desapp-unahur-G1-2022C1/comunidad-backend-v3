"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getAll = void 0;

const models = require("../../database/models");

const getAll = async (req, res) => {
  models.contratos.findAll({
    attributes: ["id", "nombre_contrato"]
  }).then(contratos => res.send({
    contratos
  })).catch(() => res.sendStatus(500));
};

exports.getAll = getAll;
//# sourceMappingURL=contratos.js.map