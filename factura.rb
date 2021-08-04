class Factura
    CALIFORNIA = "CA" 

    def initialize(cantidad, precio, estado)
        @cantidad = cantidad.to_f
        @precio = precio.to_f
        @estado = estado
        @valor_final = 0.0
        @impuesto = 0.0
        puts "Cantidad ingresada es #{@cantidad}"
        puts "Precio ingresado es #{@precio}"
        puts "Estado ingresado es #{@estado}"
    end

    def calcular_precio
        @costo_fob = @cantidad * @precio
        puts "El costo sin impuesto ni descuento es #{@costo_fob}"
    end

    def aplicar_impuesto()
        if @estado.eql? CALIFORNIA
            @impuesto = 0.0825
        else
            @impuesto = 0
        end    
        @valor_final = @costo_fob  + (@costo_fob * @impuesto)
        puts "Costo con impuesto aplicado #{@valor_final}"
    end

end

factura = Factura.new ARGV[0], ARGV[1], ARGV[2]
factura.calcular_precio
factura.aplicar_impuesto