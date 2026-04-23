const http = require("http");

const { EnvHttpProxyAgent } = require("undici-types");

const hostname = "0.0.0.0";
const port = 3000;

const server = http.createServer((request, response) => {
    response.statusCode = 200;
    response.setHeader("Content-Type", "text/plain");
    response.end("Hola Mundo!");
});

server.listen(port, hostname, () => {
    console.log('Buenvenido http://${hostname}:${port}/');
})