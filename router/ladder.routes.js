import express from 'express';
const router = express.Router();

import {pageLadder} from '../controllers/userInterface/ladder.js'

router.get("/", pageLadder);

export default router;