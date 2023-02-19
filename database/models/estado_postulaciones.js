'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class estado_postulaciones extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  estado_postulaciones.init({
    nombre_estado: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'estado_postulaciones',
  });
  return estado_postulaciones;
};