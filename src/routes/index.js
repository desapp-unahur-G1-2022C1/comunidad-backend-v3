import express from 'express';

import usuarios from './usuarios';
import postulantes from './postulantes'
import ofertas from './ofertas'
import empresas from './empresas'
import postulaciones from './postulaciones';

const router = express.Router();

router.use('/usuarios', usuarios);
router.use('/postulantes', postulantes);
router.use('/ofertas', ofertas);
router.use('/empresas', empresas);
router.use('/postulaciones', postulaciones)

export default router;