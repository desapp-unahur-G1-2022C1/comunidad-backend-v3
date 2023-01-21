import { BOOLEAN } from "sequelize";

const models = require("../../database/models");
const { Op } = require("sequelize");

export const getConFiltros = async (req, res) => {
  let paginaComoNumero = Number.parseInt(req.query.pagina);
  let limiteComoNumero = Number.parseInt(req.query.limite);
  let ordenarPor = req.query.ordenar;
  let buscarTitulo = req.query.buscarTitulo;
  let idEstado = req.query.idEstado;

  let pagina = 0;
  if (!Number.isNaN(paginaComoNumero) && paginaComoNumero > 0) {
    pagina = paginaComoNumero;
  }

  let limite = 30;
  if (!Number.isNaN(limiteComoNumero) && limiteComoNumero > 0) {
    limite = limiteComoNumero;
  }
  if (typeof ordenarPor === "undefined") {
    ordenarPor = "createdAt";
  }

  if (typeof buscarTitulo === "undefined") {
    buscarTitulo = "_";
  } else {
    buscarTitulo = buscarTitulo.replace(/\s/g, "%");
  }

  if (typeof idEstado === "undefined") {
    idEstado = 1;
 }

  models.ofertas
    .findAndCountAll({
      limit: limite,
      offset: pagina * limite,
      include: [
        {
          as: "Empresa",
          model: models.empresas,
          attributes: ["id", "nombre_empresa", "descripcion"],
        },
        {
          as: "Estudio",
          model: models.estudios,
          attributes: ["id", "nombre_estudio", "estado_estudio"],
        },
        {
          as: "Carrera",
          model: models.carreras,
          attributes: ["id", "nombre_carrera"],
        },
        {
          as: "Jornada",
          model: models.jornadas,
          attributes: ["id", "nombre_jornada"],
        },
        {
          as: "Contrato",
          model: models.contratos,
          attributes: ["id", "nombre_contrato"],
        },
        {
          as: "Estado",
          model: models.estado_ofertas,
          attributes: ["id", "nombre_estado"],
        },
      ],
      where: {
        [Op.and]: [
          {
            titulo_oferta: {
              [Op.iLike]: `%${buscarTitulo}%`,
            },
            fk_id_estado: {
              [Op.eq]: [idEstado]
            },
          },
        ],
      },
      order: [[ordenarPor, 'DESC'],],
    })
    .then((ofertas) =>
      res.send({
        ofertas,
        totalPaginas: Math.ceil(ofertas.count / limite),
      })
    )
    .catch(() => res.sendStatus(500));
};

export const getPeladas = async (req, res) => {
  let pagina = 0;
  let limite = 1000;

  models.ofertas
    .findAndCountAll({
      limit: limite,
      offset: pagina * limite,
      include: [
        {
          as: "Empresa",
          model: models.empresas,
          attributes: ["id", "nombre_empresa", "descripcion"],
        },
        {
          as: "Estudio",
          model: models.estudios,
          attributes: ["id", "nombre_estudio", "estado_estudio"],
        },
        {
          as: "Carrera",
          model: models.carreras,
          attributes: ["id", "nombre_carrera"],
        },
        {
          as: "Jornada",
          model: models.jornadas,
          attributes: ["id", "nombre_jornada"],
        },
        {
          as: "Contrato",
          model: models.contratos,
          attributes: ["id", "nombre_contrato"],
        },
        {
          as: "Estado",
          model: models.estado_ofertas,
          attributes: ["id", "nombre_estado"],
        },
      ]
    })
    .then((ofertas) =>
      res.send({
        ofertas,
        totalPaginas: Math.ceil(ofertas.count / limite),
      })
    )
    .catch(() => res.sendStatus(500));
};

const findOferta = (id, { onSuccess, onNotFound, onError }) => {
  models.ofertas
    .findOne({
      include: [
        {
          as: "Empresa",
          model: models.empresas,
          attributes: ["id", "nombre_empresa", "descripcion"],
        },
        {
          as: "Estudio",
          model: models.estudios,
          attributes: ["id", "nombre_estudio", "estado_estudio"],
        },
        {
          as: "Carrera",
          model: models.carreras,
          attributes: ["id", "nombre_carrera"],
        },
        {
          as: "Jornada",
          model: models.jornadas,
          attributes: ["id", "nombre_jornada"],
        },
        {
          as: "Contrato",
          model: models.contratos,
          attributes: ["id", "nombre_contrato"],
        },
        {
          as: "Estado",
          model: models.estado_ofertas,
          attributes: ["id", "nombre_estado"],
        },
      ],
      where: { id },
    })
    .then((ofertas) => (ofertas ? onSuccess(ofertas) : onNotFound()))
    .catch(() => onError());
};

export const getPorId = async (req, res) => {
  findOferta(req.params.id, {
    onSuccess: (ofertas) => res.send(ofertas),
    onNotFound: () => res.sendStatus(404),
    onError: () => res.sendStatus(500),
  });
};


