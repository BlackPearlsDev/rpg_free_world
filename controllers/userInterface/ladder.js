import Main from "../../models/Main.js";

export const pageLadder = async (req, res) => {
    const queryDPS = `SELECT classeName, role, dps, health, armor, gold, accounts.id, accounts.pseudo FROM classes JOIN accounts ON classes.account_id = accounts.id ORDER BY dps DESC`; 
    const queryPDV = `SELECT classeName, role, dps, health, armor, gold, accounts.id, accounts.pseudo FROM classes JOIN accounts ON classes.account_id = accounts.id ORDER BY health DESC`;
    const queryArmor = `SELECT classeName, role, dps, health, armor, gold, accounts.id, accounts.pseudo FROM classes JOIN accounts ON classes.account_id = accounts.id ORDER BY armor DESC`;
    const queryGold = `SELECT classeName, role, dps, health, armor, gold, accounts.id, accounts.pseudo FROM classes JOIN accounts ON classes.account_id = accounts.id ORDER BY gold DESC`;

    const resultDPS = await Main.getData(queryDPS);
    const resultPDV = await Main.getData(queryPDV);
    const resultArmor = await Main.getData(queryArmor);
    const resultGold = await Main.getData(queryGold);

    res.render("layout", {template: "pages/ladder", dataDPS: resultDPS, dataPDV: resultPDV, dataArmor: resultArmor, dataGold: resultGold});
}