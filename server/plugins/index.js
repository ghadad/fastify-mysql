const options = require("./options");

module.exports = {
    register: async function (fastify) {
        await fastify.register(
            require('sequelize-fastify'), options.sequelize
        )

        try {
            // first connection
            const result = await fastify.db.authenticate();
            fastify.addHook('onRequest', async (req, reply) => {
                req.db = fastify.db;
            })
            fastify.log.info('Database connection is successfully established.')
        } catch (err) {

            fastify.log.error(`Connection could not established: ${err}`)
        }


        await fastify.register(
            require('fastify-mysql'), options.mysql
        )

        console.log(fastify.mysql)
        fastify.addHook('onRequest', async (req, reply) => {
            req.mysql = fastify.mysql;
        })

    }
}