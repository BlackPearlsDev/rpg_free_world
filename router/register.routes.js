import express from 'express';
const router = express.Router();

import POOL from "../database/db.js";
import bcrypt from 'bcrypt';

router.get("/", (req, res) => {
    res.render("layout", {template: "pages/register"});
});

router.post("/", async (req, res) => {
    const saltRounds = 10;
    const {name, password, pseudo} = req.body;
    console.log(name, password, pseudo);
    const [user] = await POOL.execute(`SELECT * from accounts WHERE name = ?`, [name]);
    console.log(user);
    if(!user[0]){
        const hash = await bcrypt.hash(password, saltRounds);
        const [userSave] = await POOL.execute(`INSERT INTO accounts (name, password, pseudo) VALUE(?, ?, ?)`, [name, hash, pseudo]);
        console.log(userSave);
        res.redirect("/login");
    } else {
        res.redirect("/error");
    }
});

export default router;