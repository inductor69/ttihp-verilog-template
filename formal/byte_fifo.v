module protocore_byte_fifo (
    push_data,
    reset,
    clock,
    push,
    pop,
    full,
    empty,
    data,
    level
);

    input [7:0] push_data;
    input reset;
    input clock;
    input push;
    input pop;
    output full;
    output empty;
    output [7:0] data;
    output [3:0] level;

    wire [7:0] _35;
    wire [2:0] _40;
    wire _41;
    wire [7:0] _42;
    wire [7:0] _43;
    wire [7:0] _2;
    reg [7:0] _36;
    wire [2:0] _47;
    wire _48;
    wire [7:0] _49;
    wire [7:0] _50;
    wire [7:0] _3;
    reg [7:0] _46;
    wire [2:0] _54;
    wire _55;
    wire [7:0] _56;
    wire [7:0] _57;
    wire [7:0] _4;
    reg [7:0] _53;
    wire [2:0] _61;
    wire _62;
    wire [7:0] _63;
    wire [7:0] _64;
    wire [7:0] _5;
    reg [7:0] _60;
    wire [2:0] _68;
    wire _69;
    wire [7:0] _70;
    wire [7:0] _71;
    wire [7:0] _6;
    reg [7:0] _67;
    wire [2:0] _75;
    wire _76;
    wire [7:0] _77;
    wire [7:0] _78;
    wire [7:0] _7;
    reg [7:0] _74;
    wire [2:0] _82;
    wire _83;
    wire [7:0] _84;
    wire [7:0] _85;
    wire [7:0] _8;
    reg [7:0] _81;
    wire [7:0] _10;
    wire [2:0] _92;
    wire [2:0] _87;
    wire [2:0] _88;
    wire [2:0] _11;
    reg [2:0] _39;
    wire _93;
    wire [7:0] _94;
    wire [7:0] _95;
    wire [7:0] _12;
    reg [7:0] _91;
    wire [2:0] _104;
    wire [2:0] _105;
    wire [2:0] _13;
    reg [2:0] _102;
    reg [7:0] fifo_data;
    wire [3:0] _30;
    wire vdd;
    wire [3:0] _27;
    wire _17;
    wire _19;
    wire [3:0] _114;
    wire [3:0] _115;
    wire [3:0] _112;
    wire _109;
    wire _110;
    wire [3:0] _113;
    wire _32;
    wire _21;
    wire _33;
    wire _107;
    wire fifo_empty;
    wire _98;
    wire _23;
    wire _99;
    wire _108;
    wire [3:0] _116;
    wire [3:0] _24;
    reg [3:0] fifo_level;
    wire fifo_full;
    assign _35 = 8'b00000000;
    assign _40 = 3'b111;
    assign _41 = _39 == _40;
    assign _42 = _41 ? _10 : _36;
    assign _43 = _33 ? _42 : _36;
    assign _2 = _43;
    always @(posedge _19) begin
        if (_17)
            _36 <= _35;
        else
            _36 <= _2;
    end
    assign _47 = 3'b110;
    assign _48 = _39 == _47;
    assign _49 = _48 ? _10 : _46;
    assign _50 = _33 ? _49 : _46;
    assign _3 = _50;
    always @(posedge _19) begin
        if (_17)
            _46 <= _35;
        else
            _46 <= _3;
    end
    assign _54 = 3'b101;
    assign _55 = _39 == _54;
    assign _56 = _55 ? _10 : _53;
    assign _57 = _33 ? _56 : _53;
    assign _4 = _57;
    always @(posedge _19) begin
        if (_17)
            _53 <= _35;
        else
            _53 <= _4;
    end
    assign _61 = 3'b100;
    assign _62 = _39 == _61;
    assign _63 = _62 ? _10 : _60;
    assign _64 = _33 ? _63 : _60;
    assign _5 = _64;
    always @(posedge _19) begin
        if (_17)
            _60 <= _35;
        else
            _60 <= _5;
    end
    assign _68 = 3'b011;
    assign _69 = _39 == _68;
    assign _70 = _69 ? _10 : _67;
    assign _71 = _33 ? _70 : _67;
    assign _6 = _71;
    always @(posedge _19) begin
        if (_17)
            _67 <= _35;
        else
            _67 <= _6;
    end
    assign _75 = 3'b010;
    assign _76 = _39 == _75;
    assign _77 = _76 ? _10 : _74;
    assign _78 = _33 ? _77 : _74;
    assign _7 = _78;
    always @(posedge _19) begin
        if (_17)
            _74 <= _35;
        else
            _74 <= _7;
    end
    assign _82 = 3'b001;
    assign _83 = _39 == _82;
    assign _84 = _83 ? _10 : _81;
    assign _85 = _33 ? _84 : _81;
    assign _8 = _85;
    always @(posedge _19) begin
        if (_17)
            _81 <= _35;
        else
            _81 <= _8;
    end
    assign _10 = push_data;
    assign _92 = 3'b000;
    assign _87 = _39 + _82;
    assign _88 = _33 ? _87 : _39;
    assign _11 = _88;
    always @(posedge _19) begin
        if (_17)
            _39 <= _92;
        else
            _39 <= _11;
    end
    assign _93 = _39 == _92;
    assign _94 = _93 ? _10 : _91;
    assign _95 = _33 ? _94 : _91;
    assign _12 = _95;
    always @(posedge _19) begin
        if (_17)
            _91 <= _35;
        else
            _91 <= _12;
    end
    assign _104 = _102 + _82;
    assign _105 = _99 ? _104 : _102;
    assign _13 = _105;
    always @(posedge _19) begin
        if (_17)
            _102 <= _92;
        else
            _102 <= _13;
    end
    always @* begin
        case (_102)
        0:
            fifo_data <= _91;
        1:
            fifo_data <= _81;
        2:
            fifo_data <= _74;
        3:
            fifo_data <= _67;
        4:
            fifo_data <= _60;
        5:
            fifo_data <= _53;
        6:
            fifo_data <= _46;
        default:
            fifo_data <= _36;
        endcase
    end
    assign _30 = 4'b1000;
    assign vdd = 1'b1;
    assign _27 = 4'b0000;
    assign _17 = reset;
    assign _19 = clock;
    assign _114 = 4'b0001;
    assign _115 = fifo_level - _114;
    assign _112 = fifo_level + _114;
    assign _109 = ~ _99;
    assign _110 = _33 & _109;
    assign _113 = _110 ? _112 : fifo_level;
    assign _32 = ~ fifo_full;
    assign _21 = push;
    assign _33 = _21 & _32;
    assign _107 = ~ _33;
    assign fifo_empty = fifo_level == _27;
    assign _98 = ~ fifo_empty;
    assign _23 = pop;
    assign _99 = _23 & _98;
    assign _108 = _99 & _107;
    assign _116 = _108 ? _115 : _113;
    assign _24 = _116;
    always @(posedge _19) begin
        if (_17)
            fifo_level <= _27;
        else
            fifo_level <= _24;
    end
    assign fifo_full = fifo_level == _30;
    assign full = fifo_full;
    assign empty = fifo_empty;
    assign data = fifo_data;
    assign level = fifo_level;

endmodule
