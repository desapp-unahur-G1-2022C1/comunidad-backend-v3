import express from 'express';
import {
  getConFiltros
} from '../controllers/provincias';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validator';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));

export default router;