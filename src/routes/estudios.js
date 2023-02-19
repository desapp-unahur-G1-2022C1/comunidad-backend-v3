import express from 'express';
import {
  getAll
} from '../controllers/estudios';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validator';

const router = express.Router();

router.get('/', withErrorHandling(getAll));

export default router;