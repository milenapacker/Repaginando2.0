//CONNECTIONS
const { createPool } = require('mysql');

 const pool = createPool({
    host: 'localhost',
    user: 'root',
    password: '29De082003$',
    database: 'upx',
    connectionLimit: 100,
    stringifyObjects: true
});

module.exports = pool;

