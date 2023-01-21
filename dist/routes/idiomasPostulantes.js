"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _idiomasPostulantes = require("../controllers/idiomasPostulantes");

var _utils = require("./utils");

var _validador = require("../middlewares/validador");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.get('/', (0, _utils.withErrorHandling)(_idiomasPostulantes.getAll));
router.post('/', (0, _utils.withErrorHandling)(_idiomasPostulantes.postIdiomasPostulantes));
router.get('/:id', (0, _utils.withErrorHandling)(_idiomasPostulantes.getPorId));
var _default = router;
exports.default = _default;
//# sourceMappingURL=idiomasPostulantes.js.map