import express from 'express';
import {
  getPorIdOferta,
  getPorIdPostulante,
  getCountPostulacionesPorOferta

} from '../controllers/postulaciones';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/oferta/',validateToken, withErrorHandling(getPorIdOferta));
router.get('/postulante/',validateToken, withErrorHandling(getPorIdPostulante));
router.get('/postulacionesporofertas/',validateToken, withErrorHandling(getCountPostulacionesPorOferta));

export default router;