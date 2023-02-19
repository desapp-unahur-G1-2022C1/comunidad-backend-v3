import express from 'express';
import {
  getAll,
  postIdiomasOfertas,
  getPorId
} from '../controllers/idiomasOfertas';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validator';

const router = express.Router();

router.get('/', withErrorHandling(getAll));
router.post('/', withErrorHandling(postIdiomasOfertas));
router.get('/:id', withErrorHandling(getPorId));

export default router;