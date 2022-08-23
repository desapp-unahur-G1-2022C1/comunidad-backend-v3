const models = require("../../database/models");
const { Op } = require("sequelize");


export const getConFiltros = async (req, res) => {

  models.postulaciones
    .findAll({
    //Devolvemos los registros
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