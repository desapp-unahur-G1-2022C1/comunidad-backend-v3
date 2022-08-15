'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class carreras extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  carreras.init({
    nombre_carrera: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'carreras',
  });
  return carreras;
};