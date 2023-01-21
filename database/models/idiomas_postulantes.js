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
      idiomas_postulantes.belongsTo(models.idiomas// modelo al que pertenece
      ,{
        as : 'Idioma',  // nombre de mi relacion
        foreignKey: 'fk_id_idioma'     // campo con el que voy a igualar
      }),
      idiomas_postulantes.belongsTo(models.postulantes// modelo al que pertenece
      ,{
        as : 'Postulante',  // nombre de mi relacion
        foreignKey: 'fk_id_postulante'     // campo con el que voy a igualar
      }),
      idiomas_postulantes.belongsTo(models.niveles_idiomas// modelo al que pertenece
      ,{
        as : 'Nivel',  // nombre de mi relacion
        foreignKey: 'fk_id_nivel'     // campo con el que voy a igualar
      })
    }
  }
  idiomas_postulantes.init({
    fk_id_idioma: DataTypes.INTEGER,
    fk_id_postulante: DataTypes.INTEGER,
    fk_id_nivel: DataTypes.INTEGER,
  }, {
    sequelize,
    modelName: 'idiomas_postulantes',
  });
  return idiomas_postulantes;
};