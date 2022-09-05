import express from 'express';
import {
  getConFiltros,
  postPostulaciones,
  getPorId,
  deletePostulacion,
  updatePostulaciones,
  getPorIdOferta,
  getPorIdPostulante,

} from '../controllers/postulaciones';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.post('/', withErrorHandling(postPostulaciones));
router.get('/:id', withErrorHandling(getPorId));
router.delete('/:id', withErrorHandling(deletePostulacion));
router.put('/:id', withErrorHandling(updatePostulaciones));

export default router;