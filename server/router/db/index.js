const { QueryTypes } = require("sequelize")
module.exports = [{
    method: 'GET',
    url: '/test',
    handler: async function (request, reply) {
        let tabs = await request.db.query("SHOW TABLES", { type: QueryTypes.SELECT });
        return { tabs: tabs }
    }
}, {
    method: 'GET',
    url: '/test2',
    handler: async function (request, reply) {
        request.mysql.query(
            'SELECT * from user', [request.params.id],
            function onResult(err, result) {
                reply.send(err || result)
            }
        )
    }
}, {
    method: 'GET',
    url: '/create',
    handler: async function (request, reply) {
        let [result, metadata] = await request.db.query(`create table user2 (
            user_id numeric 
        )`);
        return { result: result, netadata: metadata }
    }
}, {
    method: 'GET',
    url: '/insert',
    handler: async function (request, reply) {
        let [result, metadata] = await request.db.query(`insert into user  values (1,'golan')`);
        [result, metadata] = await request.db.query(`insert into user values (2,'avi')`);
        [result, metadata] = await request.db.query(`insert into user  values (3,'golan2')`);
        [result, metadata] = await request.db.query(`insert into user values (4,'golan3')`);
        return { result: result, netadata: metadata }
    }
},]