import express from 'express';
const router = express.Router();

import {pageDashboard} from '../controllers/userInterface/dashboard.js'

router.get("/", pageDashboard);

export default router;