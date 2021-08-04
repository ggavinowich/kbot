class Factura
    CALIFORNIA = ["CA", "CALIFORNIA"] 
    UTAH = ["UT", "UTAH"]
    NEVADA = ["NV", "NEVADA"]
    TEXAS = ["TX", "TEXAS"]
    IMPUESTO = {"CA" => 0.0825, "UT" => 0.0625, "NV" => 0.08, "TX" => 0.0625}


    def initialize(cantidad, precio, estado)
        @cantidad = cantidad.to_f
        @precio = precio.to_f
        @estado_ingresado = estado
        @valor_final = 0.0
        @impuesto = 0.0
        @descuento = 0.0
        @estado_normalizado = []
        puts "Cantidad ingresada es #{@cantidad}"
        puts "Precio ingresado es #{@precio}"
        puts "Estado ingresado es #{@estado_ingresado}"
    end

    def calcular_precio
        @costo_fob = @cantidad * @precio
        puts "El costo sin impuesto ni descuento es #{@costo_fob}"
    end

    def obtener_estado
        if CALIFORNIA.include?(@estado_ingresado)
            @estado_normalizado = "CA"
        elsif UTAH.include?(@estado_ingresado)
            @estado_normalizado = "UT"
        elsif NEVADA.include?(@estado_ingresado)
            @estado_normalizado = "NV"
        elsif TEXAS.include?(@estado_ingresado)
            @estado_normalizado = "TX"        
        else
            @estado_normalizado = ""
        end
        puts "Estado normalizado #{@estado_normalizado}"    
    end   


    def obtener_impuesto()        
        obtener_estado()
        if IMPUESTO.include?(@estado_normalizado)
            @impuesto = IMPUESTO[@estado_normalizado]
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
