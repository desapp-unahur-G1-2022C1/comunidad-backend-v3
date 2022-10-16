'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.addConstraint('idiomas_postulantes', {
    fields: ['fk_id_postulante'],
    type: 'foreign key',
    references: {
      table: 'postulantes',
      field: 'id'
    },
    onDelete: 'cascade',
    onUpdate: 'cascade'
  })
 }
};