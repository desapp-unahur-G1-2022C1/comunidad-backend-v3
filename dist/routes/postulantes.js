"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _postulantes = require("../controllers/postulantes");

var _utils = require("./utils");

var _validador = require("../middlewares/validador");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.get('/', (0, _utils.withErrorHandling)(_postulantes.getConFiltros));
router.get('/idUsuario/:id', (0, _utils.withErrorHandling)(_postulantes.getPorIdUsuario));
router.get('/dni/:id', (0, _utils.withErrorHandling)(_postulantes.getPorId));
router.post('/', (0, _utils.withErrorHandling)(_postulantes.postPostulante));
router.delete('/dni/:id', (0, _utils.withErrorHandling)(_postulantes.deletePostulante));
router.put('/dni/:id', (0, _utils.withErrorHandling)(_postulantes.updatePostulante));
var _default = router;
exports.default = _default;
//# sourceMappingURL=postulantes.js.map