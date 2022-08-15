"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = require("express");

var _controllers = require("../controllers");

const router = (0, _express.Router)();
router.get("/usuarios", getAll);
var _default = router;
exports.default = _default;
//# sourceMappingURL=routes.js.map