'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class abm extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  abm.init({
    fk_id_usuario: DataTypes.INTEGER,
    id_usuario_mod: DataTypes.INTEGER,
    motivo: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'abm',
  });
  return abm;
};