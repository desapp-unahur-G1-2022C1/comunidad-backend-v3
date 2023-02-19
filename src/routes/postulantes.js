import express from 'express';
import {
  getConFiltros,
  getPorId,
  getPorIdUsuario,
  postPostulante,
  deletePostulante,
  updatePostulante
} from '../controllers/postulantes';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validator';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.get('/idUsuario/:id', withErrorHandling(getPorIdUsuario));
router.get('/dni/:id', withErrorHandling(getPorId));
router.post('/', withErrorHandling(postPostulante));
router.delete('/dni/:id', withErrorHandling(deletePostulante));
router.put('/dni/:id', withErrorHandling(updatePostulante));

export default router;