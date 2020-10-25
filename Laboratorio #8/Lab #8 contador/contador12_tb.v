// Testbench del contador
`define simulation

module testbench ();

reg clk = 0;              // registro de la senal del reloj
wire [11:0]data;          // Datos de salida
reg [11:0] ver_cont = 1; // Un registro para verificar si el contador cuenta correctamente

// Iniciar el contador
counter12 U1(.clk(clk),.data(data));

always #1 clk = ~clk;   // Se genera la senal de reloj

always @ (posedge clk ) begin
    if (ver_cont != data)
    $display(" LOAD = %d - LEIDO: %d", ver_cont, data);

    ver_cont <= ver_cont + 1;   //verificar si el contador cumple con los valoresm
end

initial begin
  // Mostrar los resultados en los diagramas de timng
  $dumpfile("contador12_tb.vcd");
  $dumpvars(0, testbench);

  // Se comprueba el Reset
  # 0.5 if (data != 0)
          $display("ERROR! Contador NO está a 0!");  //se muestra el error si el reset no esta en cero
        else
          $display("Contador inicializado. OK."); //  si esta en cero, se empieza el contador

  # 250 $display("FIN de la simulacion");   // cuando el contador llegue a 200 para la simulacion
  # 251 $finish;  // en 201 se termina la simulacion
end

// Se termina en 251 par que no sea tan larga la simulacion y se muestren todos los datos en los diagramas
// pero si llega  alos  11 bits de conteo

endmodule //testbench
