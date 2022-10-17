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
import ciudades from './ciudades';
import idiomas from './idiomas';
import nivelesIdiomas from './nivelesIdiomas';
import idiomasPostulantes from './idiomasPostulantes';
import idiomasOfertas from './idiomasOfertas';
import uploadFiles  from './uploadFiles';

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
router.use('/ciudades', ciudades);
router.use('/idiomas', idiomas);
router.use('/nivelesIdiomas', nivelesIdiomas);
router.use('/idiomasPostulantes', idiomasPostulantes);
router.use('/idiomasOfertas', idiomasOfertas);
router.use('/uploadFiles', uploadFiles);

export default router;