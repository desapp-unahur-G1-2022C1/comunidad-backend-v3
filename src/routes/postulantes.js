import express from 'express';
import {
  getConFiltros,
  getPorDNI,
  getPorIdUsuario,
  postPostulante
} from '../controllers/postulantes';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.get('/idUsuario/:id', withErrorHandling(getPorIdUsuario));
router.get('/dni/:id', withErrorHandling(getPorDNI));
router.post('/', withErrorHandling(postPostulante));

export default router;