'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class usuarios extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      usuarios.belongsTo(models.grupos// modelo al que pertenece
      ,{
        as : 'Grupos',  // nombre de mi relacion
        foreignKey: 'fk_id_grupo'     // campo con el que voy a igualar
      })
    }
  }
  usuarios.init({
    //id_usuario: DataTypes.INTEGER,
    fk_id_grupo: DataTypes.INTEGER,
    usuario: DataTypes.STRING,
    password: DataTypes.STRING,
    estado: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'usuarios',
  });
  return usuarios;
};