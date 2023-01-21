"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _empresas = require("../controllers/empresas");

var _utils = require("./utils");

var _validador = require("../middlewares/validador");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.get('/', (0, _utils.withErrorHandling)(_empresas.getConFiltros));
router.get('/all/', (0, _utils.withErrorHandling)(_empresas.getPeladas));
router.get('/cuit/:id', (0, _utils.withErrorHandling)(_empresas.getPorId));
router.get('/idUsuario/:id', (0, _utils.withErrorHandling)(_empresas.getPorIdUsuario));
router.delete('/cuit/:id', (0, _utils.withErrorHandling)(_empresas.deleteEmpresa));
router.post('/', (0, _utils.withErrorHandling)(_empresas.postEmpresa));
router.put('/cuit/:id', (0, _utils.withErrorHandling)(_empresas.updateEmpresa));
router.patch('/cuit/:id', (0, _utils.withErrorHandling)(_empresas.patchEmpresa));
var _default = router;
exports.default = _default;
//# sourceMappingURL=empresas.js.map