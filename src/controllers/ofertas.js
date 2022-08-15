const models = require("../../database/models");
const { Op } = require("sequelize");

export const getConFiltros = async (req, res) => {
  var paginaComoNumero = Number.parseInt(req.query.pagina);
  var limiteComoNumero = Number.parseInt(req.query.limite);
  var ordenarPor = req.query.ordenar;
  var buscarTitulo = req.query.buscarTitulo;

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
    var buscarTitulo = buscarTitulo.replace(/\s/g, "%");
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

export const getPorIdOferta = async (req, res) => {
  findOferta(req.params.id, {
    onSuccess: (ofertas) => res.send(ofertas),
    onNotFound: () => res.sendStatus(404),
    onError: () => res.sendStatus(500),
  });
};
