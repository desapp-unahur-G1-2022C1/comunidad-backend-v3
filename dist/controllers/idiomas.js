"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getAll = void 0;

const models = require("../../database/models");

const getAll = async (req, res) => {
  models.idiomas.findAll({
    attributes: ["id", "nombre_idioma"]
  }).then(idiomas => res.send({
    idiomas
  })).catch(() => res.sendStatus(500));
};

exports.getAll = getAll;
//# sourceMappingURL=idiomas.js.map