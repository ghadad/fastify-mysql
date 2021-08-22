
const Product = require("../../services/product")

module.exports = [{
    method: 'GET',
    url: '/search',
    handler: async function (request, reply) {
        const m = new Set();
        m.add('2222');
        m.add('2222');
        m.add('2221');

        console.log(m.values())
        const products = await Product.search(request.query.term)
        return { m: m.values(), products: products }
    }
}, {
    method: 'GET',
    url: '/update',
    handler: async function (request, reply) {
        const result = await Product.update(request.query.p || 0)
        return { result: result }
    }
}, {
    method: 'GET',
    url: '/delete',
    handler: async function (request, reply) {
        const result = await Product.remove(request.query.id)
        return { result: result }
    }
}]