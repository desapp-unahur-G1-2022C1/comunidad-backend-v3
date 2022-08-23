const models = require("../../database/models");
const { Op } = require("sequelize");


//get de empresas
export const getConFiltros = async (req, res) => {
  let paginaComoNumero = Number.parseInt(req.query.pagina);
  let limiteComoNumero = Number.parseInt(req.query.limite);
  let ordenarPor = req.query.ordenar;
  let nombreEmpresa = req.query.nombreEmpresa;

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

  if (typeof nombreEmpresa === "undefined") {
    nombreEmpresa = "_";
  } else {
    let nombreEmpresa = nombreEmpresa.replace(/\s/g, "%");
  }

  models.empresas
    .findAndCountAll({
      limit: limite,
      offset: pagina * limite,
      include: [
        {
          as: "Usuario",
          model: models.usuarios,
          attributes: ["id", "usuario"],
        },
        {
          as: "Rubro",
          model: models.rubros,
          attributes: ["id", "nombre_rubro"],
        },
        {
          as: "Estado",
          model: models.estado_empresas,
          attributes: ["id", "nombre_estado"],
        },
      ],
      where: {
        [Op.or]: [
          {
            nombre_empresa: {
              [Op.iLike]: `%${nombreEmpresa}%`,
            },
          },
        ],
      },
      order: [ordenarPor],
    })
    .then((empresas) =>
      res.send({
        empresas,
        totalPaginas: Math.ceil(empresas.count / limite),
      })
    )
    .catch(() => res.sendStatus(500));
};

const findEmpresas= (id, { onSuccess, onNotFound, onError }) => {
  models.empresas
    .findOne({
      include: [
        {
          as: "Usuario",
          model: models.usuarios,
          attributes: ["id", "usuario"],
        },
        {
          as: "Rubro",
          model: models.rubros,
          attributes: ["id", "nombre_rubro"],
        },
        {
          as: "Estado",
          model: models.estado_empresas,
          attributes: ["id", "nombre_estado"],
        },
      ],
      where: { id },
    })
    .then((empresas) => (empresas ? onSuccess(empresas) : onNotFound()))
    .catch(() => onError());
};

export const getPorId = async (req, res) => {
  findEmpresas(req.params.id, {
    onSuccess: (empresas) => res.send(empresas),
    onNotFound: () => res.sendStatus(404),
    onError: () => res.sendStatus(500),
  });
};