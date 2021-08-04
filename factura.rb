class Factura
    
    def initialize(cantidad, precio, estado)
        @cantidad = cantidad.to_f
        @precio = precio.to_f
        @estado = estado
        puts "Cantidad ingresada es #{@cantidad}"
        puts "Precio ingresado es #{@precio}"
        puts "Estado ingresado es #{@estado}"
    end

    def calcular_precio
        @costo_fob = @cantidad * @precio
        puts "El costo sin impuesto ni descuento es #{@costo_fob}"
    end

end

factura = Factura.new ARGV[0], ARGV[1], ARGV[2]
factura.calcular_precio