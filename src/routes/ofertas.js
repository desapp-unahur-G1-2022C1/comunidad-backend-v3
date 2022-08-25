import express from 'express';
import {
  getConFiltros,
  getPorId,
  getOfertasPorIdEmpresa,
  postOfertas,
  deleteOferta,
  updateOfertas
} from '../controllers/ofertas';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.get('/idOferta/:id', withErrorHandling(getPorId));
router.get('/cuit/:id', withErrorHandling(getOfertasPorIdEmpresa));
router.post('/',withErrorHandling(postOfertas));
router.delete('/idOferta/:id', withErrorHandling(deleteOferta));
router.put('/idOferta/:id', withErrorHandling(updateOfertas));
export default router;