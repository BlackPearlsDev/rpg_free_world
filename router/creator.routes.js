import express from 'express';
const router = express.Router();

import {pageCreator, creatorPost} from '../controllers/userInterface/creator.js'

router.get("/", pageCreator);

router.post("/", creatorPost);

export default router;