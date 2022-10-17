import express from 'express';
import {
  uploadFiles
} from '../controllers/uploadFiles';

import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';
import {multer} from '../middlewares/multer';


const router = express.Router();

router.post('/', multer.single("uploadfile"), withErrorHandling(uploadFiles));

export default router;
