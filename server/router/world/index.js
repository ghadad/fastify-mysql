
module.exports = [{
    method: 'GET',
    url: '/cities',
    handler: async function (request, reply) {

        let [cities] = await request.mysql.query("select * from world_x.city where CountryCode =COALESCE (?,countryCode)", [request.query.c]);
        return { cities: cities }
    }
}, {
    method: 'GET',
    url: '/',
    handler: function (request, reply) {
        return { hello: "World" };
    }
}, {
    method: 'GET',
    url: '/all',
    schema: {
        querystring: {
            offset: { type: 'number' },
            limit: { type: 'number', default: 3 },
        }
    },
    handler: async function (request, reply) {
        const person = new Object();

        var me = Object.create({ a: 1, b: 2 });
        Object.assign(person, { c: 4 })
        person.ddd = 1

        const orgObject = { company: 'ABC Corp' };
        const employee = Object.create(orgObject, { name: { value: 'EmployeeOne' } });

        console.log("employee", employee); // { company: "ABC Corp" }
        console.log("employee.name", employee.name); // "EmployeeOne"

        let arr = []
        arr.push(1)
        arr.push(2)
        arr.push(3)
        arr.pop()
        arr.shift()
        arr.unshift(4)

        let [res] = await request.mysql.query(`
                select world_x.city.Name as 'City' ,world_x.country.code
                from world_x.country
                left join world_x.city
                on world_x.country.code = world_x.city.countryCode
                order by 1
                limit ?   OFFSET ?  `, [request.query.limit, request.query.offset]);

        return { res: res, r: person, employee: employee, arr };
    }
}]