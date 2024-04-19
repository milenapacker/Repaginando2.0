//exemplo de função de outro arquivo sendo usada aqui:
// main.js
const { getAndPrintRandomPhrase } = require('./Frases');
const pool = require('./Database');

async function main() {
    await getAndPrintRandomPhrase();
}

main();
