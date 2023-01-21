"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.validateToken = void 0;

const jwt = require('jsonwebtoken');

require('dotenv').config('../../.env');

const secret = process.env.SECRET;

const validateToken = async (req, res, next) => {
  const accessToken = req.body.authorization;
  if (!accessToken) res.send('acceso denegado');
  jwt.verify(accessToken, secret, (err, user) => {
    if (err) {
      res.send('acceso denegado, token expirado');
    } else {
      next();
    }
  });
};

exports.validateToken = validateToken;
//# sourceMappingURL=validador.js.map