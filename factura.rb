class Factura
    
    def initialize(cantidad, precio)
        @cantidad = cantidad.to_f
        @precio = precio.to_f
        puts "Cantidad ingresada es #{@cantidad}"
        puts "Precio ingresado es #{@precio}"
    end

    def calcular_precio
        @costo_fob = @cantidad * @precio
        puts "El costo sin impuesto ni descuento es #{@costo_fob}"
    end

end

factura = Factura.new ARGV[0], ARGV[1]
factura.calcular_precio