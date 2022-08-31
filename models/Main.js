import POOL from "../database/db.js";

class Main {
    
    static async getData(query){
        const [datas] = await POOL.execute(query);
        return datas;
    }

    static async saveOrEdit(query, datas){
        const [result] = await POOL.execute(query, [...Object.values(datas)]);
        return result;
    }
}

export default Main;