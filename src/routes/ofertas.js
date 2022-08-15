import express from 'express';
import {
  getConFiltros,
  getPorIdOferta
} from '../controllers/ofertas';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.get('/:id', withErrorHandling(getPorIdOferta));

export default router;