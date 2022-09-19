const models = require("../../database/models");
const { Op } = require("sequelize");


//get de empresas
export const getConFiltros = async (req, res) => {
  let paginaComoNumero = Number.parseInt(req.query.pagina);
  let limiteComoNumero = Number.parseInt(req.query.limite);
  let ordenarPor = req.query.ordenar;
  let nombreEmpresa = req.query.nombreEmpresa;
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

  if (typeof nombreEmpresa === "undefined") {
    nombreEmpresa = "_";
  } else {
    nombreEmpresa = req.query.nombreEmpresa.replace(/\s/g, "%");
  }

  if (typeof idEstado === "undefined") {
    idEstado = 1;
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
        [Op.and]: [
          {
            nombre_empresa: {
              [Op.iLike]: `%${nombreEmpresa}%`,
            },
            fk_id_estado: {
              [Op.eq]: idEstado
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

export const getPeladas = async (req, res) => {
  let pagina = 0;
  let limite = 1000;

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

const findEmpresasPorIdUsuario = (fk_id_usuario, { onSuccess, onNotFound, onError }) => {
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
      where: { fk_id_usuario },
    })
    .then((empresas) => (empresas ? onSuccess(empresas) : onNotFound()))
    .catch(() => onError());
};

export const getPorIdUsuario = async (req, res) => {
  findEmpresasPorIdUsuario(req.params.id, {
    onSuccess: (empresas) => res.send(empresas),
    onNotFound: () => res.sendStatus(404),
    onError: () => res.sendStatus(500),
  });
};

export const deleteEmpresa = async (req, res) => {
  const onSuccess = empresas =>
  empresas
      .destroy()
      .then(() => res.sendStatus(200))
      .catch(() => res.sendStatus(500));
  findEmpresas(req.params.id, {
    onSuccess,
    onNotFound: () => res.sendStatus(404),
    onError: () => res.sendStatus(500)
  });
};

export const postEmpresa = async (req, res) => {
  models.empresas
    .create({
      id:  req.body.cuit,
      fk_id_usuario: req.body.idUsuario,     
      fk_id_rubro: req.body.idRubro,          
      fk_id_estado: 2,         
      nombre_empresa: req.body.nombreEmpresa,       
      descripcion: req.body.descripcion,          
      pais: req.body.pais,                
      provincia: req.body.provincia,            
      ciudad: req.body.ciudad,               
      calle: req.body.calle,                
      nro: req.body.nro,                  
      piso: req.body.piso,                 
      depto: req.body.depto,                
      cp: req.body.cp,                   
      telefono: req.body.telefono,             
      web: req.body.web,                  
      nombre_representante: req.body.nombreRepresentante, 
      email_representante: req.body.emailRepresentante,  
      logo: "logo.jpg" 
    })
    .then(
      (empresas) => res.status(201).send({ id: empresas.id }),
    )
    .catch((error) => {
      if (error == "SequelizeUniqueConstraintError: Validation error") {
        res.status(401).send("Bad request: Algun tipo de error de validacion de campos");
      } else {
        console.log(`Error al intentar insertar en la base de datos: ${error}`);
        res.sendStatus(500);
      }
    });
};

export const updateEmpresa = async (req, res) => {
  const onSuccess = (empresas) =>
  empresas
      .update(
        {
          fk_id_usuario: req.body.idUsuario,     
          fk_id_rubro: req.body.idRubro,          
          fk_id_estado: req.body.idEstado,         
          nombre_empresa: req.body.nombreEmpresa,       
          descripcion: req.body.descripcion,          
          pais: req.body.pais,                
          provincia: req.body.provincia,            
          ciudad: req.body.ciudad,               
          calle: req.body.calle,                
          nro: req.body.nro,                  
          piso: req.body.piso,                 
          depto: req.body.depto,                
          cp: req.body.cp,                   
          telefono: req.body.telefono,             
          web: req.body.web,                  
          nombre_representante: req.body.nombreRepresentante, 
          email_representante: req.body.emailRepresentante, 
        },
        { fields: ["fk_id_usuario", "fk_id_rubro", "fk_id_estado","nombre_empresa","descripcion","pais","provincia","descripcion","ciudad","calle","nro","piso","depto","cp","telefono","web","nombre_representante","email_representante"] }
      )
      .then(() => res.sendStatus(200),
        //aca modificamos el perfil del usuario para pasarlo al grupo empresa
        changeGroup(req.body.idUsuario)
      )
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
      findEmpresas(req.params.id, {
    onSuccess,
    onNotFound: () => res.sendStatus(404),
    onError: () => res.sendStatus(500),
  });
};

//Con esto cambiamos el grupo del usuario para que sea empresa.
const changeGroup = (id_usuario) => {
  models.usuarios.update(
    { fk_id_grupo: 2 },
    {
      where: {
        id: id_usuario,
      },
    }
  );
};