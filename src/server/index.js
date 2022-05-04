const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { API } = require('../services/apiConstants');
require('dotenv').config();

const { API_URL, API_PORT } = process.env;
const stacks = [
  { frontend: 'React.js', backend: 'Node.js', database: 'MySQL' },
  { frontend: 'Angular', backend: '.NET', database: 'MSSQL' },
];

const app = express();
app.use(bodyParser.json());
app.use(cors());

app.get(`/`, (req, res) => {
  res.send('Hello World');
});

app.get(`${API_URL}/${API.techstacks}`, (req, res) => {
  res.json(stacks);
});

// configure server port number
const listener = app.listen(API_PORT, () => {
  console.log(`Node is listening on port ${listener.address().port}`);
});
