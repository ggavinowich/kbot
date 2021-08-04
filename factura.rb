class Factura
    
    def initialize(cantidad)
        @cantidad = cantidad
        puts "Cantidad ingresada es #{@cantidad}"
    end


end

factura = Factura.new ARGV[0]