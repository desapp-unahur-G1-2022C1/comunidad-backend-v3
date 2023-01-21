"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _nivelesIdiomas = require("../controllers/nivelesIdiomas");

var _utils = require("./utils");

var _validador = require("../middlewares/validador");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.get('/', (0, _utils.withErrorHandling)(_nivelesIdiomas.getAll));
var _default = router;
exports.default = _default;
//# sourceMappingURL=nivelesIdiomas.js.map