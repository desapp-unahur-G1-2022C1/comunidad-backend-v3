import express from 'express';
import {
  getPorIdOferta,
  getPorIdPostulante,

} from '../controllers/postulaciones';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/oferta/', withErrorHandling(getPorIdOferta));
router.get('/postulante/', withErrorHandling(getPorIdPostulante));

export default router;