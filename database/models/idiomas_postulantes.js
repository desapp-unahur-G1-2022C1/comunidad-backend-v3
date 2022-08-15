'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class idiomas_postulantes extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  idiomas_postulantes.init({
    fk_id_idioma: DataTypes.INTEGER,
    fk_id_usuario: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'idiomas_postulantes',
  });
  return idiomas_postulantes;
};