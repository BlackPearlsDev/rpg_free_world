import express from 'express';
const router = express.Router();

import {pageDashboard, deleteClasse} from '../controllers/userInterface/dashboard.js'

router.get("/", pageDashboard);
router.get("/delete/:id", deleteClasse);

export default router;