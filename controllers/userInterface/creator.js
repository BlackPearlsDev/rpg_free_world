import Main from "../../models/Main.js";
import POOL from '../../database/db.js'

function getRandomInteger(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

export const pageCreator = async (req, res) => {
    const query = `SELECT * FROM classes_template`;
    const result = await Main.getData(query);
    res.render("layout", {template: "pages/creator", classes: result});
}

export const creatorPost = async (req, res) => {
    const {classeName, role, dps, health, armor, gold} = req.body;
    const dpsValue = parseInt(dps) + getRandomInteger(1, 800);
    const healthValue = parseInt(health) + getRandomInteger(1, 800);
    const armorValue = parseInt(armor) + getRandomInteger(1, 800);
    const goldValue = parseInt(gold) + getRandomInteger(1, 800);

    const query1 = `SELECT id FROM accounts WHERE pseudo = ?`;
    const query2 = `INSERT INTO classes (classeName, role, dps, health, armor, gold, account_id) VALUES (?, ?, ?, ?, ?, ?, ?)`;
    
    try {
        if (classeName === "" || role === "" || dps === "" || health === "" || armor === "" || gold === "") {
            res.redirect("/creator");
        } else {
            const [result] = await Main.getDataByValue(query1, req.session.user?.pseudo);
    
            const datas = {
                classeName: classeName,
                role: role,
                dps: dpsValue,
                health: healthValue,
                armor: armorValue,
                gold: goldValue,
                account_id: result.id,
            }

            const [resultTest] = await POOL.execute("INSERT INTO classes (classeName, role, dps, health, armor, gold, account_id) VALUES (?, ?, ?, ?, ?, ?, ?)", [classeName, role, dpsValue, healthValue, armorValue, goldValue, result.id]);
            // const [query] = await Main.saveCreator(query2, classeName, role, dpsValue, healthValue, armorValue, goldValue, result.id);
            console.log('resultTest', resultTest);
            res.redirect("/creator");
        }
    } catch (error) {
        console.log('error:', error);
    }
}