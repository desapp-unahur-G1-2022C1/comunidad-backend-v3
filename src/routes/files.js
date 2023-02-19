import express from 'express';
import {
  uploadFoto,
  uploadLogo,
  uploadCV,
  getFiles
} from '../controllers/files';

import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validator';
import {multer} from '../middlewares/multer';


const router = express.Router();

router.post('/logo', multer.single("logo"), withErrorHandling(uploadLogo));
router.post('/cv', multer.single("cv"), withErrorHandling(uploadCV));
router.post('/foto', multer.single("foto"), withErrorHandling(uploadFoto));
router.get('/', withErrorHandling(getFiles));

export default router;
