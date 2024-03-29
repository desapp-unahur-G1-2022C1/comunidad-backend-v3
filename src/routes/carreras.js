import express from 'express';
import {
  getAll
} from '../controllers/carreras';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getAll));

export default router;