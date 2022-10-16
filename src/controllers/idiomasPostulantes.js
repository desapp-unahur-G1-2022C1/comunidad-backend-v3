const models = require("../../database/models");

export const getAll = async (req, res) => {

  models.idiomas_postulantes
    .findAll({
      attributes: ["id","fk_id_idioma","fk_id_postulante","fk_id_nivel"]
    }).then(idiomas_postulantes => res.send({
      idiomas_postulantes
      
    })).catch(() => res.sendStatus(500));
};


export const postIdiomasPostulantes = async (req, res) => {
  models.idiomas_postulantes
    .create({
      fk_id_idioma: req.body.idIdioma,     
      fk_id_postulante: req.body.idPostulante,          
      fk_id_nivel: req.body.idNivel,         
    })
    .then(
      (idiomas_postulantes) => res.status(201).send({ id: idiomas_postulantes.id }))

    .catch((error) => {
      if (error == "SequelizeUniqueConstraintError: Validation error") {
        res.status(401).send("Bad request: Algun tipo de error de validacion de campos");
      } else {
        console.log(`Error al intentar insertar en la base de datos: ${error}`);
        res.sendStatus(500);
      }
    });
};

const findPorId = (
  fk_id_postulante,
  { onSuccess, onNotFound, onError }
) => {
  models.idiomas_postulantes
    .findOne({
      include: [
        {
          as: "Idioma",
          model: models.idiomas,
          attributes: ["id", "nombre_idioma"],
        },
        {
          as: "Postulante",
          model: models.postulantes,
          attributes: ["id", "fk_id_usuario"],
        },
        {
          as: "Nivel",
          model: models.niveles_idiomas,
          attributes: ["id", "nivel"],
        },
      ],
      where: { fk_id_postulante },
    })
    .then((idiomas_postulantes) =>
      idiomas_postulantes ? onSuccess(idiomas_postulantes) : onNotFound()
    )
    .catch(() => onError());
};

export const getPorId = async (req, res) => {
  findPorId(req.params.id, {
    onSuccess: (idiomas_postulantes) => res.send(idiomas_postulantes),
    onNotFound: () => res.sendStatus(401),
    onError: () => res.sendStatus(400),
  });
};
