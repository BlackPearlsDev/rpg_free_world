import express from 'express'
const router = express.Router();

import loginRoute from './login.routes.js';
import registerRoute from './register.routes.js';
import logoutRoute from './logout.routes.js';
import creatorRoute from './creator.routes.js';
import dashboardRoute from './dashboard.routes.js';
import ladderRoute from './ladder.routes.js';

import userOnly from '../middlewares/userOnly.js';

import {homePage, pageNotFound, pageError} from '../controllers/index.js';

router.get("/", homePage);
router.get("/error", pageError);

router.use("/login", loginRoute);
router.use("/register", registerRoute);
router.use("/logout", logoutRoute);
router.use("/creator", userOnly, creatorRoute);
router.use("/dashboard", userOnly, dashboardRoute);
router.use("/ladder", ladderRoute);

router.all("/*", pageNotFound);

export default router;