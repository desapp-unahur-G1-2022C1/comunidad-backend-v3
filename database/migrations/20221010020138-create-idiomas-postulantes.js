'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('idiomas_postulantes', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      fk_id_idioma: {
        type: Sequelize.INTEGER
      },
      fk_id_postulante: {
        type: Sequelize.INTEGER
      },
      fk_id_nivel: {
        type: Sequelize.INTEGER
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('idiomas_postulantes');
  }
};