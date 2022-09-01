import Main from "../../models/Main.js";
import bcrypt from 'bcrypt';

export const pageLogin = async (req, res) => {
    res.render("layout", {template: "pages/login"});
}

export const loginPost = async (req, res) => {
    const {pseudo, password} = req.body;
    const query = `SELECT * FROM accounts WHERE pseudo = ?`;

    try {
        const user = await Main.getDataByValue(query, pseudo);
        const isSamePwd = user[0] ? await bcrypt.compare(password, user[0].password) : null; 
        
        if(!user[0] || !isSamePwd) {
            res.locals.error = "Bad Email or/and Password";
            res.render("layout", {template: "pages/error"});
        } else { 
            req.session.user = {pseudo: pseudo, role: user[0].Role};
            req.session.isLogged = true;
            // if(user[0].Role === "admin") return res.redirect("/admin");
            res.redirect('/');
        }
    } catch (error) {
        console.log(error);
    }
}