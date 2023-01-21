"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _uploadFiles = require("../controllers/uploadFiles");

var _utils = require("./utils");

var _validador = require("../middlewares/validador");

var _multer = require("../middlewares/multer");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.post('/', _multer.multer.single("uploadfile"), (0, _utils.withErrorHandling)(_uploadFiles.uploadFiles));
var _default = router;
exports.default = _default;
//# sourceMappingURL=uploadFiles.js.map