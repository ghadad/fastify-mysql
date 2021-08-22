module.exports = [
    {
        method: 'GET',
        url: '/user/select',
        handler: async function (request, reply) {
            const connection = await request.mysql.getConnection();

            const [rows, fields] = await connection.query("select * from user");
            connection.release();

            return { users: rows }
        }
    }]
