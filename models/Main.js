import POOL from "../database/db.js";

class Main {
    
    static async getData(query){
        const [datas] = await POOL.execute(query);
        return datas;
    }

    static async getDataByObject(query, datas){
        const [result] = await POOL.execute(query, [...Object.values(datas)]);
        // le spread recupere les values de l'objets en arguments, l'agument passé doit être de fait un objet
        return result;
    }

    static async getDataByValue(query, val){
        const [result] = await POOL.execute(query, [val]);
        return result;
    }

    static async saveValues(query, val){
        const [result] = await POOL.execute(query, [...Object.values(val)]);
        return result;
    }

    static async saveCreator(query, ...val){
        console.log('val:', val);
        const [result] = await POOL.execute(query, [...val]);
        return result;
    }
}

export default Main;