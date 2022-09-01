import express from 'express';
import 'dotenv/config';
import {fileURLToPath} from 'url';
import path from 'path';

import session from 'express-session';

import router from './router/index.js';
import {PORT} from './lib/index.js';

const app = express();
app.set("views", "./views");
app.set("view engine", "ejs");

const __filename = fileURLToPath(import.meta.url);
const __dirname  = path.dirname(__filename);
app.use(express.static(path.join(__dirname + "/public")));

app.use(express.json());
app.use(express.urlencoded({extended: true}));

app.use(session({
    secret: "secret",
    resave: true,
    saveUninitialized: true,
    proxy: true,
    cookie: {
        maxAge: 24 * 60 * 60 * 1000,
        secure: process.env.NOVE_ENV && process.env.NOVE_ENV === "production" ? true : false,
    },
}));

app.use((req, res, next)=>{
    res.locals.session = req.session;
    res.locals.error = null;
    
    if(!req.session.user){
        req.session.user = null;
        req.session.isLogged = false;
    }
    next();
});

app.use(router);

app.listen(PORT, ()=> {
    console.log(`Server launch at http://localhost:${PORT}`)
});