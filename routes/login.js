var express = require('express');

var router = express.Router();

var database = require('../database');

router.get("/",function(request,response,next){
    response.render('login',{title: 'Login'});
});

router.post("/client", function(request, response, next){

	var action = request.body.action;

    if (action == "ingresarCliente") {
        var usuario = request.body.usuario;
        var contrasenia = request.body.contrasenia;
        var query = `
        select * from usuario where usuario= "${usuario}" and contrasenia= "${contrasenia}" and estado ='1'; 
            `;
        database.query(query,function (error, data) {
            if (data.length > 0) {
                response.json({
                    message: "BIENVENIDO..",
                });
            } else {
                response.status(401).json({
                    message: "Datos incorrectos, ingrese nuevamente",
                });
            }
        });
    }
});

module.exports = router;