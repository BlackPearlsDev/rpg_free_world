import express from 'express';
const router = express.Router();

import {pageLogin, loginPost} from '../controllers/entry/login.js'

router.get("/", pageLogin);

router.post("/", loginPost);

export default router;