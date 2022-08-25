import { BOOLEAN } from "sequelize";

const models = require("../../database/models");
const { Op } = require("sequelize");

export const getConFiltros = async (req, res) => {
  let paginaComoNumero = Number.parseInt(req.query.pagina);
  let limiteComoNumero = Number.parseInt(req.query.limite);
  let ordenarPor = req.query.ordenar;
  let buscarTitulo = req.query.buscarTitulo;

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
    let buscarTitulo = buscarTitulo.replace(/\s/g, "%");
  }

  models.ofertas
    .findAndCountAll({
      limit: limite,
      offset: pagina * limite,
      include: [
        {
          as: "Empresa",
          model: models.empresas,
          attributes: ["id", "nombre_empresa"],
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
        [Op.or]: [
          {
            titulo_oferta: {
              [Op.iLike]: `%${buscarTitulo}%`,
            },
          },
        ],
      },
      order: [ordenarPor],
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
          attributes: ["id", "nombre_empresa"],
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

const findOfertaPorIdEmpresa = (fk_id_empresa, { onSuccess, onNotFound, onError }) => {
  models.ofertas
    .findAll({
      include: [
        {
          as: "Empresa",
          model: models.empresas,
          attributes: ["id", "nombre_empresa"],
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
      where: { fk_id_empresa }
    })
    .then((ofertas) => (ofertas ? onSuccess(ofertas) : onNotFound()))
    .catch(() => onError());
};

export const getOfertasPorIdEmpresa = async (req, res) => {
  findOfertaPorIdEmpresa(req.params.id, {
    onSuccess: (ofertas) => res.send(ofertas),
    onNotFound: () => res.sendStatus(404),
    onError: () => res.sendStatus(500),
  });
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
      fecha_vigencia: req.body.fechqVigencia,             
      titulo_oferta: req.body.tituloOferta,          
      descripcion: req.body.descripcion,            
      horario_laboral_desde: req.body.horarioLaboralDesde,  
      horario_laboral_hasta: req.body.horarioLaboralHasta,  
      edad_desde: req.body.edadDesde,             
      edad_hasta: req.body.edadHasta,             
      experiencia_previa_desc: req.body.experienciaPreviaDec,
      zona_trabajo: req.body.zonaTrabajo,           
      areas_estudio: req.body.areasEstudio,          
      otros_detalles: req.body.otrosDetalles,         
      beneficios: req.body.beneficios,             
      remuneracion: req.body.remuneracion
    })
    .then(
      (ofertas) => res.status(201).send({ id: ofertas.id }),
    )
    .catch((error) => {
      if (error == "SequelizeUniqueConstraintError: Validation error") {
        res.status(401).send("Bad request: el cuit no existe");
      } else {
        console.log(`Error al intentar insertar en la base de datos: ${error}`);
        res.sendStatus(500);
      }
    });
};