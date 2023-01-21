const models = require("../../database/models");

export const getAll = async (req, res) => {

  models.idiomas_ofertas
    .findAll({
      attributes: ["id","fk_id_idioma","fk_id_oferta","fk_id_nivel"]
    }).then(idiomas_ofertas => res.send({
      idiomas_ofertas
      
    })).catch(() => res.sendStatus(500));
};

export const postIdiomasOfertas = async (req, res) => {
  models.idiomas_ofertas
    .create({
      fk_id_idioma: req.body.idIdioma,     
      fk_id_oferta: req.body.idOferta,          
      fk_id_nivel: req.body.idNivel,         
    })
    .then(
      (idiomas_ofertas) => res.status(201).send({ id: idiomas_ofertas.id }))

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
  fk_id_oferta,
  { onSuccess, onNotFound, onError }
) => {
  models.idiomas_ofertas
    .findOne({
      include: [
        {
          as: "Idioma",
          model: models.idiomas,
          attributes: ["id", "nombre_idioma"],
        },
        {
          as: "Oferta",
          model: models.ofertas,
          attributes: ["id", "titulo_oferta"],
        },
        {
          as: "Nivel",
          model: models.niveles_idiomas,
          attributes: ["id", "nivel"],
        },
      ],

      where: { fk_id_oferta },
    })
    .then((idiomas_ofertas) =>
      idiomas_ofertas ? onSuccess(idiomas_ofertas) : onNotFound()
    )
    .catch(() => onError());
};

export const getPorId = async (req, res) => {
  findPorId(req.params.id, {
    onSuccess: (idiomas_ofertas) => res.send(idiomas_ofertas),
    onNotFound: () => res.sendStatus(401),
    onError: () => res.sendStatus(400),
  });
};
