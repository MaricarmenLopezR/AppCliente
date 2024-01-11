var express = require('express');

var router = express.Router();

var database = require('../database');

router.get("/",function(request,response,next){
    response.render('sample_data',{title: 'Home Cliente'});
});

router.post("/action", function(request, response, next){

	var action = request.body.action;

    if(action == 'fetch') {
        var start = parseInt(request.body.start) || 0;
        var length = parseInt(request.body.length) || 10;

        var query = "SELECT * FROM cliente ORDER BY nombres ASC LIMIT ?, ?";

        database.query(query, [start, length], function(error, data){
            if (error) {
                console.error(error);
                response.status(500).send("Error en el servidor");
                return;
            }
            var queryCount = "SELECT COUNT(*) as count FROM cliente";
            database.query(queryCount, function(countError, countResult) {
                if (countError) {
                    console.error(countError);
                    response.status(500).send("Error en el servidor");
                    return;
                }

                var totalCount = countResult[0].count;

                response.json({
                    recordsTotal: totalCount,
                    recordsFiltered: totalCount,
                    data: data
                });
            });
        });
    }

    if (action == "SearchDni") {
        var dni = request.body.dni;
        var query = `
            SELECT * FROM cliente WHERE dni = "${dni}" 
            `;
  
        database.query(query,function (error, data) {
            if (error) {
                console.error(error);
                response.status(500).json({ error: "Error en el servidor" });
            } else {
                response.json({
                    data: data,
                });
            }
        });
    }

    if (action == "Add") {
      var dni = request.body.dni;
      var nombres = request.body.nombres;
      var apellidos = request.body.apellidos;
      var fecha_nacimiento = request.body.fecha_nacimiento;
      var celular = request.body.celular;
      var correo = request.body.correo;
      var banco = request.body.banco;
      var numero_cci = request.body.numero_cci;

      var query = `
		INSERT INTO cliente 
		VALUES ("${dni}", "${nombres}", "${apellidos}", "${fecha_nacimiento}", "${celular}", "${correo}", "${banco}", "${numero_cci}")
		`;

      database.query(query, function (error, data) {
        if (error) {
            console.error(error);
            response.status(500).json({ error: "Error en el servidor" });
        } else {
            response.json({
                message: "Cliente registrado correctamente",
            });
        }
      });

    }

});

module.exports = router;
