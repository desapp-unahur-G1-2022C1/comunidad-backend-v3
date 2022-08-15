import express from 'express';
import {
  getOfertasPorIdEmpresa
} from '../controllers/ofertasPorEmpresa';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/:id', withErrorHandling(getOfertasPorIdEmpresa));

export default router;