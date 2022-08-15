'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class tipos_documentos extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  tipos_documentos.init({
    tipo_documento: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'tipos_documentos',
  });
  return tipos_documentos;
};