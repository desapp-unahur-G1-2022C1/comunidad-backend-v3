import express from 'express';
import {
  getAll,
  signIn,
  signUp,
  deleteUsuario
} from '../controllers/usuarios';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validator';

const router = express.Router();

router.get('/', validateToken, withErrorHandling(getAll));
router.post('/signin', withErrorHandling(signIn));
router.post('/signup', withErrorHandling(signUp));
//router.delete('/:id', withErrorHandling(deleteUsuario));

export default router;