'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class niveles_idiomas extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  niveles_idiomas.init({
    nivel: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'niveles_idiomas',
  });
  return niveles_idiomas;
};