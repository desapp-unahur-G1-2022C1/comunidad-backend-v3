const jwt = require('jsonwebtoken')
require('dotenv').config('../../.env');
const secret = process.env.SECRET;


export const validateToken = async (req, res, next) => {
    const accessToken = req.query.authorization;
    console.log(accessToken);
    if(!accessToken) res.send('acceso denegado');
  
    jwt.verify(accessToken, secret, (err, user) =>{
      if(err){
        res.send('acceso denegado, token expirado');
      }else {
        next();
      }
    } )
  }
