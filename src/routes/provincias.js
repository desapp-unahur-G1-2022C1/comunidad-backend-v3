import express from 'express';
import {
  getConFiltros
} from '../controllers/provincias';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/',validateToken, withErrorHandling(getConFiltros));

export default router;