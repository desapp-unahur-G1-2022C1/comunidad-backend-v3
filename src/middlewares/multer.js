const Multer = require("multer");

export const multer = Multer({
  storage: Multer.memoryStorage(),
  limits: {
    fileSize: 5 * 1024 * 1024, // El tamaño maximo de archivo a subir en MB.
  },
});