const Multer = require("multer");

export const multer = Multer({
  storage: Multer.memoryStorage(),
  limits: {
    fileSize: 5 * 1024 * 1024, // El tamaño maximo de archivo a subir en MB.
  },  
});

/*
export const multer = Multer({
  storage: Multer.diskStorage({
  
  destination: function (req, file, cb) {
    cb(null, '/tmp/')
  },
  
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
    cb(null, file.fieldname + '-' + uniqueSuffix)
    console.log("aca muestro el miemtipe", file.mimetype);
  }
  })
})

//const upload = multer({ storage: storage })
*/