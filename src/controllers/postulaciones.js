const models = require("../../database/models");
const { Op } = require("sequelize");


export const getPorIdPostulante = async (req, res) => {

  let paginaComoNumero = Number.parseInt(req.query.pagina);
  let limiteComoNumero = Number.parseInt(req.query.limite);
  let idPostulante = req.query.id;

  let pagina = 0;
  if (!Number.isNaN(paginaComoNumero) && paginaComoNumero > 0) {
    pagina = paginaComoNumero;
  }

  let limite = 30;
  if (!Number.isNaN(limiteComoNumero) && limiteComoNumero > 0) {
    limite = limiteComoNumero;
  }
 
  models.postulaciones
    .findAndCountAll({
      limit: limite,
      offset: pagina * limite,
      include: [
        {
          as: "Postulante",
          model: models.postulantes,
          attributes: ["id", "nombre", "apellido","fk_id_usuario","telefono"],
        },
        {
          as: "Oferta",
          model: models.ofertas,
          attributes: ["id", "fk_id_empresa", "titulo_oferta"],
        },
      ],
      where: { fk_id_postulante: idPostulante },
    })
    .then((postulaciones) =>
      res.send({
        postulaciones,
        totalPaginas: Math.ceil(postulaciones.count / limite),
      })
    )
    .catch(() => res.sendStatus(500));
};

export const getPorIdOferta = async (req, res) => {

  let paginaComoNumero = Number.parseInt(req.query.pagina);
  let limiteComoNumero = Number.parseInt(req.query.limite);
  let idOferta = req.query.id;

  let pagina = 0;
  if (!Number.isNaN(paginaComoNumero) && paginaComoNumero > 0) {
    pagina = paginaComoNumero;
  }

  let limite = 30;
  if (!Number.isNaN(limiteComoNumero) && limiteComoNumero > 0) {
    limite = limiteComoNumero;
  }
 
  models.postulaciones
    .findAndCountAll({
      limit: limite,
      offset: pagina * limite,
      include: [
        {
          as: "Postulante",
          model: models.postulantes,
          attributes: ["id", "nombre", "apellido","fk_id_usuario","telefono"],
        },
        {
          as: "Oferta",
          model: models.ofertas,
          attributes: ["id", "fk_id_empresa", "titulo_oferta"],
        },
      ],
      where: { fk_id_oferta: idOferta },
    })
    .then((postulaciones) =>
      res.send({
        postulaciones,
        totalPaginas: Math.ceil(postulaciones.count / limite),
      })
    )
    .catch(() => res.sendStatus(500));
};

export const getConFiltros = async (req, res) => {
  models.postulaciones
    .findAll({
    //Devolvemos los registros
    include: [
      {
        as: "Postulante",
        model: models.postulantes,
        attributes: ["id", "nombre", "apellido","fk_id_usuario","telefono"],
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
            attributes: ["id", "nombre", "apellido","fk_id_usuario","telefono"],
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