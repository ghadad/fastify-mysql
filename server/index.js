require("dotenv").config();
const fastify = require('fastify')({ logger: true })
const plugins = require("./plugins");
const router = require("./router")


fastify.setErrorHandler(function (error, request, reply) {
    // Log error
    this.log.error(error)
    // Send error response
    reply.status(409).send({ ok: false })
})

// Run the server!

const start = async () => {
    try {
        await plugins.register(fastify)
        await router.register(fastify)
        await fastify.listen(3001)
    } catch (err) {
        fastify.log.error(err)
        process.exit(1)
    }
    return { db: fastify.mysql }
}

module.exports = start()

