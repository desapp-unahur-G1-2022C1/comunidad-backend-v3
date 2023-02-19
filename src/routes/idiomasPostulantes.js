import express from 'express';
import {
  getAll,
  postIdiomasPostulantes,
  getPorId
} from '../controllers/idiomasPostulantes';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validator';

const router = express.Router();

router.get('/', withErrorHandling(getAll));
router.post('/', withErrorHandling(postIdiomasPostulantes));
router.get('/:id', withErrorHandling(getPorId));

export default router;