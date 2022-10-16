"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _ofertas = require("../controllers/ofertas");

var _utils = require("./utils");

var _validador = require("../middlewares/validador");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.get('/', (0, _utils.withErrorHandling)(_ofertas.getConFiltros));
router.get('/all/', (0, _utils.withErrorHandling)(_ofertas.getPeladas));
router.get('/idOferta/:id', (0, _utils.withErrorHandling)(_ofertas.getPorId));
router.get('/cuit/:id', (0, _utils.withErrorHandling)(_ofertas.getOfertasPorIdEmpresa));
router.post('/', (0, _utils.withErrorHandling)(_ofertas.postOfertas));
router.delete('/idOferta/:id', (0, _utils.withErrorHandling)(_ofertas.deleteOferta));
router.put('/idOferta/:id', (0, _utils.withErrorHandling)(_ofertas.updateOfertas));
var _default = router;
exports.default = _default;
//# sourceMappingURL=ofertas.js.map