"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.signUp = exports.signIn = exports.getAll = void 0;

const express = require("express");

const models = require("../../database/models");

var bcrypt = require('bcrypt');

var jwt = require('jsonwebtoken');

require('dotenv').config('./.env');

const secret = process.env.SECRET;
const expireTime = process.env.EXPIRE; //Creamos un usuario

const signUp = async (req, res) => {
  //Nos traemos el usuario desde el body
  const usuario = await req.body.usuario;
  const password = await req.body.password; //Obtenemos el largo de la password

  const passwordLength = password.length; //Con bcrypt generamos el salt y hasheamos la contraseña.

  const salt = await bcrypt.genSalt();
  const hashPassword = await bcrypt.hash(password, salt); //largo de contraseña

  const minPasswordLength = 6; //Luego de algunas validaciones insertamos el usuario en la tabla o devolvemos un error.

  if (passwordLength >= minPasswordLength) {
    models.usuarios.create({
      usuario: usuario,
      password: hashPassword,
      fk_id_grupo: '1',
      estado: '0'
    }).then(usuarios => res.status(201).send({
      id: usuarios.id
    })).catch(error => {
      //El usuario es unico y esta definido en el modelo
      if (error == "SequelizeUniqueConstraintError: Validation error") {
        res.status(402).send('Bad request: el usuario ya existe');
      } else {
        res.sendStatus(400);
      }
    });
  } else {
    res.status(401).send('Bad request: el usuario o la contraseña no son validos');
  }
}; //Consultamos un usuario


exports.signUp = signUp;

const signIn = async (req, res) => {
  //Nos traemos el usuario desde el body
  const usuario = await req.body; //const password = await req.body.password;  

  console.log("imprimo usuario y pass", usuario); //Buscamos si existe el usuario en la base

  const findUsuario = await models.usuarios.findOne({
    where: {
      usuario: usuario
    }
  }); //Si el usuario existe validamos, sino devolvemos error

  if (findUsuario !== null) {
    console.log("datos del usuario", findUsuario.estado); //Si el hash de la password matchea con la que paso el usuario damos ok, sino error.

    if (await bcrypt.compare(password, findUsuario.password)) {
      //HORRIBLE pero es lo mas rapido. Refactorizar en cuanto se pueda.
      if (!findUsuario.estado) {
        res.header('authotization').json({
          message: 'Usuario no completo formulario postulante',
          id: findUsuario.id,
          estado: findUsuario.estado
        });
      } else {
        //Aca se llama a la funcion para generar la apikey
        const accessToken = generateAccessToken(usuario);
        res.header('authotization', accessToken).json({
          message: 'Usuario autenticado',
          id: findUsuario.id,
          token: accessToken
        });
      }
    } else {
      res.status(400).send('Usuario o password invalidos');
    }
  } else {
    res.status(401).send('Debe especificar usuario y password validos');
  }

  function generateAccessToken(usuario) {
    return jwt.sign({
      uid: usuario
    }, secret, {
      expiresIn: expireTime
    });
  }
};

exports.signIn = signIn;

const getAll = async (req, res) => {
  models.usuarios.findAll({
    attributes: ["id", "usuario", "fk_id_grupo", "estado", "createdAt"],
    include: [{
      as: "Grupos",
      model: models.grupos,
      attributes: ["id", "descripcion"]
    }]
  }).then(usuarios => res.send({
    usuarios
  })).catch(() => res.sendStatus(400));
};

exports.getAll = getAll;
//# sourceMappingURL=usuarios.js.map