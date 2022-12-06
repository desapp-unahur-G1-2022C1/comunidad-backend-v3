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
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/',validateToken, withErrorHandling(getConFiltros));
router.get('/idUsuario/:id',validateToken, withErrorHandling(getPorIdUsuario));
router.get('/dni/:id',validateToken, withErrorHandling(getPorId));
router.post('/', withErrorHandling(postPostulante));
router.delete('/dni/:id',validateToken, withErrorHandling(deletePostulante));
router.put('/dni/:id',validateToken, withErrorHandling(updatePostulante));

export default router;