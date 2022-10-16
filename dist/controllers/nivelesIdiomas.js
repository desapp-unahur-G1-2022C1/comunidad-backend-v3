"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getAll = void 0;

const models = require("../../database/models");

const getAll = async (req, res) => {
  models.niveles_idiomas.findAll({
    attributes: ["id", "nivel"]
  }).then(niveles_idiomas => res.send({
    niveles_idiomas
  })).catch(() => res.sendStatus(500));
};

exports.getAll = getAll;
//# sourceMappingURL=nivelesIdiomas.js.map