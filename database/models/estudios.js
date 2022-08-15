'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class estudios extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  estudios.init({
    nombre_estudio: DataTypes.STRING,
    estado_estudio: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'estudios',
  });
  return estudios;
};