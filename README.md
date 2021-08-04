# kbot

Construir una aplicación de línea de comando que permita calcular los datos de facturación incluyendo impuestos y descuentos.
Debe poder ejecutarse con la línea de comando:

ruby factura.rb <cantidad> <precio unitario> <estado>

| Impuesto ||
| -------- | -------- |
| Estado   | Tasa |
| UT       | 6.85% |
| NV       | 8.00% |
| TX       | 6.25% |
| AL       | 4.00% |
| CA       | 8.25% |
  
| Descuentos ||
| ---------- | ---------- |
| Más de     | % |
| $1,000     | 3% |
| $5,000     | 5% |
| $7,000     | 7% |
| $10,000    | 10% |
| $50,000    | 15% |
