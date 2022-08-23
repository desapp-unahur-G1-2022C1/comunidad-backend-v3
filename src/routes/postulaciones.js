import express from 'express';
import {
  getConFiltros,
  postPostulaciones
} from '../controllers/postulaciones';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.post('/', withErrorHandling(postPostulaciones));

export default router;