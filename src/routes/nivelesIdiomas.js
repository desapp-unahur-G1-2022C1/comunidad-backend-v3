import express from 'express';
import {
  getAll
} from '../controllers/nivelesIdiomas';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getAll));

export default router;