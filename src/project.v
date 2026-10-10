module tt_um_inductor69_protocore (
    ena,
    uio_in,
    rst_n,
    clk,
    ui_in,
    uo_out,
    uio_out,
    uio_oe
);

    input ena;
    input [7:0] uio_in;
    input rst_n;
    input clk;
    input [7:0] ui_in;
    output [7:0] uo_out;
    output [7:0] uio_out;
    output [7:0] uio_oe;

    wire _2;
    wire [1:0] _128;
    wire [3:0] _129;
    wire [7:0] _130;
    wire [7:0] _131;
    wire [7:0] _1047;
    wire _1085;
    wire [6:0] _1084;
    wire [7:0] _1086;
    wire _1082;
    wire _1083;
    wire [7:0] _1087;
    wire [7:0] core_data_out;
    wire [1:0] _1070;
    wire _1069;
    wire [2:0] _1071;
    wire [3:0] _1072;
    wire [3:0] _1068;
    wire [7:0] _1073;
    wire [7:0] _1065;
    wire [2:0] _265;
    wire _266;
    wire [7:0] _267;
    wire [7:0] _268;
    wire [7:0] _6;
    reg [7:0] _261;
    wire [2:0] _272;
    wire _273;
    wire [7:0] _274;
    wire [7:0] _275;
    wire [7:0] _7;
    reg [7:0] _271;
    wire [2:0] _279;
    wire _280;
    wire [7:0] _281;
    wire [7:0] _282;
    wire [7:0] _8;
    reg [7:0] _278;
    wire [2:0] _286;
    wire _287;
    wire [7:0] _288;
    wire [7:0] _289;
    wire [7:0] _9;
    reg [7:0] _285;
    wire [2:0] _293;
    wire _294;
    wire [7:0] _295;
    wire [7:0] _296;
    wire [7:0] _10;
    reg [7:0] _292;
    wire [2:0] _300;
    wire _301;
    wire [7:0] _302;
    wire [7:0] _303;
    wire [7:0] _11;
    reg [7:0] _299;
    wire [2:0] _307;
    wire _308;
    wire [7:0] _309;
    wire [7:0] _310;
    wire [7:0] _12;
    reg [7:0] _306;
    wire [7:0] core_tx_data;
    wire [2:0] _317;
    wire [2:0] _312;
    wire [2:0] _313;
    wire [2:0] _14;
    reg [2:0] _264;
    wire _318;
    wire [7:0] _319;
    wire [7:0] _320;
    wire [7:0] _15;
    reg [7:0] _316;
    wire [2:0] _329;
    wire [2:0] _330;
    wire [2:0] _16;
    reg [2:0] _327;
    reg [7:0] fifo_data;
    wire [7:0] tx_data;
    wire [3:0] _1041;
    wire [3:0] _1042;
    wire [3:0] _1039;
    wire _1036;
    wire _1037;
    wire [3:0] _1040;
    wire _257;
    wire [4:0] _1023;
    wire _1024;
    wire [7:0] _337;
    wire [7:0] _338;
    wire _335;
    wire [7:0] _339;
    wire [4:0] _332;
    wire _333;
    wire [7:0] _340;
    wire [7:0] _341;
    wire [7:0] _18;
    reg [7:0] _193;
    wire _194;
    wire [7:0] _188;
    wire _189;
    wire _182;
    wire _183;
    wire [3:0] _255;
    wire fifo_full;
    wire tx_full;
    wire _163;
    wire rx_empty;
    wire _161;
    wire _160;
    wire [4:0] _149;
    wire _150;
    wire _162;
    wire _148;
    wire _164;
    wire [4:0] _145;
    wire _146;
    wire _184;
    wire [4:0] _143;
    wire _144;
    wire _190;
    wire [15:0] _1011;
    wire [15:0] _1010;
    wire _382;
    wire [7:0] _375;
    wire _376;
    wire _383;
    wire [7:0] _390;
    wire _371;
    wire [7:0] _391;
    wire [7:0] _392;
    wire [7:0] _393;
    wire [7:0] _394;
    wire [7:0] _21;
    reg [7:0] _357;
    wire [15:0] _395;
    wire [15:0] host_prog_wr_data;
    wire [7:0] host_prog_wr_addr;
    wire [7:0] _444;
    wire [7:0] _445;
    wire [7:0] _446;
    wire [7:0] _24;
    reg [7:0] pc;
    wire _438;
    wire _439;
    wire [4:0] _433;
    wire _434;
    wire branch_taken;
    wire _430;
    wire [4:0] _428;
    wire _429;
    wire _431;
    wire [4:0] _424;
    wire _425;
    wire _426;
    wire _421;
    wire [4:0] _419;
    wire _420;
    wire _422;
    wire _416;
    wire [4:0] _414;
    wire _415;
    wire _417;
    wire _411;
    wire [4:0] _409;
    wire _410;
    wire _412;
    wire _994;
    wire _988;
    wire _987;
    wire _985;
    wire _984;
    reg _992;
    wire [1:0] _995;
    wire [5:0] _983;
    wire [7:0] _996;
    wire [2:0] _869;
    reg [7:0] reg_src;
    wire _447;
    wire _448;
    wire [7:0] _449;
    wire [7:0] _450;
    wire [7:0] _25;
    reg [7:0] _241;
    wire [4:0] _236;
    wire _237;
    wire [7:0] _238;
    wire _452;
    wire _453;
    wire _454;
    wire _26;
    reg _159;
    wire [7:0] _242;
    wire [7:0] host_data_rd_addr;
    wire _154;
    wire [4:0] _151;
    wire _152;
    wire _155;
    wire _156;
    wire [7:0] _243;
    wire [7:0] _464;
    wire [15:0] _461;
    wire [15:0] _455;
    wire [15:0] _456;
    wire [15:0] _457;
    wire [15:0] _28;
    reg [15:0] cyc;
    wire [15:0] _462;
    wire [7:0] _463;
    reg [7:0] _465;
    wire [7:0] cap_wr_data;
    wire [7:0] host_data_wr_data;
    wire [7:0] _230;
    wire [7:0] _231;
    wire [7:0] _494;
    wire [7:0] _496;
    wire [7:0] _491;
    wire [7:0] _493;
    wire [7:0] _474;
    wire [7:0] _475;
    wire [7:0] _476;
    wire [7:0] _477;
    wire [7:0] _31;
    reg [7:0] _471;
    wire [7:0] _484;
    wire [7:0] _485;
    wire _481;
    wire [7:0] _486;
    wire [7:0] _487;
    wire [7:0] _488;
    wire [7:0] _489;
    wire [7:0] _32;
    reg [7:0] cap_base;
    wire [7:0] _490;
    reg [7:0] _497;
    wire [7:0] cap_wr_addr;
    wire [7:0] _515;
    wire [7:0] _511;
    wire [7:0] _508;
    wire _507;
    wire [7:0] _509;
    wire _504;
    wire _505;
    wire [7:0] _512;
    wire _502;
    wire [7:0] _513;
    wire [7:0] _499;
    wire _500;
    wire [7:0] _516;
    wire _498;
    wire [7:0] _517;
    wire [7:0] _518;
    wire [7:0] _519;
    wire [7:0] _520;
    wire [7:0] _34;
    reg [7:0] host_data_rd_addr_0;
    wire [7:0] prog_wr_addr;
    wire [7:0] data_wr_addr;
    wire [7:0] host_data_wr_addr;
    wire [4:0] _206;
    wire _207;
    wire [7:0] _211;
    wire [7:0] _212;
    wire [7:0] _213;
    wire [1:0] _472;
    wire [1:0] _459;
    wire [1:0] _619;
    wire [1:0] _620;
    wire [1:0] _621;
    wire [1:0] _617;
    wire [1:0] _618;
    wire [1:0] _622;
    wire [1:0] _36;
    reg [1:0] _460;
    wire _473;
    wire _634;
    wire _630;
    wire _607;
    wire _608;
    wire _609;
    wire _610;
    wire _611;
    wire _612;
    wire _613;
    wire _602;
    wire _603;
    wire _601;
    wire _604;
    wire _599;
    wire _597;
    wire _598;
    wire _600;
    wire _605;
    wire _593;
    wire _594;
    wire _592;
    wire _595;
    wire _590;
    wire _588;
    wire _589;
    wire _591;
    wire _596;
    wire _584;
    wire _585;
    wire _583;
    wire _586;
    wire _581;
    wire _579;
    wire _580;
    wire _582;
    wire _587;
    wire _575;
    wire _576;
    wire _574;
    wire _577;
    wire _572;
    wire _570;
    wire _571;
    wire _573;
    wire _578;
    wire _566;
    wire _567;
    wire _565;
    wire _568;
    wire _563;
    wire _561;
    wire _562;
    wire _564;
    wire _569;
    wire _557;
    wire _558;
    wire _556;
    wire _559;
    wire _554;
    wire _552;
    wire _553;
    wire _555;
    wire _560;
    wire _548;
    wire _549;
    wire _547;
    wire _550;
    wire _545;
    wire _543;
    wire _544;
    wire _546;
    wire _551;
    wire _539;
    wire _540;
    wire _538;
    wire _541;
    wire [7:0] _37;
    reg [7:0] _535;
    wire _536;
    wire _531;
    wire _532;
    wire _537;
    wire _530;
    wire _542;
    wire [2:0] _529;
    reg _606;
    wire _528;
    wire _614;
    wire _527;
    wire _615;
    wire _631;
    wire _525;
    wire [7:0] _624;
    wire [7:0] _482;
    wire _483;
    wire [7:0] _625;
    wire _623;
    wire [7:0] _626;
    wire [7:0] _627;
    wire [7:0] _628;
    wire [7:0] _629;
    wire [7:0] _38;
    reg [7:0] cap_ctrl;
    wire _524;
    wire _526;
    wire _632;
    wire _635;
    wire _39;
    reg _468;
    wire cap_wr;
    wire _201;
    wire _202;
    wire [4:0] _196;
    wire _197;
    wire _198;
    wire _642;
    wire data_wr;
    wire host_data_wr;
    wire _199;
    wire _203;
    wire _204;
    wire [15:0] _250;
    wire [7:0] data_mem_host_rdata;
    wire [2:0] _864;
    reg pin_imm;
    wire [6:0] _863;
    wire [7:0] _866;
    wire _655;
    wire [7:0] _656;
    wire [7:0] _657;
    wire [7:0] _42;
    reg [7:0] _650;
    wire _662;
    wire [7:0] _663;
    wire [7:0] _664;
    wire [7:0] _43;
    reg [7:0] _660;
    wire _669;
    wire [7:0] _670;
    wire [7:0] _671;
    wire [7:0] _44;
    reg [7:0] _667;
    wire _676;
    wire [7:0] _677;
    wire [7:0] _678;
    wire [7:0] _45;
    reg [7:0] _674;
    wire _683;
    wire [7:0] _684;
    wire [7:0] _685;
    wire [7:0] _46;
    reg [7:0] _681;
    wire _690;
    wire [7:0] _691;
    wire [7:0] _692;
    wire [7:0] _47;
    reg [7:0] _688;
    wire _697;
    wire [7:0] _698;
    wire [7:0] _699;
    wire [7:0] _48;
    reg [7:0] _695;
    wire [7:0] host_rx_data;
    wire [2:0] _701;
    wire [2:0] _702;
    wire [2:0] _50;
    reg [2:0] _653;
    wire _707;
    wire [7:0] _708;
    wire [7:0] _709;
    wire [7:0] _51;
    reg [7:0] _705;
    wire [2:0] _734;
    wire [3:0] _725;
    wire [3:0] _722;
    wire _719;
    wire _720;
    wire [3:0] _723;
    wire _646;
    wire fifo_full_0;
    wire rx_full;
    wire _713;
    wire [7:0] _710;
    wire _711;
    wire _712;
    wire fifo_rx_push;
    wire host_rx_push;
    wire _647;
    wire _717;
    wire _718;
    wire [3:0] _726;
    wire [3:0] _54;
    reg [3:0] fifo_level;
    wire fifo_empty;
    wire _715;
    wire _728;
    wire fifo_rx_pop;
    wire core_rx_pop;
    wire _716;
    wire [2:0] _735;
    wire [2:0] _56;
    reg [2:0] _732;
    reg [7:0] fifo_data_0;
    wire [7:0] rx_data;
    wire [7:0] _859;
    wire [7:0] _858;
    wire [7:0] _857;
    wire [8:0] _854;
    wire [8:0] _855;
    wire [7:0] _856;
    wire [8:0] _850;
    wire [8:0] _848;
    wire [8:0] _851;
    wire [7:0] _852;
    wire [3:0] _834;
    wire [7:0] _835;
    wire [5:0] _830;
    wire [7:0] _831;
    wire [6:0] _826;
    wire [7:0] _827;
    wire _824;
    wire [7:0] _828;
    wire _823;
    wire [7:0] _832;
    wire _822;
    wire [7:0] _836;
    wire _821;
    wire [7:0] _838;
    wire _820;
    wire [7:0] _840;
    wire _819;
    wire [7:0] _842;
    wire _818;
    wire [7:0] _844;
    wire _817;
    wire [7:0] _846;
    wire [3:0] _803;
    wire [7:0] _805;
    wire [5:0] _799;
    wire [7:0] _801;
    wire [6:0] _795;
    wire [7:0] _797;
    wire _766;
    wire [7:0] _873;
    wire [7:0] _874;
    wire [7:0] _875;
    wire [7:0] _876;
    wire [7:0] _58;
    reg [7:0] _228;
    wire _878;
    wire [7:0] _879;
    wire [7:0] _880;
    wire [7:0] _881;
    wire [7:0] _882;
    wire [7:0] _59;
    reg [7:0] oe;
    wire [6:0] _952;
    wire [7:0] _953;
    wire [5:0] _950;
    wire _949;
    wire [7:0] _951;
    wire [4:0] _947;
    wire [1:0] _946;
    wire [7:0] _948;
    wire [3:0] _944;
    wire [2:0] _943;
    wire [7:0] _945;
    wire [2:0] _941;
    wire [3:0] _940;
    wire [7:0] _942;
    wire [1:0] _938;
    wire [4:0] _937;
    wire [7:0] _939;
    wire _935;
    wire [5:0] _934;
    wire [7:0] _936;
    wire _179;
    wire _178;
    wire _177;
    wire _176;
    wire _175;
    wire _174;
    wire _173;
    wire [7:0] _61;
    reg [7:0] _168;
    reg [7:0] pins_sync;
    wire _172;
    reg pin_arg;
    wire [6:0] _895;
    wire [7:0] _896;
    wire [6:0] _891;
    wire [7:0] _893;
    wire _888;
    wire [7:0] _889;
    wire [7:0] _890;
    wire [7:0] _894;
    wire [4:0] _883;
    wire _884;
    wire [7:0] _897;
    wire [7:0] _898;
    wire [7:0] _899;
    wire [7:0] _62;
    reg [7:0] _222;
    wire _932;
    wire [6:0] _931;
    wire [7:0] _933;
    reg [7:0] _954;
    wire [6:0] _927;
    wire [7:0] _928;
    wire [5:0] _925;
    wire _924;
    wire [7:0] _926;
    wire [4:0] _922;
    wire [1:0] _921;
    wire [7:0] _923;
    wire [3:0] _919;
    wire [2:0] _918;
    wire [7:0] _920;
    wire [2:0] _916;
    wire [3:0] _915;
    wire [7:0] _917;
    wire [1:0] _913;
    wire [4:0] _912;
    wire [7:0] _914;
    wire _910;
    wire [5:0] _909;
    wire [7:0] _911;
    wire _907;
    wire [6:0] _906;
    wire [7:0] _908;
    reg [7:0] _929;
    wire _903;
    wire [7:0] _904;
    wire [7:0] _905;
    wire [4:0] _900;
    wire _901;
    wire [7:0] _930;
    wire [4:0] _885;
    wire _886;
    wire [7:0] _955;
    wire [7:0] _956;
    wire [7:0] _957;
    wire [7:0] _63;
    reg [7:0] pins_out;
    wire _959;
    wire [7:0] _960;
    wire [7:0] _961;
    wire [7:0] _962;
    wire [7:0] _963;
    wire [7:0] _64;
    reg [7:0] _210;
    wire [7:0] _436;
    wire _967;
    wire [7:0] _968;
    wire [7:0] _969;
    wire _965;
    wire [7:0] _970;
    wire [7:0] _971;
    wire [7:0] _972;
    wire [7:0] _65;
    reg [7:0] _219;
    wire _974;
    wire [7:0] _975;
    wire [7:0] _976;
    wire [7:0] _977;
    wire [7:0] _978;
    wire [7:0] _66;
    reg [7:0] fifo_tx_data;
    reg [7:0] reg_val;
    wire _794;
    wire [7:0] _798;
    wire _793;
    wire [7:0] _802;
    wire _792;
    wire [7:0] _806;
    wire _791;
    wire [7:0] _808;
    wire _790;
    wire [7:0] _810;
    wire _789;
    wire [7:0] _812;
    wire _788;
    wire [7:0] _814;
    wire [7:0] imm;
    wire _784;
    wire [7:0] _786;
    wire _787;
    wire [7:0] _816;
    wire [2:0] _782;
    reg [7:0] alu_result;
    wire _781;
    wire [7:0] _861;
    wire [4:0] _778;
    wire _779;
    wire [7:0] _862;
    wire [4:0] _776;
    wire _777;
    wire [7:0] _867;
    wire _774;
    wire _772;
    wire _775;
    wire [7:0] _868;
    wire [4:0] _769;
    wire _770;
    wire [7:0] _871;
    wire [4:0] _767;
    wire _768;
    wire [7:0] reg_write_value;
    wire [2:0] arg;
    wire _980;
    wire [7:0] _981;
    wire _763;
    wire _760;
    wire _757;
    wire _754;
    wire _751;
    wire _740;
    wire _738;
    wire _741;
    wire _749;
    wire _752;
    wire _755;
    wire _758;
    wire _761;
    wire _764;
    wire [7:0] _982;
    wire [4:0] _745;
    wire _746;
    wire _747;
    wire [4:0] _742;
    wire _743;
    wire _744;
    wire _748;
    wire [7:0] _997;
    wire [7:0] _998;
    wire [7:0] _999;
    wire [7:0] _67;
    reg [7:0] _225;
    wire _406;
    wire [4:0] _404;
    wire _405;
    wire _407;
    wire [4:0] _402;
    wire _403;
    wire _408;
    wire _413;
    wire _418;
    wire _423;
    wire _427;
    wire _432;
    wire _441;
    wire [7:0] fetch_addr;
    wire [7:0] _1000;
    wire [7:0] _68;
    wire _1001;
    wire _1002;
    wire _1003;
    wire _69;
    wire _1005;
    wire _1006;
    wire prog_wr;
    wire host_prog_wr;
    wire [15:0] _1013;
    wire [15:0] _71;
    wire [4:0] _139;
    wire [4:0] _138;
    wire _1017;
    wire [7:0] _1014;
    wire _1015;
    wire _1016;
    wire reset_core;
    wire host_reset_core;
    wire _124;
    wire host_run;
    wire _1022;
    wire _74;
    reg _137;
    wire [4:0] op;
    wire _142;
    wire advance;
    wire fifo_tx_push;
    wire core_tx_push;
    wire _258;
    wire _1034;
    wire _323;
    wire _1032;
    wire [7:0] _1029;
    wire _1030;
    wire _1027;
    wire _1028;
    wire _1031;
    wire fifo_tx_pop;
    wire host_tx_pop;
    wire _324;
    wire _1035;
    wire [3:0] _1043;
    wire [3:0] _77;
    reg [3:0] fifo_level_0;
    wire fifo_empty_0;
    wire tx_empty;
    wire [7:0] _1066;
    wire _1063;
    wire [7:0] _1067;
    wire [7:0] _1060;
    wire _1061;
    wire [7:0] _1074;
    wire [7:0] _1058;
    wire _1059;
    wire [7:0] _1075;
    wire [7:0] _1076;
    wire _1049;
    wire [7:0] _1077;
    wire [7:0] _1078;
    wire [7:0] _1079;
    wire [7:0] _1080;
    wire _1044;
    wire _1045;
    wire [7:0] _1088;
    wire [7:0] _79;
    reg [7:0] _1048;
    wire _1428;
    wire gnd;
    wire _1426;
    wire _1427;
    wire miso;
    wire _1092;
    wire _1091;
    wire _1093;
    wire _1089;
    wire _1094;
    wire _1095;
    wire _1096;
    wire _1097;
    wire _80;
    reg run;
    wire status;
    wire [1:0] _1430;
    wire [15:0] _1115;
    wire [3:0] _1106;
    wire _1107;
    wire _1108;
    wire [15:0] _1116;
    wire [15:0] _81;
    reg [15:0] _1111;
    wire [15:0] _1123;
    wire [3:0] _1117;
    wire _1118;
    wire _1119;
    wire [15:0] _1124;
    wire [15:0] _82;
    reg [15:0] _1122;
    wire [15:0] _1131;
    wire [3:0] _1125;
    wire _1126;
    wire _1127;
    wire [15:0] _1132;
    wire [15:0] _83;
    reg [15:0] _1130;
    wire [15:0] _1139;
    wire [3:0] _1133;
    wire _1134;
    wire _1135;
    wire [15:0] _1140;
    wire [15:0] _84;
    reg [15:0] _1138;
    wire [15:0] _1147;
    wire [3:0] _1141;
    wire _1142;
    wire _1143;
    wire [15:0] _1148;
    wire [15:0] _85;
    reg [15:0] _1146;
    wire [15:0] _1155;
    wire [3:0] _1149;
    wire _1150;
    wire _1151;
    wire [15:0] _1156;
    wire [15:0] _86;
    reg [15:0] _1154;
    wire [15:0] _1163;
    wire [3:0] _1157;
    wire _1158;
    wire _1159;
    wire [15:0] _1164;
    wire [15:0] _87;
    reg [15:0] _1162;
    wire [15:0] _1171;
    wire _1166;
    wire _1167;
    wire [15:0] _1172;
    wire [15:0] _88;
    reg [15:0] _1170;
    wire [15:0] _1179;
    wire [3:0] _1173;
    wire _1174;
    wire _1175;
    wire [15:0] _1180;
    wire [15:0] _89;
    reg [15:0] _1178;
    wire [15:0] _1187;
    wire [3:0] _1181;
    wire _1182;
    wire _1183;
    wire [15:0] _1188;
    wire [15:0] _90;
    reg [15:0] _1186;
    wire [15:0] _1195;
    wire [3:0] _1189;
    wire _1190;
    wire _1191;
    wire [15:0] _1196;
    wire [15:0] _91;
    reg [15:0] _1194;
    wire [15:0] _1203;
    wire [3:0] _1197;
    wire _1198;
    wire _1199;
    wire [15:0] _1204;
    wire [15:0] _92;
    reg [15:0] _1202;
    wire [15:0] _1211;
    wire [3:0] _1205;
    wire _1206;
    wire _1207;
    wire [15:0] _1212;
    wire [15:0] _93;
    reg [15:0] _1210;
    wire [15:0] _1219;
    wire [3:0] _1213;
    wire _1214;
    wire _1215;
    wire [15:0] _1220;
    wire [15:0] _94;
    reg [15:0] _1218;
    wire [15:0] _1227;
    wire _1222;
    wire _1223;
    wire [15:0] _1228;
    wire [15:0] _95;
    reg [15:0] _1226;
    wire _1235;
    wire [7:0] _1236;
    wire [7:0] _1237;
    wire [7:0] _1238;
    wire _1229;
    wire [7:0] _1239;
    wire [7:0] _1240;
    wire [7:0] _1241;
    wire [7:0] _1242;
    wire [7:0] _96;
    reg [7:0] pat_data_lo;
    wire [15:0] _1256;
    wire _1233;
    wire [7:0] _1244;
    wire [7:0] _1230;
    wire _1231;
    wire [7:0] _1245;
    wire _1243;
    wire [7:0] _1246;
    wire [7:0] _1247;
    wire [7:0] _1248;
    wire [7:0] _1249;
    wire [7:0] _97;
    reg [7:0] _1104;
    wire [3:0] pat_data_idx;
    wire _1251;
    wire _1099;
    wire _638;
    wire _639;
    wire _636;
    wire _640;
    wire _1100;
    wire pat_data_wr;
    wire _1252;
    wire [15:0] _1257;
    wire [15:0] _98;
    reg [15:0] _1255;
    wire [3:0] _1417;
    wire _1265;
    wire [7:0] _1266;
    wire [7:0] _1267;
    wire [7:0] _1268;
    wire _1261;
    wire [7:0] _1269;
    wire [7:0] _1270;
    wire [7:0] _1271;
    wire [7:0] _1272;
    wire [7:0] _99;
    reg [7:0] pat_len;
    wire [7:0] _1413;
    wire [3:0] _1414;
    wire _1415;
    wire [3:0] _1419;
    wire [7:0] _1288;
    wire [7:0] _1291;
    wire [7:0] _1293;
    wire [7:0] _1295;
    wire [7:0] _1296;
    wire [7:0] _100;
    reg [7:0] _1279;
    wire _1289;
    wire [3:0] _1420;
    wire _101;
    reg _1282;
    wire _1283;
    wire [3:0] _1422;
    wire [7:0] _1406;
    wire [7:0] _1262;
    wire _1297;
    wire [7:0] _1298;
    wire [7:0] _1299;
    wire [7:0] _1300;
    wire [7:0] _1301;
    wire [7:0] _102;
    reg [7:0] _374;
    wire _1263;
    wire [7:0] _1407;
    wire [1:0] _1081;
    wire [1:0] _1380;
    wire [1:0] _1381;
    wire _1056;
    wire _1053;
    wire _1051;
    wire _1054;
    wire _1057;
    wire _1378;
    wire _1377;
    wire _1379;
    wire [1:0] _1382;
    wire _1358;
    wire _1355;
    wire _1353;
    wire _1356;
    wire _1359;
    wire [7:0] _1362;
    wire _1350;
    wire _1348;
    wire _1351;
    wire [7:0] _1364;
    wire _1345;
    wire _1342;
    wire _1339;
    wire _1336;
    wire _1333;
    wire _1330;
    wire _1327;
    wire _1324;
    wire new_shift;
    wire [6:0] _1302;
    wire [7:0] _1303;
    wire [7:0] _1304;
    wire [7:0] _1305;
    wire [7:0] _103;
    reg [7:0] _386;
    wire [6:0] _387;
    wire [7:0] prog_wr_data;
    wire [7:0] data_wr_data;
    wire [7:0] fifo_rx_data;
    wire [7:0] pat_data_hi;
    wire _1322;
    wire _1325;
    wire _1328;
    wire _1331;
    wire _1334;
    wire _1337;
    wire _1340;
    wire _1343;
    wire _1346;
    wire [7:0] _1365;
    wire [7:0] _1319;
    wire _1317;
    wire [7:0] _1320;
    wire _1316;
    wire [7:0] _1366;
    wire [7:0] _1367;
    wire [7:0] _1368;
    wire [7:0] _1313;
    wire [7:0] _1315;
    wire [7:0] _1369;
    wire [7:0] _104;
    reg [7:0] _379;
    wire _381;
    wire [1:0] _1375;
    wire _1374;
    wire [1:0] _1376;
    wire _1373;
    wire [1:0] _1383;
    wire [1:0] _1384;
    wire [1:0] _1385;
    wire [1:0] _1370;
    wire [1:0] _1372;
    wire [1:0] _1386;
    wire [1:0] _105;
    reg [1:0] _369;
    wire _1405;
    wire [7:0] _1408;
    wire [3:0] _1392;
    wire [3:0] _1394;
    wire [3:0] _1395;
    wire _1311;
    wire [3:0] _1388;
    wire _106;
    reg _1308;
    wire _1309;
    wire _1310;
    wire [3:0] _1390;
    wire [3:0] _1396;
    wire [3:0] _107;
    reg [3:0] _364;
    wire _366;
    wire [7:0] _1409;
    wire _1397;
    wire _108;
    reg _1400;
    wire _109;
    reg _360;
    wire _361;
    wire [7:0] _1410;
    wire _110;
    reg _352;
    wire _353;
    wire vdd;
    wire _112;
    wire _123;
    wire _114;
    wire [7:0] _116;
    wire _1401;
    wire _117;
    reg _1404;
    wire _118;
    reg _349;
    wire _354;
    wire [7:0] _1411;
    wire [7:0] _119;
    reg [7:0] pat_ctrl;
    wire _1276;
    wire [3:0] _1423;
    wire [3:0] _120;
    reg [3:0] _1286;
    reg [15:0] _1287;
    wire [7:0] pat_pins;
    wire [5:0] _1425;
    wire [7:0] _1431;
    assign _2 = ena;
    assign _128 = { _2,
                    _2 };
    assign _129 = { _128,
                    _128 };
    assign _130 = { _129,
                    _129 };
    assign _131 = oe & _130;
    assign _1047 = 8'b00000000;
    assign _1085 = 1'b0;
    assign _1084 = _1048[6:0];
    assign _1086 = { _1084,
                     _1085 };
    assign _1082 = _1081 == _369;
    assign _1083 = _361 & _1082;
    assign _1087 = _1083 ? _1086 : _1080;
    assign core_data_out = data_mem_host_rdata;
    assign _1070 = { vdd,
                     run };
    assign _1069 = ~ tx_empty;
    assign _1071 = { _1069,
                     _1070 };
    assign _1072 = { rx_full,
                     _1071 };
    assign _1068 = 4'b0000;
    assign _1073 = { _1068,
                     _1072 };
    assign _1065 = 8'b11111111;
    assign _265 = 3'b111;
    assign _266 = _264 == _265;
    assign _267 = _266 ? core_tx_data : _261;
    assign _268 = _258 ? _267 : _261;
    assign _6 = _268;
    always @(posedge _114) begin
        if (_123)
            _261 <= _1047;
        else
            _261 <= _6;
    end
    assign _272 = 3'b110;
    assign _273 = _264 == _272;
    assign _274 = _273 ? core_tx_data : _271;
    assign _275 = _258 ? _274 : _271;
    assign _7 = _275;
    always @(posedge _114) begin
        if (_123)
            _271 <= _1047;
        else
            _271 <= _7;
    end
    assign _279 = 3'b101;
    assign _280 = _264 == _279;
    assign _281 = _280 ? core_tx_data : _278;
    assign _282 = _258 ? _281 : _278;
    assign _8 = _282;
    always @(posedge _114) begin
        if (_123)
            _278 <= _1047;
        else
            _278 <= _8;
    end
    assign _286 = 3'b100;
    assign _287 = _264 == _286;
    assign _288 = _287 ? core_tx_data : _285;
    assign _289 = _258 ? _288 : _285;
    assign _9 = _289;
    always @(posedge _114) begin
        if (_123)
            _285 <= _1047;
        else
            _285 <= _9;
    end
    assign _293 = 3'b011;
    assign _294 = _264 == _293;
    assign _295 = _294 ? core_tx_data : _292;
    assign _296 = _258 ? _295 : _292;
    assign _10 = _296;
    always @(posedge _114) begin
        if (_123)
            _292 <= _1047;
        else
            _292 <= _10;
    end
    assign _300 = 3'b010;
    assign _301 = _264 == _300;
    assign _302 = _301 ? core_tx_data : _299;
    assign _303 = _258 ? _302 : _299;
    assign _11 = _303;
    always @(posedge _114) begin
        if (_123)
            _299 <= _1047;
        else
            _299 <= _11;
    end
    assign _307 = 3'b001;
    assign _308 = _264 == _307;
    assign _309 = _308 ? core_tx_data : _306;
    assign _310 = _258 ? _309 : _306;
    assign _12 = _310;
    always @(posedge _114) begin
        if (_123)
            _306 <= _1047;
        else
            _306 <= _12;
    end
    assign core_tx_data = fifo_tx_data;
    assign _317 = 3'b000;
    assign _312 = _264 + _307;
    assign _313 = _258 ? _312 : _264;
    assign _14 = _313;
    always @(posedge _114) begin
        if (_123)
            _264 <= _317;
        else
            _264 <= _14;
    end
    assign _318 = _264 == _317;
    assign _319 = _318 ? core_tx_data : _316;
    assign _320 = _258 ? _319 : _316;
    assign _15 = _320;
    always @(posedge _114) begin
        if (_123)
            _316 <= _1047;
        else
            _316 <= _15;
    end
    assign _329 = _327 + _307;
    assign _330 = _324 ? _329 : _327;
    assign _16 = _330;
    always @(posedge _114) begin
        if (_123)
            _327 <= _317;
        else
            _327 <= _16;
    end
    always @* begin
        case (_327)
        0:
            fifo_data <= _316;
        1:
            fifo_data <= _306;
        2:
            fifo_data <= _299;
        3:
            fifo_data <= _292;
        4:
            fifo_data <= _285;
        5:
            fifo_data <= _278;
        6:
            fifo_data <= _271;
        default:
            fifo_data <= _261;
        endcase
    end
    assign tx_data = fifo_data;
    assign _1041 = 4'b0001;
    assign _1042 = fifo_level_0 - _1041;
    assign _1039 = fifo_level_0 + _1041;
    assign _1036 = ~ _324;
    assign _1037 = _258 & _1036;
    assign _1040 = _1037 ? _1039 : fifo_level_0;
    assign _257 = ~ fifo_full;
    assign _1023 = 5'b11100;
    assign _1024 = op == _1023;
    assign _337 = 8'b00000001;
    assign _338 = _193 + _337;
    assign _335 = _193 < imm;
    assign _339 = _335 ? _338 : _1047;
    assign _332 = 5'b01101;
    assign _333 = op == _332;
    assign _340 = _333 ? _339 : _1047;
    assign _341 = host_run ? _340 : _193;
    assign _18 = _341;
    always @(posedge _114) begin
        if (_124)
            _193 <= _1047;
        else
            _193 <= _18;
    end
    assign _194 = _193 == imm;
    assign _188 = cyc[7:0];
    assign _189 = _188 == imm;
    assign _182 = imm[0:0];
    assign _183 = pin_arg == _182;
    assign _255 = 4'b1000;
    assign fifo_full = fifo_level_0 == _255;
    assign tx_full = fifo_full;
    assign _163 = ~ tx_full;
    assign rx_empty = fifo_empty;
    assign _161 = ~ rx_empty;
    assign _160 = _156 ? _159 : vdd;
    assign _149 = 5'b11101;
    assign _150 = op == _149;
    assign _162 = _150 ? _161 : _160;
    assign _148 = op == _1023;
    assign _164 = _148 ? _163 : _162;
    assign _145 = 5'b01111;
    assign _146 = op == _145;
    assign _184 = _146 ? _183 : _164;
    assign _143 = 5'b01110;
    assign _144 = op == _143;
    assign _190 = _144 ? _189 : _184;
    assign _1011 = 16'b1111111111111111;
    assign _1010 = 16'b0000000000000000;
    assign _382 = ~ _381;
    assign _375 = 8'b00000010;
    assign _376 = _374 == _375;
    assign _383 = _376 & _382;
    assign _390 = _383 ? prog_wr_data : _357;
    assign _371 = _369 == _472;
    assign _391 = _371 ? _390 : _357;
    assign _392 = _366 ? _391 : _357;
    assign _393 = _361 ? _392 : _357;
    assign _394 = _354 ? _393 : _357;
    assign _21 = _394;
    always @(posedge _114) begin
        if (_123)
            _357 <= _1047;
        else
            _357 <= _21;
    end
    assign _395 = { _357,
                    prog_wr_data };
    assign host_prog_wr_data = _395;
    assign host_prog_wr_addr = host_data_rd_addr_0;
    assign _444 = fetch_addr + _337;
    assign _445 = advance ? _444 : pc;
    assign _446 = host_run ? _445 : pc;
    assign _24 = _446;
    always @(posedge _114) begin
        if (_124)
            pc <= _1047;
        else
            pc <= _24;
    end
    assign _438 = _436 == _1047;
    assign _439 = ~ _438;
    assign _433 = 5'b10111;
    assign _434 = op == _433;
    assign branch_taken = _434 & _439;
    assign _430 = ~ pin_arg;
    assign _428 = 5'b10110;
    assign _429 = op == _428;
    assign _431 = _429 & _430;
    assign _424 = 5'b10101;
    assign _425 = op == _424;
    assign _426 = _425 & pin_arg;
    assign _421 = ~ _416;
    assign _419 = 5'b10100;
    assign _420 = op == _419;
    assign _422 = _420 & _421;
    assign _416 = _225[1:1];
    assign _414 = 5'b10011;
    assign _415 = op == _414;
    assign _417 = _415 & _416;
    assign _411 = ~ _406;
    assign _409 = 5'b10010;
    assign _410 = op == _409;
    assign _412 = _410 & _411;
    assign _994 = alu_result == _1047;
    assign _988 = _855[8:8];
    assign _987 = _851[8:8];
    assign _985 = reg_val[0:0];
    assign _984 = reg_val[7:7];
    always @* begin
        case (_782)
        0:
            _992 <= _984;
        1:
            _992 <= _985;
        2:
            _992 <= _1085;
        3:
            _992 <= _987;
        4:
            _992 <= _988;
        5:
            _992 <= _1085;
        6:
            _992 <= _1085;
        default:
            _992 <= _1085;
        endcase
    end
    assign _995 = { _992,
                    _994 };
    assign _983 = 6'b000000;
    assign _996 = { _983,
                    _995 };
    assign _869 = imm[2:0];
    always @* begin
        case (_869)
        0:
            reg_src <= fifo_tx_data;
        1:
            reg_src <= _219;
        2:
            reg_src <= _210;
        3:
            reg_src <= pins_out;
        4:
            reg_src <= oe;
        5:
            reg_src <= _222;
        6:
            reg_src <= _225;
        default:
            reg_src <= _228;
        endcase
    end
    assign _447 = ~ _159;
    assign _448 = _156 & _447;
    assign _449 = _448 ? _238 : _241;
    assign _450 = host_run ? _449 : _241;
    assign _25 = _450;
    always @(posedge _114) begin
        if (_124)
            _241 <= _1047;
        else
            _241 <= _25;
    end
    assign _236 = 5'b01010;
    assign _237 = op == _236;
    assign _238 = _237 ? _210 : imm;
    assign _452 = ~ _159;
    assign _453 = _156 ? _452 : _1085;
    assign _454 = host_run ? _453 : _159;
    assign _26 = _454;
    always @(posedge _114) begin
        if (_124)
            _159 <= _1085;
        else
            _159 <= _26;
    end
    assign _242 = _159 ? _241 : _238;
    assign host_data_rd_addr = host_data_rd_addr_0;
    assign _154 = op == _236;
    assign _151 = 5'b11110;
    assign _152 = op == _151;
    assign _155 = _152 | _154;
    assign _156 = _155 & host_run;
    assign _243 = _156 ? _242 : host_data_rd_addr;
    assign _464 = _462[15:8];
    assign _461 = 16'b0000000000000010;
    assign _455 = 16'b0000000000000001;
    assign _456 = cyc + _455;
    assign _457 = host_run ? _456 : cyc;
    assign _28 = _457;
    always @(posedge _114) begin
        if (_124)
            cyc <= _1010;
        else
            cyc <= _28;
    end
    assign _462 = cyc - _461;
    assign _463 = _462[7:0];
    always @* begin
        case (_460)
        0:
            _465 <= pins_sync;
        1:
            _465 <= _463;
        default:
            _465 <= _464;
        endcase
    end
    assign cap_wr_data = _465;
    assign host_data_wr_data = prog_wr_data;
    assign _230 = host_data_wr ? host_data_wr_data : reg_val;
    assign _231 = cap_wr ? cap_wr_data : _230;
    assign _494 = cap_base + _471;
    assign _496 = _494 + _375;
    assign _491 = cap_base + _471;
    assign _493 = _491 + _337;
    assign _474 = 8'b00000011;
    assign _475 = _471 + _474;
    assign _476 = _473 ? _475 : _471;
    assign _477 = _468 ? _476 : _471;
    assign _31 = _477;
    always @(posedge _114) begin
        if (_123)
            _471 <= _1047;
        else
            _471 <= _31;
    end
    assign _484 = _381 ? cap_base : prog_wr_data;
    assign _485 = _483 ? _484 : cap_base;
    assign _481 = _369 == _472;
    assign _486 = _481 ? _485 : cap_base;
    assign _487 = _366 ? _486 : cap_base;
    assign _488 = _361 ? _487 : cap_base;
    assign _489 = _354 ? _488 : cap_base;
    assign _32 = _489;
    always @(posedge _114) begin
        if (_123)
            cap_base <= _1047;
        else
            cap_base <= _32;
    end
    assign _490 = cap_base + _471;
    always @* begin
        case (_460)
        0:
            _497 <= _490;
        1:
            _497 <= _493;
        default:
            _497 <= _496;
        endcase
    end
    assign cap_wr_addr = _497;
    assign _515 = host_data_rd_addr_0 + _337;
    assign _511 = host_data_rd_addr_0 + _337;
    assign _508 = _381 ? prog_wr_data : host_data_rd_addr_0;
    assign _507 = _374 == _337;
    assign _509 = _507 ? _508 : host_data_rd_addr_0;
    assign _504 = _374 == _375;
    assign _505 = _504 & _381;
    assign _512 = _505 ? _511 : _509;
    assign _502 = _374 == _474;
    assign _513 = _502 ? prog_wr_data : _512;
    assign _499 = 8'b00000100;
    assign _500 = _374 == _499;
    assign _516 = _500 ? _515 : _513;
    assign _498 = _369 == _472;
    assign _517 = _498 ? _516 : host_data_rd_addr_0;
    assign _518 = _366 ? _517 : host_data_rd_addr_0;
    assign _519 = _361 ? _518 : host_data_rd_addr_0;
    assign _520 = _354 ? _519 : host_data_rd_addr_0;
    assign _34 = _520;
    always @(posedge _114) begin
        if (_123)
            host_data_rd_addr_0 <= _1047;
        else
            host_data_rd_addr_0 <= _34;
    end
    assign host_data_wr_addr = host_data_rd_addr_0;
    assign _206 = 5'b01011;
    assign _207 = op == _206;
    assign _211 = _207 ? _210 : imm;
    assign _212 = host_data_wr ? host_data_wr_addr : _211;
    assign _213 = cap_wr ? cap_wr_addr : _212;
    assign _472 = 2'b10;
    assign _459 = 2'b00;
    assign _619 = 2'b01;
    assign _620 = _460 + _619;
    assign _621 = _473 ? _618 : _620;
    assign _617 = _615 ? _459 : _460;
    assign _618 = _526 ? _617 : _460;
    assign _622 = _468 ? _621 : _618;
    assign _36 = _622;
    always @(posedge _114) begin
        if (_123)
            _460 <= _459;
        else
            _460 <= _36;
    end
    assign _473 = _460 == _472;
    assign _634 = _473 ? _1085 : _632;
    assign _630 = 1'b1;
    assign _607 = _542 | _551;
    assign _608 = _607 | _560;
    assign _609 = _608 | _569;
    assign _610 = _609 | _578;
    assign _611 = _610 | _587;
    assign _612 = _611 | _596;
    assign _613 = _612 | _605;
    assign _602 = _535[7:7];
    assign _603 = ~ _602;
    assign _601 = pins_sync[7:7];
    assign _604 = _601 & _603;
    assign _599 = _535[7:7];
    assign _597 = pins_sync[7:7];
    assign _598 = ~ _597;
    assign _600 = _598 & _599;
    assign _605 = _530 ? _604 : _600;
    assign _593 = _535[6:6];
    assign _594 = ~ _593;
    assign _592 = pins_sync[6:6];
    assign _595 = _592 & _594;
    assign _590 = _535[6:6];
    assign _588 = pins_sync[6:6];
    assign _589 = ~ _588;
    assign _591 = _589 & _590;
    assign _596 = _530 ? _595 : _591;
    assign _584 = _535[5:5];
    assign _585 = ~ _584;
    assign _583 = pins_sync[5:5];
    assign _586 = _583 & _585;
    assign _581 = _535[5:5];
    assign _579 = pins_sync[5:5];
    assign _580 = ~ _579;
    assign _582 = _580 & _581;
    assign _587 = _530 ? _586 : _582;
    assign _575 = _535[4:4];
    assign _576 = ~ _575;
    assign _574 = pins_sync[4:4];
    assign _577 = _574 & _576;
    assign _572 = _535[4:4];
    assign _570 = pins_sync[4:4];
    assign _571 = ~ _570;
    assign _573 = _571 & _572;
    assign _578 = _530 ? _577 : _573;
    assign _566 = _535[3:3];
    assign _567 = ~ _566;
    assign _565 = pins_sync[3:3];
    assign _568 = _565 & _567;
    assign _563 = _535[3:3];
    assign _561 = pins_sync[3:3];
    assign _562 = ~ _561;
    assign _564 = _562 & _563;
    assign _569 = _530 ? _568 : _564;
    assign _557 = _535[2:2];
    assign _558 = ~ _557;
    assign _556 = pins_sync[2:2];
    assign _559 = _556 & _558;
    assign _554 = _535[2:2];
    assign _552 = pins_sync[2:2];
    assign _553 = ~ _552;
    assign _555 = _553 & _554;
    assign _560 = _530 ? _559 : _555;
    assign _548 = _535[1:1];
    assign _549 = ~ _548;
    assign _547 = pins_sync[1:1];
    assign _550 = _547 & _549;
    assign _545 = _535[1:1];
    assign _543 = pins_sync[1:1];
    assign _544 = ~ _543;
    assign _546 = _544 & _545;
    assign _551 = _530 ? _550 : _546;
    assign _539 = _535[0:0];
    assign _540 = ~ _539;
    assign _538 = pins_sync[0:0];
    assign _541 = _538 & _540;
    assign _37 = pins_sync;
    always @(posedge _114) begin
        if (_123)
            _535 <= _1047;
        else
            _535 <= _37;
    end
    assign _536 = _535[0:0];
    assign _531 = pins_sync[0:0];
    assign _532 = ~ _531;
    assign _537 = _532 & _536;
    assign _530 = cap_ctrl[1:1];
    assign _542 = _530 ? _541 : _537;
    assign _529 = cap_ctrl[4:2];
    always @* begin
        case (_529)
        0:
            _606 <= _542;
        1:
            _606 <= _551;
        2:
            _606 <= _560;
        3:
            _606 <= _569;
        4:
            _606 <= _578;
        5:
            _606 <= _587;
        6:
            _606 <= _596;
        default:
            _606 <= _605;
        endcase
    end
    assign _528 = cap_ctrl[5:5];
    assign _614 = _528 ? _613 : _606;
    assign _527 = _524 & _525;
    assign _615 = _527 & _614;
    assign _631 = _615 ? _630 : _468;
    assign _525 = ~ _468;
    assign _624 = _381 ? prog_wr_data : cap_ctrl;
    assign _482 = 8'b00001010;
    assign _483 = _374 == _482;
    assign _625 = _483 ? _624 : cap_ctrl;
    assign _623 = _369 == _472;
    assign _626 = _623 ? _625 : cap_ctrl;
    assign _627 = _366 ? _626 : cap_ctrl;
    assign _628 = _361 ? _627 : cap_ctrl;
    assign _629 = _354 ? _628 : cap_ctrl;
    assign _38 = _629;
    always @(posedge _114) begin
        if (_123)
            cap_ctrl <= _1047;
        else
            cap_ctrl <= _38;
    end
    assign _524 = cap_ctrl[0:0];
    assign _526 = _524 & _525;
    assign _632 = _526 ? _631 : _468;
    assign _635 = _468 ? _634 : _632;
    assign _39 = _635;
    always @(posedge _114) begin
        if (_123)
            _468 <= _1085;
        else
            _468 <= _39;
    end
    assign cap_wr = _468;
    assign _201 = op == _206;
    assign _202 = advance & _201;
    assign _196 = 5'b11111;
    assign _197 = op == _196;
    assign _198 = advance & _197;
    assign _642 = _374 == _499;
    assign data_wr = _640 & _642;
    assign host_data_wr = data_wr;
    assign _199 = host_data_wr | _198;
    assign _203 = _199 | _202;
    assign _204 = _203 | cap_wr;
    RM_IHPSG13_2P_256x8_c2_bm_bist
        the_RM_IHPSG13_2P_256x8_c2_bm_bist
        ( .A_CLK(_114),
          .A_MEN(vdd),
          .A_WEN(_204),
          .A_REN(gnd),
          .A_ADDR(_213),
          .A_DIN(_231),
          .A_DLY(gnd),
          .A_BM(_1065),
          .A_BIST_CLK(gnd),
          .A_BIST_EN(gnd),
          .A_BIST_MEN(gnd),
          .A_BIST_WEN(gnd),
          .A_BIST_REN(gnd),
          .A_BIST_ADDR(_1047),
          .A_BIST_DIN(_1047),
          .A_BIST_BM(_1065),
          .B_CLK(_114),
          .B_MEN(vdd),
          .B_WEN(gnd),
          .B_REN(vdd),
          .B_ADDR(_243),
          .B_DIN(_1047),
          .B_DLY(gnd),
          .B_BM(_1065),
          .B_BIST_CLK(gnd),
          .B_BIST_EN(gnd),
          .B_BIST_MEN(gnd),
          .B_BIST_WEN(gnd),
          .B_BIST_REN(gnd),
          .B_BIST_ADDR(_1047),
          .B_BIST_DIN(_1047),
          .B_BIST_BM(_1065),
          .B_DOUT(_250[15:8]),
          .A_DOUT(_250[7:0]) );
    assign data_mem_host_rdata = _250[15:8];
    assign _864 = imm[2:0];
    always @* begin
        case (_864)
        0:
            pin_imm <= _172;
        1:
            pin_imm <= _173;
        2:
            pin_imm <= _174;
        3:
            pin_imm <= _175;
        4:
            pin_imm <= _176;
        5:
            pin_imm <= _177;
        6:
            pin_imm <= _178;
        default:
            pin_imm <= _179;
        endcase
    end
    assign _863 = 7'b0000000;
    assign _866 = { _863,
                    pin_imm };
    assign _655 = _653 == _265;
    assign _656 = _655 ? host_rx_data : _650;
    assign _657 = _647 ? _656 : _650;
    assign _42 = _657;
    always @(posedge _114) begin
        if (_123)
            _650 <= _1047;
        else
            _650 <= _42;
    end
    assign _662 = _653 == _272;
    assign _663 = _662 ? host_rx_data : _660;
    assign _664 = _647 ? _663 : _660;
    assign _43 = _664;
    always @(posedge _114) begin
        if (_123)
            _660 <= _1047;
        else
            _660 <= _43;
    end
    assign _669 = _653 == _279;
    assign _670 = _669 ? host_rx_data : _667;
    assign _671 = _647 ? _670 : _667;
    assign _44 = _671;
    always @(posedge _114) begin
        if (_123)
            _667 <= _1047;
        else
            _667 <= _44;
    end
    assign _676 = _653 == _286;
    assign _677 = _676 ? host_rx_data : _674;
    assign _678 = _647 ? _677 : _674;
    assign _45 = _678;
    always @(posedge _114) begin
        if (_123)
            _674 <= _1047;
        else
            _674 <= _45;
    end
    assign _683 = _653 == _293;
    assign _684 = _683 ? host_rx_data : _681;
    assign _685 = _647 ? _684 : _681;
    assign _46 = _685;
    always @(posedge _114) begin
        if (_123)
            _681 <= _1047;
        else
            _681 <= _46;
    end
    assign _690 = _653 == _300;
    assign _691 = _690 ? host_rx_data : _688;
    assign _692 = _647 ? _691 : _688;
    assign _47 = _692;
    always @(posedge _114) begin
        if (_123)
            _688 <= _1047;
        else
            _688 <= _47;
    end
    assign _697 = _653 == _307;
    assign _698 = _697 ? host_rx_data : _695;
    assign _699 = _647 ? _698 : _695;
    assign _48 = _699;
    always @(posedge _114) begin
        if (_123)
            _695 <= _1047;
        else
            _695 <= _48;
    end
    assign host_rx_data = prog_wr_data;
    assign _701 = _653 + _307;
    assign _702 = _647 ? _701 : _653;
    assign _50 = _702;
    always @(posedge _114) begin
        if (_123)
            _653 <= _317;
        else
            _653 <= _50;
    end
    assign _707 = _653 == _317;
    assign _708 = _707 ? host_rx_data : _705;
    assign _709 = _647 ? _708 : _705;
    assign _51 = _709;
    always @(posedge _114) begin
        if (_123)
            _705 <= _1047;
        else
            _705 <= _51;
    end
    assign _734 = _732 + _307;
    assign _725 = fifo_level - _1041;
    assign _722 = fifo_level + _1041;
    assign _719 = ~ _716;
    assign _720 = _647 & _719;
    assign _723 = _720 ? _722 : fifo_level;
    assign _646 = ~ fifo_full_0;
    assign fifo_full_0 = fifo_level == _255;
    assign rx_full = fifo_full_0;
    assign _713 = ~ rx_full;
    assign _710 = 8'b00001000;
    assign _711 = _374 == _710;
    assign _712 = _640 & _711;
    assign fifo_rx_push = _712 & _713;
    assign host_rx_push = fifo_rx_push;
    assign _647 = host_rx_push & _646;
    assign _717 = ~ _647;
    assign _718 = _716 & _717;
    assign _726 = _718 ? _725 : _723;
    assign _54 = _726;
    always @(posedge _114) begin
        if (_123)
            fifo_level <= _1068;
        else
            fifo_level <= _54;
    end
    assign fifo_empty = fifo_level == _1068;
    assign _715 = ~ fifo_empty;
    assign _728 = op == _149;
    assign fifo_rx_pop = advance & _728;
    assign core_rx_pop = fifo_rx_pop;
    assign _716 = core_rx_pop & _715;
    assign _735 = _716 ? _734 : _732;
    assign _56 = _735;
    always @(posedge _114) begin
        if (_123)
            _732 <= _317;
        else
            _732 <= _56;
    end
    always @* begin
        case (_732)
        0:
            fifo_data_0 <= _705;
        1:
            fifo_data_0 <= _695;
        2:
            fifo_data_0 <= _688;
        3:
            fifo_data_0 <= _681;
        4:
            fifo_data_0 <= _674;
        5:
            fifo_data_0 <= _667;
        6:
            fifo_data_0 <= _660;
        default:
            fifo_data_0 <= _650;
        endcase
    end
    assign rx_data = fifo_data_0;
    assign _859 = reg_val ^ imm;
    assign _858 = reg_val | imm;
    assign _857 = reg_val & imm;
    assign _854 = { _1085,
                    reg_val };
    assign _855 = _854 - _850;
    assign _856 = _855[7:0];
    assign _850 = { _1085,
                    imm };
    assign _848 = { _1085,
                    reg_val };
    assign _851 = _848 + _850;
    assign _852 = _851[7:0];
    assign _834 = _832[7:4];
    assign _835 = { _1068,
                    _834 };
    assign _830 = _828[7:2];
    assign _831 = { _459,
                    _830 };
    assign _826 = reg_val[7:1];
    assign _827 = { _1085,
                    _826 };
    assign _824 = _786[0:0];
    assign _828 = _824 ? _827 : reg_val;
    assign _823 = _786[1:1];
    assign _832 = _823 ? _831 : _828;
    assign _822 = _786[2:2];
    assign _836 = _822 ? _835 : _832;
    assign _821 = _786[3:3];
    assign _838 = _821 ? _1047 : _836;
    assign _820 = _786[4:4];
    assign _840 = _820 ? _1047 : _838;
    assign _819 = _786[5:5];
    assign _842 = _819 ? _1047 : _840;
    assign _818 = _786[6:6];
    assign _844 = _818 ? _1047 : _842;
    assign _817 = _786[7:7];
    assign _846 = _817 ? _1047 : _844;
    assign _803 = _802[3:0];
    assign _805 = { _803,
                    _1068 };
    assign _799 = _798[5:0];
    assign _801 = { _799,
                    _459 };
    assign _795 = reg_val[6:0];
    assign _797 = { _795,
                    _1085 };
    assign _766 = arg == _265;
    assign _873 = _766 ? reg_write_value : _228;
    assign _874 = _764 ? _873 : _228;
    assign _875 = advance ? _874 : _228;
    assign _876 = host_run ? _875 : _228;
    assign _58 = _876;
    always @(posedge _114) begin
        if (_124)
            _228 <= _1047;
        else
            _228 <= _58;
    end
    assign _878 = arg == _286;
    assign _879 = _878 ? reg_write_value : oe;
    assign _880 = _764 ? _879 : oe;
    assign _881 = advance ? _880 : oe;
    assign _882 = host_run ? _881 : oe;
    assign _59 = _882;
    always @(posedge _114) begin
        if (_124)
            oe <= _1047;
        else
            oe <= _59;
    end
    assign _952 = pins_out[6:0];
    assign _953 = { _932,
                    _952 };
    assign _950 = pins_out[5:0];
    assign _949 = pins_out[7:7];
    assign _951 = { _949,
                    _932,
                    _950 };
    assign _947 = pins_out[4:0];
    assign _946 = pins_out[7:6];
    assign _948 = { _946,
                    _932,
                    _947 };
    assign _944 = pins_out[3:0];
    assign _943 = pins_out[7:5];
    assign _945 = { _943,
                    _932,
                    _944 };
    assign _941 = pins_out[2:0];
    assign _940 = pins_out[7:4];
    assign _942 = { _940,
                    _932,
                    _941 };
    assign _938 = pins_out[1:0];
    assign _937 = pins_out[7:3];
    assign _939 = { _937,
                    _932,
                    _938 };
    assign _935 = pins_out[0:0];
    assign _934 = pins_out[7:2];
    assign _936 = { _934,
                    _932,
                    _935 };
    assign _179 = pins_sync[7:7];
    assign _178 = pins_sync[6:6];
    assign _177 = pins_sync[5:5];
    assign _176 = pins_sync[4:4];
    assign _175 = pins_sync[3:3];
    assign _174 = pins_sync[2:2];
    assign _173 = pins_sync[1:1];
    assign _61 = uio_in;
    always @(posedge _114) begin
        _168 <= _61;
    end
    always @(posedge _114) begin
        pins_sync <= _168;
    end
    assign _172 = pins_sync[0:0];
    always @* begin
        case (arg)
        0:
            pin_arg <= _172;
        1:
            pin_arg <= _173;
        2:
            pin_arg <= _174;
        3:
            pin_arg <= _175;
        4:
            pin_arg <= _176;
        5:
            pin_arg <= _177;
        6:
            pin_arg <= _178;
        default:
            pin_arg <= _179;
        endcase
    end
    assign _895 = _222[6:0];
    assign _896 = { _895,
                    pin_arg };
    assign _891 = _222[6:0];
    assign _893 = { _891,
                    _1085 };
    assign _888 = arg == _279;
    assign _889 = _888 ? reg_write_value : _222;
    assign _890 = _764 ? _889 : _222;
    assign _894 = _886 ? _893 : _890;
    assign _883 = 5'b11011;
    assign _884 = op == _883;
    assign _897 = _884 ? _896 : _894;
    assign _898 = advance ? _897 : _222;
    assign _899 = host_run ? _898 : _222;
    assign _62 = _899;
    always @(posedge _114) begin
        if (_124)
            _222 <= _1047;
        else
            _222 <= _62;
    end
    assign _932 = _222[7:7];
    assign _931 = pins_out[7:1];
    assign _933 = { _931,
                    _932 };
    always @* begin
        case (arg)
        0:
            _954 <= _933;
        1:
            _954 <= _936;
        2:
            _954 <= _939;
        3:
            _954 <= _942;
        4:
            _954 <= _945;
        5:
            _954 <= _948;
        6:
            _954 <= _951;
        default:
            _954 <= _953;
        endcase
    end
    assign _927 = pins_out[6:0];
    assign _928 = { _907,
                    _927 };
    assign _925 = pins_out[5:0];
    assign _924 = pins_out[7:7];
    assign _926 = { _924,
                    _907,
                    _925 };
    assign _922 = pins_out[4:0];
    assign _921 = pins_out[7:6];
    assign _923 = { _921,
                    _907,
                    _922 };
    assign _919 = pins_out[3:0];
    assign _918 = pins_out[7:5];
    assign _920 = { _918,
                    _907,
                    _919 };
    assign _916 = pins_out[2:0];
    assign _915 = pins_out[7:4];
    assign _917 = { _915,
                    _907,
                    _916 };
    assign _913 = pins_out[1:0];
    assign _912 = pins_out[7:3];
    assign _914 = { _912,
                    _907,
                    _913 };
    assign _910 = pins_out[0:0];
    assign _909 = pins_out[7:2];
    assign _911 = { _909,
                    _907,
                    _910 };
    assign _907 = imm[0:0];
    assign _906 = pins_out[7:1];
    assign _908 = { _906,
                    _907 };
    always @* begin
        case (arg)
        0:
            _929 <= _908;
        1:
            _929 <= _911;
        2:
            _929 <= _914;
        3:
            _929 <= _917;
        4:
            _929 <= _920;
        5:
            _929 <= _923;
        6:
            _929 <= _926;
        default:
            _929 <= _928;
        endcase
    end
    assign _903 = arg == _293;
    assign _904 = _903 ? reg_write_value : pins_out;
    assign _905 = _764 ? _904 : pins_out;
    assign _900 = 5'b01100;
    assign _901 = op == _900;
    assign _930 = _901 ? _929 : _905;
    assign _885 = 5'b11010;
    assign _886 = op == _885;
    assign _955 = _886 ? _954 : _930;
    assign _956 = advance ? _955 : pins_out;
    assign _957 = host_run ? _956 : pins_out;
    assign _63 = _957;
    always @(posedge _114) begin
        if (_124)
            pins_out <= _1047;
        else
            pins_out <= _63;
    end
    assign _959 = arg == _300;
    assign _960 = _959 ? reg_write_value : _210;
    assign _961 = _764 ? _960 : _210;
    assign _962 = advance ? _961 : _210;
    assign _963 = host_run ? _962 : _210;
    assign _64 = _963;
    always @(posedge _114) begin
        if (_124)
            _210 <= _1047;
        else
            _210 <= _64;
    end
    assign _436 = _219 - _337;
    assign _967 = arg == _307;
    assign _968 = _967 ? reg_write_value : _219;
    assign _969 = _764 ? _968 : _219;
    assign _965 = op == _433;
    assign _970 = _965 ? _436 : _969;
    assign _971 = advance ? _970 : _219;
    assign _972 = host_run ? _971 : _219;
    assign _65 = _972;
    always @(posedge _114) begin
        if (_124)
            _219 <= _1047;
        else
            _219 <= _65;
    end
    assign _974 = arg == _317;
    assign _975 = _974 ? reg_write_value : fifo_tx_data;
    assign _976 = _764 ? _975 : fifo_tx_data;
    assign _977 = advance ? _976 : fifo_tx_data;
    assign _978 = host_run ? _977 : fifo_tx_data;
    assign _66 = _978;
    always @(posedge _114) begin
        if (_124)
            fifo_tx_data <= _1047;
        else
            fifo_tx_data <= _66;
    end
    always @* begin
        case (arg)
        0:
            reg_val <= fifo_tx_data;
        1:
            reg_val <= _219;
        2:
            reg_val <= _210;
        3:
            reg_val <= pins_out;
        4:
            reg_val <= oe;
        5:
            reg_val <= _222;
        6:
            reg_val <= _225;
        default:
            reg_val <= _228;
        endcase
    end
    assign _794 = _786[0:0];
    assign _798 = _794 ? _797 : reg_val;
    assign _793 = _786[1:1];
    assign _802 = _793 ? _801 : _798;
    assign _792 = _786[2:2];
    assign _806 = _792 ? _805 : _802;
    assign _791 = _786[3:3];
    assign _808 = _791 ? _1047 : _806;
    assign _790 = _786[4:4];
    assign _810 = _790 ? _1047 : _808;
    assign _789 = _786[5:5];
    assign _812 = _789 ? _1047 : _810;
    assign _788 = _786[6:6];
    assign _814 = _788 ? _1047 : _812;
    assign imm = _71[7:0];
    assign _784 = imm == _1047;
    assign _786 = _784 ? _710 : imm;
    assign _787 = _786[7:7];
    assign _816 = _787 ? _1047 : _814;
    assign _782 = op[2:0];
    always @* begin
        case (_782)
        0:
            alu_result <= _816;
        1:
            alu_result <= _846;
        2:
            alu_result <= _852;
        3:
            alu_result <= _852;
        4:
            alu_result <= _856;
        5:
            alu_result <= _857;
        6:
            alu_result <= _858;
        default:
            alu_result <= _859;
        endcase
    end
    assign _781 = op == _149;
    assign _861 = _781 ? rx_data : alu_result;
    assign _778 = 5'b11001;
    assign _779 = op == _778;
    assign _862 = _779 ? pins_sync : _861;
    assign _776 = 5'b11000;
    assign _777 = op == _776;
    assign _867 = _777 ? _866 : _862;
    assign _774 = op == _236;
    assign _772 = op == _151;
    assign _775 = _772 | _774;
    assign _868 = _775 ? data_mem_host_rdata : _867;
    assign _769 = 5'b00010;
    assign _770 = op == _769;
    assign _871 = _770 ? reg_src : _868;
    assign _767 = 5'b00001;
    assign _768 = op == _767;
    assign reg_write_value = _768 ? imm : _871;
    assign arg = _71[10:8];
    assign _980 = arg == _272;
    assign _981 = _980 ? reg_write_value : _225;
    assign _763 = op == _149;
    assign _760 = op == _778;
    assign _757 = op == _776;
    assign _754 = op == _236;
    assign _751 = op == _151;
    assign _740 = op == _769;
    assign _738 = op == _767;
    assign _741 = _738 | _740;
    assign _749 = _741 | _748;
    assign _752 = _749 | _751;
    assign _755 = _752 | _754;
    assign _758 = _755 | _757;
    assign _761 = _758 | _760;
    assign _764 = _761 | _763;
    assign _982 = _764 ? _981 : _225;
    assign _745 = 5'b01001;
    assign _746 = _745 < op;
    assign _747 = ~ _746;
    assign _742 = 5'b00011;
    assign _743 = op < _742;
    assign _744 = ~ _743;
    assign _748 = _744 & _747;
    assign _997 = _748 ? _996 : _982;
    assign _998 = advance ? _997 : _225;
    assign _999 = host_run ? _998 : _225;
    assign _67 = _999;
    always @(posedge _114) begin
        if (_124)
            _225 <= _1047;
        else
            _225 <= _67;
    end
    assign _406 = _225[0:0];
    assign _404 = 5'b10001;
    assign _405 = op == _404;
    assign _407 = _405 & _406;
    assign _402 = 5'b10000;
    assign _403 = op == _402;
    assign _408 = _403 | _407;
    assign _413 = _408 | _412;
    assign _418 = _413 | _417;
    assign _423 = _418 | _422;
    assign _427 = _423 | _426;
    assign _432 = _427 | _431;
    assign _441 = _432 | branch_taken;
    assign fetch_addr = _441 ? imm : pc;
    assign _1000 = host_prog_wr ? host_prog_wr_addr : fetch_addr;
    assign _68 = _1000;
    assign _1001 = ~ host_prog_wr;
    assign _1002 = _1001 & host_run;
    assign _1003 = _1002 & advance;
    assign _69 = _1003;
    assign _1005 = _374 == _375;
    assign _1006 = _640 & _1005;
    assign prog_wr = _1006 & _381;
    assign host_prog_wr = prog_wr;
    RM_IHPSG13_1P_256x16_c2_bm_bist
        the_RM_IHPSG13_1P_256x16_c2_bm_bist
        ( .A_CLK(_114),
          .A_MEN(vdd),
          .A_WEN(host_prog_wr),
          .A_REN(_69),
          .A_ADDR(_68),
          .A_DIN(host_prog_wr_data),
          .A_DLY(gnd),
          .A_BM(_1011),
          .A_BIST_CLK(gnd),
          .A_BIST_EN(gnd),
          .A_BIST_MEN(gnd),
          .A_BIST_WEN(gnd),
          .A_BIST_REN(gnd),
          .A_BIST_ADDR(_1047),
          .A_BIST_DIN(_1010),
          .A_BIST_BM(_1011),
          .A_DOUT(_1013[15:0]) );
    assign _71 = _1013;
    assign _139 = _71[15:11];
    assign _138 = 5'b00000;
    assign _1017 = prog_wr_data[1:1];
    assign _1014 = 8'b00000110;
    assign _1015 = _374 == _1014;
    assign _1016 = _640 & _1015;
    assign reset_core = _1016 & _1017;
    assign host_reset_core = reset_core;
    assign _124 = _123 | host_reset_core;
    assign host_run = run;
    assign _1022 = host_run ? vdd : _137;
    assign _74 = _1022;
    always @(posedge _114) begin
        if (_124)
            _137 <= _1085;
        else
            _137 <= _74;
    end
    assign op = _137 ? _139 : _138;
    assign _142 = op == _332;
    assign advance = _142 ? _194 : _190;
    assign fifo_tx_push = advance & _1024;
    assign core_tx_push = fifo_tx_push;
    assign _258 = core_tx_push & _257;
    assign _1034 = ~ _258;
    assign _323 = ~ fifo_empty_0;
    assign _1032 = ~ tx_empty;
    assign _1029 = 8'b00001001;
    assign _1030 = prog_wr_data == _1029;
    assign _1027 = _619 == _369;
    assign _1028 = _1027 & _639;
    assign _1031 = _1028 & _1030;
    assign fifo_tx_pop = _1031 & _1032;
    assign host_tx_pop = fifo_tx_pop;
    assign _324 = host_tx_pop & _323;
    assign _1035 = _324 & _1034;
    assign _1043 = _1035 ? _1042 : _1040;
    assign _77 = _1043;
    always @(posedge _114) begin
        if (_123)
            fifo_level_0 <= _1068;
        else
            fifo_level_0 <= _77;
    end
    assign fifo_empty_0 = fifo_level_0 == _1068;
    assign tx_empty = fifo_empty_0;
    assign _1066 = tx_empty ? _1065 : tx_data;
    assign _1063 = prog_wr_data == _1029;
    assign _1067 = _1063 ? _1066 : _1047;
    assign _1060 = 8'b00000111;
    assign _1061 = prog_wr_data == _1060;
    assign _1074 = _1061 ? _1073 : _1067;
    assign _1058 = 8'b00000101;
    assign _1059 = prog_wr_data == _1058;
    assign _1075 = _1059 ? core_data_out : _1074;
    assign _1076 = _1057 ? _1075 : _1048;
    assign _1049 = _369 == _619;
    assign _1077 = _1049 ? _1076 : _1048;
    assign _1078 = _366 ? _1077 : _1048;
    assign _1079 = _361 ? _1078 : _1048;
    assign _1080 = _354 ? _1079 : _1048;
    assign _1044 = ~ _349;
    assign _1045 = _1044 & _352;
    assign _1088 = _1045 ? _1087 : _1080;
    assign _79 = _1088;
    always @(posedge _114) begin
        if (_123)
            _1048 <= _1047;
        else
            _1048 <= _79;
    end
    assign _1428 = _1048[7:7];
    assign gnd = 1'b0;
    assign _1426 = _1081 == _369;
    assign _1427 = _361 & _1426;
    assign miso = _1427 ? _1428 : gnd;
    assign _1092 = prog_wr_data[0:0];
    assign _1091 = _374 == _1014;
    assign _1093 = _1091 ? _1092 : run;
    assign _1089 = _369 == _472;
    assign _1094 = _1089 ? _1093 : run;
    assign _1095 = _366 ? _1094 : run;
    assign _1096 = _361 ? _1095 : run;
    assign _1097 = _354 ? _1096 : run;
    assign _80 = _1097;
    always @(posedge _114) begin
        if (_123)
            run <= _1085;
        else
            run <= _80;
    end
    assign _1430 = { run,
                     miso };
    assign _1115 = { prog_wr_data,
                     pat_data_lo };
    assign _1106 = 4'b1111;
    assign _1107 = pat_data_idx == _1106;
    assign _1108 = pat_data_wr & _1107;
    assign _1116 = _1108 ? _1115 : _1111;
    assign _81 = _1116;
    always @(posedge _114) begin
        if (_123)
            _1111 <= _1010;
        else
            _1111 <= _81;
    end
    assign _1123 = { prog_wr_data,
                     pat_data_lo };
    assign _1117 = 4'b1110;
    assign _1118 = pat_data_idx == _1117;
    assign _1119 = pat_data_wr & _1118;
    assign _1124 = _1119 ? _1123 : _1122;
    assign _82 = _1124;
    always @(posedge _114) begin
        if (_123)
            _1122 <= _1010;
        else
            _1122 <= _82;
    end
    assign _1131 = { prog_wr_data,
                     pat_data_lo };
    assign _1125 = 4'b1101;
    assign _1126 = pat_data_idx == _1125;
    assign _1127 = pat_data_wr & _1126;
    assign _1132 = _1127 ? _1131 : _1130;
    assign _83 = _1132;
    always @(posedge _114) begin
        if (_123)
            _1130 <= _1010;
        else
            _1130 <= _83;
    end
    assign _1139 = { prog_wr_data,
                     pat_data_lo };
    assign _1133 = 4'b1100;
    assign _1134 = pat_data_idx == _1133;
    assign _1135 = pat_data_wr & _1134;
    assign _1140 = _1135 ? _1139 : _1138;
    assign _84 = _1140;
    always @(posedge _114) begin
        if (_123)
            _1138 <= _1010;
        else
            _1138 <= _84;
    end
    assign _1147 = { prog_wr_data,
                     pat_data_lo };
    assign _1141 = 4'b1011;
    assign _1142 = pat_data_idx == _1141;
    assign _1143 = pat_data_wr & _1142;
    assign _1148 = _1143 ? _1147 : _1146;
    assign _85 = _1148;
    always @(posedge _114) begin
        if (_123)
            _1146 <= _1010;
        else
            _1146 <= _85;
    end
    assign _1155 = { prog_wr_data,
                     pat_data_lo };
    assign _1149 = 4'b1010;
    assign _1150 = pat_data_idx == _1149;
    assign _1151 = pat_data_wr & _1150;
    assign _1156 = _1151 ? _1155 : _1154;
    assign _86 = _1156;
    always @(posedge _114) begin
        if (_123)
            _1154 <= _1010;
        else
            _1154 <= _86;
    end
    assign _1163 = { prog_wr_data,
                     pat_data_lo };
    assign _1157 = 4'b1001;
    assign _1158 = pat_data_idx == _1157;
    assign _1159 = pat_data_wr & _1158;
    assign _1164 = _1159 ? _1163 : _1162;
    assign _87 = _1164;
    always @(posedge _114) begin
        if (_123)
            _1162 <= _1010;
        else
            _1162 <= _87;
    end
    assign _1171 = { prog_wr_data,
                     pat_data_lo };
    assign _1166 = pat_data_idx == _255;
    assign _1167 = pat_data_wr & _1166;
    assign _1172 = _1167 ? _1171 : _1170;
    assign _88 = _1172;
    always @(posedge _114) begin
        if (_123)
            _1170 <= _1010;
        else
            _1170 <= _88;
    end
    assign _1179 = { prog_wr_data,
                     pat_data_lo };
    assign _1173 = 4'b0111;
    assign _1174 = pat_data_idx == _1173;
    assign _1175 = pat_data_wr & _1174;
    assign _1180 = _1175 ? _1179 : _1178;
    assign _89 = _1180;
    always @(posedge _114) begin
        if (_123)
            _1178 <= _1010;
        else
            _1178 <= _89;
    end
    assign _1187 = { prog_wr_data,
                     pat_data_lo };
    assign _1181 = 4'b0110;
    assign _1182 = pat_data_idx == _1181;
    assign _1183 = pat_data_wr & _1182;
    assign _1188 = _1183 ? _1187 : _1186;
    assign _90 = _1188;
    always @(posedge _114) begin
        if (_123)
            _1186 <= _1010;
        else
            _1186 <= _90;
    end
    assign _1195 = { prog_wr_data,
                     pat_data_lo };
    assign _1189 = 4'b0101;
    assign _1190 = pat_data_idx == _1189;
    assign _1191 = pat_data_wr & _1190;
    assign _1196 = _1191 ? _1195 : _1194;
    assign _91 = _1196;
    always @(posedge _114) begin
        if (_123)
            _1194 <= _1010;
        else
            _1194 <= _91;
    end
    assign _1203 = { prog_wr_data,
                     pat_data_lo };
    assign _1197 = 4'b0100;
    assign _1198 = pat_data_idx == _1197;
    assign _1199 = pat_data_wr & _1198;
    assign _1204 = _1199 ? _1203 : _1202;
    assign _92 = _1204;
    always @(posedge _114) begin
        if (_123)
            _1202 <= _1010;
        else
            _1202 <= _92;
    end
    assign _1211 = { prog_wr_data,
                     pat_data_lo };
    assign _1205 = 4'b0011;
    assign _1206 = pat_data_idx == _1205;
    assign _1207 = pat_data_wr & _1206;
    assign _1212 = _1207 ? _1211 : _1210;
    assign _93 = _1212;
    always @(posedge _114) begin
        if (_123)
            _1210 <= _1010;
        else
            _1210 <= _93;
    end
    assign _1219 = { prog_wr_data,
                     pat_data_lo };
    assign _1213 = 4'b0010;
    assign _1214 = pat_data_idx == _1213;
    assign _1215 = pat_data_wr & _1214;
    assign _1220 = _1215 ? _1219 : _1218;
    assign _94 = _1220;
    always @(posedge _114) begin
        if (_123)
            _1218 <= _1010;
        else
            _1218 <= _94;
    end
    assign _1227 = { prog_wr_data,
                     pat_data_lo };
    assign _1222 = pat_data_idx == _1041;
    assign _1223 = pat_data_wr & _1222;
    assign _1228 = _1223 ? _1227 : _1226;
    assign _95 = _1228;
    always @(posedge _114) begin
        if (_123)
            _1226 <= _1010;
        else
            _1226 <= _95;
    end
    assign _1235 = _379 == _375;
    assign _1236 = _1235 ? prog_wr_data : pat_data_lo;
    assign _1237 = _1233 ? pat_data_lo : _1236;
    assign _1238 = _1231 ? _1237 : pat_data_lo;
    assign _1229 = _369 == _472;
    assign _1239 = _1229 ? _1238 : pat_data_lo;
    assign _1240 = _366 ? _1239 : pat_data_lo;
    assign _1241 = _361 ? _1240 : pat_data_lo;
    assign _1242 = _354 ? _1241 : pat_data_lo;
    assign _96 = _1242;
    always @(posedge _114) begin
        if (_123)
            pat_data_lo <= _1047;
        else
            pat_data_lo <= _96;
    end
    assign _1256 = { prog_wr_data,
                     pat_data_lo };
    assign _1233 = _379 == _474;
    assign _1244 = _1233 ? prog_wr_data : _1104;
    assign _1230 = 8'b00001100;
    assign _1231 = _374 == _1230;
    assign _1245 = _1231 ? _1244 : _1104;
    assign _1243 = _369 == _472;
    assign _1246 = _1243 ? _1245 : _1104;
    assign _1247 = _366 ? _1246 : _1104;
    assign _1248 = _361 ? _1247 : _1104;
    assign _1249 = _354 ? _1248 : _1104;
    assign _97 = _1249;
    always @(posedge _114) begin
        if (_123)
            _1104 <= _1047;
        else
            _1104 <= _97;
    end
    assign pat_data_idx = _1104[3:0];
    assign _1251 = pat_data_idx == _1068;
    assign _1099 = _374 == _1230;
    assign _638 = _364 == _1173;
    assign _639 = _354 & _638;
    assign _636 = _472 == _369;
    assign _640 = _636 & _639;
    assign _1100 = _640 & _1099;
    assign pat_data_wr = _1100 & _381;
    assign _1252 = pat_data_wr & _1251;
    assign _1257 = _1252 ? _1256 : _1255;
    assign _98 = _1257;
    always @(posedge _114) begin
        if (_123)
            _1255 <= _1010;
        else
            _1255 <= _98;
    end
    assign _1417 = _1286 + _1041;
    assign _1265 = _379 == _375;
    assign _1266 = _1265 ? prog_wr_data : pat_len;
    assign _1267 = _381 ? pat_len : _1266;
    assign _1268 = _1263 ? _1267 : pat_len;
    assign _1261 = _369 == _472;
    assign _1269 = _1261 ? _1268 : pat_len;
    assign _1270 = _366 ? _1269 : pat_len;
    assign _1271 = _361 ? _1270 : pat_len;
    assign _1272 = _354 ? _1271 : pat_len;
    assign _99 = _1272;
    always @(posedge _114) begin
        if (_123)
            pat_len <= _1047;
        else
            pat_len <= _99;
    end
    assign _1413 = pat_len - _337;
    assign _1414 = _1413[3:0];
    assign _1415 = _1286 == _1414;
    assign _1419 = _1415 ? _1068 : _1417;
    assign _1288 = _1287[15:8];
    assign _1291 = _1279 + _337;
    assign _1293 = _1289 ? _337 : _1291;
    assign _1295 = _1283 ? _337 : _1293;
    assign _1296 = _1276 ? _1295 : _1279;
    assign _100 = _1296;
    always @(posedge _114) begin
        if (_123)
            _1279 <= _1047;
        else
            _1279 <= _100;
    end
    assign _1289 = _1279 == _1288;
    assign _1420 = _1289 ? _1419 : _1286;
    assign _101 = _1276;
    always @(posedge _114) begin
        if (_123)
            _1282 <= _1085;
        else
            _1282 <= _101;
    end
    assign _1283 = ~ _1282;
    assign _1422 = _1283 ? _1068 : _1420;
    assign _1406 = _381 ? prog_wr_data : pat_ctrl;
    assign _1262 = 8'b00001011;
    assign _1297 = _369 == _619;
    assign _1298 = _1297 ? prog_wr_data : _374;
    assign _1299 = _366 ? _1298 : _374;
    assign _1300 = _361 ? _1299 : _374;
    assign _1301 = _354 ? _1300 : _374;
    assign _102 = _1301;
    always @(posedge _114) begin
        if (_123)
            _374 <= _1047;
        else
            _374 <= _102;
    end
    assign _1263 = _374 == _1262;
    assign _1407 = _1263 ? _1406 : pat_ctrl;
    assign _1081 = 2'b11;
    assign _1380 = _1346 ? _472 : _1372;
    assign _1381 = _1057 ? _1081 : _1380;
    assign _1056 = prog_wr_data == _1029;
    assign _1053 = prog_wr_data == _1060;
    assign _1051 = prog_wr_data == _1058;
    assign _1054 = _1051 | _1053;
    assign _1057 = _1054 | _1056;
    assign _1378 = ~ _1057;
    assign _1377 = ~ _1346;
    assign _1379 = _1377 & _1378;
    assign _1382 = _1379 ? _459 : _1381;
    assign _1358 = prog_wr_data == _482;
    assign _1355 = prog_wr_data == _375;
    assign _1353 = prog_wr_data == _337;
    assign _1356 = _1353 | _1355;
    assign _1359 = _1356 | _1358;
    assign _1362 = _1359 ? _375 : _337;
    assign _1350 = prog_wr_data == _1230;
    assign _1348 = prog_wr_data == _1262;
    assign _1351 = _1348 | _1350;
    assign _1364 = _1351 ? _474 : _1362;
    assign _1345 = prog_wr_data == _1230;
    assign _1342 = prog_wr_data == _1262;
    assign _1339 = prog_wr_data == _482;
    assign _1336 = prog_wr_data == _710;
    assign _1333 = prog_wr_data == _1014;
    assign _1330 = prog_wr_data == _499;
    assign _1327 = prog_wr_data == _474;
    assign _1324 = prog_wr_data == _375;
    assign new_shift = _116[2:2];
    assign _1302 = _386[6:0];
    assign _1303 = { _1302,
                     new_shift };
    assign _1304 = _361 ? _1303 : _386;
    assign _1305 = _354 ? _1304 : _386;
    assign _103 = _1305;
    always @(posedge _114) begin
        if (_123)
            _386 <= _1047;
        else
            _386 <= _103;
    end
    assign _387 = _386[6:0];
    assign prog_wr_data = { _387,
                            new_shift };
    assign _1322 = prog_wr_data == _337;
    assign _1325 = _1322 | _1324;
    assign _1328 = _1325 | _1327;
    assign _1331 = _1328 | _1330;
    assign _1334 = _1331 | _1333;
    assign _1337 = _1334 | _1336;
    assign _1340 = _1337 | _1339;
    assign _1343 = _1340 | _1342;
    assign _1346 = _1343 | _1345;
    assign _1365 = _1346 ? _1364 : _1315;
    assign _1319 = _379 - _337;
    assign _1317 = _369 == _472;
    assign _1320 = _1317 ? _1319 : _1315;
    assign _1316 = _369 == _619;
    assign _1366 = _1316 ? _1365 : _1320;
    assign _1367 = _366 ? _1366 : _1315;
    assign _1368 = _361 ? _1367 : _1315;
    assign _1313 = _1311 ? _1047 : _379;
    assign _1315 = _1310 ? _1047 : _1313;
    assign _1369 = _354 ? _1368 : _1315;
    assign _104 = _1369;
    always @(posedge _114) begin
        if (_123)
            _379 <= _1047;
        else
            _379 <= _104;
    end
    assign _381 = _379 == _337;
    assign _1375 = _381 ? _459 : _1372;
    assign _1374 = _369 == _472;
    assign _1376 = _1374 ? _1375 : _1372;
    assign _1373 = _369 == _619;
    assign _1383 = _1373 ? _1382 : _1376;
    assign _1384 = _366 ? _1383 : _1372;
    assign _1385 = _361 ? _1384 : _1372;
    assign _1370 = _1311 ? _619 : _369;
    assign _1372 = _1310 ? _459 : _1370;
    assign _1386 = _354 ? _1385 : _1372;
    assign _105 = _1386;
    always @(posedge _114) begin
        if (_123)
            _369 <= _459;
        else
            _369 <= _105;
    end
    assign _1405 = _369 == _472;
    assign _1408 = _1405 ? _1407 : pat_ctrl;
    assign _1392 = _364 + _1041;
    assign _1394 = _366 ? _1068 : _1392;
    assign _1395 = _361 ? _1394 : _1390;
    assign _1311 = _361 & _1308;
    assign _1388 = _1311 ? _1068 : _364;
    assign _106 = _360;
    always @(posedge _114) begin
        if (_123)
            _1308 <= _1085;
        else
            _1308 <= _106;
    end
    assign _1309 = ~ _1308;
    assign _1310 = _360 & _1309;
    assign _1390 = _1310 ? _1068 : _1388;
    assign _1396 = _354 ? _1395 : _1390;
    assign _107 = _1396;
    always @(posedge _114) begin
        if (_123)
            _364 <= _1068;
        else
            _364 <= _107;
    end
    assign _366 = _364 == _1173;
    assign _1409 = _366 ? _1408 : pat_ctrl;
    assign _1397 = _116[0:0];
    assign _108 = _1397;
    always @(posedge _114) begin
        if (_123)
            _1400 <= _1085;
        else
            _1400 <= _108;
    end
    assign _109 = _1400;
    always @(posedge _114) begin
        if (_123)
            _360 <= _1085;
        else
            _360 <= _109;
    end
    assign _361 = ~ _360;
    assign _1410 = _361 ? _1409 : pat_ctrl;
    assign _110 = _349;
    always @(posedge _114) begin
        if (_123)
            _352 <= _1085;
        else
            _352 <= _110;
    end
    assign _353 = ~ _352;
    assign vdd = 1'b1;
    assign _112 = rst_n;
    assign _123 = ~ _112;
    assign _114 = clk;
    assign _116 = ui_in;
    assign _1401 = _116[1:1];
    assign _117 = _1401;
    always @(posedge _114) begin
        if (_123)
            _1404 <= _1085;
        else
            _1404 <= _117;
    end
    assign _118 = _1404;
    always @(posedge _114) begin
        if (_123)
            _349 <= _1085;
        else
            _349 <= _118;
    end
    assign _354 = _349 & _353;
    assign _1411 = _354 ? _1410 : pat_ctrl;
    assign _119 = _1411;
    always @(posedge _114) begin
        if (_123)
            pat_ctrl <= _1047;
        else
            pat_ctrl <= _119;
    end
    assign _1276 = pat_ctrl[0:0];
    assign _1423 = _1276 ? _1422 : _1286;
    assign _120 = _1423;
    always @(posedge _114) begin
        if (_123)
            _1286 <= _1068;
        else
            _1286 <= _120;
    end
    always @* begin
        case (_1286)
        0:
            _1287 <= _1255;
        1:
            _1287 <= _1226;
        2:
            _1287 <= _1218;
        3:
            _1287 <= _1210;
        4:
            _1287 <= _1202;
        5:
            _1287 <= _1194;
        6:
            _1287 <= _1186;
        7:
            _1287 <= _1178;
        8:
            _1287 <= _1170;
        9:
            _1287 <= _1162;
        10:
            _1287 <= _1154;
        11:
            _1287 <= _1146;
        12:
            _1287 <= _1138;
        13:
            _1287 <= _1130;
        14:
            _1287 <= _1122;
        default:
            _1287 <= _1111;
        endcase
    end
    assign pat_pins = _1287[7:0];
    assign _1425 = pat_pins[7:2];
    assign _1431 = { _1425,
                     _1430 };
    assign prog_wr_addr = host_data_rd_addr_0;
    assign data_wr_addr = host_data_rd_addr_0;
    assign status = run;
    assign data_wr_data = prog_wr_data;
    assign fifo_rx_data = prog_wr_data;
    assign pat_data_hi = prog_wr_data;
    assign uo_out = _1431;
    assign uio_out = pins_out;
    assign uio_oe = _131;

endmodule
