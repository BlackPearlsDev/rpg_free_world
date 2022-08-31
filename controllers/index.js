import Main from "../models/Main.js";

export const homePage = async (req, res) => {
    res.render("layout", {template: "pages/home"});
}

export const pageNotFound = (req, res) => {
    res.render("layout", {template: "pages/notFound"});
}

export const pageLogin = (req, res) => {
    res.render("layout", {template: "pages/login"});
}

export const pageRegister = async (req, res) => {
    res.render("layout", {template: "pages/register"});
}

export const pageError = (req, res) => {
    res.render("layout", {template: "pages/error"});
}

export const pageDashboard = (req, res) => {
    res.render("layout", {template: "pages/dashboard"});
}

export const pageCreator = (req, res) => {
    res.render("layout", {template: "pages/creator"});
}