import Main from "../../models/Main.js";
import bcrypt from 'bcrypt';

export const pageRegister = async (req, res) => {
    res.render("layout", {template: "pages/register"});
}

export const registerPost = async (req, res) => {
    const saltRounds = 10;
    const {name, password, pseudo} = req.body;
    
    const query1 = `SELECT * from accounts WHERE name = ?`;
    const query2 = `INSERT INTO accounts (name, password, pseudo) VALUE(?, ?, ?)`;

    try {
        const user = await Main.getDataByValue(query1, pseudo);
        if(!user[0]){
            const hash = await bcrypt.hash(password, saltRounds);
            const datas = {
                name: name,
                password: hash,
                pseudo: pseudo,
            }
            const userSave = await Main.saveValues(query2, datas);
            res.redirect("/login");
        } else {
            res.redirect("/error");
        }
    } catch (error) {
        console.log(error);
    }
}