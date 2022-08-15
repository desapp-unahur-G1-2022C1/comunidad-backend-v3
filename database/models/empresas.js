'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class empresas extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  empresas.init({
    fk_id_usuario: DataTypes.INTEGER,
    fk_id_rubro: DataTypes.INTEGER,
    fk_id_estado: DataTypes.INTEGER,
    nombre_empresa: DataTypes.STRING,
    descripcion: DataTypes.STRING,
    pais: DataTypes.STRING,
    provincia: DataTypes.STRING,
    ciudad: DataTypes.STRING,
    calle: DataTypes.STRING,
    nro: DataTypes.INTEGER,
    piso: DataTypes.INTEGER,
    depto: DataTypes.STRING,
    cp: DataTypes.STRING,
    telefono: DataTypes.INTEGER,
    web: DataTypes.STRING,
    nombre_representante: DataTypes.STRING,
    email_representante: DataTypes.STRING,
    logo: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'empresas',
  });
  return empresas;
};