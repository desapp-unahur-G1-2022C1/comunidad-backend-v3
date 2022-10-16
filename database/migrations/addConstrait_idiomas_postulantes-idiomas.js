'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.addConstraint('idiomas_postulantes', {
    fields: ['fk_id_idioma'],
    type: 'foreign key',
    references: {
      table: 'idiomas',
      field: 'id'
    },
    onDelete: 'cascade',
    onUpdate: 'cascade'
  })
 }
};