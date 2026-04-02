const {createPool} = require('mysql');

const pool = createPool({
    user: 'root',
    password: 'ithertzwhenIP#1984',
    host: 'localhost',
    database: 'fermentdb', 
    connectionLimit: 10
})

pool.query('show tables;', (err, result, fields)=>{
    if(err)
        console.log(err);
    return console.log(result);
});