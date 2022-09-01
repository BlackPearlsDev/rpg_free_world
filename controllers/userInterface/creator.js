import Main from "../../models/Main.js";
import POOL from '../../database/db.js'

function getRandomInteger(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

export const pageCreator = async (req, res) => {
    const query1 = `SELECT id, name FROM classes_template`;
    const query2 = `SELECT specName, style, classes_id, classes_template.name AS classeName FROM specs_template JOIN classes_template ON specs_template.classes_id = classes_template.id`;
    const result = await Main.getData(query1);
    const result2 = await Main.getData(query2);
    res.render("layout", {template: "pages/creator", classes: result, specs: result2});
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