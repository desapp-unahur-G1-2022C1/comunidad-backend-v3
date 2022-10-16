'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.addConstraint('idiomas_ofertas', {
    fields: ['fk_id_oferta'],
    type: 'foreign key',
    references: {
      table: 'ofertas',
      field: 'id'
    },
    onDelete: 'cascade',
    onUpdate: 'cascade'
  })
 }
};