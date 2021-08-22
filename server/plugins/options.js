module.exports = {
    sequelize: {
        instance: 'db',
        sequelizeOptions: {
            dialect: 'mysql', /* one of 'mysql' | 'mariadb' | 'postgres' | 'mssql' */
            database: process.env.MYSQL_DATABASE,
            username: process.env.MYSQL_USER,
            password: process.env.MYSQL_PASSWORD,
            options: {
                host: process.env.MYSQL_HOST,
                port: process.env.MYSQL_DOCKER_PORT
            }
        }
    },
    mysql: {
        promise: true,
        connectionString: `mysql://${process.env.MYSQL_USER}:${process.env.MYSQL_PASSWORD}@${process.env.MYSQL_HOST}/${process.env.MYSQL_DATABASE}`
    }
}
