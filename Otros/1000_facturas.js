db = db.getSiblingDB('empresa');
db.createCollection("facturas");
var count = 1;
var clientes = ["C001", "C002", "C003", "C004", "C005"];
var productos = [
  { id: "pantalon", precio: 30 },
  { id: "calcetin", precio: 5 },
  { id: "corbata", precio: 8 },
  { id: "sudadera", precio: 20 },
  { id: "camisa", precio: 25 }
];

for (var i = 0; i < 1000; i++) {
  var fecha = new Date("2023-01-01");
  fecha.setDate(fecha.getDate() + i);
  var cliente = clientes[Math.floor(Math.random() * clientes.length)];
  var lineas = [];
  for (var j = 0; j < Math.floor(Math.random() * 5) + 1; j++) {
    var producto = productos[Math.floor(Math.random() * productos.length)];
    var unidades = Math.floor(Math.random() * 5) + 1;
    lineas.push({ id: producto.id, unidades: unidades, precio: producto.precio });
  }
  db.facturas.insertOne({
    nro: count++,
    fecha: fecha,
    cliente: cliente,
    lineas: lineas
  });
}