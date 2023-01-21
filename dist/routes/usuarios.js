"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _usuarios = require("../controllers/usuarios");

var _utils = require("./utils");

var _validador = require("../middlewares/validador");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.get('/', (0, _utils.withErrorHandling)(_usuarios.getAll));
router.post('/signin', (0, _utils.withErrorHandling)(_usuarios.signIn));
router.post('/signup', (0, _utils.withErrorHandling)(_usuarios.signUp));
router.delete('/:id', (0, _utils.withErrorHandling)(_usuarios.deleteUsuario));
var _default = router;
exports.default = _default;
//# sourceMappingURL=usuarios.js.map