import express from 'express';
import {
  getConFiltros,
  getPorId
  
} from '../controllers/empresas';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.get('/:id', withErrorHandling(getPorId));

export default router;