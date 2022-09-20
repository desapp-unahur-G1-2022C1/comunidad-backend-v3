import express from 'express';

import usuarios from './usuarios';
import postulantes from './postulantes'
import ofertas from './ofertas'
import empresas from './empresas'
import postulaciones from './postulaciones';
import jornadas from './jornadas';
import contratos from './contratos';
import estudios from './estudios';
import carreras from './carreras';
import postulacionesId from './postulacionesId'
import provincias from './provincias';
import departamentos from './departamentos';

const router = express.Router();

router.use('/usuarios', usuarios);
router.use('/postulantes', postulantes);
router.use('/ofertas', ofertas);
router.use('/empresas', empresas);
router.use('/postulaciones', postulaciones);
router.use('/jornadas', jornadas);
router.use('/contratos', contratos);
router.use('/estudios', estudios);
router.use('/carreras', carreras);
router.use('/postulacionesId', postulacionesId);
router.use('/provincias', provincias);
router.use('/departamentos', departamentos);

export default router;