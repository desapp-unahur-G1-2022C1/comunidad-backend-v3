'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.addConstraint('idiomas_postulantes', {
    fields: ['fk_id_nivel'],
    type: 'foreign key',
    references: {
      table: 'niveles_idiomas',
      field: 'id'
    },
    onDelete: 'cascade',
    onUpdate: 'cascade'
  })
 }
};