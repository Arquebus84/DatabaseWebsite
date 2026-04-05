// import { Database } from "sqlite";
import DataAccess from './database.js';
// const express = require('express');

// const table = document.getElementById("tableView");
// const patientBT = document.getElementById("patientBT");
const facultyBT = document.getElementById('facultyBT');

const tableValues = new DataAccess();

facultyBT.addEventListener('click', function(e){
    document.getElementById("tableView").innerText = tableValues.getFacultyTable();
});