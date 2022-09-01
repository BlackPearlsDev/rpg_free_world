export const homePage = async (req, res) => {
    res.render("layout", {template: "pages/home"});
}

export const pageNotFound = (req, res) => {
    res.render("layout", {template: "pages/notFound"});
}

export const pageError = (req, res) => {
    res.render("layout", {template: "pages/error"});
}