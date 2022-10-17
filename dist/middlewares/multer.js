"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.multer = void 0;

const Multer = require("multer");

const multer = Multer({
  storage: Multer.memoryStorage(),
  limits: {
    fileSize: 5 * 1024 * 1024 // El tamaño maximo de archivo a subir en MB.

  }
});
exports.multer = multer;
//# sourceMappingURL=multer.js.map