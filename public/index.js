// import { Database } from "sqlite";
// import DataAccess from './database.js';
// const express = require('express');
// const {DatabaseSync} = require('node:sqlite');

// // const table = document.getElementById("tableView");
// // const patientBT = document.getElementById("patientBT");
const facultyBT = document.getElementById('facultyBT');

// // const tableValues = new DataAccess();
// db = DatabaseSync('nurseryDB.db');
//     // db = DatabaseSync('nurseryDB.db');
// const rows = db.prepare('SELECT * FROM faculty').all();   //query.all()

facultyBT.addEventListener('click', function(e){
    document.getElementById("tableView").innerText = "Hello Table";//tableValues.getFacultyTable();
    // console.log(rows);
});