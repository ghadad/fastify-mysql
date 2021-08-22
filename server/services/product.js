
const DbService = require("./db");

class Product extends DbService {
    constructor() {
        super();
    }

    async search(term = "") {
        const [products, meta] = await this.db.query(
            `select p.name as 'name',
                    p.id as 'productId',
                    pc.name as 'category',
                    p.price ,
                    o.id as 'OrderId', 
                    concat('The greate Customer ever:',cust.first_name, ',',cust.last_name)  as 'CustomerName'
             from products p 
             right join product_categories pc
                   on p.category  = pc.id
             right join orders o
                    on p.id = o.product      
             join customers cust
                   on o.customer =  cust.id
             where p.name like ?
             order by 1
             limit 3`, ["%" + term + "%"]);
        return products
    }

    async update(p = 0) {
        return await this.db.execute(
            `update products
            set price = price  + (price * ? /100) `, [p]
        )
    }

    async remove(id = null) {
        if (!id)
            throw new Error("missing id ");

        return await this.db.execute(
            `delete from  products where id  = ?`, [id]
        )
    }
}

module.exports = new Product();
