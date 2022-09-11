import express from 'express';
import {
  getConFiltros,
  getPorId,
  getPorIdUsuario,
  deleteEmpresa,
  postEmpresa,
  updateEmpresa,
  getPeladas

} from '../controllers/empresas';
import { withErrorHandling } from './utils';
import { validateToken } from '../middlewares/validador';

const router = express.Router();

router.get('/', withErrorHandling(getConFiltros));
router.get('/all/', withErrorHandling(getPeladas));
router.get('/cuit/:id', withErrorHandling(getPorId));
router.get('/idUsuario/:id', withErrorHandling(getPorIdUsuario));
router.delete('/cuit/:id', withErrorHandling(deleteEmpresa));
router.post('/',withErrorHandling(postEmpresa));
router.put('/cuit/:id',withErrorHandling(updateEmpresa));

export default router;