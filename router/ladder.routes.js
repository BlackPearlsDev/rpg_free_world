import express from 'express';
const router = express.Router();

import POOL from "../database/db.js";

router.get("/", async (req, res) => {
    const [resultsDPS] = await POOL.query("SELECT classeName, role, dps, health, armor, gold, accounts.id, accounts.pseudo FROM classes JOIN accounts ON classes.account_id = accounts.id ORDER BY dps DESC");
    const [resultsPDV] = await POOL.query("SELECT classeName, role, dps, health, armor, gold, accounts.id, accounts.pseudo FROM classes JOIN accounts ON classes.account_id = accounts.id ORDER BY health DESC");
    const [resultsArmor] = await POOL.query("SELECT classeName, role, dps, health, armor, gold, accounts.id, accounts.pseudo FROM classes JOIN accounts ON classes.account_id = accounts.id ORDER BY armor DESC");
    const [resultsGold] = await POOL.query("SELECT classeName, role, dps, health, armor, gold, accounts.id, accounts.pseudo FROM classes JOIN accounts ON classes.account_id = accounts.id ORDER BY gold DESC");

    res.render("layout", {template: "pages/ladder", dataDPS: resultsDPS, dataPDV: resultsPDV, dataArmor: resultsArmor, dataGold: resultsGold});
});

export default router;