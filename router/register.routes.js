import express from 'express';
const router = express.Router();

import {pageRegister, registerPost} from '../controllers/entry/register.js'

router.get("/", pageRegister);

router.post("/", registerPost);

export default router;