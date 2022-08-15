"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _usuarios = require("../controllers/usuarios");

var _utils = require("./utils");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.get('/', _usuarios.getAll);
router.post('/signin', _usuarios.signIn);
router.post('/signup', _usuarios.signUp);
var _default = router;
exports.default = _default;
//# sourceMappingURL=usuarios.js.map