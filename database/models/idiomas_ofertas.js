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
    }
  }
  idiomas_ofertas.init({
    fk_id_idioma: DataTypes.INTEGER,
    fk_id_oferta: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'idiomas_ofertas',
  });
  return idiomas_ofertas;
};