// const path = require('path');
const express = require('express');
// import express from 'express';
const app = express();
// const app = express();

const PORT = 3000;

app.use(express.static('public'));

app.listen(PORT, ()=>{
    console.log(`App running on http://localhost:${PORT}`);
});

app.get('/', (req, res)=>{
    res.sendFile(__dirname + '/public/index.html');
});