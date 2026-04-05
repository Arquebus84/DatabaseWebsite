const path = require('path');
const express = require('express');
const app = express();

const PORT = 3000;

app.use(express.static('index.html'));

app.listen(PORT, ()=>{
    console.log(`App running on http://localhost:${PORT}`);
});

app.get('/', (req, res)=>{
    res.sendFile(__dirname, 'index.html');
});