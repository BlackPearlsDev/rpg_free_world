import express from 'express';
const router = express.Router();

import POOL from "../database/db.js";
import bcrypt from 'bcrypt';

router.get("/", (req, res) => {
    res.render("layout", {template: "pages/login"});
});

router.post("/", async (req, res) => {
    const {pseudo, password} = req.body;
    const [user] = await POOL.execute(`SELECT * FROM accounts WHERE pseudo = ?`, [pseudo]);

    const isSamePwd = user[0] ? await bcrypt.compare(password, user[0].password) : null; 
    
    if(!user[0] || !isSamePwd) {
        res.locals.error = "Bad Email or/and Password";
        res.render("layout", {template: "pages/login"});
    } else { 
        req.session.user = {pseudo: pseudo, role: user[0].Role};
        req.session.isLogged = true;
        // if(user[0].Role === "admin") return res.redirect("/admin");
        res.redirect('/');
    }
});

export default router;