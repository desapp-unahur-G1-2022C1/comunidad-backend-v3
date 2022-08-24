import express from 'express';
import {
  getConFiltros,
  getPorId,
  getPorIdUsuario

} from '../controllers/empresas';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.get('/cuit/:id', withErrorHandling(getPorId));
router.get('/idUsuario/:id', withErrorHandling(getPorIdUsuario));

export default router;