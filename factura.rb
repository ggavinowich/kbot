class Factura
    CALIFORNIA = ["CA", "CALIFORNIA"] 
    UTAH = ["UT", "UTAH"]
    NEVADA = ["NV", "NEVADA"]
    TEXAS = ["TX", "TEXAS"]
    ALABAMA = ["AL", "ALABAMA"]
    IMPUESTO = {"CA" => 0.0825, "UT" => 0.0625, "NV" => 0.08, "TX" => 0.0625, "AL" => 0.04}


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
        elsif ALABAMA.include?(@estado_ingresado)
            @estado_normalizado = "AL"
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
        if @costo_fob.between?(1000+1, 5000)
            @descuento = 0.03
        elsif @costo_fob.between?(5000+1, 7000)
            @descuento = 0.05
        elsif @costo_fob.between?(7000+1, 10000)
            @descuento = 0.07
        elsif @costo_fob.between?(10000+1, 15000)
            @descuento = 0.10
        elsif (15000+1 < @costo_fob)
            @descuento = 0.15
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
