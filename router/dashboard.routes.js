import express from 'express';
const router = express.Router();

import POOL from "../database/db.js";

router.get("/", async (req, res) => {
    const [userId] = await POOL.execute(`SELECT id FROM accounts WHERE pseudo = ?`, [req.session.user?.pseudo]);
    const [result] = await POOL.execute(`SELECT * FROM classes WHERE account_id = ?`, [userId[0].id]);
    res.render("layout", {template: "pages/dashboard", classes: result});
});

export default router;