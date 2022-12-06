import express from 'express';
import {
  getPorIdOferta,
  getPorIdPostulante,
  getCountPostulacionesPorOferta

} from '../controllers/postulaciones';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/oferta/', withErrorHandling(getPorIdOferta));
router.get('/postulante/', withErrorHandling(getPorIdPostulante));
router.get('/postulacionesporofertas/', withErrorHandling(getCountPostulacionesPorOferta));

export default router;