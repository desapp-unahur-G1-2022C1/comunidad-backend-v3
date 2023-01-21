'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class idiomas_ofertas extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      idiomas_ofertas.belongsTo(models.idiomas// modelo al que pertenece
      ,{
        as : 'Idioma',  // nombre de mi relacion
        foreignKey: 'fk_id_idioma'     // campo con el que voy a igualar
      }),
      idiomas_ofertas.belongsTo(models.ofertas// modelo al que pertenece
      ,{
        as : 'Oferta',  // nombre de mi relacion
        foreignKey: 'fk_id_oferta'     // campo con el que voy a igualar
      }),
      idiomas_ofertas.belongsTo(models.niveles_idiomas// modelo al que pertenece
      ,{
        as : 'Nivel',  // nombre de mi relacion
        foreignKey: 'fk_id_nivel'     // campo con el que voy a igualar
      })
    }
  }
  idiomas_ofertas.init({
    fk_id_idioma: DataTypes.INTEGER,
    fk_id_oferta: DataTypes.INTEGER,
    fk_id_nivel: DataTypes.INTEGER,
  }, {
    sequelize,
    modelName: 'idiomas_ofertas',
  });
  return idiomas_ofertas;
};