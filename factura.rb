class Factura
    
    def initialize(cantidad, precio)
        @cantidad = cantidad
        @precio = precio
        puts "Cantidad ingresada es #{@cantidad}"
        puts "Precio ingresado es #{@precio}"
    end


end

factura = Factura.new ARGV[0], ARGV[1]