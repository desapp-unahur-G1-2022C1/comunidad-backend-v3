"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _express = _interopRequireDefault(require("express"));

var _usuarios = _interopRequireDefault(require("./usuarios"));

var _postulantes = _interopRequireDefault(require("./postulantes"));

var _ofertas = _interopRequireDefault(require("./ofertas"));

var _empresas = _interopRequireDefault(require("./empresas"));

var _postulaciones = _interopRequireDefault(require("./postulaciones"));

var _jornadas = _interopRequireDefault(require("./jornadas"));

var _contratos = _interopRequireDefault(require("./contratos"));

var _estudios = _interopRequireDefault(require("./estudios"));

var _carreras = _interopRequireDefault(require("./carreras"));

var _postulacionesId = _interopRequireDefault(require("./postulacionesId"));

var _provincias = _interopRequireDefault(require("./provincias"));

var _ciudades = _interopRequireDefault(require("./ciudades"));

var _idiomas = _interopRequireDefault(require("./idiomas"));

var _nivelesIdiomas = _interopRequireDefault(require("./nivelesIdiomas"));

var _idiomasPostulantes = _interopRequireDefault(require("./idiomasPostulantes"));

var _idiomasOfertas = _interopRequireDefault(require("./idiomasOfertas"));

var _uploadFiles = _interopRequireDefault(require("./uploadFiles"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const router = _express.default.Router();

router.use('/usuarios', _usuarios.default);
router.use('/postulantes', _postulantes.default);
router.use('/ofertas', _ofertas.default);
router.use('/empresas', _empresas.default);
router.use('/postulaciones', _postulaciones.default);
router.use('/jornadas', _jornadas.default);
router.use('/contratos', _contratos.default);
router.use('/estudios', _estudios.default);
router.use('/carreras', _carreras.default);
router.use('/postulacionesId', _postulacionesId.default);
router.use('/provincias', _provincias.default);
router.use('/ciudades', _ciudades.default);
router.use('/idiomas', _idiomas.default);
router.use('/nivelesIdiomas', _nivelesIdiomas.default);
router.use('/idiomasPostulantes', _idiomasPostulantes.default);
router.use('/idiomasOfertas', _idiomasOfertas.default);
router.use('/uploadFiles', _uploadFiles.default);
var _default = router;
exports.default = _default;
//# sourceMappingURL=index.js.map