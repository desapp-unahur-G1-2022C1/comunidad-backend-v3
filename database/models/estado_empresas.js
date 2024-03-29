'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class estado_empresas extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  estado_empresas.init({
    nombre_estado: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'estado_empresas',
  });
  return estado_empresas;
};