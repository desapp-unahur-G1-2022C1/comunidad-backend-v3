'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ciudades extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      ciudades.belongsTo(models.provincias// modelo al que pertenece
      ,{
        as : 'Provincia',  // nombre de mi relacion
        foreignKey: 'fk_id_provincia'     // campo con el que voy a igualar
      })
    }
  }
  ciudades.init({
    nombre: DataTypes.STRING,
    fk_id_provincia: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'ciudades',
  });
  return ciudades;
};