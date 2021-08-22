const { resolve } = require('path');
const { readdir } = require('fs').promises;

async function* getFiles(dir) {
    const dirents = await readdir(dir, { withFileTypes: true });
    for (const dirent of dirents) {
        const res = resolve(dir, dirent.name);
        if (dirent.isDirectory()) {
            yield* getFiles(res);
        } else {
            yield res.replace(__dirname, "");
        }
    }
}


async function register(fastify) {
    for await (const f of getFiles(__dirname)) {

        let newMod = f.replace(/index\.js$/, '').replace(/\.js$/, '')

        let routes = require("./" + newMod)

        if (!Array.isArray(routes))
            continue;
        for (let r of routes) {
            let newPath = newMod + "/" + r.url
            newPath = newPath.replace(/\/+/g, '/')

            r.url = newPath;
            fastify.route(r)
        }


    }
}

module.exports = {
    register: register
}


