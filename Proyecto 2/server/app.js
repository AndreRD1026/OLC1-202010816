var express = require('express');
var morgan = require('morgan');
var cors = require('cors');
var app=express();
var corsOptions = {origin: true, optionsSuccessStatus: 200};

app.use(morgan('dev'));
app.use(express.json());
app.use(cors(corsOptions));
app.use(express.urlencoded({extended: true}));


var incremental = 0

app.listen(8080, function () {
    console.log('app escuchando en el puerto 8080')
})


app.get('/', function (req, res) {
    incremental++;
    res.json({mensaje: "Hola Mundo"})
})

app.get('/getIncremental', function (req, res) {
    res.json({incremental: incremental})
})

app.get('/retornoTexto', function (req, res) {
    res.send('Este mensaje esta en texto')
})


app.post('/setIncremental', function (req, res) {
    incremental = req.body.incremental
    res.json({msg: "Operacion con exito"})
    
})