'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class idiomas extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  idiomas.init({
    nombre_idioma: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'idiomas',
  });
  return idiomas;
};