const models = require("../../database/models");
const { Op } = require("sequelize");

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