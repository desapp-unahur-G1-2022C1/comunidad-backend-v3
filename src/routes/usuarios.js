import express from 'express';
import {
  getAll,
  signIn,
  signUp
} from '../controllers/usuarios';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getAll));
router.post('/signin', withErrorHandling(signIn));
router.post('/signup', withErrorHandling(signUp));

export default router;