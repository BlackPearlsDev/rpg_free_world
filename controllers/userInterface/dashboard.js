import Main from "../../models/Main.js";

export const pageDashboard = async (req, res) => {
    const pseudo = req.session.user?.pseudo;
    const query1 = `SELECT * from accounts WHERE pseudo = ?`;
    const query2 = `SELECT * from classes WHERE account_id = ?`;

    try {
        const user = await Main.getDataByValue(query1, pseudo);
        const classes = await Main.getDataByValue(query2, user[0].id);
        res.render("layout", {template: "pages/dashboard", classes: classes});
    } catch (error) {
        console.log(error);
    }
}