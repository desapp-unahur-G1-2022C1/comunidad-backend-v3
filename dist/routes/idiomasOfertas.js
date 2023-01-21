"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _idiomasOfertas = require("../controllers/idiomasOfertas");

var _utils = require("./utils");

var _validador = require("../middlewares/validador");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.get('/', (0, _utils.withErrorHandling)(_idiomasOfertas.getAll));
router.post('/', (0, _utils.withErrorHandling)(_idiomasOfertas.postIdiomasOfertas));
router.get('/:id', (0, _utils.withErrorHandling)(_idiomasOfertas.getPorId));
var _default = router;
exports.default = _default;
//# sourceMappingURL=idiomasOfertas.js.map