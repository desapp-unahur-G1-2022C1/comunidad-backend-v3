const models = require("../../database/models");
const { Op } = require("sequelize");


export const getConFiltros = async (req, res) => {

  models.postulaciones
    .findAll({
    //Devolvemos los registros
    include: [
      {
        as: "Postulante",
        model: models.postulantes,
        attributes: ["id", "nombre", "apellido"],
      },
      {
        as: "Oferta",
        model: models.ofertas,
        attributes: ["id", "fk_id_empresa", "titulo_oferta"],
      },
    ],
    }).then(postulaciones => res.send({
      postulaciones
      
    })).catch(() => res.sendStatus(500));
};

export const postPostulaciones = async (req, res) => {


  models.postulaciones
    .create({ 
      fk_id_postulante: req.body.postulante,
      fk_id_oferta: req.body.oferta,
    })
    .then(postulaciones => res.status(201).send({ id: postulaciones.id }),
    )
    .catch(error => {
      if (error == "SequelizeUniqueConstraintError: Validation error") {
        res.status(400).send('Bad request: una error')
      }
      else {
        console.log(`Error al intentar insertar en la base de datos: ${error}`)
        res.sendStatus(500)
      }
    });
  };

  const findPostulaciones= (id, { onSuccess, onNotFound, onError }) => {
    models.postulaciones
      .findOne({
        include: [
          {
            as: "Postulante",
            model: models.postulantes,
            attributes: ["id", "nombre", "apellido"],
          },
          {
            as: "Oferta",
            model: models.ofertas,
            attributes: ["id", "fk_id_empresa", "titulo_oferta"],
          },
        ],
        where: { id },
      })
      .then((postulaciones) => (postulaciones ? onSuccess(postulaciones) : onNotFound()))
      .catch(() => onError());
  };

  export const getPorId = async (req, res) => {
    findPostulaciones(req.params.id, {
      onSuccess: (postulaciones) => res.send(postulaciones),
      onNotFound: () => res.sendStatus(404),
      onError: () => res.sendStatus(500),
    });
  };

  export const deletePostulacion = async (req, res) => {
    const onSuccess = postulaciones =>
    postulaciones
        .destroy()
        .then(() => res.sendStatus(200))
        .catch(() => res.sendStatus(500));
      findPostulaciones(req.params.id, {
      onSuccess,
      onNotFound: () => res.sendStatus(404),
      onError: () => res.sendStatus(500)
    });
  };

  export const updatePostulaciones = async (req, res) => {
    const onSuccess = (postulaciones) =>
    postulaciones
        .update(
          {
            fk_id_postulante: req.body.postulante,
            fk_id_oferta: req.body.oferta,
          },
          { fields: ["fk_id_postulante", "fk_id_oferta"] }
        )
        .then(() => res.sendStatus(200))
        .catch((error) => {
          if (error == "SequelizeUniqueConstraintError: Validation error") {
            res
              .status(400)
              .send("Bad request: Algun tipo de error de validacion de campos");
          } else {
            console.log(
              `Error al intentar actualizar la base de datos: ${error}`
            );
            res.sendStatus(500);
          }
        });
        findPostulaciones(req.params.id, {
      onSuccess,
      onNotFound: () => res.sendStatus(404),
      onError: () => res.sendStatus(500),
    });
  };