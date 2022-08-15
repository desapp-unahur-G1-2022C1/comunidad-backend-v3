import express from 'express';

import usuarios from './usuarios';
import postulantes from './postulantes'
import ofertasPorEmpresa from './ofertasPorEmpresa'
import ofertas from './ofertas'

const router = express.Router();

router.use('/usuarios', usuarios);
router.use('/postulantes', postulantes);
router.use('/ofertasPorEmpresa', ofertasPorEmpresa);
router.use('/ofertas', ofertas);

export default router;