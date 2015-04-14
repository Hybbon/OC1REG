module reg_tb;
    reg clock, reset, enc;
    reg [4:0] addra, addrb, addrc;
    wire [31:0] dataa, datab;
    reg [31:0] datac;

    Registers U0 (
        .clock (clock),
        .reset (reset),
        .addra (addra),
        .dataa (dataa),
        .addrb (addrb),
        .datab (datab),
        .enc (enc),
        .addrc (addrc),
        .datac (datac)
    );

    initial begin
        clock = 0;
        reset = 1;
        addrc = 5'd31;
        addrb = 5'd31;
        datac = 32'd3098;
        enc = 1'b1;
    end

    always begin
        #5 clock = ~clock;
    end

    always begin
        #25 reset = ~reset;
        #25 enc = 1'b0;
    end

    initial begin
        $dumpfile ("reg_tb1.vcd");
        $dumpvars;
        $display("\t\ttime\tclock\tdatab\tenc\nreset");
        $monitor("%d\t%b\t%d\t%b\t%b", $time, clock, datab, enc, reset);
        #100 $finish;
    end

endmodule
