'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class accesos extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  accesos.init({
    fk_id_grupo: DataTypes.INTEGER,
    usuario_mail: DataTypes.STRING,
    password: DataTypes.STRING,
    hash: DataTypes.STRING,
    estado: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'accesos',
  });
  return accesos;
};