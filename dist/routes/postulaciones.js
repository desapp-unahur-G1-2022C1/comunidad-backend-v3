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

router.get('/', (0, _utils.withErrorHandling)(_postulaciones.getConFiltros));
router.post('/', (0, _utils.withErrorHandling)(_postulaciones.postPostulaciones));
router.get('/:id', (0, _utils.withErrorHandling)(_postulaciones.getPorId));
router.delete('/:id', (0, _utils.withErrorHandling)(_postulaciones.deletePostulacion));
router.put('/:id', (0, _utils.withErrorHandling)(_postulaciones.updatePostulaciones));
var _default = router;
exports.default = _default;
//# sourceMappingURL=postulaciones.js.map