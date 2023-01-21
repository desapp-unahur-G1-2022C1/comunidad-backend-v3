"use strict";

var _express = _interopRequireDefault(require("express"));

var _routes = _interopRequireDefault(require("./routes"));

var _cors = _interopRequireDefault(require("cors"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

//var cors = require('cors');
//import sequelize from "../database/models";
const {
  sequelize
} = require('../database/models');

const app = (0, _express.default)();
app.set('port', process.env.PORT || 3000);
app.use(_express.default.json());
app.use((0, _cors.default)());
app.use('/', _routes.default);
app.listen(app.get('port'), () => {
  console.log('Servidor conectado al puerto', app.get('port')), sequelize.authenticate();
});
module.exports = app;
//# sourceMappingURL=app.js.map