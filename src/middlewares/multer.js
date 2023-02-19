const Multer = require("multer");
const { v4: uuidv4 } = require('uuid');
/*
export const multer = Multer({
  storage: Multer.memoryStorage(),
  limits: {
    fileSize: 5 * 1024 * 1024, // El tamaño maximo de archivo a subir en MB.
  },  
});
*/

export const multer = Multer({
  storage: Multer.diskStorage({
  
  destination: function (req, file, cb) {
    cb(null, './files');
  },
  
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '_' + uuidv4() + '.' + file.mimetype.split('/',2)[1]);
  },
  limits: {
    fileSize: 5 * 1024 * 1024, // El tamaño maximo de archivo a subir en MB.
  },
  })
})

//const upload = multer({ storage: storage })
