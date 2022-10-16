'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.addConstraint('ciudades', {
    fields: ['fk_id_provincia'],
    type: 'foreign key',
    references: {
      table: 'provincias',
      field: 'id'
    },
    onDelete: 'cascade',
    onUpdate: 'cascade'
  })
 }
};