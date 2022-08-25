import express from 'express';
import {
  getConFiltros,
  getPorId,
  getOfertasPorIdEmpresa,
  postOfertas
} from '../controllers/ofertas';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.get('/idOferta/:id', withErrorHandling(getPorId));
router.get('/cuit/:id', withErrorHandling(getOfertasPorIdEmpresa));
router.post('/',withErrorHandling(postOfertas));

export default router;