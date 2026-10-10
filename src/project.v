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
    wire [1:0] _127;
    wire [3:0] _128;
    wire [7:0] _129;
    wire [7:0] _130;
    wire [7:0] _1041;
    wire _1079;
    wire [6:0] _1078;
    wire [7:0] _1080;
    wire _1076;
    wire _1077;
    wire [7:0] _1081;
    wire [7:0] core_data_out;
    wire [1:0] _1064;
    wire _1063;
    wire [2:0] _1065;
    wire [3:0] _1066;
    wire [3:0] _1062;
    wire [7:0] _1067;
    wire [7:0] _1059;
    wire [2:0] _259;
    wire _260;
    wire [7:0] _261;
    wire [7:0] _262;
    wire [7:0] _6;
    reg [7:0] _255;
    wire [2:0] _266;
    wire _267;
    wire [7:0] _268;
    wire [7:0] _269;
    wire [7:0] _7;
    reg [7:0] _265;
    wire [2:0] _273;
    wire _274;
    wire [7:0] _275;
    wire [7:0] _276;
    wire [7:0] _8;
    reg [7:0] _272;
    wire [2:0] _280;
    wire _281;
    wire [7:0] _282;
    wire [7:0] _283;
    wire [7:0] _9;
    reg [7:0] _279;
    wire [2:0] _287;
    wire _288;
    wire [7:0] _289;
    wire [7:0] _290;
    wire [7:0] _10;
    reg [7:0] _286;
    wire [2:0] _294;
    wire _295;
    wire [7:0] _296;
    wire [7:0] _297;
    wire [7:0] _11;
    reg [7:0] _293;
    wire [2:0] _301;
    wire _302;
    wire [7:0] _303;
    wire [7:0] _304;
    wire [7:0] _12;
    reg [7:0] _300;
    wire [7:0] core_tx_data;
    wire [2:0] _311;
    wire [2:0] _306;
    wire [2:0] _307;
    wire [2:0] _14;
    reg [2:0] _258;
    wire _312;
    wire [7:0] _313;
    wire [7:0] _314;
    wire [7:0] _15;
    reg [7:0] _310;
    wire [2:0] _323;
    wire [2:0] _324;
    wire [2:0] _16;
    reg [2:0] _321;
    reg [7:0] fifo_data;
    wire [7:0] tx_data;
    wire [3:0] _1035;
    wire [3:0] _1036;
    wire [3:0] _1033;
    wire _1030;
    wire _1031;
    wire [3:0] _1034;
    wire _251;
    wire [4:0] _1017;
    wire _1018;
    wire [7:0] _331;
    wire [7:0] _332;
    wire _329;
    wire [7:0] _333;
    wire [4:0] _326;
    wire _327;
    wire [7:0] _334;
    wire [7:0] _335;
    wire [7:0] _18;
    reg [7:0] _187;
    wire _188;
    wire [7:0] _182;
    wire _183;
    wire _176;
    wire _177;
    wire [3:0] _249;
    wire fifo_full;
    wire tx_full;
    wire _157;
    wire rx_empty;
    wire _155;
    wire _154;
    wire [4:0] _143;
    wire _144;
    wire _156;
    wire _142;
    wire _158;
    wire [4:0] _139;
    wire _140;
    wire _178;
    wire [4:0] _137;
    wire _138;
    wire _184;
    wire [15:0] _1014;
    wire [15:0] _1013;
    wire _376;
    wire [7:0] _369;
    wire _370;
    wire _377;
    wire [7:0] _384;
    wire _365;
    wire [7:0] _385;
    wire [7:0] _386;
    wire [7:0] _387;
    wire [7:0] _388;
    wire [7:0] _21;
    reg [7:0] _351;
    wire [15:0] _389;
    wire [15:0] host_prog_wr_data;
    wire [7:0] host_prog_wr_addr;
    wire [7:0] _438;
    wire [7:0] _439;
    wire [7:0] _440;
    wire [7:0] _24;
    reg [7:0] pc;
    wire _432;
    wire _433;
    wire [4:0] _427;
    wire _428;
    wire branch_taken;
    wire _424;
    wire [4:0] _422;
    wire _423;
    wire _425;
    wire [4:0] _418;
    wire _419;
    wire _420;
    wire _415;
    wire [4:0] _413;
    wire _414;
    wire _416;
    wire _410;
    wire [4:0] _408;
    wire _409;
    wire _411;
    wire _405;
    wire [4:0] _403;
    wire _404;
    wire _406;
    wire _993;
    wire _987;
    wire _986;
    wire _984;
    wire _983;
    reg _991;
    wire [1:0] _994;
    wire [5:0] _982;
    wire [7:0] _995;
    wire [2:0] _863;
    reg [7:0] reg_src;
    wire _441;
    wire _442;
    wire [7:0] _443;
    wire [7:0] _444;
    wire [7:0] _25;
    reg [7:0] _235;
    wire [4:0] _230;
    wire _231;
    wire [7:0] _232;
    wire _446;
    wire _447;
    wire _448;
    wire _26;
    reg _153;
    wire [7:0] _236;
    wire [7:0] host_data_rd_addr;
    wire _148;
    wire [4:0] _145;
    wire _146;
    wire _149;
    wire _150;
    wire [7:0] _237;
    wire [7:0] _458;
    wire [15:0] _455;
    wire [15:0] _449;
    wire [15:0] _450;
    wire [15:0] _451;
    wire [15:0] _28;
    reg [15:0] cyc;
    wire [15:0] _456;
    wire [7:0] _457;
    reg [7:0] _459;
    wire [7:0] cap_wr_data;
    wire [7:0] host_data_wr_data;
    wire [7:0] _224;
    wire [7:0] _225;
    wire [7:0] _488;
    wire [7:0] _490;
    wire [7:0] _485;
    wire [7:0] _487;
    wire [7:0] _468;
    wire [7:0] _469;
    wire [7:0] _470;
    wire [7:0] _471;
    wire [7:0] _31;
    reg [7:0] _465;
    wire [7:0] _478;
    wire [7:0] _479;
    wire _475;
    wire [7:0] _480;
    wire [7:0] _481;
    wire [7:0] _482;
    wire [7:0] _483;
    wire [7:0] _32;
    reg [7:0] cap_base;
    wire [7:0] _484;
    reg [7:0] _491;
    wire [7:0] cap_wr_addr;
    wire [7:0] _509;
    wire [7:0] _505;
    wire [7:0] _502;
    wire _501;
    wire [7:0] _503;
    wire _498;
    wire _499;
    wire [7:0] _506;
    wire _496;
    wire [7:0] _507;
    wire [7:0] _493;
    wire _494;
    wire [7:0] _510;
    wire _492;
    wire [7:0] _511;
    wire [7:0] _512;
    wire [7:0] _513;
    wire [7:0] _514;
    wire [7:0] _34;
    reg [7:0] host_data_rd_addr_0;
    wire [7:0] prog_wr_addr;
    wire [7:0] data_wr_addr;
    wire [7:0] host_data_wr_addr;
    wire [4:0] _200;
    wire _201;
    wire [7:0] _205;
    wire [7:0] _206;
    wire [7:0] _207;
    wire [1:0] _466;
    wire [1:0] _453;
    wire [1:0] _613;
    wire [1:0] _614;
    wire [1:0] _615;
    wire [1:0] _611;
    wire [1:0] _612;
    wire [1:0] _616;
    wire [1:0] _36;
    reg [1:0] _454;
    wire _467;
    wire _628;
    wire _624;
    wire _601;
    wire _602;
    wire _603;
    wire _604;
    wire _605;
    wire _606;
    wire _607;
    wire _596;
    wire _597;
    wire _595;
    wire _598;
    wire _593;
    wire _591;
    wire _592;
    wire _594;
    wire _599;
    wire _587;
    wire _588;
    wire _586;
    wire _589;
    wire _584;
    wire _582;
    wire _583;
    wire _585;
    wire _590;
    wire _578;
    wire _579;
    wire _577;
    wire _580;
    wire _575;
    wire _573;
    wire _574;
    wire _576;
    wire _581;
    wire _569;
    wire _570;
    wire _568;
    wire _571;
    wire _566;
    wire _564;
    wire _565;
    wire _567;
    wire _572;
    wire _560;
    wire _561;
    wire _559;
    wire _562;
    wire _557;
    wire _555;
    wire _556;
    wire _558;
    wire _563;
    wire _551;
    wire _552;
    wire _550;
    wire _553;
    wire _548;
    wire _546;
    wire _547;
    wire _549;
    wire _554;
    wire _542;
    wire _543;
    wire _541;
    wire _544;
    wire _539;
    wire _537;
    wire _538;
    wire _540;
    wire _545;
    wire _533;
    wire _534;
    wire _532;
    wire _535;
    wire [7:0] _37;
    reg [7:0] _529;
    wire _530;
    wire _525;
    wire _526;
    wire _531;
    wire _524;
    wire _536;
    wire [2:0] _523;
    reg _600;
    wire _522;
    wire _608;
    wire _521;
    wire _609;
    wire _625;
    wire _519;
    wire [7:0] _618;
    wire [7:0] _476;
    wire _477;
    wire [7:0] _619;
    wire _617;
    wire [7:0] _620;
    wire [7:0] _621;
    wire [7:0] _622;
    wire [7:0] _623;
    wire [7:0] _38;
    reg [7:0] cap_ctrl;
    wire _518;
    wire _520;
    wire _626;
    wire _629;
    wire _39;
    reg _462;
    wire cap_wr;
    wire _195;
    wire _196;
    wire [4:0] _190;
    wire _191;
    wire _192;
    wire _636;
    wire data_wr;
    wire host_data_wr;
    wire _193;
    wire _197;
    wire _198;
    wire [15:0] _244;
    wire [7:0] data_mem_host_rdata;
    wire [2:0] _858;
    reg pin_imm;
    wire [6:0] _857;
    wire [7:0] _860;
    wire _649;
    wire [7:0] _650;
    wire [7:0] _651;
    wire [7:0] _42;
    reg [7:0] _644;
    wire _656;
    wire [7:0] _657;
    wire [7:0] _658;
    wire [7:0] _43;
    reg [7:0] _654;
    wire _663;
    wire [7:0] _664;
    wire [7:0] _665;
    wire [7:0] _44;
    reg [7:0] _661;
    wire _670;
    wire [7:0] _671;
    wire [7:0] _672;
    wire [7:0] _45;
    reg [7:0] _668;
    wire _677;
    wire [7:0] _678;
    wire [7:0] _679;
    wire [7:0] _46;
    reg [7:0] _675;
    wire _684;
    wire [7:0] _685;
    wire [7:0] _686;
    wire [7:0] _47;
    reg [7:0] _682;
    wire _691;
    wire [7:0] _692;
    wire [7:0] _693;
    wire [7:0] _48;
    reg [7:0] _689;
    wire [7:0] host_rx_data;
    wire [2:0] _695;
    wire [2:0] _696;
    wire [2:0] _50;
    reg [2:0] _647;
    wire _701;
    wire [7:0] _702;
    wire [7:0] _703;
    wire [7:0] _51;
    reg [7:0] _699;
    wire [2:0] _728;
    wire [3:0] _719;
    wire [3:0] _716;
    wire _713;
    wire _714;
    wire [3:0] _717;
    wire _640;
    wire fifo_full_0;
    wire rx_full;
    wire _707;
    wire [7:0] _704;
    wire _705;
    wire _706;
    wire fifo_rx_push;
    wire host_rx_push;
    wire _641;
    wire _711;
    wire _712;
    wire [3:0] _720;
    wire [3:0] _54;
    reg [3:0] fifo_level;
    wire fifo_empty;
    wire _709;
    wire _722;
    wire fifo_rx_pop;
    wire core_rx_pop;
    wire _710;
    wire [2:0] _729;
    wire [2:0] _56;
    reg [2:0] _726;
    reg [7:0] fifo_data_0;
    wire [7:0] rx_data;
    wire [7:0] _853;
    wire [7:0] _852;
    wire [7:0] _851;
    wire [8:0] _848;
    wire [8:0] _849;
    wire [7:0] _850;
    wire [8:0] _844;
    wire [8:0] _842;
    wire [8:0] _845;
    wire [7:0] _846;
    wire [3:0] _828;
    wire [7:0] _829;
    wire [5:0] _824;
    wire [7:0] _825;
    wire [6:0] _820;
    wire [7:0] _821;
    wire _818;
    wire [7:0] _822;
    wire _817;
    wire [7:0] _826;
    wire _816;
    wire [7:0] _830;
    wire _815;
    wire [7:0] _832;
    wire _814;
    wire [7:0] _834;
    wire _813;
    wire [7:0] _836;
    wire _812;
    wire [7:0] _838;
    wire _811;
    wire [7:0] _840;
    wire [3:0] _797;
    wire [7:0] _799;
    wire [5:0] _793;
    wire [7:0] _795;
    wire [6:0] _789;
    wire [7:0] _791;
    wire _760;
    wire [7:0] _867;
    wire [7:0] _868;
    wire [7:0] _869;
    wire [7:0] _870;
    wire [7:0] _58;
    reg [7:0] _222;
    wire _872;
    wire [7:0] _873;
    wire [7:0] _874;
    wire [7:0] _875;
    wire [7:0] _876;
    wire [7:0] _59;
    reg [7:0] oe;
    wire [6:0] _946;
    wire [7:0] _947;
    wire [5:0] _944;
    wire _943;
    wire [7:0] _945;
    wire [4:0] _941;
    wire [1:0] _940;
    wire [7:0] _942;
    wire [3:0] _938;
    wire [2:0] _937;
    wire [7:0] _939;
    wire [2:0] _935;
    wire [3:0] _934;
    wire [7:0] _936;
    wire [1:0] _932;
    wire [4:0] _931;
    wire [7:0] _933;
    wire _929;
    wire [5:0] _928;
    wire [7:0] _930;
    wire _173;
    wire _172;
    wire _171;
    wire _170;
    wire _169;
    wire _168;
    wire _167;
    wire [7:0] _61;
    reg [7:0] _162;
    reg [7:0] pins_sync;
    wire _166;
    reg pin_arg;
    wire [6:0] _889;
    wire [7:0] _890;
    wire [6:0] _885;
    wire [7:0] _887;
    wire _882;
    wire [7:0] _883;
    wire [7:0] _884;
    wire [7:0] _888;
    wire [4:0] _877;
    wire _878;
    wire [7:0] _891;
    wire [7:0] _892;
    wire [7:0] _893;
    wire [7:0] _62;
    reg [7:0] _216;
    wire _926;
    wire [6:0] _925;
    wire [7:0] _927;
    reg [7:0] _948;
    wire [6:0] _921;
    wire [7:0] _922;
    wire [5:0] _919;
    wire _918;
    wire [7:0] _920;
    wire [4:0] _916;
    wire [1:0] _915;
    wire [7:0] _917;
    wire [3:0] _913;
    wire [2:0] _912;
    wire [7:0] _914;
    wire [2:0] _910;
    wire [3:0] _909;
    wire [7:0] _911;
    wire [1:0] _907;
    wire [4:0] _906;
    wire [7:0] _908;
    wire _904;
    wire [5:0] _903;
    wire [7:0] _905;
    wire _901;
    wire [6:0] _900;
    wire [7:0] _902;
    reg [7:0] _923;
    wire _897;
    wire [7:0] _898;
    wire [7:0] _899;
    wire [4:0] _894;
    wire _895;
    wire [7:0] _924;
    wire [4:0] _879;
    wire _880;
    wire [7:0] _949;
    wire [7:0] _950;
    wire [7:0] _951;
    wire [7:0] _63;
    reg [7:0] pins_out;
    wire _953;
    wire [7:0] _954;
    wire [7:0] _955;
    wire [7:0] _956;
    wire [7:0] _957;
    wire [7:0] _64;
    reg [7:0] _204;
    wire [7:0] _430;
    wire _961;
    wire [7:0] _962;
    wire [7:0] _963;
    wire _959;
    wire [7:0] _964;
    wire [7:0] _965;
    wire [7:0] _966;
    wire [7:0] _65;
    reg [7:0] _213;
    wire _970;
    wire [7:0] _967;
    wire _968;
    wire _969;
    wire reset_core;
    wire host_reset_core;
    wire _123;
    wire _973;
    wire [7:0] _974;
    wire [7:0] _975;
    wire [7:0] _976;
    wire [7:0] _977;
    wire [7:0] _67;
    reg [7:0] fifo_tx_data;
    reg [7:0] reg_val;
    wire _788;
    wire [7:0] _792;
    wire _787;
    wire [7:0] _796;
    wire _786;
    wire [7:0] _800;
    wire _785;
    wire [7:0] _802;
    wire _784;
    wire [7:0] _804;
    wire _783;
    wire [7:0] _806;
    wire _782;
    wire [7:0] _808;
    wire [7:0] imm;
    wire _778;
    wire [7:0] _780;
    wire _781;
    wire [7:0] _810;
    wire [2:0] _776;
    reg [7:0] alu_result;
    wire _775;
    wire [7:0] _855;
    wire [4:0] _772;
    wire _773;
    wire [7:0] _856;
    wire [4:0] _770;
    wire _771;
    wire [7:0] _861;
    wire _768;
    wire _766;
    wire _769;
    wire [7:0] _862;
    wire [4:0] _763;
    wire _764;
    wire [7:0] _865;
    wire [4:0] _761;
    wire _762;
    wire [7:0] reg_write_value;
    wire [2:0] arg;
    wire _979;
    wire [7:0] _980;
    wire _757;
    wire _754;
    wire _751;
    wire _748;
    wire _745;
    wire _734;
    wire _732;
    wire _735;
    wire _743;
    wire _746;
    wire _749;
    wire _752;
    wire _755;
    wire _758;
    wire [7:0] _981;
    wire [4:0] _739;
    wire _740;
    wire _741;
    wire [4:0] _736;
    wire _737;
    wire _738;
    wire _742;
    wire [7:0] _996;
    wire [7:0] _997;
    wire [7:0] _998;
    wire [7:0] _68;
    reg [7:0] _219;
    wire _400;
    wire [4:0] _398;
    wire _399;
    wire _401;
    wire [4:0] _396;
    wire _397;
    wire _402;
    wire _407;
    wire _412;
    wire _417;
    wire _421;
    wire _426;
    wire _435;
    wire [7:0] fetch_addr;
    wire [7:0] _999;
    wire [7:0] _69;
    wire host_run;
    wire _1004;
    wire _1005;
    wire _1003;
    wire _1006;
    wire _71;
    wire _1008;
    wire _1009;
    wire prog_wr;
    wire host_prog_wr;
    wire [15:0] _1016;
    wire [15:0] _73;
    wire [4:0] op;
    wire _136;
    wire advance;
    wire fifo_tx_push;
    wire core_tx_push;
    wire _252;
    wire _1028;
    wire _317;
    wire _1026;
    wire [7:0] _1023;
    wire _1024;
    wire _1021;
    wire _1022;
    wire _1025;
    wire fifo_tx_pop;
    wire host_tx_pop;
    wire _318;
    wire _1029;
    wire [3:0] _1037;
    wire [3:0] _76;
    reg [3:0] fifo_level_0;
    wire fifo_empty_0;
    wire tx_empty;
    wire [7:0] _1060;
    wire _1057;
    wire [7:0] _1061;
    wire [7:0] _1054;
    wire _1055;
    wire [7:0] _1068;
    wire [7:0] _1052;
    wire _1053;
    wire [7:0] _1069;
    wire [7:0] _1070;
    wire _1043;
    wire [7:0] _1071;
    wire [7:0] _1072;
    wire [7:0] _1073;
    wire [7:0] _1074;
    wire _1038;
    wire _1039;
    wire [7:0] _1082;
    wire [7:0] _78;
    reg [7:0] _1042;
    wire _1422;
    wire gnd;
    wire _1420;
    wire _1421;
    wire miso;
    wire _1086;
    wire _1085;
    wire _1087;
    wire _1083;
    wire _1088;
    wire _1089;
    wire _1090;
    wire _1091;
    wire _79;
    reg run;
    wire status;
    wire [1:0] _1424;
    wire [15:0] _1109;
    wire [3:0] _1100;
    wire _1101;
    wire _1102;
    wire [15:0] _1110;
    wire [15:0] _80;
    reg [15:0] _1105;
    wire [15:0] _1117;
    wire [3:0] _1111;
    wire _1112;
    wire _1113;
    wire [15:0] _1118;
    wire [15:0] _81;
    reg [15:0] _1116;
    wire [15:0] _1125;
    wire [3:0] _1119;
    wire _1120;
    wire _1121;
    wire [15:0] _1126;
    wire [15:0] _82;
    reg [15:0] _1124;
    wire [15:0] _1133;
    wire [3:0] _1127;
    wire _1128;
    wire _1129;
    wire [15:0] _1134;
    wire [15:0] _83;
    reg [15:0] _1132;
    wire [15:0] _1141;
    wire [3:0] _1135;
    wire _1136;
    wire _1137;
    wire [15:0] _1142;
    wire [15:0] _84;
    reg [15:0] _1140;
    wire [15:0] _1149;
    wire [3:0] _1143;
    wire _1144;
    wire _1145;
    wire [15:0] _1150;
    wire [15:0] _85;
    reg [15:0] _1148;
    wire [15:0] _1157;
    wire [3:0] _1151;
    wire _1152;
    wire _1153;
    wire [15:0] _1158;
    wire [15:0] _86;
    reg [15:0] _1156;
    wire [15:0] _1165;
    wire _1160;
    wire _1161;
    wire [15:0] _1166;
    wire [15:0] _87;
    reg [15:0] _1164;
    wire [15:0] _1173;
    wire [3:0] _1167;
    wire _1168;
    wire _1169;
    wire [15:0] _1174;
    wire [15:0] _88;
    reg [15:0] _1172;
    wire [15:0] _1181;
    wire [3:0] _1175;
    wire _1176;
    wire _1177;
    wire [15:0] _1182;
    wire [15:0] _89;
    reg [15:0] _1180;
    wire [15:0] _1189;
    wire [3:0] _1183;
    wire _1184;
    wire _1185;
    wire [15:0] _1190;
    wire [15:0] _90;
    reg [15:0] _1188;
    wire [15:0] _1197;
    wire [3:0] _1191;
    wire _1192;
    wire _1193;
    wire [15:0] _1198;
    wire [15:0] _91;
    reg [15:0] _1196;
    wire [15:0] _1205;
    wire [3:0] _1199;
    wire _1200;
    wire _1201;
    wire [15:0] _1206;
    wire [15:0] _92;
    reg [15:0] _1204;
    wire [15:0] _1213;
    wire [3:0] _1207;
    wire _1208;
    wire _1209;
    wire [15:0] _1214;
    wire [15:0] _93;
    reg [15:0] _1212;
    wire [15:0] _1221;
    wire _1216;
    wire _1217;
    wire [15:0] _1222;
    wire [15:0] _94;
    reg [15:0] _1220;
    wire _1229;
    wire [7:0] _1230;
    wire [7:0] _1231;
    wire [7:0] _1232;
    wire _1223;
    wire [7:0] _1233;
    wire [7:0] _1234;
    wire [7:0] _1235;
    wire [7:0] _1236;
    wire [7:0] _95;
    reg [7:0] pat_data_lo;
    wire [15:0] _1250;
    wire _1227;
    wire [7:0] _1238;
    wire [7:0] _1224;
    wire _1225;
    wire [7:0] _1239;
    wire _1237;
    wire [7:0] _1240;
    wire [7:0] _1241;
    wire [7:0] _1242;
    wire [7:0] _1243;
    wire [7:0] _96;
    reg [7:0] _1098;
    wire [3:0] pat_data_idx;
    wire _1245;
    wire _1093;
    wire _632;
    wire _633;
    wire _630;
    wire _634;
    wire _1094;
    wire pat_data_wr;
    wire _1246;
    wire [15:0] _1251;
    wire [15:0] _97;
    reg [15:0] _1249;
    wire [3:0] _1411;
    wire _1259;
    wire [7:0] _1260;
    wire [7:0] _1261;
    wire [7:0] _1262;
    wire _1255;
    wire [7:0] _1263;
    wire [7:0] _1264;
    wire [7:0] _1265;
    wire [7:0] _1266;
    wire [7:0] _98;
    reg [7:0] pat_len;
    wire [7:0] _1407;
    wire [3:0] _1408;
    wire _1409;
    wire [3:0] _1413;
    wire [7:0] _1282;
    wire [7:0] _1285;
    wire [7:0] _1287;
    wire [7:0] _1289;
    wire [7:0] _1290;
    wire [7:0] _99;
    reg [7:0] _1273;
    wire _1283;
    wire [3:0] _1414;
    wire _100;
    reg _1276;
    wire _1277;
    wire [3:0] _1416;
    wire [7:0] _1400;
    wire [7:0] _1256;
    wire _1291;
    wire [7:0] _1292;
    wire [7:0] _1293;
    wire [7:0] _1294;
    wire [7:0] _1295;
    wire [7:0] _101;
    reg [7:0] _368;
    wire _1257;
    wire [7:0] _1401;
    wire [1:0] _1075;
    wire [1:0] _1374;
    wire [1:0] _1375;
    wire _1050;
    wire _1047;
    wire _1045;
    wire _1048;
    wire _1051;
    wire _1372;
    wire _1371;
    wire _1373;
    wire [1:0] _1376;
    wire _1352;
    wire _1349;
    wire _1347;
    wire _1350;
    wire _1353;
    wire [7:0] _1356;
    wire _1344;
    wire _1342;
    wire _1345;
    wire [7:0] _1358;
    wire _1339;
    wire _1336;
    wire _1333;
    wire _1330;
    wire _1327;
    wire _1324;
    wire _1321;
    wire _1318;
    wire new_shift;
    wire [6:0] _1296;
    wire [7:0] _1297;
    wire [7:0] _1298;
    wire [7:0] _1299;
    wire [7:0] _102;
    reg [7:0] _380;
    wire [6:0] _381;
    wire [7:0] prog_wr_data;
    wire [7:0] data_wr_data;
    wire [7:0] fifo_rx_data;
    wire [7:0] pat_data_hi;
    wire _1316;
    wire _1319;
    wire _1322;
    wire _1325;
    wire _1328;
    wire _1331;
    wire _1334;
    wire _1337;
    wire _1340;
    wire [7:0] _1359;
    wire [7:0] _1313;
    wire _1311;
    wire [7:0] _1314;
    wire _1310;
    wire [7:0] _1360;
    wire [7:0] _1361;
    wire [7:0] _1362;
    wire [7:0] _1307;
    wire [7:0] _1309;
    wire [7:0] _1363;
    wire [7:0] _103;
    reg [7:0] _373;
    wire _375;
    wire [1:0] _1369;
    wire _1368;
    wire [1:0] _1370;
    wire _1367;
    wire [1:0] _1377;
    wire [1:0] _1378;
    wire [1:0] _1379;
    wire [1:0] _1364;
    wire [1:0] _1366;
    wire [1:0] _1380;
    wire [1:0] _104;
    reg [1:0] _363;
    wire _1399;
    wire [7:0] _1402;
    wire [3:0] _1386;
    wire [3:0] _1388;
    wire [3:0] _1389;
    wire _1305;
    wire [3:0] _1382;
    wire _105;
    reg _1302;
    wire _1303;
    wire _1304;
    wire [3:0] _1384;
    wire [3:0] _1390;
    wire [3:0] _106;
    reg [3:0] _358;
    wire _360;
    wire [7:0] _1403;
    wire _1391;
    wire _107;
    reg _1394;
    wire _108;
    reg _354;
    wire _355;
    wire [7:0] _1404;
    wire _109;
    reg _346;
    wire _347;
    wire vdd;
    wire _111;
    wire _122;
    wire _113;
    wire [7:0] _115;
    wire _1395;
    wire _116;
    reg _1398;
    wire _117;
    reg _343;
    wire _348;
    wire [7:0] _1405;
    wire [7:0] _118;
    reg [7:0] pat_ctrl;
    wire _1270;
    wire [3:0] _1417;
    wire [3:0] _119;
    reg [3:0] _1280;
    reg [15:0] _1281;
    wire [7:0] pat_pins;
    wire [5:0] _1419;
    wire [7:0] _1425;
    assign _2 = ena;
    assign _127 = { _2,
                    _2 };
    assign _128 = { _127,
                    _127 };
    assign _129 = { _128,
                    _128 };
    assign _130 = oe & _129;
    assign _1041 = 8'b00000000;
    assign _1079 = 1'b0;
    assign _1078 = _1042[6:0];
    assign _1080 = { _1078,
                     _1079 };
    assign _1076 = _1075 == _363;
    assign _1077 = _355 & _1076;
    assign _1081 = _1077 ? _1080 : _1074;
    assign core_data_out = data_mem_host_rdata;
    assign _1064 = { vdd,
                     run };
    assign _1063 = ~ tx_empty;
    assign _1065 = { _1063,
                     _1064 };
    assign _1066 = { rx_full,
                     _1065 };
    assign _1062 = 4'b0000;
    assign _1067 = { _1062,
                     _1066 };
    assign _1059 = 8'b11111111;
    assign _259 = 3'b111;
    assign _260 = _258 == _259;
    assign _261 = _260 ? core_tx_data : _255;
    assign _262 = _252 ? _261 : _255;
    assign _6 = _262;
    always @(posedge _113) begin
        if (_122)
            _255 <= _1041;
        else
            _255 <= _6;
    end
    assign _266 = 3'b110;
    assign _267 = _258 == _266;
    assign _268 = _267 ? core_tx_data : _265;
    assign _269 = _252 ? _268 : _265;
    assign _7 = _269;
    always @(posedge _113) begin
        if (_122)
            _265 <= _1041;
        else
            _265 <= _7;
    end
    assign _273 = 3'b101;
    assign _274 = _258 == _273;
    assign _275 = _274 ? core_tx_data : _272;
    assign _276 = _252 ? _275 : _272;
    assign _8 = _276;
    always @(posedge _113) begin
        if (_122)
            _272 <= _1041;
        else
            _272 <= _8;
    end
    assign _280 = 3'b100;
    assign _281 = _258 == _280;
    assign _282 = _281 ? core_tx_data : _279;
    assign _283 = _252 ? _282 : _279;
    assign _9 = _283;
    always @(posedge _113) begin
        if (_122)
            _279 <= _1041;
        else
            _279 <= _9;
    end
    assign _287 = 3'b011;
    assign _288 = _258 == _287;
    assign _289 = _288 ? core_tx_data : _286;
    assign _290 = _252 ? _289 : _286;
    assign _10 = _290;
    always @(posedge _113) begin
        if (_122)
            _286 <= _1041;
        else
            _286 <= _10;
    end
    assign _294 = 3'b010;
    assign _295 = _258 == _294;
    assign _296 = _295 ? core_tx_data : _293;
    assign _297 = _252 ? _296 : _293;
    assign _11 = _297;
    always @(posedge _113) begin
        if (_122)
            _293 <= _1041;
        else
            _293 <= _11;
    end
    assign _301 = 3'b001;
    assign _302 = _258 == _301;
    assign _303 = _302 ? core_tx_data : _300;
    assign _304 = _252 ? _303 : _300;
    assign _12 = _304;
    always @(posedge _113) begin
        if (_122)
            _300 <= _1041;
        else
            _300 <= _12;
    end
    assign core_tx_data = fifo_tx_data;
    assign _311 = 3'b000;
    assign _306 = _258 + _301;
    assign _307 = _252 ? _306 : _258;
    assign _14 = _307;
    always @(posedge _113) begin
        if (_122)
            _258 <= _311;
        else
            _258 <= _14;
    end
    assign _312 = _258 == _311;
    assign _313 = _312 ? core_tx_data : _310;
    assign _314 = _252 ? _313 : _310;
    assign _15 = _314;
    always @(posedge _113) begin
        if (_122)
            _310 <= _1041;
        else
            _310 <= _15;
    end
    assign _323 = _321 + _301;
    assign _324 = _318 ? _323 : _321;
    assign _16 = _324;
    always @(posedge _113) begin
        if (_122)
            _321 <= _311;
        else
            _321 <= _16;
    end
    always @* begin
        case (_321)
        0:
            fifo_data <= _310;
        1:
            fifo_data <= _300;
        2:
            fifo_data <= _293;
        3:
            fifo_data <= _286;
        4:
            fifo_data <= _279;
        5:
            fifo_data <= _272;
        6:
            fifo_data <= _265;
        default:
            fifo_data <= _255;
        endcase
    end
    assign tx_data = fifo_data;
    assign _1035 = 4'b0001;
    assign _1036 = fifo_level_0 - _1035;
    assign _1033 = fifo_level_0 + _1035;
    assign _1030 = ~ _318;
    assign _1031 = _252 & _1030;
    assign _1034 = _1031 ? _1033 : fifo_level_0;
    assign _251 = ~ fifo_full;
    assign _1017 = 5'b11100;
    assign _1018 = op == _1017;
    assign _331 = 8'b00000001;
    assign _332 = _187 + _331;
    assign _329 = _187 < imm;
    assign _333 = _329 ? _332 : _1041;
    assign _326 = 5'b01101;
    assign _327 = op == _326;
    assign _334 = _327 ? _333 : _1041;
    assign _335 = host_run ? _334 : _187;
    assign _18 = _335;
    always @(posedge _113) begin
        if (_123)
            _187 <= _1041;
        else
            _187 <= _18;
    end
    assign _188 = _187 == imm;
    assign _182 = cyc[7:0];
    assign _183 = _182 == imm;
    assign _176 = imm[0:0];
    assign _177 = pin_arg == _176;
    assign _249 = 4'b1000;
    assign fifo_full = fifo_level_0 == _249;
    assign tx_full = fifo_full;
    assign _157 = ~ tx_full;
    assign rx_empty = fifo_empty;
    assign _155 = ~ rx_empty;
    assign _154 = _150 ? _153 : vdd;
    assign _143 = 5'b11101;
    assign _144 = op == _143;
    assign _156 = _144 ? _155 : _154;
    assign _142 = op == _1017;
    assign _158 = _142 ? _157 : _156;
    assign _139 = 5'b01111;
    assign _140 = op == _139;
    assign _178 = _140 ? _177 : _158;
    assign _137 = 5'b01110;
    assign _138 = op == _137;
    assign _184 = _138 ? _183 : _178;
    assign _1014 = 16'b1111111111111111;
    assign _1013 = 16'b0000000000000000;
    assign _376 = ~ _375;
    assign _369 = 8'b00000010;
    assign _370 = _368 == _369;
    assign _377 = _370 & _376;
    assign _384 = _377 ? prog_wr_data : _351;
    assign _365 = _363 == _466;
    assign _385 = _365 ? _384 : _351;
    assign _386 = _360 ? _385 : _351;
    assign _387 = _355 ? _386 : _351;
    assign _388 = _348 ? _387 : _351;
    assign _21 = _388;
    always @(posedge _113) begin
        if (_122)
            _351 <= _1041;
        else
            _351 <= _21;
    end
    assign _389 = { _351,
                    prog_wr_data };
    assign host_prog_wr_data = _389;
    assign host_prog_wr_addr = host_data_rd_addr_0;
    assign _438 = fetch_addr + _331;
    assign _439 = advance ? _438 : pc;
    assign _440 = host_run ? _439 : pc;
    assign _24 = _440;
    always @(posedge _113) begin
        if (_123)
            pc <= _1041;
        else
            pc <= _24;
    end
    assign _432 = _430 == _1041;
    assign _433 = ~ _432;
    assign _427 = 5'b10111;
    assign _428 = op == _427;
    assign branch_taken = _428 & _433;
    assign _424 = ~ pin_arg;
    assign _422 = 5'b10110;
    assign _423 = op == _422;
    assign _425 = _423 & _424;
    assign _418 = 5'b10101;
    assign _419 = op == _418;
    assign _420 = _419 & pin_arg;
    assign _415 = ~ _410;
    assign _413 = 5'b10100;
    assign _414 = op == _413;
    assign _416 = _414 & _415;
    assign _410 = _219[1:1];
    assign _408 = 5'b10011;
    assign _409 = op == _408;
    assign _411 = _409 & _410;
    assign _405 = ~ _400;
    assign _403 = 5'b10010;
    assign _404 = op == _403;
    assign _406 = _404 & _405;
    assign _993 = alu_result == _1041;
    assign _987 = _849[8:8];
    assign _986 = _845[8:8];
    assign _984 = reg_val[0:0];
    assign _983 = reg_val[7:7];
    always @* begin
        case (_776)
        0:
            _991 <= _983;
        1:
            _991 <= _984;
        2:
            _991 <= _1079;
        3:
            _991 <= _986;
        4:
            _991 <= _987;
        5:
            _991 <= _1079;
        6:
            _991 <= _1079;
        default:
            _991 <= _1079;
        endcase
    end
    assign _994 = { _991,
                    _993 };
    assign _982 = 6'b000000;
    assign _995 = { _982,
                    _994 };
    assign _863 = imm[2:0];
    always @* begin
        case (_863)
        0:
            reg_src <= fifo_tx_data;
        1:
            reg_src <= _213;
        2:
            reg_src <= _204;
        3:
            reg_src <= pins_out;
        4:
            reg_src <= oe;
        5:
            reg_src <= _216;
        6:
            reg_src <= _219;
        default:
            reg_src <= _222;
        endcase
    end
    assign _441 = ~ _153;
    assign _442 = _150 & _441;
    assign _443 = _442 ? _232 : _235;
    assign _444 = host_run ? _443 : _235;
    assign _25 = _444;
    always @(posedge _113) begin
        if (_123)
            _235 <= _1041;
        else
            _235 <= _25;
    end
    assign _230 = 5'b01010;
    assign _231 = op == _230;
    assign _232 = _231 ? _204 : imm;
    assign _446 = ~ _153;
    assign _447 = _150 ? _446 : _1079;
    assign _448 = host_run ? _447 : _153;
    assign _26 = _448;
    always @(posedge _113) begin
        if (_123)
            _153 <= _1079;
        else
            _153 <= _26;
    end
    assign _236 = _153 ? _235 : _232;
    assign host_data_rd_addr = host_data_rd_addr_0;
    assign _148 = op == _230;
    assign _145 = 5'b11110;
    assign _146 = op == _145;
    assign _149 = _146 | _148;
    assign _150 = _149 & host_run;
    assign _237 = _150 ? _236 : host_data_rd_addr;
    assign _458 = _456[15:8];
    assign _455 = 16'b0000000000000010;
    assign _449 = 16'b0000000000000001;
    assign _450 = cyc + _449;
    assign _451 = host_run ? _450 : cyc;
    assign _28 = _451;
    always @(posedge _113) begin
        if (_123)
            cyc <= _1013;
        else
            cyc <= _28;
    end
    assign _456 = cyc - _455;
    assign _457 = _456[7:0];
    always @* begin
        case (_454)
        0:
            _459 <= pins_sync;
        1:
            _459 <= _457;
        default:
            _459 <= _458;
        endcase
    end
    assign cap_wr_data = _459;
    assign host_data_wr_data = prog_wr_data;
    assign _224 = host_data_wr ? host_data_wr_data : reg_val;
    assign _225 = cap_wr ? cap_wr_data : _224;
    assign _488 = cap_base + _465;
    assign _490 = _488 + _369;
    assign _485 = cap_base + _465;
    assign _487 = _485 + _331;
    assign _468 = 8'b00000011;
    assign _469 = _465 + _468;
    assign _470 = _467 ? _469 : _465;
    assign _471 = _462 ? _470 : _465;
    assign _31 = _471;
    always @(posedge _113) begin
        if (_122)
            _465 <= _1041;
        else
            _465 <= _31;
    end
    assign _478 = _375 ? cap_base : prog_wr_data;
    assign _479 = _477 ? _478 : cap_base;
    assign _475 = _363 == _466;
    assign _480 = _475 ? _479 : cap_base;
    assign _481 = _360 ? _480 : cap_base;
    assign _482 = _355 ? _481 : cap_base;
    assign _483 = _348 ? _482 : cap_base;
    assign _32 = _483;
    always @(posedge _113) begin
        if (_122)
            cap_base <= _1041;
        else
            cap_base <= _32;
    end
    assign _484 = cap_base + _465;
    always @* begin
        case (_454)
        0:
            _491 <= _484;
        1:
            _491 <= _487;
        default:
            _491 <= _490;
        endcase
    end
    assign cap_wr_addr = _491;
    assign _509 = host_data_rd_addr_0 + _331;
    assign _505 = host_data_rd_addr_0 + _331;
    assign _502 = _375 ? prog_wr_data : host_data_rd_addr_0;
    assign _501 = _368 == _331;
    assign _503 = _501 ? _502 : host_data_rd_addr_0;
    assign _498 = _368 == _369;
    assign _499 = _498 & _375;
    assign _506 = _499 ? _505 : _503;
    assign _496 = _368 == _468;
    assign _507 = _496 ? prog_wr_data : _506;
    assign _493 = 8'b00000100;
    assign _494 = _368 == _493;
    assign _510 = _494 ? _509 : _507;
    assign _492 = _363 == _466;
    assign _511 = _492 ? _510 : host_data_rd_addr_0;
    assign _512 = _360 ? _511 : host_data_rd_addr_0;
    assign _513 = _355 ? _512 : host_data_rd_addr_0;
    assign _514 = _348 ? _513 : host_data_rd_addr_0;
    assign _34 = _514;
    always @(posedge _113) begin
        if (_122)
            host_data_rd_addr_0 <= _1041;
        else
            host_data_rd_addr_0 <= _34;
    end
    assign host_data_wr_addr = host_data_rd_addr_0;
    assign _200 = 5'b01011;
    assign _201 = op == _200;
    assign _205 = _201 ? _204 : imm;
    assign _206 = host_data_wr ? host_data_wr_addr : _205;
    assign _207 = cap_wr ? cap_wr_addr : _206;
    assign _466 = 2'b10;
    assign _453 = 2'b00;
    assign _613 = 2'b01;
    assign _614 = _454 + _613;
    assign _615 = _467 ? _612 : _614;
    assign _611 = _609 ? _453 : _454;
    assign _612 = _520 ? _611 : _454;
    assign _616 = _462 ? _615 : _612;
    assign _36 = _616;
    always @(posedge _113) begin
        if (_122)
            _454 <= _453;
        else
            _454 <= _36;
    end
    assign _467 = _454 == _466;
    assign _628 = _467 ? _1079 : _626;
    assign _624 = 1'b1;
    assign _601 = _536 | _545;
    assign _602 = _601 | _554;
    assign _603 = _602 | _563;
    assign _604 = _603 | _572;
    assign _605 = _604 | _581;
    assign _606 = _605 | _590;
    assign _607 = _606 | _599;
    assign _596 = _529[7:7];
    assign _597 = ~ _596;
    assign _595 = pins_sync[7:7];
    assign _598 = _595 & _597;
    assign _593 = _529[7:7];
    assign _591 = pins_sync[7:7];
    assign _592 = ~ _591;
    assign _594 = _592 & _593;
    assign _599 = _524 ? _598 : _594;
    assign _587 = _529[6:6];
    assign _588 = ~ _587;
    assign _586 = pins_sync[6:6];
    assign _589 = _586 & _588;
    assign _584 = _529[6:6];
    assign _582 = pins_sync[6:6];
    assign _583 = ~ _582;
    assign _585 = _583 & _584;
    assign _590 = _524 ? _589 : _585;
    assign _578 = _529[5:5];
    assign _579 = ~ _578;
    assign _577 = pins_sync[5:5];
    assign _580 = _577 & _579;
    assign _575 = _529[5:5];
    assign _573 = pins_sync[5:5];
    assign _574 = ~ _573;
    assign _576 = _574 & _575;
    assign _581 = _524 ? _580 : _576;
    assign _569 = _529[4:4];
    assign _570 = ~ _569;
    assign _568 = pins_sync[4:4];
    assign _571 = _568 & _570;
    assign _566 = _529[4:4];
    assign _564 = pins_sync[4:4];
    assign _565 = ~ _564;
    assign _567 = _565 & _566;
    assign _572 = _524 ? _571 : _567;
    assign _560 = _529[3:3];
    assign _561 = ~ _560;
    assign _559 = pins_sync[3:3];
    assign _562 = _559 & _561;
    assign _557 = _529[3:3];
    assign _555 = pins_sync[3:3];
    assign _556 = ~ _555;
    assign _558 = _556 & _557;
    assign _563 = _524 ? _562 : _558;
    assign _551 = _529[2:2];
    assign _552 = ~ _551;
    assign _550 = pins_sync[2:2];
    assign _553 = _550 & _552;
    assign _548 = _529[2:2];
    assign _546 = pins_sync[2:2];
    assign _547 = ~ _546;
    assign _549 = _547 & _548;
    assign _554 = _524 ? _553 : _549;
    assign _542 = _529[1:1];
    assign _543 = ~ _542;
    assign _541 = pins_sync[1:1];
    assign _544 = _541 & _543;
    assign _539 = _529[1:1];
    assign _537 = pins_sync[1:1];
    assign _538 = ~ _537;
    assign _540 = _538 & _539;
    assign _545 = _524 ? _544 : _540;
    assign _533 = _529[0:0];
    assign _534 = ~ _533;
    assign _532 = pins_sync[0:0];
    assign _535 = _532 & _534;
    assign _37 = pins_sync;
    always @(posedge _113) begin
        if (_122)
            _529 <= _1041;
        else
            _529 <= _37;
    end
    assign _530 = _529[0:0];
    assign _525 = pins_sync[0:0];
    assign _526 = ~ _525;
    assign _531 = _526 & _530;
    assign _524 = cap_ctrl[1:1];
    assign _536 = _524 ? _535 : _531;
    assign _523 = cap_ctrl[4:2];
    always @* begin
        case (_523)
        0:
            _600 <= _536;
        1:
            _600 <= _545;
        2:
            _600 <= _554;
        3:
            _600 <= _563;
        4:
            _600 <= _572;
        5:
            _600 <= _581;
        6:
            _600 <= _590;
        default:
            _600 <= _599;
        endcase
    end
    assign _522 = cap_ctrl[5:5];
    assign _608 = _522 ? _607 : _600;
    assign _521 = _518 & _519;
    assign _609 = _521 & _608;
    assign _625 = _609 ? _624 : _462;
    assign _519 = ~ _462;
    assign _618 = _375 ? prog_wr_data : cap_ctrl;
    assign _476 = 8'b00001010;
    assign _477 = _368 == _476;
    assign _619 = _477 ? _618 : cap_ctrl;
    assign _617 = _363 == _466;
    assign _620 = _617 ? _619 : cap_ctrl;
    assign _621 = _360 ? _620 : cap_ctrl;
    assign _622 = _355 ? _621 : cap_ctrl;
    assign _623 = _348 ? _622 : cap_ctrl;
    assign _38 = _623;
    always @(posedge _113) begin
        if (_122)
            cap_ctrl <= _1041;
        else
            cap_ctrl <= _38;
    end
    assign _518 = cap_ctrl[0:0];
    assign _520 = _518 & _519;
    assign _626 = _520 ? _625 : _462;
    assign _629 = _462 ? _628 : _626;
    assign _39 = _629;
    always @(posedge _113) begin
        if (_122)
            _462 <= _1079;
        else
            _462 <= _39;
    end
    assign cap_wr = _462;
    assign _195 = op == _200;
    assign _196 = advance & _195;
    assign _190 = 5'b11111;
    assign _191 = op == _190;
    assign _192 = advance & _191;
    assign _636 = _368 == _493;
    assign data_wr = _634 & _636;
    assign host_data_wr = data_wr;
    assign _193 = host_data_wr | _192;
    assign _197 = _193 | _196;
    assign _198 = _197 | cap_wr;
    RM_IHPSG13_2P_256x8_c2_bm_bist
        the_RM_IHPSG13_2P_256x8_c2_bm_bist
        ( .A_CLK(_113),
          .A_MEN(vdd),
          .A_WEN(_198),
          .A_REN(gnd),
          .A_ADDR(_207),
          .A_DIN(_225),
          .A_DLY(gnd),
          .A_BM(_1059),
          .A_BIST_CLK(gnd),
          .A_BIST_EN(gnd),
          .A_BIST_MEN(gnd),
          .A_BIST_WEN(gnd),
          .A_BIST_REN(gnd),
          .A_BIST_ADDR(_1041),
          .A_BIST_DIN(_1041),
          .A_BIST_BM(_1059),
          .B_CLK(_113),
          .B_MEN(vdd),
          .B_WEN(gnd),
          .B_REN(vdd),
          .B_ADDR(_237),
          .B_DIN(_1041),
          .B_DLY(gnd),
          .B_BM(_1059),
          .B_BIST_CLK(gnd),
          .B_BIST_EN(gnd),
          .B_BIST_MEN(gnd),
          .B_BIST_WEN(gnd),
          .B_BIST_REN(gnd),
          .B_BIST_ADDR(_1041),
          .B_BIST_DIN(_1041),
          .B_BIST_BM(_1059),
          .B_DOUT(_244[15:8]),
          .A_DOUT(_244[7:0]) );
    assign data_mem_host_rdata = _244[15:8];
    assign _858 = imm[2:0];
    always @* begin
        case (_858)
        0:
            pin_imm <= _166;
        1:
            pin_imm <= _167;
        2:
            pin_imm <= _168;
        3:
            pin_imm <= _169;
        4:
            pin_imm <= _170;
        5:
            pin_imm <= _171;
        6:
            pin_imm <= _172;
        default:
            pin_imm <= _173;
        endcase
    end
    assign _857 = 7'b0000000;
    assign _860 = { _857,
                    pin_imm };
    assign _649 = _647 == _259;
    assign _650 = _649 ? host_rx_data : _644;
    assign _651 = _641 ? _650 : _644;
    assign _42 = _651;
    always @(posedge _113) begin
        if (_122)
            _644 <= _1041;
        else
            _644 <= _42;
    end
    assign _656 = _647 == _266;
    assign _657 = _656 ? host_rx_data : _654;
    assign _658 = _641 ? _657 : _654;
    assign _43 = _658;
    always @(posedge _113) begin
        if (_122)
            _654 <= _1041;
        else
            _654 <= _43;
    end
    assign _663 = _647 == _273;
    assign _664 = _663 ? host_rx_data : _661;
    assign _665 = _641 ? _664 : _661;
    assign _44 = _665;
    always @(posedge _113) begin
        if (_122)
            _661 <= _1041;
        else
            _661 <= _44;
    end
    assign _670 = _647 == _280;
    assign _671 = _670 ? host_rx_data : _668;
    assign _672 = _641 ? _671 : _668;
    assign _45 = _672;
    always @(posedge _113) begin
        if (_122)
            _668 <= _1041;
        else
            _668 <= _45;
    end
    assign _677 = _647 == _287;
    assign _678 = _677 ? host_rx_data : _675;
    assign _679 = _641 ? _678 : _675;
    assign _46 = _679;
    always @(posedge _113) begin
        if (_122)
            _675 <= _1041;
        else
            _675 <= _46;
    end
    assign _684 = _647 == _294;
    assign _685 = _684 ? host_rx_data : _682;
    assign _686 = _641 ? _685 : _682;
    assign _47 = _686;
    always @(posedge _113) begin
        if (_122)
            _682 <= _1041;
        else
            _682 <= _47;
    end
    assign _691 = _647 == _301;
    assign _692 = _691 ? host_rx_data : _689;
    assign _693 = _641 ? _692 : _689;
    assign _48 = _693;
    always @(posedge _113) begin
        if (_122)
            _689 <= _1041;
        else
            _689 <= _48;
    end
    assign host_rx_data = prog_wr_data;
    assign _695 = _647 + _301;
    assign _696 = _641 ? _695 : _647;
    assign _50 = _696;
    always @(posedge _113) begin
        if (_122)
            _647 <= _311;
        else
            _647 <= _50;
    end
    assign _701 = _647 == _311;
    assign _702 = _701 ? host_rx_data : _699;
    assign _703 = _641 ? _702 : _699;
    assign _51 = _703;
    always @(posedge _113) begin
        if (_122)
            _699 <= _1041;
        else
            _699 <= _51;
    end
    assign _728 = _726 + _301;
    assign _719 = fifo_level - _1035;
    assign _716 = fifo_level + _1035;
    assign _713 = ~ _710;
    assign _714 = _641 & _713;
    assign _717 = _714 ? _716 : fifo_level;
    assign _640 = ~ fifo_full_0;
    assign fifo_full_0 = fifo_level == _249;
    assign rx_full = fifo_full_0;
    assign _707 = ~ rx_full;
    assign _704 = 8'b00001000;
    assign _705 = _368 == _704;
    assign _706 = _634 & _705;
    assign fifo_rx_push = _706 & _707;
    assign host_rx_push = fifo_rx_push;
    assign _641 = host_rx_push & _640;
    assign _711 = ~ _641;
    assign _712 = _710 & _711;
    assign _720 = _712 ? _719 : _717;
    assign _54 = _720;
    always @(posedge _113) begin
        if (_122)
            fifo_level <= _1062;
        else
            fifo_level <= _54;
    end
    assign fifo_empty = fifo_level == _1062;
    assign _709 = ~ fifo_empty;
    assign _722 = op == _143;
    assign fifo_rx_pop = advance & _722;
    assign core_rx_pop = fifo_rx_pop;
    assign _710 = core_rx_pop & _709;
    assign _729 = _710 ? _728 : _726;
    assign _56 = _729;
    always @(posedge _113) begin
        if (_122)
            _726 <= _311;
        else
            _726 <= _56;
    end
    always @* begin
        case (_726)
        0:
            fifo_data_0 <= _699;
        1:
            fifo_data_0 <= _689;
        2:
            fifo_data_0 <= _682;
        3:
            fifo_data_0 <= _675;
        4:
            fifo_data_0 <= _668;
        5:
            fifo_data_0 <= _661;
        6:
            fifo_data_0 <= _654;
        default:
            fifo_data_0 <= _644;
        endcase
    end
    assign rx_data = fifo_data_0;
    assign _853 = reg_val ^ imm;
    assign _852 = reg_val | imm;
    assign _851 = reg_val & imm;
    assign _848 = { _1079,
                    reg_val };
    assign _849 = _848 - _844;
    assign _850 = _849[7:0];
    assign _844 = { _1079,
                    imm };
    assign _842 = { _1079,
                    reg_val };
    assign _845 = _842 + _844;
    assign _846 = _845[7:0];
    assign _828 = _826[7:4];
    assign _829 = { _1062,
                    _828 };
    assign _824 = _822[7:2];
    assign _825 = { _453,
                    _824 };
    assign _820 = reg_val[7:1];
    assign _821 = { _1079,
                    _820 };
    assign _818 = _780[0:0];
    assign _822 = _818 ? _821 : reg_val;
    assign _817 = _780[1:1];
    assign _826 = _817 ? _825 : _822;
    assign _816 = _780[2:2];
    assign _830 = _816 ? _829 : _826;
    assign _815 = _780[3:3];
    assign _832 = _815 ? _1041 : _830;
    assign _814 = _780[4:4];
    assign _834 = _814 ? _1041 : _832;
    assign _813 = _780[5:5];
    assign _836 = _813 ? _1041 : _834;
    assign _812 = _780[6:6];
    assign _838 = _812 ? _1041 : _836;
    assign _811 = _780[7:7];
    assign _840 = _811 ? _1041 : _838;
    assign _797 = _796[3:0];
    assign _799 = { _797,
                    _1062 };
    assign _793 = _792[5:0];
    assign _795 = { _793,
                    _453 };
    assign _789 = reg_val[6:0];
    assign _791 = { _789,
                    _1079 };
    assign _760 = arg == _259;
    assign _867 = _760 ? reg_write_value : _222;
    assign _868 = _758 ? _867 : _222;
    assign _869 = advance ? _868 : _222;
    assign _870 = host_run ? _869 : _222;
    assign _58 = _870;
    always @(posedge _113) begin
        if (_123)
            _222 <= _1041;
        else
            _222 <= _58;
    end
    assign _872 = arg == _280;
    assign _873 = _872 ? reg_write_value : oe;
    assign _874 = _758 ? _873 : oe;
    assign _875 = advance ? _874 : oe;
    assign _876 = host_run ? _875 : oe;
    assign _59 = _876;
    always @(posedge _113) begin
        if (_123)
            oe <= _1041;
        else
            oe <= _59;
    end
    assign _946 = pins_out[6:0];
    assign _947 = { _926,
                    _946 };
    assign _944 = pins_out[5:0];
    assign _943 = pins_out[7:7];
    assign _945 = { _943,
                    _926,
                    _944 };
    assign _941 = pins_out[4:0];
    assign _940 = pins_out[7:6];
    assign _942 = { _940,
                    _926,
                    _941 };
    assign _938 = pins_out[3:0];
    assign _937 = pins_out[7:5];
    assign _939 = { _937,
                    _926,
                    _938 };
    assign _935 = pins_out[2:0];
    assign _934 = pins_out[7:4];
    assign _936 = { _934,
                    _926,
                    _935 };
    assign _932 = pins_out[1:0];
    assign _931 = pins_out[7:3];
    assign _933 = { _931,
                    _926,
                    _932 };
    assign _929 = pins_out[0:0];
    assign _928 = pins_out[7:2];
    assign _930 = { _928,
                    _926,
                    _929 };
    assign _173 = pins_sync[7:7];
    assign _172 = pins_sync[6:6];
    assign _171 = pins_sync[5:5];
    assign _170 = pins_sync[4:4];
    assign _169 = pins_sync[3:3];
    assign _168 = pins_sync[2:2];
    assign _167 = pins_sync[1:1];
    assign _61 = uio_in;
    always @(posedge _113) begin
        _162 <= _61;
    end
    always @(posedge _113) begin
        pins_sync <= _162;
    end
    assign _166 = pins_sync[0:0];
    always @* begin
        case (arg)
        0:
            pin_arg <= _166;
        1:
            pin_arg <= _167;
        2:
            pin_arg <= _168;
        3:
            pin_arg <= _169;
        4:
            pin_arg <= _170;
        5:
            pin_arg <= _171;
        6:
            pin_arg <= _172;
        default:
            pin_arg <= _173;
        endcase
    end
    assign _889 = _216[6:0];
    assign _890 = { _889,
                    pin_arg };
    assign _885 = _216[6:0];
    assign _887 = { _885,
                    _1079 };
    assign _882 = arg == _273;
    assign _883 = _882 ? reg_write_value : _216;
    assign _884 = _758 ? _883 : _216;
    assign _888 = _880 ? _887 : _884;
    assign _877 = 5'b11011;
    assign _878 = op == _877;
    assign _891 = _878 ? _890 : _888;
    assign _892 = advance ? _891 : _216;
    assign _893 = host_run ? _892 : _216;
    assign _62 = _893;
    always @(posedge _113) begin
        if (_123)
            _216 <= _1041;
        else
            _216 <= _62;
    end
    assign _926 = _216[7:7];
    assign _925 = pins_out[7:1];
    assign _927 = { _925,
                    _926 };
    always @* begin
        case (arg)
        0:
            _948 <= _927;
        1:
            _948 <= _930;
        2:
            _948 <= _933;
        3:
            _948 <= _936;
        4:
            _948 <= _939;
        5:
            _948 <= _942;
        6:
            _948 <= _945;
        default:
            _948 <= _947;
        endcase
    end
    assign _921 = pins_out[6:0];
    assign _922 = { _901,
                    _921 };
    assign _919 = pins_out[5:0];
    assign _918 = pins_out[7:7];
    assign _920 = { _918,
                    _901,
                    _919 };
    assign _916 = pins_out[4:0];
    assign _915 = pins_out[7:6];
    assign _917 = { _915,
                    _901,
                    _916 };
    assign _913 = pins_out[3:0];
    assign _912 = pins_out[7:5];
    assign _914 = { _912,
                    _901,
                    _913 };
    assign _910 = pins_out[2:0];
    assign _909 = pins_out[7:4];
    assign _911 = { _909,
                    _901,
                    _910 };
    assign _907 = pins_out[1:0];
    assign _906 = pins_out[7:3];
    assign _908 = { _906,
                    _901,
                    _907 };
    assign _904 = pins_out[0:0];
    assign _903 = pins_out[7:2];
    assign _905 = { _903,
                    _901,
                    _904 };
    assign _901 = imm[0:0];
    assign _900 = pins_out[7:1];
    assign _902 = { _900,
                    _901 };
    always @* begin
        case (arg)
        0:
            _923 <= _902;
        1:
            _923 <= _905;
        2:
            _923 <= _908;
        3:
            _923 <= _911;
        4:
            _923 <= _914;
        5:
            _923 <= _917;
        6:
            _923 <= _920;
        default:
            _923 <= _922;
        endcase
    end
    assign _897 = arg == _287;
    assign _898 = _897 ? reg_write_value : pins_out;
    assign _899 = _758 ? _898 : pins_out;
    assign _894 = 5'b01100;
    assign _895 = op == _894;
    assign _924 = _895 ? _923 : _899;
    assign _879 = 5'b11010;
    assign _880 = op == _879;
    assign _949 = _880 ? _948 : _924;
    assign _950 = advance ? _949 : pins_out;
    assign _951 = host_run ? _950 : pins_out;
    assign _63 = _951;
    always @(posedge _113) begin
        if (_123)
            pins_out <= _1041;
        else
            pins_out <= _63;
    end
    assign _953 = arg == _294;
    assign _954 = _953 ? reg_write_value : _204;
    assign _955 = _758 ? _954 : _204;
    assign _956 = advance ? _955 : _204;
    assign _957 = host_run ? _956 : _204;
    assign _64 = _957;
    always @(posedge _113) begin
        if (_123)
            _204 <= _1041;
        else
            _204 <= _64;
    end
    assign _430 = _213 - _331;
    assign _961 = arg == _301;
    assign _962 = _961 ? reg_write_value : _213;
    assign _963 = _758 ? _962 : _213;
    assign _959 = op == _427;
    assign _964 = _959 ? _430 : _963;
    assign _965 = advance ? _964 : _213;
    assign _966 = host_run ? _965 : _213;
    assign _65 = _966;
    always @(posedge _113) begin
        if (_123)
            _213 <= _1041;
        else
            _213 <= _65;
    end
    assign _970 = prog_wr_data[1:1];
    assign _967 = 8'b00000110;
    assign _968 = _368 == _967;
    assign _969 = _634 & _968;
    assign reset_core = _969 & _970;
    assign host_reset_core = reset_core;
    assign _123 = _122 | host_reset_core;
    assign _973 = arg == _311;
    assign _974 = _973 ? reg_write_value : fifo_tx_data;
    assign _975 = _758 ? _974 : fifo_tx_data;
    assign _976 = advance ? _975 : fifo_tx_data;
    assign _977 = host_run ? _976 : fifo_tx_data;
    assign _67 = _977;
    always @(posedge _113) begin
        if (_123)
            fifo_tx_data <= _1041;
        else
            fifo_tx_data <= _67;
    end
    always @* begin
        case (arg)
        0:
            reg_val <= fifo_tx_data;
        1:
            reg_val <= _213;
        2:
            reg_val <= _204;
        3:
            reg_val <= pins_out;
        4:
            reg_val <= oe;
        5:
            reg_val <= _216;
        6:
            reg_val <= _219;
        default:
            reg_val <= _222;
        endcase
    end
    assign _788 = _780[0:0];
    assign _792 = _788 ? _791 : reg_val;
    assign _787 = _780[1:1];
    assign _796 = _787 ? _795 : _792;
    assign _786 = _780[2:2];
    assign _800 = _786 ? _799 : _796;
    assign _785 = _780[3:3];
    assign _802 = _785 ? _1041 : _800;
    assign _784 = _780[4:4];
    assign _804 = _784 ? _1041 : _802;
    assign _783 = _780[5:5];
    assign _806 = _783 ? _1041 : _804;
    assign _782 = _780[6:6];
    assign _808 = _782 ? _1041 : _806;
    assign imm = _73[7:0];
    assign _778 = imm == _1041;
    assign _780 = _778 ? _704 : imm;
    assign _781 = _780[7:7];
    assign _810 = _781 ? _1041 : _808;
    assign _776 = op[2:0];
    always @* begin
        case (_776)
        0:
            alu_result <= _810;
        1:
            alu_result <= _840;
        2:
            alu_result <= _846;
        3:
            alu_result <= _846;
        4:
            alu_result <= _850;
        5:
            alu_result <= _851;
        6:
            alu_result <= _852;
        default:
            alu_result <= _853;
        endcase
    end
    assign _775 = op == _143;
    assign _855 = _775 ? rx_data : alu_result;
    assign _772 = 5'b11001;
    assign _773 = op == _772;
    assign _856 = _773 ? pins_sync : _855;
    assign _770 = 5'b11000;
    assign _771 = op == _770;
    assign _861 = _771 ? _860 : _856;
    assign _768 = op == _230;
    assign _766 = op == _145;
    assign _769 = _766 | _768;
    assign _862 = _769 ? data_mem_host_rdata : _861;
    assign _763 = 5'b00010;
    assign _764 = op == _763;
    assign _865 = _764 ? reg_src : _862;
    assign _761 = 5'b00001;
    assign _762 = op == _761;
    assign reg_write_value = _762 ? imm : _865;
    assign arg = _73[10:8];
    assign _979 = arg == _266;
    assign _980 = _979 ? reg_write_value : _219;
    assign _757 = op == _143;
    assign _754 = op == _772;
    assign _751 = op == _770;
    assign _748 = op == _230;
    assign _745 = op == _145;
    assign _734 = op == _763;
    assign _732 = op == _761;
    assign _735 = _732 | _734;
    assign _743 = _735 | _742;
    assign _746 = _743 | _745;
    assign _749 = _746 | _748;
    assign _752 = _749 | _751;
    assign _755 = _752 | _754;
    assign _758 = _755 | _757;
    assign _981 = _758 ? _980 : _219;
    assign _739 = 5'b01001;
    assign _740 = _739 < op;
    assign _741 = ~ _740;
    assign _736 = 5'b00011;
    assign _737 = op < _736;
    assign _738 = ~ _737;
    assign _742 = _738 & _741;
    assign _996 = _742 ? _995 : _981;
    assign _997 = advance ? _996 : _219;
    assign _998 = host_run ? _997 : _219;
    assign _68 = _998;
    always @(posedge _113) begin
        if (_123)
            _219 <= _1041;
        else
            _219 <= _68;
    end
    assign _400 = _219[0:0];
    assign _398 = 5'b10001;
    assign _399 = op == _398;
    assign _401 = _399 & _400;
    assign _396 = 5'b10000;
    assign _397 = op == _396;
    assign _402 = _397 | _401;
    assign _407 = _402 | _406;
    assign _412 = _407 | _411;
    assign _417 = _412 | _416;
    assign _421 = _417 | _420;
    assign _426 = _421 | _425;
    assign _435 = _426 | branch_taken;
    assign fetch_addr = _435 ? imm : pc;
    assign _999 = host_prog_wr ? host_prog_wr_addr : fetch_addr;
    assign _69 = _999;
    assign host_run = run;
    assign _1004 = ~ host_run;
    assign _1005 = advance | _1004;
    assign _1003 = ~ host_prog_wr;
    assign _1006 = _1003 & _1005;
    assign _71 = _1006;
    assign _1008 = _368 == _369;
    assign _1009 = _634 & _1008;
    assign prog_wr = _1009 & _375;
    assign host_prog_wr = prog_wr;
    RM_IHPSG13_1P_256x16_c2_bm_bist
        the_RM_IHPSG13_1P_256x16_c2_bm_bist
        ( .A_CLK(_113),
          .A_MEN(vdd),
          .A_WEN(host_prog_wr),
          .A_REN(_71),
          .A_ADDR(_69),
          .A_DIN(host_prog_wr_data),
          .A_DLY(gnd),
          .A_BM(_1014),
          .A_BIST_CLK(gnd),
          .A_BIST_EN(gnd),
          .A_BIST_MEN(gnd),
          .A_BIST_WEN(gnd),
          .A_BIST_REN(gnd),
          .A_BIST_ADDR(_1041),
          .A_BIST_DIN(_1013),
          .A_BIST_BM(_1014),
          .A_DOUT(_1016[15:0]) );
    assign _73 = _1016;
    assign op = _73[15:11];
    assign _136 = op == _326;
    assign advance = _136 ? _188 : _184;
    assign fifo_tx_push = advance & _1018;
    assign core_tx_push = fifo_tx_push;
    assign _252 = core_tx_push & _251;
    assign _1028 = ~ _252;
    assign _317 = ~ fifo_empty_0;
    assign _1026 = ~ tx_empty;
    assign _1023 = 8'b00001001;
    assign _1024 = prog_wr_data == _1023;
    assign _1021 = _613 == _363;
    assign _1022 = _1021 & _633;
    assign _1025 = _1022 & _1024;
    assign fifo_tx_pop = _1025 & _1026;
    assign host_tx_pop = fifo_tx_pop;
    assign _318 = host_tx_pop & _317;
    assign _1029 = _318 & _1028;
    assign _1037 = _1029 ? _1036 : _1034;
    assign _76 = _1037;
    always @(posedge _113) begin
        if (_122)
            fifo_level_0 <= _1062;
        else
            fifo_level_0 <= _76;
    end
    assign fifo_empty_0 = fifo_level_0 == _1062;
    assign tx_empty = fifo_empty_0;
    assign _1060 = tx_empty ? _1059 : tx_data;
    assign _1057 = prog_wr_data == _1023;
    assign _1061 = _1057 ? _1060 : _1041;
    assign _1054 = 8'b00000111;
    assign _1055 = prog_wr_data == _1054;
    assign _1068 = _1055 ? _1067 : _1061;
    assign _1052 = 8'b00000101;
    assign _1053 = prog_wr_data == _1052;
    assign _1069 = _1053 ? core_data_out : _1068;
    assign _1070 = _1051 ? _1069 : _1042;
    assign _1043 = _363 == _613;
    assign _1071 = _1043 ? _1070 : _1042;
    assign _1072 = _360 ? _1071 : _1042;
    assign _1073 = _355 ? _1072 : _1042;
    assign _1074 = _348 ? _1073 : _1042;
    assign _1038 = ~ _343;
    assign _1039 = _1038 & _346;
    assign _1082 = _1039 ? _1081 : _1074;
    assign _78 = _1082;
    always @(posedge _113) begin
        if (_122)
            _1042 <= _1041;
        else
            _1042 <= _78;
    end
    assign _1422 = _1042[7:7];
    assign gnd = 1'b0;
    assign _1420 = _1075 == _363;
    assign _1421 = _355 & _1420;
    assign miso = _1421 ? _1422 : gnd;
    assign _1086 = prog_wr_data[0:0];
    assign _1085 = _368 == _967;
    assign _1087 = _1085 ? _1086 : run;
    assign _1083 = _363 == _466;
    assign _1088 = _1083 ? _1087 : run;
    assign _1089 = _360 ? _1088 : run;
    assign _1090 = _355 ? _1089 : run;
    assign _1091 = _348 ? _1090 : run;
    assign _79 = _1091;
    always @(posedge _113) begin
        if (_122)
            run <= _1079;
        else
            run <= _79;
    end
    assign _1424 = { run,
                     miso };
    assign _1109 = { prog_wr_data,
                     pat_data_lo };
    assign _1100 = 4'b1111;
    assign _1101 = pat_data_idx == _1100;
    assign _1102 = pat_data_wr & _1101;
    assign _1110 = _1102 ? _1109 : _1105;
    assign _80 = _1110;
    always @(posedge _113) begin
        if (_122)
            _1105 <= _1013;
        else
            _1105 <= _80;
    end
    assign _1117 = { prog_wr_data,
                     pat_data_lo };
    assign _1111 = 4'b1110;
    assign _1112 = pat_data_idx == _1111;
    assign _1113 = pat_data_wr & _1112;
    assign _1118 = _1113 ? _1117 : _1116;
    assign _81 = _1118;
    always @(posedge _113) begin
        if (_122)
            _1116 <= _1013;
        else
            _1116 <= _81;
    end
    assign _1125 = { prog_wr_data,
                     pat_data_lo };
    assign _1119 = 4'b1101;
    assign _1120 = pat_data_idx == _1119;
    assign _1121 = pat_data_wr & _1120;
    assign _1126 = _1121 ? _1125 : _1124;
    assign _82 = _1126;
    always @(posedge _113) begin
        if (_122)
            _1124 <= _1013;
        else
            _1124 <= _82;
    end
    assign _1133 = { prog_wr_data,
                     pat_data_lo };
    assign _1127 = 4'b1100;
    assign _1128 = pat_data_idx == _1127;
    assign _1129 = pat_data_wr & _1128;
    assign _1134 = _1129 ? _1133 : _1132;
    assign _83 = _1134;
    always @(posedge _113) begin
        if (_122)
            _1132 <= _1013;
        else
            _1132 <= _83;
    end
    assign _1141 = { prog_wr_data,
                     pat_data_lo };
    assign _1135 = 4'b1011;
    assign _1136 = pat_data_idx == _1135;
    assign _1137 = pat_data_wr & _1136;
    assign _1142 = _1137 ? _1141 : _1140;
    assign _84 = _1142;
    always @(posedge _113) begin
        if (_122)
            _1140 <= _1013;
        else
            _1140 <= _84;
    end
    assign _1149 = { prog_wr_data,
                     pat_data_lo };
    assign _1143 = 4'b1010;
    assign _1144 = pat_data_idx == _1143;
    assign _1145 = pat_data_wr & _1144;
    assign _1150 = _1145 ? _1149 : _1148;
    assign _85 = _1150;
    always @(posedge _113) begin
        if (_122)
            _1148 <= _1013;
        else
            _1148 <= _85;
    end
    assign _1157 = { prog_wr_data,
                     pat_data_lo };
    assign _1151 = 4'b1001;
    assign _1152 = pat_data_idx == _1151;
    assign _1153 = pat_data_wr & _1152;
    assign _1158 = _1153 ? _1157 : _1156;
    assign _86 = _1158;
    always @(posedge _113) begin
        if (_122)
            _1156 <= _1013;
        else
            _1156 <= _86;
    end
    assign _1165 = { prog_wr_data,
                     pat_data_lo };
    assign _1160 = pat_data_idx == _249;
    assign _1161 = pat_data_wr & _1160;
    assign _1166 = _1161 ? _1165 : _1164;
    assign _87 = _1166;
    always @(posedge _113) begin
        if (_122)
            _1164 <= _1013;
        else
            _1164 <= _87;
    end
    assign _1173 = { prog_wr_data,
                     pat_data_lo };
    assign _1167 = 4'b0111;
    assign _1168 = pat_data_idx == _1167;
    assign _1169 = pat_data_wr & _1168;
    assign _1174 = _1169 ? _1173 : _1172;
    assign _88 = _1174;
    always @(posedge _113) begin
        if (_122)
            _1172 <= _1013;
        else
            _1172 <= _88;
    end
    assign _1181 = { prog_wr_data,
                     pat_data_lo };
    assign _1175 = 4'b0110;
    assign _1176 = pat_data_idx == _1175;
    assign _1177 = pat_data_wr & _1176;
    assign _1182 = _1177 ? _1181 : _1180;
    assign _89 = _1182;
    always @(posedge _113) begin
        if (_122)
            _1180 <= _1013;
        else
            _1180 <= _89;
    end
    assign _1189 = { prog_wr_data,
                     pat_data_lo };
    assign _1183 = 4'b0101;
    assign _1184 = pat_data_idx == _1183;
    assign _1185 = pat_data_wr & _1184;
    assign _1190 = _1185 ? _1189 : _1188;
    assign _90 = _1190;
    always @(posedge _113) begin
        if (_122)
            _1188 <= _1013;
        else
            _1188 <= _90;
    end
    assign _1197 = { prog_wr_data,
                     pat_data_lo };
    assign _1191 = 4'b0100;
    assign _1192 = pat_data_idx == _1191;
    assign _1193 = pat_data_wr & _1192;
    assign _1198 = _1193 ? _1197 : _1196;
    assign _91 = _1198;
    always @(posedge _113) begin
        if (_122)
            _1196 <= _1013;
        else
            _1196 <= _91;
    end
    assign _1205 = { prog_wr_data,
                     pat_data_lo };
    assign _1199 = 4'b0011;
    assign _1200 = pat_data_idx == _1199;
    assign _1201 = pat_data_wr & _1200;
    assign _1206 = _1201 ? _1205 : _1204;
    assign _92 = _1206;
    always @(posedge _113) begin
        if (_122)
            _1204 <= _1013;
        else
            _1204 <= _92;
    end
    assign _1213 = { prog_wr_data,
                     pat_data_lo };
    assign _1207 = 4'b0010;
    assign _1208 = pat_data_idx == _1207;
    assign _1209 = pat_data_wr & _1208;
    assign _1214 = _1209 ? _1213 : _1212;
    assign _93 = _1214;
    always @(posedge _113) begin
        if (_122)
            _1212 <= _1013;
        else
            _1212 <= _93;
    end
    assign _1221 = { prog_wr_data,
                     pat_data_lo };
    assign _1216 = pat_data_idx == _1035;
    assign _1217 = pat_data_wr & _1216;
    assign _1222 = _1217 ? _1221 : _1220;
    assign _94 = _1222;
    always @(posedge _113) begin
        if (_122)
            _1220 <= _1013;
        else
            _1220 <= _94;
    end
    assign _1229 = _373 == _369;
    assign _1230 = _1229 ? prog_wr_data : pat_data_lo;
    assign _1231 = _1227 ? pat_data_lo : _1230;
    assign _1232 = _1225 ? _1231 : pat_data_lo;
    assign _1223 = _363 == _466;
    assign _1233 = _1223 ? _1232 : pat_data_lo;
    assign _1234 = _360 ? _1233 : pat_data_lo;
    assign _1235 = _355 ? _1234 : pat_data_lo;
    assign _1236 = _348 ? _1235 : pat_data_lo;
    assign _95 = _1236;
    always @(posedge _113) begin
        if (_122)
            pat_data_lo <= _1041;
        else
            pat_data_lo <= _95;
    end
    assign _1250 = { prog_wr_data,
                     pat_data_lo };
    assign _1227 = _373 == _468;
    assign _1238 = _1227 ? prog_wr_data : _1098;
    assign _1224 = 8'b00001100;
    assign _1225 = _368 == _1224;
    assign _1239 = _1225 ? _1238 : _1098;
    assign _1237 = _363 == _466;
    assign _1240 = _1237 ? _1239 : _1098;
    assign _1241 = _360 ? _1240 : _1098;
    assign _1242 = _355 ? _1241 : _1098;
    assign _1243 = _348 ? _1242 : _1098;
    assign _96 = _1243;
    always @(posedge _113) begin
        if (_122)
            _1098 <= _1041;
        else
            _1098 <= _96;
    end
    assign pat_data_idx = _1098[3:0];
    assign _1245 = pat_data_idx == _1062;
    assign _1093 = _368 == _1224;
    assign _632 = _358 == _1167;
    assign _633 = _348 & _632;
    assign _630 = _466 == _363;
    assign _634 = _630 & _633;
    assign _1094 = _634 & _1093;
    assign pat_data_wr = _1094 & _375;
    assign _1246 = pat_data_wr & _1245;
    assign _1251 = _1246 ? _1250 : _1249;
    assign _97 = _1251;
    always @(posedge _113) begin
        if (_122)
            _1249 <= _1013;
        else
            _1249 <= _97;
    end
    assign _1411 = _1280 + _1035;
    assign _1259 = _373 == _369;
    assign _1260 = _1259 ? prog_wr_data : pat_len;
    assign _1261 = _375 ? pat_len : _1260;
    assign _1262 = _1257 ? _1261 : pat_len;
    assign _1255 = _363 == _466;
    assign _1263 = _1255 ? _1262 : pat_len;
    assign _1264 = _360 ? _1263 : pat_len;
    assign _1265 = _355 ? _1264 : pat_len;
    assign _1266 = _348 ? _1265 : pat_len;
    assign _98 = _1266;
    always @(posedge _113) begin
        if (_122)
            pat_len <= _1041;
        else
            pat_len <= _98;
    end
    assign _1407 = pat_len - _331;
    assign _1408 = _1407[3:0];
    assign _1409 = _1280 == _1408;
    assign _1413 = _1409 ? _1062 : _1411;
    assign _1282 = _1281[15:8];
    assign _1285 = _1273 + _331;
    assign _1287 = _1283 ? _331 : _1285;
    assign _1289 = _1277 ? _331 : _1287;
    assign _1290 = _1270 ? _1289 : _1273;
    assign _99 = _1290;
    always @(posedge _113) begin
        if (_122)
            _1273 <= _1041;
        else
            _1273 <= _99;
    end
    assign _1283 = _1273 == _1282;
    assign _1414 = _1283 ? _1413 : _1280;
    assign _100 = _1270;
    always @(posedge _113) begin
        if (_122)
            _1276 <= _1079;
        else
            _1276 <= _100;
    end
    assign _1277 = ~ _1276;
    assign _1416 = _1277 ? _1062 : _1414;
    assign _1400 = _375 ? prog_wr_data : pat_ctrl;
    assign _1256 = 8'b00001011;
    assign _1291 = _363 == _613;
    assign _1292 = _1291 ? prog_wr_data : _368;
    assign _1293 = _360 ? _1292 : _368;
    assign _1294 = _355 ? _1293 : _368;
    assign _1295 = _348 ? _1294 : _368;
    assign _101 = _1295;
    always @(posedge _113) begin
        if (_122)
            _368 <= _1041;
        else
            _368 <= _101;
    end
    assign _1257 = _368 == _1256;
    assign _1401 = _1257 ? _1400 : pat_ctrl;
    assign _1075 = 2'b11;
    assign _1374 = _1340 ? _466 : _1366;
    assign _1375 = _1051 ? _1075 : _1374;
    assign _1050 = prog_wr_data == _1023;
    assign _1047 = prog_wr_data == _1054;
    assign _1045 = prog_wr_data == _1052;
    assign _1048 = _1045 | _1047;
    assign _1051 = _1048 | _1050;
    assign _1372 = ~ _1051;
    assign _1371 = ~ _1340;
    assign _1373 = _1371 & _1372;
    assign _1376 = _1373 ? _453 : _1375;
    assign _1352 = prog_wr_data == _476;
    assign _1349 = prog_wr_data == _369;
    assign _1347 = prog_wr_data == _331;
    assign _1350 = _1347 | _1349;
    assign _1353 = _1350 | _1352;
    assign _1356 = _1353 ? _369 : _331;
    assign _1344 = prog_wr_data == _1224;
    assign _1342 = prog_wr_data == _1256;
    assign _1345 = _1342 | _1344;
    assign _1358 = _1345 ? _468 : _1356;
    assign _1339 = prog_wr_data == _1224;
    assign _1336 = prog_wr_data == _1256;
    assign _1333 = prog_wr_data == _476;
    assign _1330 = prog_wr_data == _704;
    assign _1327 = prog_wr_data == _967;
    assign _1324 = prog_wr_data == _493;
    assign _1321 = prog_wr_data == _468;
    assign _1318 = prog_wr_data == _369;
    assign new_shift = _115[2:2];
    assign _1296 = _380[6:0];
    assign _1297 = { _1296,
                     new_shift };
    assign _1298 = _355 ? _1297 : _380;
    assign _1299 = _348 ? _1298 : _380;
    assign _102 = _1299;
    always @(posedge _113) begin
        if (_122)
            _380 <= _1041;
        else
            _380 <= _102;
    end
    assign _381 = _380[6:0];
    assign prog_wr_data = { _381,
                            new_shift };
    assign _1316 = prog_wr_data == _331;
    assign _1319 = _1316 | _1318;
    assign _1322 = _1319 | _1321;
    assign _1325 = _1322 | _1324;
    assign _1328 = _1325 | _1327;
    assign _1331 = _1328 | _1330;
    assign _1334 = _1331 | _1333;
    assign _1337 = _1334 | _1336;
    assign _1340 = _1337 | _1339;
    assign _1359 = _1340 ? _1358 : _1309;
    assign _1313 = _373 - _331;
    assign _1311 = _363 == _466;
    assign _1314 = _1311 ? _1313 : _1309;
    assign _1310 = _363 == _613;
    assign _1360 = _1310 ? _1359 : _1314;
    assign _1361 = _360 ? _1360 : _1309;
    assign _1362 = _355 ? _1361 : _1309;
    assign _1307 = _1305 ? _1041 : _373;
    assign _1309 = _1304 ? _1041 : _1307;
    assign _1363 = _348 ? _1362 : _1309;
    assign _103 = _1363;
    always @(posedge _113) begin
        if (_122)
            _373 <= _1041;
        else
            _373 <= _103;
    end
    assign _375 = _373 == _331;
    assign _1369 = _375 ? _453 : _1366;
    assign _1368 = _363 == _466;
    assign _1370 = _1368 ? _1369 : _1366;
    assign _1367 = _363 == _613;
    assign _1377 = _1367 ? _1376 : _1370;
    assign _1378 = _360 ? _1377 : _1366;
    assign _1379 = _355 ? _1378 : _1366;
    assign _1364 = _1305 ? _613 : _363;
    assign _1366 = _1304 ? _453 : _1364;
    assign _1380 = _348 ? _1379 : _1366;
    assign _104 = _1380;
    always @(posedge _113) begin
        if (_122)
            _363 <= _453;
        else
            _363 <= _104;
    end
    assign _1399 = _363 == _466;
    assign _1402 = _1399 ? _1401 : pat_ctrl;
    assign _1386 = _358 + _1035;
    assign _1388 = _360 ? _1062 : _1386;
    assign _1389 = _355 ? _1388 : _1384;
    assign _1305 = _355 & _1302;
    assign _1382 = _1305 ? _1062 : _358;
    assign _105 = _354;
    always @(posedge _113) begin
        if (_122)
            _1302 <= _1079;
        else
            _1302 <= _105;
    end
    assign _1303 = ~ _1302;
    assign _1304 = _354 & _1303;
    assign _1384 = _1304 ? _1062 : _1382;
    assign _1390 = _348 ? _1389 : _1384;
    assign _106 = _1390;
    always @(posedge _113) begin
        if (_122)
            _358 <= _1062;
        else
            _358 <= _106;
    end
    assign _360 = _358 == _1167;
    assign _1403 = _360 ? _1402 : pat_ctrl;
    assign _1391 = _115[0:0];
    assign _107 = _1391;
    always @(posedge _113) begin
        if (_122)
            _1394 <= _1079;
        else
            _1394 <= _107;
    end
    assign _108 = _1394;
    always @(posedge _113) begin
        if (_122)
            _354 <= _1079;
        else
            _354 <= _108;
    end
    assign _355 = ~ _354;
    assign _1404 = _355 ? _1403 : pat_ctrl;
    assign _109 = _343;
    always @(posedge _113) begin
        if (_122)
            _346 <= _1079;
        else
            _346 <= _109;
    end
    assign _347 = ~ _346;
    assign vdd = 1'b1;
    assign _111 = rst_n;
    assign _122 = ~ _111;
    assign _113 = clk;
    assign _115 = ui_in;
    assign _1395 = _115[1:1];
    assign _116 = _1395;
    always @(posedge _113) begin
        if (_122)
            _1398 <= _1079;
        else
            _1398 <= _116;
    end
    assign _117 = _1398;
    always @(posedge _113) begin
        if (_122)
            _343 <= _1079;
        else
            _343 <= _117;
    end
    assign _348 = _343 & _347;
    assign _1405 = _348 ? _1404 : pat_ctrl;
    assign _118 = _1405;
    always @(posedge _113) begin
        if (_122)
            pat_ctrl <= _1041;
        else
            pat_ctrl <= _118;
    end
    assign _1270 = pat_ctrl[0:0];
    assign _1417 = _1270 ? _1416 : _1280;
    assign _119 = _1417;
    always @(posedge _113) begin
        if (_122)
            _1280 <= _1062;
        else
            _1280 <= _119;
    end
    always @* begin
        case (_1280)
        0:
            _1281 <= _1249;
        1:
            _1281 <= _1220;
        2:
            _1281 <= _1212;
        3:
            _1281 <= _1204;
        4:
            _1281 <= _1196;
        5:
            _1281 <= _1188;
        6:
            _1281 <= _1180;
        7:
            _1281 <= _1172;
        8:
            _1281 <= _1164;
        9:
            _1281 <= _1156;
        10:
            _1281 <= _1148;
        11:
            _1281 <= _1140;
        12:
            _1281 <= _1132;
        13:
            _1281 <= _1124;
        14:
            _1281 <= _1116;
        default:
            _1281 <= _1105;
        endcase
    end
    assign pat_pins = _1281[7:0];
    assign _1419 = pat_pins[7:2];
    assign _1425 = { _1419,
                     _1424 };
    assign prog_wr_addr = host_data_rd_addr_0;
    assign data_wr_addr = host_data_rd_addr_0;
    assign status = run;
    assign data_wr_data = prog_wr_data;
    assign fifo_rx_data = prog_wr_data;
    assign pat_data_hi = prog_wr_data;
    assign uo_out = _1425;
    assign uio_out = pins_out;
    assign uio_oe = _130;

endmodule
