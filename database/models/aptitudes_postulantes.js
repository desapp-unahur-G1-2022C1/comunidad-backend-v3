'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class aptitudes_postulantes extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  aptitudes_postulantes.init({
    fk_id_aptitud: DataTypes.INTEGER,
    fk_id_usuario: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'aptitudes_postulantes',
  });
  return aptitudes_postulantes;
};