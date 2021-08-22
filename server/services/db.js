const db = require("../db");
console.log(db)
module.exports = class DbService {
    constructor() {
        this.db = db
    }
}