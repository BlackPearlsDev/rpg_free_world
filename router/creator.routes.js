import express from 'express';
const router = express.Router();

import POOL from "../database/db.js";

function getRandomInteger(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

router.get("/", async (req, res) => {
    const [result] = await POOL.execute(`SELECT * FROM classes_template`);
    res.render("layout", {template: "pages/creator", classes: result});
});

router.post("/", async (req, res) => {
    const {classeName, role, dps, health, armor, gold} = req.body;
    console.log(classeName, role, dps, health, armor, gold);
    if (classeName == "" || role == "" || dps == "" || health == "" || armor == "" || gold == "") {
        res.redirect("/creator");
    } else {
        console.log(req.session.user?.pseudo);
        const [result] = await POOL.execute(`SELECT id FROM accounts WHERE pseudo = ?`, [req.session.user?.pseudo]);
        const [query] = await POOL.execute(`INSERT INTO classes (classeName, role, dps, health, armor, gold, account_id) VALUES (?, ?, ?, ?, ?, ?, ?)`, [classeName, role, (dps + getRandomInteger(1, 100)), (health + getRandomInteger(1, 100)), (armor + getRandomInteger(1, 100)), (gold + getRandomInteger(1, 100)), result[0].id]);
        console.log('query', query);
        res.redirect("/creator");
    }
});

export default router;