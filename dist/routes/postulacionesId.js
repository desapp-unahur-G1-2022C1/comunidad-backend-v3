"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _postulaciones = require("../controllers/postulaciones");

var _utils = require("./utils");

var _validador = require("../middlewares/validador");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.get('/oferta/', (0, _utils.withErrorHandling)(_postulaciones.getPorIdOferta));
router.get('/postulante/', (0, _utils.withErrorHandling)(_postulaciones.getPorIdPostulante));
router.get('/postulacionesporofertas/', (0, _utils.withErrorHandling)(_postulaciones.getCountPostulacionesPorOferta));
var _default = router;
exports.default = _default;
//# sourceMappingURL=postulacionesId.js.map