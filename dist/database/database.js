"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.sequelize = void 0;

var _sequelize = _interopRequireDefault(require("sequelize"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const sequelize = new _sequelize.default("desarrollo", "postgres", "admin1234", {
  host: "127.0.0.1",
  dialect: "postgres"
});
exports.sequelize = sequelize;
//# sourceMappingURL=database.js.map