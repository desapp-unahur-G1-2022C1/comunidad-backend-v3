import express from 'express';
import {
  getConFiltros,
  getPorId,
  getPorIdUsuario,
  postPostulante
} from '../controllers/postulantes';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.get('/idUsuario/:id', withErrorHandling(getPorIdUsuario));
router.get('/dni/:id', withErrorHandling(getPorId));
router.post('/', withErrorHandling(postPostulante));

export default router;