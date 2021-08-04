class Factura
    CALIFORNIA = "CA" 
    UTATH = "UT"

    def initialize(cantidad, precio, estado)
        @cantidad = cantidad.to_f
        @precio = precio.to_f
        @estado = estado
        @valor_final = 0.0
        @impuesto = 0.0
        @descuento = 0.0
        puts "Cantidad ingresada es #{@cantidad}"
        puts "Precio ingresado es #{@precio}"
        puts "Estado ingresado es #{@estado}"
    end

    def calcular_precio
        @costo_fob = @cantidad * @precio
        puts "El costo sin impuesto ni descuento es #{@costo_fob}"
    end

    def obtener_impuesto()
        if @estado.eql? CALIFORNIA
            @impuesto = 0.0825
        elsif @estado.eql? UTATH
            @impuesto = 0.0685
        else
            @impuesto = 0.0
        end    
        puts "Impuesto aplicado #{@impuesto}"
    end

    def obtener_descuento
        if  (1000 < @costo_fob) and (@costo_fob <= 5000)
            @descuento = 0.03
        else
            @descuento = 0.0
        end    
        puts "Descuento aplicado #{@descuento}"
    end

    def calcular_valor_final
        @valor_final = @costo_fob  - (@costo_fob * @descuento) + (@costo_fob * @impuesto)
        puts "Costo con impuesto y descuentos aplicados #{@valor_final}" 
    end

end

factura = Factura.new ARGV[0], ARGV[1], ARGV[2]
factura.calcular_precio
factura.obtener_impuesto
factura.obtener_descuento
factura.calcular_valor_final
