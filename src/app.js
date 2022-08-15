import express  from "express";
import routes from './routes';
//import sequelize from "../database/models";
const { sequelize } = require('../database/models');
const app = express();

app.set('port', process.env.PORT || 3000);
app.use(express.json());
app.use('/', routes);


app.listen(app.get('port'), () => {
  console.log('Servidor conectado al puerto', app.get('port')),
  sequelize.authenticate();
 });

 


 module.exports = app;