"use strict";

var _express = _interopRequireDefault(require("express"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const app = (0, _express.default)();
app.set('port', process.env.PORT || 3000);
app.listen(app.get('port'), () => {
  console.log('Servidor conectado al puerto', app.get('port'));
});
//# sourceMappingURL=index.js.map