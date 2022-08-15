const jwt = require('jsonwebtoken')
require('dotenv').config('../../.env');
const secret = process.env.SECRET;


export const validateToken = async (req, res, next) => {
    const accessToken = req.body.authorization;
    if(!accessToken) res.send('acceso denegado');
  
    jwt.verify(accessToken, secret, (err, user) =>{
      if(err){
        res.send('acceso denegado, token expirado');
      }else {
        next();
      }
    } )
  }