export const getOfertasPorIdEmpresa = async (req, res) => {
  let buscarTitulo = req.query.buscarTitulo;
  let pagina = req.query.pagina;
  let limite = req.query.limite;
  let fk_id_empresa = req.params.id;

  if (typeof buscarTitulo === "undefined") {
    buscarTitulo = "_";
  } else {
    buscarTitulo = buscarTitulo.replace(/\s/g, "%");
  }

  if (typeof pagina === "undefined") {
    pagina = 0;
  }

  if (typeof limite === "undefined") {
    limite = 30;
  }

  models.ofertas
    .findAndCountAll({
      limit: limite,
      offset: pagina * limite,
      include: [
        {
          as: "Empresa",
          model: models.empresas,
          attributes: ["id", "nombre_empresa", "descripcion"],
        },
        {
          as: "Estudio",
          model: models.estudios,
          attributes: ["id", "nombre_estudio", "estado_estudio"],
        },
        {
          as: "Carrera",
          model: models.carreras,
          attributes: ["id", "nombre_carrera"],
        },
        {
          as: "Jornada",
          model: models.jornadas,
          attributes: ["id", "nombre_jornada"],
        },
        {
          as: "Contrato",
          model: models.contratos,
          attributes: ["id", "nombre_contrato"],
        },
        {
          as: "Estado",
          model: models.estado_ofertas,
          attributes: ["id", "nombre_estado"],
        },
      ],
      where: { fk_id_empresa,
        [Op.and]: [
          {
            titulo_oferta: {
              [Op.iLike]: `%${buscarTitulo}%`,
            },
          },
        ],
      },
    })
    .then((ofertas) =>
      res.send({
        ofertas,
        totalPaginas: Math.ceil(ofertas.count / limite),
      })
    )
    .catch(() => res.sendStatus(500));
};

export const postOfertas = async (req, res) => {
  models.ofertas
    .create({
      fk_id_empresa: req.body.idEmpresa,
      fk_id_jornada: req.body.idJornada,
      fk_id_contrato: req.body.idContrato,
      fk_id_estudio: req.body.idEstudio,
      fk_id_carrera: req.body.idCarrera,
      fk_id_estado: 2,
      fecha_vigencia: req.body.fechaVigencia,
      titulo_oferta: req.body.tituloOferta,
      descripcion: req.body.descripcion,
      horario_laboral_desde: req.body.horarioLaboralDesde,
      horario_laboral_hasta: req.body.horarioLaboralHasta,
      edad_desde: req.body.edadDesde,
      edad_hasta: req.body.edadHasta,
      experiencia_previa_desc: req.body.experienciaPreviaDesc,
      zona_trabajo: req.body.zonaTrabajo,
      areas_estudio: req.body.areasEstudio,
      otros_detalles: req.body.otrosDetalles,
      beneficios: req.body.beneficios,
      remuneracion: req.body.remuneracion,
    })
    .then((ofertas) => res.status(201).send({ id: ofertas.id }))
    .catch((error) => {
      if (error == "SequelizeUniqueConstraintError: Validation error") {
        res.status(401).send("Bad request: Algun tipo de error de validacion de campos");
      } else {
        console.log(`Error al intentar insertar en la base de datos: ${error}`);
        res.sendStatus(500);
      }
    });
};

export const deleteOferta = async (req, res) => {
  const onSuccess = (ofertas) =>
    ofertas
      .destroy()
      .then(() => res.sendStatus(200))
      .catch(() => res.sendStatus(500));
  findOferta(req.params.id, {
    onSuccess,
    onNotFound: () => res.sendStatus(404),
    onError: () => res.sendStatus(500),
  });
};

export const updateOfertas = async (req, res) => {
  const onSuccess = (ofertas) =>
    ofertas
      .update(
        {
          fk_id_jornada: req.body.idJornada,
          fk_id_contrato: req.body.idContrato,
          fk_id_estudio: req.body.idEstudio,
          fk_id_carrera: req.body.idCarrera,
          fk_id_estado: req.body.idEstado,
          fecha_vigencia: req.body.fechaVigencia,
          titulo_oferta: req.body.tituloOferta,
          descripcion: req.body.descripcion,
          horario_laboral_desde: req.body.horarioLaboralDesde,
          horario_laboral_hasta: req.body.horarioLaboralHasta,
          edad_desde: req.body.edadDesde,
          edad_hasta: req.body.edadHasta,
          experiencia_previa_desc: req.body.experienciaPreviaDesc,
          zona_trabajo: req.body.zonaTrabajo,
          areas_estudio: req.body.areasEstudio,
          otros_detalles: req.body.otrosDetalles,
          beneficios: req.body.beneficios,
          remuneracion: req.body.remuneracion,
        },
        { fields: ["fk_id_jornada", "fk_id_contrato", "fk_id_estudio","fk_id_carrera","fk_id_estado","fecha_vigencia","titulo_oferta","descripcion","horario_laboral_desde","horario_laboral_hasta","edad_desde","edad_hasta","experiencia_previa_desc","zona_trabajo","areas_estudio","otros_detalles","beneficios","remuneracion"] }
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
  findOferta(req.params.id, {
    onSuccess,
    onNotFound: () => res.sendStatus(404),
    onError: () => res.sendStatus(500),
  });
};
