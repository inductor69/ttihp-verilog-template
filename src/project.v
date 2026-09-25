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
    wire [7:0] _1032;
    wire _1070;
    wire [6:0] _1069;
    wire [7:0] _1071;
    wire _1067;
    wire _1068;
    wire [7:0] _1072;
    wire [7:0] core_data_out;
    wire [1:0] _1055;
    wire _1054;
    wire [2:0] _1056;
    wire [3:0] _1057;
    wire [3:0] _1053;
    wire [7:0] _1058;
    wire [7:0] _1050;
    wire [2:0] _252;
    wire _253;
    wire [7:0] _254;
    wire [7:0] _255;
    wire [7:0] _6;
    reg [7:0] _248;
    wire [2:0] _259;
    wire _260;
    wire [7:0] _261;
    wire [7:0] _262;
    wire [7:0] _7;
    reg [7:0] _258;
    wire [2:0] _266;
    wire _267;
    wire [7:0] _268;
    wire [7:0] _269;
    wire [7:0] _8;
    reg [7:0] _265;
    wire [2:0] _273;
    wire _274;
    wire [7:0] _275;
    wire [7:0] _276;
    wire [7:0] _9;
    reg [7:0] _272;
    wire [2:0] _280;
    wire _281;
    wire [7:0] _282;
    wire [7:0] _283;
    wire [7:0] _10;
    reg [7:0] _279;
    wire [2:0] _287;
    wire _288;
    wire [7:0] _289;
    wire [7:0] _290;
    wire [7:0] _11;
    reg [7:0] _286;
    wire [2:0] _294;
    wire _295;
    wire [7:0] _296;
    wire [7:0] _297;
    wire [7:0] _12;
    reg [7:0] _293;
    wire [7:0] core_tx_data;
    wire [2:0] _304;
    wire [2:0] _299;
    wire [2:0] _300;
    wire [2:0] _14;
    reg [2:0] _251;
    wire _305;
    wire [7:0] _306;
    wire [7:0] _307;
    wire [7:0] _15;
    reg [7:0] _303;
    wire [2:0] _316;
    wire [2:0] _317;
    wire [2:0] _16;
    reg [2:0] _314;
    reg [7:0] fifo_data;
    wire [7:0] tx_data;
    wire [3:0] _1026;
    wire [3:0] _1027;
    wire [3:0] _1024;
    wire _1021;
    wire _1022;
    wire [3:0] _1025;
    wire _244;
    wire [4:0] _1008;
    wire _1009;
    wire [7:0] _324;
    wire [7:0] _325;
    wire _322;
    wire [7:0] _326;
    wire [4:0] _319;
    wire _320;
    wire [7:0] _327;
    wire [7:0] _328;
    wire [7:0] _18;
    reg [7:0] _180;
    wire _181;
    wire [7:0] _175;
    wire _176;
    wire _169;
    wire _170;
    wire [3:0] _242;
    wire fifo_full;
    wire tx_full;
    wire _156;
    wire rx_empty;
    wire _154;
    wire _153;
    wire [4:0] _143;
    wire _144;
    wire _155;
    wire _142;
    wire _157;
    wire [4:0] _139;
    wire _140;
    wire _171;
    wire [4:0] _137;
    wire _138;
    wire _177;
    wire [15:0] _1005;
    wire [15:0] _1004;
    wire _369;
    wire [7:0] _362;
    wire _363;
    wire _370;
    wire [7:0] _377;
    wire _358;
    wire [7:0] _378;
    wire [7:0] _379;
    wire [7:0] _380;
    wire [7:0] _381;
    wire [7:0] _21;
    reg [7:0] _344;
    wire [15:0] _382;
    wire [15:0] host_prog_wr_data;
    wire [7:0] host_prog_wr_addr;
    wire [7:0] _431;
    wire [7:0] _432;
    wire [7:0] _433;
    wire [7:0] _24;
    reg [7:0] pc;
    wire _425;
    wire _426;
    wire [4:0] _420;
    wire _421;
    wire branch_taken;
    wire _417;
    wire [4:0] _415;
    wire _416;
    wire _418;
    wire [4:0] _411;
    wire _412;
    wire _413;
    wire _408;
    wire [4:0] _406;
    wire _407;
    wire _409;
    wire _403;
    wire [4:0] _401;
    wire _402;
    wire _404;
    wire _398;
    wire [4:0] _396;
    wire _397;
    wire _399;
    wire _984;
    wire _978;
    wire _977;
    wire _975;
    wire _974;
    reg _982;
    wire [1:0] _985;
    wire [5:0] _973;
    wire [7:0] _986;
    wire [2:0] _854;
    reg [7:0] reg_src;
    wire _434;
    wire _435;
    wire [7:0] _436;
    wire [7:0] _437;
    wire [7:0] _25;
    reg [7:0] _228;
    wire [4:0] _223;
    wire _224;
    wire [7:0] _225;
    wire _439;
    wire _440;
    wire _441;
    wire _26;
    reg _152;
    wire [7:0] _229;
    wire [7:0] host_data_rd_addr;
    wire _148;
    wire [4:0] _145;
    wire _146;
    wire _149;
    wire [7:0] _230;
    wire [7:0] _449;
    wire [15:0] _442;
    wire [15:0] _443;
    wire [15:0] _444;
    wire [15:0] _28;
    reg [15:0] cyc;
    wire [7:0] _448;
    reg [7:0] _450;
    wire [7:0] cap_wr_data;
    wire [7:0] host_data_wr_data;
    wire [7:0] _217;
    wire [7:0] _218;
    wire [7:0] _479;
    wire [7:0] _481;
    wire [7:0] _476;
    wire [7:0] _478;
    wire [7:0] _459;
    wire [7:0] _460;
    wire [7:0] _461;
    wire [7:0] _462;
    wire [7:0] _31;
    reg [7:0] _456;
    wire [7:0] _469;
    wire [7:0] _470;
    wire _466;
    wire [7:0] _471;
    wire [7:0] _472;
    wire [7:0] _473;
    wire [7:0] _474;
    wire [7:0] _32;
    reg [7:0] cap_base;
    wire [7:0] _475;
    reg [7:0] _482;
    wire [7:0] cap_wr_addr;
    wire [7:0] _500;
    wire [7:0] _496;
    wire [7:0] _493;
    wire _492;
    wire [7:0] _494;
    wire _489;
    wire _490;
    wire [7:0] _497;
    wire _487;
    wire [7:0] _498;
    wire [7:0] _484;
    wire _485;
    wire [7:0] _501;
    wire _483;
    wire [7:0] _502;
    wire [7:0] _503;
    wire [7:0] _504;
    wire [7:0] _505;
    wire [7:0] _34;
    reg [7:0] host_data_rd_addr_0;
    wire [7:0] prog_wr_addr;
    wire [7:0] data_wr_addr;
    wire [7:0] host_data_wr_addr;
    wire [4:0] _193;
    wire _194;
    wire [7:0] _198;
    wire [7:0] _199;
    wire [7:0] _200;
    wire [1:0] _457;
    wire [1:0] _446;
    wire [1:0] _604;
    wire [1:0] _605;
    wire [1:0] _606;
    wire [1:0] _602;
    wire [1:0] _603;
    wire [1:0] _607;
    wire [1:0] _36;
    reg [1:0] _447;
    wire _458;
    wire _619;
    wire _615;
    wire _592;
    wire _593;
    wire _594;
    wire _595;
    wire _596;
    wire _597;
    wire _598;
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
    wire _530;
    wire _528;
    wire _529;
    wire _531;
    wire _536;
    wire _524;
    wire _525;
    wire _523;
    wire _526;
    wire [7:0] _37;
    reg [7:0] _520;
    wire _521;
    wire _516;
    wire _517;
    wire _522;
    wire _515;
    wire _527;
    wire [2:0] _514;
    reg _591;
    wire _513;
    wire _599;
    wire _512;
    wire _600;
    wire _616;
    wire _510;
    wire [7:0] _609;
    wire [7:0] _467;
    wire _468;
    wire [7:0] _610;
    wire _608;
    wire [7:0] _611;
    wire [7:0] _612;
    wire [7:0] _613;
    wire [7:0] _614;
    wire [7:0] _38;
    reg [7:0] cap_ctrl;
    wire _509;
    wire _511;
    wire _617;
    wire _620;
    wire _39;
    reg _453;
    wire cap_wr;
    wire _188;
    wire _189;
    wire [4:0] _183;
    wire _184;
    wire _185;
    wire _627;
    wire data_wr;
    wire host_data_wr;
    wire _186;
    wire _190;
    wire _191;
    wire [15:0] _237;
    wire [7:0] data_mem_host_rdata;
    wire [2:0] _849;
    reg pin_imm;
    wire [6:0] _848;
    wire [7:0] _851;
    wire _640;
    wire [7:0] _641;
    wire [7:0] _642;
    wire [7:0] _42;
    reg [7:0] _635;
    wire _647;
    wire [7:0] _648;
    wire [7:0] _649;
    wire [7:0] _43;
    reg [7:0] _645;
    wire _654;
    wire [7:0] _655;
    wire [7:0] _656;
    wire [7:0] _44;
    reg [7:0] _652;
    wire _661;
    wire [7:0] _662;
    wire [7:0] _663;
    wire [7:0] _45;
    reg [7:0] _659;
    wire _668;
    wire [7:0] _669;
    wire [7:0] _670;
    wire [7:0] _46;
    reg [7:0] _666;
    wire _675;
    wire [7:0] _676;
    wire [7:0] _677;
    wire [7:0] _47;
    reg [7:0] _673;
    wire _682;
    wire [7:0] _683;
    wire [7:0] _684;
    wire [7:0] _48;
    reg [7:0] _680;
    wire [7:0] host_rx_data;
    wire [2:0] _686;
    wire [2:0] _687;
    wire [2:0] _50;
    reg [2:0] _638;
    wire _692;
    wire [7:0] _693;
    wire [7:0] _694;
    wire [7:0] _51;
    reg [7:0] _690;
    wire [2:0] _719;
    wire [3:0] _710;
    wire [3:0] _707;
    wire _704;
    wire _705;
    wire [3:0] _708;
    wire _631;
    wire fifo_full_0;
    wire rx_full;
    wire _698;
    wire [7:0] _695;
    wire _696;
    wire _697;
    wire fifo_rx_push;
    wire host_rx_push;
    wire _632;
    wire _702;
    wire _703;
    wire [3:0] _711;
    wire [3:0] _54;
    reg [3:0] fifo_level;
    wire fifo_empty;
    wire _700;
    wire _713;
    wire fifo_rx_pop;
    wire core_rx_pop;
    wire _701;
    wire [2:0] _720;
    wire [2:0] _56;
    reg [2:0] _717;
    reg [7:0] fifo_data_0;
    wire [7:0] rx_data;
    wire [7:0] _844;
    wire [7:0] _843;
    wire [7:0] _842;
    wire [8:0] _839;
    wire [8:0] _840;
    wire [7:0] _841;
    wire [8:0] _835;
    wire [8:0] _833;
    wire [8:0] _836;
    wire [7:0] _837;
    wire [3:0] _819;
    wire [7:0] _820;
    wire [5:0] _815;
    wire [7:0] _816;
    wire [6:0] _811;
    wire [7:0] _812;
    wire _809;
    wire [7:0] _813;
    wire _808;
    wire [7:0] _817;
    wire _807;
    wire [7:0] _821;
    wire _806;
    wire [7:0] _823;
    wire _805;
    wire [7:0] _825;
    wire _804;
    wire [7:0] _827;
    wire _803;
    wire [7:0] _829;
    wire _802;
    wire [7:0] _831;
    wire [3:0] _788;
    wire [7:0] _790;
    wire [5:0] _784;
    wire [7:0] _786;
    wire [6:0] _780;
    wire [7:0] _782;
    wire _751;
    wire [7:0] _858;
    wire [7:0] _859;
    wire [7:0] _860;
    wire [7:0] _861;
    wire [7:0] _58;
    reg [7:0] _215;
    wire _863;
    wire [7:0] _864;
    wire [7:0] _865;
    wire [7:0] _866;
    wire [7:0] _867;
    wire [7:0] _59;
    reg [7:0] oe;
    wire [6:0] _937;
    wire [7:0] _938;
    wire [5:0] _935;
    wire _934;
    wire [7:0] _936;
    wire [4:0] _932;
    wire [1:0] _931;
    wire [7:0] _933;
    wire [3:0] _929;
    wire [2:0] _928;
    wire [7:0] _930;
    wire [2:0] _926;
    wire [3:0] _925;
    wire [7:0] _927;
    wire [1:0] _923;
    wire [4:0] _922;
    wire [7:0] _924;
    wire _920;
    wire [5:0] _919;
    wire [7:0] _921;
    wire _166;
    wire _165;
    wire _164;
    wire _163;
    wire _162;
    wire _161;
    wire _160;
    wire [7:0] _61;
    wire _159;
    reg pin_arg;
    wire [6:0] _880;
    wire [7:0] _881;
    wire [6:0] _876;
    wire [7:0] _878;
    wire _873;
    wire [7:0] _874;
    wire [7:0] _875;
    wire [7:0] _879;
    wire [4:0] _868;
    wire _869;
    wire [7:0] _882;
    wire [7:0] _883;
    wire [7:0] _884;
    wire [7:0] _62;
    reg [7:0] _209;
    wire _917;
    wire [6:0] _916;
    wire [7:0] _918;
    reg [7:0] _939;
    wire [6:0] _912;
    wire [7:0] _913;
    wire [5:0] _910;
    wire _909;
    wire [7:0] _911;
    wire [4:0] _907;
    wire [1:0] _906;
    wire [7:0] _908;
    wire [3:0] _904;
    wire [2:0] _903;
    wire [7:0] _905;
    wire [2:0] _901;
    wire [3:0] _900;
    wire [7:0] _902;
    wire [1:0] _898;
    wire [4:0] _897;
    wire [7:0] _899;
    wire _895;
    wire [5:0] _894;
    wire [7:0] _896;
    wire _892;
    wire [6:0] _891;
    wire [7:0] _893;
    reg [7:0] _914;
    wire _888;
    wire [7:0] _889;
    wire [7:0] _890;
    wire [4:0] _885;
    wire _886;
    wire [7:0] _915;
    wire [4:0] _870;
    wire _871;
    wire [7:0] _940;
    wire [7:0] _941;
    wire [7:0] _942;
    wire [7:0] _63;
    reg [7:0] pins_out;
    wire _944;
    wire [7:0] _945;
    wire [7:0] _946;
    wire [7:0] _947;
    wire [7:0] _948;
    wire [7:0] _64;
    reg [7:0] _197;
    wire [7:0] _423;
    wire _952;
    wire [7:0] _953;
    wire [7:0] _954;
    wire _950;
    wire [7:0] _955;
    wire [7:0] _956;
    wire [7:0] _957;
    wire [7:0] _65;
    reg [7:0] _206;
    wire _961;
    wire [7:0] _958;
    wire _959;
    wire _960;
    wire reset_core;
    wire host_reset_core;
    wire _123;
    wire _964;
    wire [7:0] _965;
    wire [7:0] _966;
    wire [7:0] _967;
    wire [7:0] _968;
    wire [7:0] _67;
    reg [7:0] fifo_tx_data;
    reg [7:0] reg_val;
    wire _779;
    wire [7:0] _783;
    wire _778;
    wire [7:0] _787;
    wire _777;
    wire [7:0] _791;
    wire _776;
    wire [7:0] _793;
    wire _775;
    wire [7:0] _795;
    wire _774;
    wire [7:0] _797;
    wire _773;
    wire [7:0] _799;
    wire [7:0] imm;
    wire _769;
    wire [7:0] _771;
    wire _772;
    wire [7:0] _801;
    wire [2:0] _767;
    reg [7:0] alu_result;
    wire _766;
    wire [7:0] _846;
    wire [4:0] _763;
    wire _764;
    wire [7:0] _847;
    wire [4:0] _761;
    wire _762;
    wire [7:0] _852;
    wire _759;
    wire _757;
    wire _760;
    wire [7:0] _853;
    wire [4:0] _754;
    wire _755;
    wire [7:0] _856;
    wire [4:0] _752;
    wire _753;
    wire [7:0] reg_write_value;
    wire [2:0] arg;
    wire _970;
    wire [7:0] _971;
    wire _748;
    wire _745;
    wire _742;
    wire _739;
    wire _736;
    wire _725;
    wire _723;
    wire _726;
    wire _734;
    wire _737;
    wire _740;
    wire _743;
    wire _746;
    wire _749;
    wire [7:0] _972;
    wire [4:0] _730;
    wire _731;
    wire _732;
    wire [4:0] _727;
    wire _728;
    wire _729;
    wire _733;
    wire [7:0] _987;
    wire [7:0] _988;
    wire [7:0] _989;
    wire [7:0] _68;
    reg [7:0] _212;
    wire _393;
    wire [4:0] _391;
    wire _392;
    wire _394;
    wire [4:0] _389;
    wire _390;
    wire _395;
    wire _400;
    wire _405;
    wire _410;
    wire _414;
    wire _419;
    wire _428;
    wire [7:0] fetch_addr;
    wire [7:0] _990;
    wire [7:0] _69;
    wire host_run;
    wire _995;
    wire _996;
    wire _994;
    wire _997;
    wire _71;
    wire _999;
    wire _1000;
    wire prog_wr;
    wire host_prog_wr;
    wire [15:0] _1007;
    wire [15:0] _73;
    wire [4:0] op;
    wire _136;
    wire advance;
    wire fifo_tx_push;
    wire core_tx_push;
    wire _245;
    wire _1019;
    wire _310;
    wire _1017;
    wire [7:0] _1014;
    wire _1015;
    wire _1012;
    wire _1013;
    wire _1016;
    wire fifo_tx_pop;
    wire host_tx_pop;
    wire _311;
    wire _1020;
    wire [3:0] _1028;
    wire [3:0] _76;
    reg [3:0] fifo_level_0;
    wire fifo_empty_0;
    wire tx_empty;
    wire [7:0] _1051;
    wire _1048;
    wire [7:0] _1052;
    wire [7:0] _1045;
    wire _1046;
    wire [7:0] _1059;
    wire [7:0] _1043;
    wire _1044;
    wire [7:0] _1060;
    wire [7:0] _1061;
    wire _1034;
    wire [7:0] _1062;
    wire [7:0] _1063;
    wire [7:0] _1064;
    wire [7:0] _1065;
    wire _1029;
    wire _1030;
    wire [7:0] _1073;
    wire [7:0] _78;
    reg [7:0] _1033;
    wire _1413;
    wire gnd;
    wire _1411;
    wire _1412;
    wire miso;
    wire _1077;
    wire _1076;
    wire _1078;
    wire _1074;
    wire _1079;
    wire _1080;
    wire _1081;
    wire _1082;
    wire _79;
    reg run;
    wire status;
    wire [1:0] _1415;
    wire [15:0] _1100;
    wire [3:0] _1091;
    wire _1092;
    wire _1093;
    wire [15:0] _1101;
    wire [15:0] _80;
    reg [15:0] _1096;
    wire [15:0] _1108;
    wire [3:0] _1102;
    wire _1103;
    wire _1104;
    wire [15:0] _1109;
    wire [15:0] _81;
    reg [15:0] _1107;
    wire [15:0] _1116;
    wire [3:0] _1110;
    wire _1111;
    wire _1112;
    wire [15:0] _1117;
    wire [15:0] _82;
    reg [15:0] _1115;
    wire [15:0] _1124;
    wire [3:0] _1118;
    wire _1119;
    wire _1120;
    wire [15:0] _1125;
    wire [15:0] _83;
    reg [15:0] _1123;
    wire [15:0] _1132;
    wire [3:0] _1126;
    wire _1127;
    wire _1128;
    wire [15:0] _1133;
    wire [15:0] _84;
    reg [15:0] _1131;
    wire [15:0] _1140;
    wire [3:0] _1134;
    wire _1135;
    wire _1136;
    wire [15:0] _1141;
    wire [15:0] _85;
    reg [15:0] _1139;
    wire [15:0] _1148;
    wire [3:0] _1142;
    wire _1143;
    wire _1144;
    wire [15:0] _1149;
    wire [15:0] _86;
    reg [15:0] _1147;
    wire [15:0] _1156;
    wire _1151;
    wire _1152;
    wire [15:0] _1157;
    wire [15:0] _87;
    reg [15:0] _1155;
    wire [15:0] _1164;
    wire [3:0] _1158;
    wire _1159;
    wire _1160;
    wire [15:0] _1165;
    wire [15:0] _88;
    reg [15:0] _1163;
    wire [15:0] _1172;
    wire [3:0] _1166;
    wire _1167;
    wire _1168;
    wire [15:0] _1173;
    wire [15:0] _89;
    reg [15:0] _1171;
    wire [15:0] _1180;
    wire [3:0] _1174;
    wire _1175;
    wire _1176;
    wire [15:0] _1181;
    wire [15:0] _90;
    reg [15:0] _1179;
    wire [15:0] _1188;
    wire [3:0] _1182;
    wire _1183;
    wire _1184;
    wire [15:0] _1189;
    wire [15:0] _91;
    reg [15:0] _1187;
    wire [15:0] _1196;
    wire [3:0] _1190;
    wire _1191;
    wire _1192;
    wire [15:0] _1197;
    wire [15:0] _92;
    reg [15:0] _1195;
    wire [15:0] _1204;
    wire [3:0] _1198;
    wire _1199;
    wire _1200;
    wire [15:0] _1205;
    wire [15:0] _93;
    reg [15:0] _1203;
    wire [15:0] _1212;
    wire _1207;
    wire _1208;
    wire [15:0] _1213;
    wire [15:0] _94;
    reg [15:0] _1211;
    wire _1220;
    wire [7:0] _1221;
    wire [7:0] _1222;
    wire [7:0] _1223;
    wire _1214;
    wire [7:0] _1224;
    wire [7:0] _1225;
    wire [7:0] _1226;
    wire [7:0] _1227;
    wire [7:0] _95;
    reg [7:0] pat_data_lo;
    wire [15:0] _1241;
    wire _1218;
    wire [7:0] _1229;
    wire [7:0] _1215;
    wire _1216;
    wire [7:0] _1230;
    wire _1228;
    wire [7:0] _1231;
    wire [7:0] _1232;
    wire [7:0] _1233;
    wire [7:0] _1234;
    wire [7:0] _96;
    reg [7:0] _1089;
    wire [3:0] pat_data_idx;
    wire _1236;
    wire _1084;
    wire _623;
    wire _624;
    wire _621;
    wire _625;
    wire _1085;
    wire pat_data_wr;
    wire _1237;
    wire [15:0] _1242;
    wire [15:0] _97;
    reg [15:0] _1240;
    wire [3:0] _1402;
    wire _1250;
    wire [7:0] _1251;
    wire [7:0] _1252;
    wire [7:0] _1253;
    wire _1246;
    wire [7:0] _1254;
    wire [7:0] _1255;
    wire [7:0] _1256;
    wire [7:0] _1257;
    wire [7:0] _98;
    reg [7:0] pat_len;
    wire [7:0] _1398;
    wire [3:0] _1399;
    wire _1400;
    wire [3:0] _1404;
    wire [7:0] _1273;
    wire [7:0] _1276;
    wire [7:0] _1278;
    wire [7:0] _1280;
    wire [7:0] _1281;
    wire [7:0] _99;
    reg [7:0] _1264;
    wire _1274;
    wire [3:0] _1405;
    wire _100;
    reg _1267;
    wire _1268;
    wire [3:0] _1407;
    wire [7:0] _1391;
    wire [7:0] _1247;
    wire _1282;
    wire [7:0] _1283;
    wire [7:0] _1284;
    wire [7:0] _1285;
    wire [7:0] _1286;
    wire [7:0] _101;
    reg [7:0] _361;
    wire _1248;
    wire [7:0] _1392;
    wire [1:0] _1066;
    wire [1:0] _1365;
    wire [1:0] _1366;
    wire _1041;
    wire _1038;
    wire _1036;
    wire _1039;
    wire _1042;
    wire _1363;
    wire _1362;
    wire _1364;
    wire [1:0] _1367;
    wire _1343;
    wire _1340;
    wire _1338;
    wire _1341;
    wire _1344;
    wire [7:0] _1347;
    wire _1335;
    wire _1333;
    wire _1336;
    wire [7:0] _1349;
    wire _1330;
    wire _1327;
    wire _1324;
    wire _1321;
    wire _1318;
    wire _1315;
    wire _1312;
    wire _1309;
    wire new_shift;
    wire [6:0] _1287;
    wire [7:0] _1288;
    wire [7:0] _1289;
    wire [7:0] _1290;
    wire [7:0] _102;
    reg [7:0] _373;
    wire [6:0] _374;
    wire [7:0] prog_wr_data;
    wire [7:0] data_wr_data;
    wire [7:0] fifo_rx_data;
    wire [7:0] pat_data_hi;
    wire _1307;
    wire _1310;
    wire _1313;
    wire _1316;
    wire _1319;
    wire _1322;
    wire _1325;
    wire _1328;
    wire _1331;
    wire [7:0] _1350;
    wire [7:0] _1304;
    wire _1302;
    wire [7:0] _1305;
    wire _1301;
    wire [7:0] _1351;
    wire [7:0] _1352;
    wire [7:0] _1353;
    wire [7:0] _1298;
    wire [7:0] _1300;
    wire [7:0] _1354;
    wire [7:0] _103;
    reg [7:0] _366;
    wire _368;
    wire [1:0] _1360;
    wire _1359;
    wire [1:0] _1361;
    wire _1358;
    wire [1:0] _1368;
    wire [1:0] _1369;
    wire [1:0] _1370;
    wire [1:0] _1355;
    wire [1:0] _1357;
    wire [1:0] _1371;
    wire [1:0] _104;
    reg [1:0] _356;
    wire _1390;
    wire [7:0] _1393;
    wire [3:0] _1377;
    wire [3:0] _1379;
    wire [3:0] _1380;
    wire _1296;
    wire [3:0] _1373;
    wire _105;
    reg _1293;
    wire _1294;
    wire _1295;
    wire [3:0] _1375;
    wire [3:0] _1381;
    wire [3:0] _106;
    reg [3:0] _351;
    wire _353;
    wire [7:0] _1394;
    wire _1382;
    wire _107;
    reg _1385;
    wire _108;
    reg _347;
    wire _348;
    wire [7:0] _1395;
    wire _109;
    reg _339;
    wire _340;
    wire vdd;
    wire _111;
    wire _122;
    wire _113;
    wire [7:0] _115;
    wire _1386;
    wire _116;
    reg _1389;
    wire _117;
    reg _336;
    wire _341;
    wire [7:0] _1396;
    wire [7:0] _118;
    reg [7:0] pat_ctrl;
    wire _1261;
    wire [3:0] _1408;
    wire [3:0] _119;
    reg [3:0] _1271;
    reg [15:0] _1272;
    wire [7:0] pat_pins;
    wire [5:0] _1410;
    wire [7:0] _1416;
    assign _2 = ena;
    assign _127 = { _2,
                    _2 };
    assign _128 = { _127,
                    _127 };
    assign _129 = { _128,
                    _128 };
    assign _130 = oe & _129;
    assign _1032 = 8'b00000000;
    assign _1070 = 1'b0;
    assign _1069 = _1033[6:0];
    assign _1071 = { _1069,
                     _1070 };
    assign _1067 = _1066 == _356;
    assign _1068 = _348 & _1067;
    assign _1072 = _1068 ? _1071 : _1065;
    assign core_data_out = data_mem_host_rdata;
    assign _1055 = { vdd,
                     run };
    assign _1054 = ~ tx_empty;
    assign _1056 = { _1054,
                     _1055 };
    assign _1057 = { rx_full,
                     _1056 };
    assign _1053 = 4'b0000;
    assign _1058 = { _1053,
                     _1057 };
    assign _1050 = 8'b11111111;
    assign _252 = 3'b111;
    assign _253 = _251 == _252;
    assign _254 = _253 ? core_tx_data : _248;
    assign _255 = _245 ? _254 : _248;
    assign _6 = _255;
    always @(posedge _113) begin
        if (_122)
            _248 <= _1032;
        else
            _248 <= _6;
    end
    assign _259 = 3'b110;
    assign _260 = _251 == _259;
    assign _261 = _260 ? core_tx_data : _258;
    assign _262 = _245 ? _261 : _258;
    assign _7 = _262;
    always @(posedge _113) begin
        if (_122)
            _258 <= _1032;
        else
            _258 <= _7;
    end
    assign _266 = 3'b101;
    assign _267 = _251 == _266;
    assign _268 = _267 ? core_tx_data : _265;
    assign _269 = _245 ? _268 : _265;
    assign _8 = _269;
    always @(posedge _113) begin
        if (_122)
            _265 <= _1032;
        else
            _265 <= _8;
    end
    assign _273 = 3'b100;
    assign _274 = _251 == _273;
    assign _275 = _274 ? core_tx_data : _272;
    assign _276 = _245 ? _275 : _272;
    assign _9 = _276;
    always @(posedge _113) begin
        if (_122)
            _272 <= _1032;
        else
            _272 <= _9;
    end
    assign _280 = 3'b011;
    assign _281 = _251 == _280;
    assign _282 = _281 ? core_tx_data : _279;
    assign _283 = _245 ? _282 : _279;
    assign _10 = _283;
    always @(posedge _113) begin
        if (_122)
            _279 <= _1032;
        else
            _279 <= _10;
    end
    assign _287 = 3'b010;
    assign _288 = _251 == _287;
    assign _289 = _288 ? core_tx_data : _286;
    assign _290 = _245 ? _289 : _286;
    assign _11 = _290;
    always @(posedge _113) begin
        if (_122)
            _286 <= _1032;
        else
            _286 <= _11;
    end
    assign _294 = 3'b001;
    assign _295 = _251 == _294;
    assign _296 = _295 ? core_tx_data : _293;
    assign _297 = _245 ? _296 : _293;
    assign _12 = _297;
    always @(posedge _113) begin
        if (_122)
            _293 <= _1032;
        else
            _293 <= _12;
    end
    assign core_tx_data = fifo_tx_data;
    assign _304 = 3'b000;
    assign _299 = _251 + _294;
    assign _300 = _245 ? _299 : _251;
    assign _14 = _300;
    always @(posedge _113) begin
        if (_122)
            _251 <= _304;
        else
            _251 <= _14;
    end
    assign _305 = _251 == _304;
    assign _306 = _305 ? core_tx_data : _303;
    assign _307 = _245 ? _306 : _303;
    assign _15 = _307;
    always @(posedge _113) begin
        if (_122)
            _303 <= _1032;
        else
            _303 <= _15;
    end
    assign _316 = _314 + _294;
    assign _317 = _311 ? _316 : _314;
    assign _16 = _317;
    always @(posedge _113) begin
        if (_122)
            _314 <= _304;
        else
            _314 <= _16;
    end
    always @* begin
        case (_314)
        0:
            fifo_data <= _303;
        1:
            fifo_data <= _293;
        2:
            fifo_data <= _286;
        3:
            fifo_data <= _279;
        4:
            fifo_data <= _272;
        5:
            fifo_data <= _265;
        6:
            fifo_data <= _258;
        default:
            fifo_data <= _248;
        endcase
    end
    assign tx_data = fifo_data;
    assign _1026 = 4'b0001;
    assign _1027 = fifo_level_0 - _1026;
    assign _1024 = fifo_level_0 + _1026;
    assign _1021 = ~ _311;
    assign _1022 = _245 & _1021;
    assign _1025 = _1022 ? _1024 : fifo_level_0;
    assign _244 = ~ fifo_full;
    assign _1008 = 5'b11100;
    assign _1009 = op == _1008;
    assign _324 = 8'b00000001;
    assign _325 = _180 + _324;
    assign _322 = _180 < imm;
    assign _326 = _322 ? _325 : _1032;
    assign _319 = 5'b01101;
    assign _320 = op == _319;
    assign _327 = _320 ? _326 : _1032;
    assign _328 = host_run ? _327 : _180;
    assign _18 = _328;
    always @(posedge _113) begin
        if (_123)
            _180 <= _1032;
        else
            _180 <= _18;
    end
    assign _181 = _180 == imm;
    assign _175 = cyc[7:0];
    assign _176 = _175 == imm;
    assign _169 = imm[0:0];
    assign _170 = pin_arg == _169;
    assign _242 = 4'b1000;
    assign fifo_full = fifo_level_0 == _242;
    assign tx_full = fifo_full;
    assign _156 = ~ tx_full;
    assign rx_empty = fifo_empty;
    assign _154 = ~ rx_empty;
    assign _153 = _149 ? _152 : vdd;
    assign _143 = 5'b11101;
    assign _144 = op == _143;
    assign _155 = _144 ? _154 : _153;
    assign _142 = op == _1008;
    assign _157 = _142 ? _156 : _155;
    assign _139 = 5'b01111;
    assign _140 = op == _139;
    assign _171 = _140 ? _170 : _157;
    assign _137 = 5'b01110;
    assign _138 = op == _137;
    assign _177 = _138 ? _176 : _171;
    assign _1005 = 16'b1111111111111111;
    assign _1004 = 16'b0000000000000000;
    assign _369 = ~ _368;
    assign _362 = 8'b00000010;
    assign _363 = _361 == _362;
    assign _370 = _363 & _369;
    assign _377 = _370 ? prog_wr_data : _344;
    assign _358 = _356 == _457;
    assign _378 = _358 ? _377 : _344;
    assign _379 = _353 ? _378 : _344;
    assign _380 = _348 ? _379 : _344;
    assign _381 = _341 ? _380 : _344;
    assign _21 = _381;
    always @(posedge _113) begin
        if (_122)
            _344 <= _1032;
        else
            _344 <= _21;
    end
    assign _382 = { _344,
                    prog_wr_data };
    assign host_prog_wr_data = _382;
    assign host_prog_wr_addr = host_data_rd_addr_0;
    assign _431 = fetch_addr + _324;
    assign _432 = advance ? _431 : pc;
    assign _433 = host_run ? _432 : pc;
    assign _24 = _433;
    always @(posedge _113) begin
        if (_123)
            pc <= _1032;
        else
            pc <= _24;
    end
    assign _425 = _423 == _1032;
    assign _426 = ~ _425;
    assign _420 = 5'b10111;
    assign _421 = op == _420;
    assign branch_taken = _421 & _426;
    assign _417 = ~ pin_arg;
    assign _415 = 5'b10110;
    assign _416 = op == _415;
    assign _418 = _416 & _417;
    assign _411 = 5'b10101;
    assign _412 = op == _411;
    assign _413 = _412 & pin_arg;
    assign _408 = ~ _403;
    assign _406 = 5'b10100;
    assign _407 = op == _406;
    assign _409 = _407 & _408;
    assign _403 = _212[1:1];
    assign _401 = 5'b10011;
    assign _402 = op == _401;
    assign _404 = _402 & _403;
    assign _398 = ~ _393;
    assign _396 = 5'b10010;
    assign _397 = op == _396;
    assign _399 = _397 & _398;
    assign _984 = alu_result == _1032;
    assign _978 = _840[8:8];
    assign _977 = _836[8:8];
    assign _975 = reg_val[0:0];
    assign _974 = reg_val[7:7];
    always @* begin
        case (_767)
        0:
            _982 <= _974;
        1:
            _982 <= _975;
        2:
            _982 <= _1070;
        3:
            _982 <= _977;
        4:
            _982 <= _978;
        5:
            _982 <= _1070;
        6:
            _982 <= _1070;
        default:
            _982 <= _1070;
        endcase
    end
    assign _985 = { _982,
                    _984 };
    assign _973 = 6'b000000;
    assign _986 = { _973,
                    _985 };
    assign _854 = imm[2:0];
    always @* begin
        case (_854)
        0:
            reg_src <= fifo_tx_data;
        1:
            reg_src <= _206;
        2:
            reg_src <= _197;
        3:
            reg_src <= pins_out;
        4:
            reg_src <= oe;
        5:
            reg_src <= _209;
        6:
            reg_src <= _212;
        default:
            reg_src <= _215;
        endcase
    end
    assign _434 = ~ _152;
    assign _435 = _149 & _434;
    assign _436 = _435 ? _225 : _228;
    assign _437 = host_run ? _436 : _228;
    assign _25 = _437;
    always @(posedge _113) begin
        if (_123)
            _228 <= _1032;
        else
            _228 <= _25;
    end
    assign _223 = 5'b01010;
    assign _224 = op == _223;
    assign _225 = _224 ? _197 : imm;
    assign _439 = ~ _152;
    assign _440 = _149 ? _439 : _1070;
    assign _441 = host_run ? _440 : _152;
    assign _26 = _441;
    always @(posedge _113) begin
        if (_123)
            _152 <= _1070;
        else
            _152 <= _26;
    end
    assign _229 = _152 ? _228 : _225;
    assign host_data_rd_addr = host_data_rd_addr_0;
    assign _148 = op == _223;
    assign _145 = 5'b11110;
    assign _146 = op == _145;
    assign _149 = _146 | _148;
    assign _230 = _149 ? _229 : host_data_rd_addr;
    assign _449 = cyc[15:8];
    assign _442 = 16'b0000000000000001;
    assign _443 = cyc + _442;
    assign _444 = host_run ? _443 : cyc;
    assign _28 = _444;
    always @(posedge _113) begin
        if (_123)
            cyc <= _1004;
        else
            cyc <= _28;
    end
    assign _448 = cyc[7:0];
    always @* begin
        case (_447)
        0:
            _450 <= _61;
        1:
            _450 <= _448;
        default:
            _450 <= _449;
        endcase
    end
    assign cap_wr_data = _450;
    assign host_data_wr_data = prog_wr_data;
    assign _217 = host_data_wr ? host_data_wr_data : reg_val;
    assign _218 = cap_wr ? cap_wr_data : _217;
    assign _479 = cap_base + _456;
    assign _481 = _479 + _362;
    assign _476 = cap_base + _456;
    assign _478 = _476 + _324;
    assign _459 = 8'b00000011;
    assign _460 = _456 + _459;
    assign _461 = _458 ? _460 : _456;
    assign _462 = _453 ? _461 : _456;
    assign _31 = _462;
    always @(posedge _113) begin
        if (_122)
            _456 <= _1032;
        else
            _456 <= _31;
    end
    assign _469 = _368 ? cap_base : prog_wr_data;
    assign _470 = _468 ? _469 : cap_base;
    assign _466 = _356 == _457;
    assign _471 = _466 ? _470 : cap_base;
    assign _472 = _353 ? _471 : cap_base;
    assign _473 = _348 ? _472 : cap_base;
    assign _474 = _341 ? _473 : cap_base;
    assign _32 = _474;
    always @(posedge _113) begin
        if (_122)
            cap_base <= _1032;
        else
            cap_base <= _32;
    end
    assign _475 = cap_base + _456;
    always @* begin
        case (_447)
        0:
            _482 <= _475;
        1:
            _482 <= _478;
        default:
            _482 <= _481;
        endcase
    end
    assign cap_wr_addr = _482;
    assign _500 = host_data_rd_addr_0 + _324;
    assign _496 = host_data_rd_addr_0 + _324;
    assign _493 = _368 ? prog_wr_data : host_data_rd_addr_0;
    assign _492 = _361 == _324;
    assign _494 = _492 ? _493 : host_data_rd_addr_0;
    assign _489 = _361 == _362;
    assign _490 = _489 & _368;
    assign _497 = _490 ? _496 : _494;
    assign _487 = _361 == _459;
    assign _498 = _487 ? prog_wr_data : _497;
    assign _484 = 8'b00000100;
    assign _485 = _361 == _484;
    assign _501 = _485 ? _500 : _498;
    assign _483 = _356 == _457;
    assign _502 = _483 ? _501 : host_data_rd_addr_0;
    assign _503 = _353 ? _502 : host_data_rd_addr_0;
    assign _504 = _348 ? _503 : host_data_rd_addr_0;
    assign _505 = _341 ? _504 : host_data_rd_addr_0;
    assign _34 = _505;
    always @(posedge _113) begin
        if (_122)
            host_data_rd_addr_0 <= _1032;
        else
            host_data_rd_addr_0 <= _34;
    end
    assign host_data_wr_addr = host_data_rd_addr_0;
    assign _193 = 5'b01011;
    assign _194 = op == _193;
    assign _198 = _194 ? _197 : imm;
    assign _199 = host_data_wr ? host_data_wr_addr : _198;
    assign _200 = cap_wr ? cap_wr_addr : _199;
    assign _457 = 2'b10;
    assign _446 = 2'b00;
    assign _604 = 2'b01;
    assign _605 = _447 + _604;
    assign _606 = _458 ? _603 : _605;
    assign _602 = _600 ? _446 : _447;
    assign _603 = _511 ? _602 : _447;
    assign _607 = _453 ? _606 : _603;
    assign _36 = _607;
    always @(posedge _113) begin
        if (_122)
            _447 <= _446;
        else
            _447 <= _36;
    end
    assign _458 = _447 == _457;
    assign _619 = _458 ? _1070 : _617;
    assign _615 = 1'b1;
    assign _592 = _527 | _536;
    assign _593 = _592 | _545;
    assign _594 = _593 | _554;
    assign _595 = _594 | _563;
    assign _596 = _595 | _572;
    assign _597 = _596 | _581;
    assign _598 = _597 | _590;
    assign _587 = _520[7:7];
    assign _588 = ~ _587;
    assign _586 = _61[7:7];
    assign _589 = _586 & _588;
    assign _584 = _520[7:7];
    assign _582 = _61[7:7];
    assign _583 = ~ _582;
    assign _585 = _583 & _584;
    assign _590 = _515 ? _589 : _585;
    assign _578 = _520[6:6];
    assign _579 = ~ _578;
    assign _577 = _61[6:6];
    assign _580 = _577 & _579;
    assign _575 = _520[6:6];
    assign _573 = _61[6:6];
    assign _574 = ~ _573;
    assign _576 = _574 & _575;
    assign _581 = _515 ? _580 : _576;
    assign _569 = _520[5:5];
    assign _570 = ~ _569;
    assign _568 = _61[5:5];
    assign _571 = _568 & _570;
    assign _566 = _520[5:5];
    assign _564 = _61[5:5];
    assign _565 = ~ _564;
    assign _567 = _565 & _566;
    assign _572 = _515 ? _571 : _567;
    assign _560 = _520[4:4];
    assign _561 = ~ _560;
    assign _559 = _61[4:4];
    assign _562 = _559 & _561;
    assign _557 = _520[4:4];
    assign _555 = _61[4:4];
    assign _556 = ~ _555;
    assign _558 = _556 & _557;
    assign _563 = _515 ? _562 : _558;
    assign _551 = _520[3:3];
    assign _552 = ~ _551;
    assign _550 = _61[3:3];
    assign _553 = _550 & _552;
    assign _548 = _520[3:3];
    assign _546 = _61[3:3];
    assign _547 = ~ _546;
    assign _549 = _547 & _548;
    assign _554 = _515 ? _553 : _549;
    assign _542 = _520[2:2];
    assign _543 = ~ _542;
    assign _541 = _61[2:2];
    assign _544 = _541 & _543;
    assign _539 = _520[2:2];
    assign _537 = _61[2:2];
    assign _538 = ~ _537;
    assign _540 = _538 & _539;
    assign _545 = _515 ? _544 : _540;
    assign _533 = _520[1:1];
    assign _534 = ~ _533;
    assign _532 = _61[1:1];
    assign _535 = _532 & _534;
    assign _530 = _520[1:1];
    assign _528 = _61[1:1];
    assign _529 = ~ _528;
    assign _531 = _529 & _530;
    assign _536 = _515 ? _535 : _531;
    assign _524 = _520[0:0];
    assign _525 = ~ _524;
    assign _523 = _61[0:0];
    assign _526 = _523 & _525;
    assign _37 = _61;
    always @(posedge _113) begin
        if (_122)
            _520 <= _1032;
        else
            _520 <= _37;
    end
    assign _521 = _520[0:0];
    assign _516 = _61[0:0];
    assign _517 = ~ _516;
    assign _522 = _517 & _521;
    assign _515 = cap_ctrl[1:1];
    assign _527 = _515 ? _526 : _522;
    assign _514 = cap_ctrl[4:2];
    always @* begin
        case (_514)
        0:
            _591 <= _527;
        1:
            _591 <= _536;
        2:
            _591 <= _545;
        3:
            _591 <= _554;
        4:
            _591 <= _563;
        5:
            _591 <= _572;
        6:
            _591 <= _581;
        default:
            _591 <= _590;
        endcase
    end
    assign _513 = cap_ctrl[5:5];
    assign _599 = _513 ? _598 : _591;
    assign _512 = _509 & _510;
    assign _600 = _512 & _599;
    assign _616 = _600 ? _615 : _453;
    assign _510 = ~ _453;
    assign _609 = _368 ? prog_wr_data : cap_ctrl;
    assign _467 = 8'b00001010;
    assign _468 = _361 == _467;
    assign _610 = _468 ? _609 : cap_ctrl;
    assign _608 = _356 == _457;
    assign _611 = _608 ? _610 : cap_ctrl;
    assign _612 = _353 ? _611 : cap_ctrl;
    assign _613 = _348 ? _612 : cap_ctrl;
    assign _614 = _341 ? _613 : cap_ctrl;
    assign _38 = _614;
    always @(posedge _113) begin
        if (_122)
            cap_ctrl <= _1032;
        else
            cap_ctrl <= _38;
    end
    assign _509 = cap_ctrl[0:0];
    assign _511 = _509 & _510;
    assign _617 = _511 ? _616 : _453;
    assign _620 = _453 ? _619 : _617;
    assign _39 = _620;
    always @(posedge _113) begin
        if (_122)
            _453 <= _1070;
        else
            _453 <= _39;
    end
    assign cap_wr = _453;
    assign _188 = op == _193;
    assign _189 = advance & _188;
    assign _183 = 5'b11111;
    assign _184 = op == _183;
    assign _185 = advance & _184;
    assign _627 = _361 == _484;
    assign data_wr = _625 & _627;
    assign host_data_wr = data_wr;
    assign _186 = host_data_wr | _185;
    assign _190 = _186 | _189;
    assign _191 = _190 | cap_wr;
    RM_IHPSG13_2P_256x8_c2_bm_bist
        the_RM_IHPSG13_2P_256x8_c2_bm_bist
        ( .A_CLK(_113),
          .A_MEN(vdd),
          .A_WEN(_191),
          .A_REN(gnd),
          .A_ADDR(_200),
          .A_DIN(_218),
          .A_DLY(gnd),
          .A_BM(_1050),
          .A_BIST_CLK(gnd),
          .A_BIST_EN(gnd),
          .A_BIST_MEN(gnd),
          .A_BIST_WEN(gnd),
          .A_BIST_REN(gnd),
          .A_BIST_ADDR(_1032),
          .A_BIST_DIN(_1032),
          .A_BIST_BM(_1050),
          .B_CLK(_113),
          .B_MEN(vdd),
          .B_WEN(gnd),
          .B_REN(vdd),
          .B_ADDR(_230),
          .B_DIN(_1032),
          .B_DLY(gnd),
          .B_BM(_1050),
          .B_BIST_CLK(gnd),
          .B_BIST_EN(gnd),
          .B_BIST_MEN(gnd),
          .B_BIST_WEN(gnd),
          .B_BIST_REN(gnd),
          .B_BIST_ADDR(_1032),
          .B_BIST_DIN(_1032),
          .B_BIST_BM(_1050),
          .B_DOUT(_237[15:8]),
          .A_DOUT(_237[7:0]) );
    assign data_mem_host_rdata = _237[15:8];
    assign _849 = imm[2:0];
    always @* begin
        case (_849)
        0:
            pin_imm <= _159;
        1:
            pin_imm <= _160;
        2:
            pin_imm <= _161;
        3:
            pin_imm <= _162;
        4:
            pin_imm <= _163;
        5:
            pin_imm <= _164;
        6:
            pin_imm <= _165;
        default:
            pin_imm <= _166;
        endcase
    end
    assign _848 = 7'b0000000;
    assign _851 = { _848,
                    pin_imm };
    assign _640 = _638 == _252;
    assign _641 = _640 ? host_rx_data : _635;
    assign _642 = _632 ? _641 : _635;
    assign _42 = _642;
    always @(posedge _113) begin
        if (_122)
            _635 <= _1032;
        else
            _635 <= _42;
    end
    assign _647 = _638 == _259;
    assign _648 = _647 ? host_rx_data : _645;
    assign _649 = _632 ? _648 : _645;
    assign _43 = _649;
    always @(posedge _113) begin
        if (_122)
            _645 <= _1032;
        else
            _645 <= _43;
    end
    assign _654 = _638 == _266;
    assign _655 = _654 ? host_rx_data : _652;
    assign _656 = _632 ? _655 : _652;
    assign _44 = _656;
    always @(posedge _113) begin
        if (_122)
            _652 <= _1032;
        else
            _652 <= _44;
    end
    assign _661 = _638 == _273;
    assign _662 = _661 ? host_rx_data : _659;
    assign _663 = _632 ? _662 : _659;
    assign _45 = _663;
    always @(posedge _113) begin
        if (_122)
            _659 <= _1032;
        else
            _659 <= _45;
    end
    assign _668 = _638 == _280;
    assign _669 = _668 ? host_rx_data : _666;
    assign _670 = _632 ? _669 : _666;
    assign _46 = _670;
    always @(posedge _113) begin
        if (_122)
            _666 <= _1032;
        else
            _666 <= _46;
    end
    assign _675 = _638 == _287;
    assign _676 = _675 ? host_rx_data : _673;
    assign _677 = _632 ? _676 : _673;
    assign _47 = _677;
    always @(posedge _113) begin
        if (_122)
            _673 <= _1032;
        else
            _673 <= _47;
    end
    assign _682 = _638 == _294;
    assign _683 = _682 ? host_rx_data : _680;
    assign _684 = _632 ? _683 : _680;
    assign _48 = _684;
    always @(posedge _113) begin
        if (_122)
            _680 <= _1032;
        else
            _680 <= _48;
    end
    assign host_rx_data = prog_wr_data;
    assign _686 = _638 + _294;
    assign _687 = _632 ? _686 : _638;
    assign _50 = _687;
    always @(posedge _113) begin
        if (_122)
            _638 <= _304;
        else
            _638 <= _50;
    end
    assign _692 = _638 == _304;
    assign _693 = _692 ? host_rx_data : _690;
    assign _694 = _632 ? _693 : _690;
    assign _51 = _694;
    always @(posedge _113) begin
        if (_122)
            _690 <= _1032;
        else
            _690 <= _51;
    end
    assign _719 = _717 + _294;
    assign _710 = fifo_level - _1026;
    assign _707 = fifo_level + _1026;
    assign _704 = ~ _701;
    assign _705 = _632 & _704;
    assign _708 = _705 ? _707 : fifo_level;
    assign _631 = ~ fifo_full_0;
    assign fifo_full_0 = fifo_level == _242;
    assign rx_full = fifo_full_0;
    assign _698 = ~ rx_full;
    assign _695 = 8'b00001000;
    assign _696 = _361 == _695;
    assign _697 = _625 & _696;
    assign fifo_rx_push = _697 & _698;
    assign host_rx_push = fifo_rx_push;
    assign _632 = host_rx_push & _631;
    assign _702 = ~ _632;
    assign _703 = _701 & _702;
    assign _711 = _703 ? _710 : _708;
    assign _54 = _711;
    always @(posedge _113) begin
        if (_122)
            fifo_level <= _1053;
        else
            fifo_level <= _54;
    end
    assign fifo_empty = fifo_level == _1053;
    assign _700 = ~ fifo_empty;
    assign _713 = op == _143;
    assign fifo_rx_pop = advance & _713;
    assign core_rx_pop = fifo_rx_pop;
    assign _701 = core_rx_pop & _700;
    assign _720 = _701 ? _719 : _717;
    assign _56 = _720;
    always @(posedge _113) begin
        if (_122)
            _717 <= _304;
        else
            _717 <= _56;
    end
    always @* begin
        case (_717)
        0:
            fifo_data_0 <= _690;
        1:
            fifo_data_0 <= _680;
        2:
            fifo_data_0 <= _673;
        3:
            fifo_data_0 <= _666;
        4:
            fifo_data_0 <= _659;
        5:
            fifo_data_0 <= _652;
        6:
            fifo_data_0 <= _645;
        default:
            fifo_data_0 <= _635;
        endcase
    end
    assign rx_data = fifo_data_0;
    assign _844 = reg_val ^ imm;
    assign _843 = reg_val | imm;
    assign _842 = reg_val & imm;
    assign _839 = { _1070,
                    reg_val };
    assign _840 = _839 - _835;
    assign _841 = _840[7:0];
    assign _835 = { _1070,
                    imm };
    assign _833 = { _1070,
                    reg_val };
    assign _836 = _833 + _835;
    assign _837 = _836[7:0];
    assign _819 = _817[7:4];
    assign _820 = { _1053,
                    _819 };
    assign _815 = _813[7:2];
    assign _816 = { _446,
                    _815 };
    assign _811 = reg_val[7:1];
    assign _812 = { _1070,
                    _811 };
    assign _809 = _771[0:0];
    assign _813 = _809 ? _812 : reg_val;
    assign _808 = _771[1:1];
    assign _817 = _808 ? _816 : _813;
    assign _807 = _771[2:2];
    assign _821 = _807 ? _820 : _817;
    assign _806 = _771[3:3];
    assign _823 = _806 ? _1032 : _821;
    assign _805 = _771[4:4];
    assign _825 = _805 ? _1032 : _823;
    assign _804 = _771[5:5];
    assign _827 = _804 ? _1032 : _825;
    assign _803 = _771[6:6];
    assign _829 = _803 ? _1032 : _827;
    assign _802 = _771[7:7];
    assign _831 = _802 ? _1032 : _829;
    assign _788 = _787[3:0];
    assign _790 = { _788,
                    _1053 };
    assign _784 = _783[5:0];
    assign _786 = { _784,
                    _446 };
    assign _780 = reg_val[6:0];
    assign _782 = { _780,
                    _1070 };
    assign _751 = arg == _252;
    assign _858 = _751 ? reg_write_value : _215;
    assign _859 = _749 ? _858 : _215;
    assign _860 = advance ? _859 : _215;
    assign _861 = host_run ? _860 : _215;
    assign _58 = _861;
    always @(posedge _113) begin
        if (_123)
            _215 <= _1032;
        else
            _215 <= _58;
    end
    assign _863 = arg == _273;
    assign _864 = _863 ? reg_write_value : oe;
    assign _865 = _749 ? _864 : oe;
    assign _866 = advance ? _865 : oe;
    assign _867 = host_run ? _866 : oe;
    assign _59 = _867;
    always @(posedge _113) begin
        if (_123)
            oe <= _1032;
        else
            oe <= _59;
    end
    assign _937 = pins_out[6:0];
    assign _938 = { _917,
                    _937 };
    assign _935 = pins_out[5:0];
    assign _934 = pins_out[7:7];
    assign _936 = { _934,
                    _917,
                    _935 };
    assign _932 = pins_out[4:0];
    assign _931 = pins_out[7:6];
    assign _933 = { _931,
                    _917,
                    _932 };
    assign _929 = pins_out[3:0];
    assign _928 = pins_out[7:5];
    assign _930 = { _928,
                    _917,
                    _929 };
    assign _926 = pins_out[2:0];
    assign _925 = pins_out[7:4];
    assign _927 = { _925,
                    _917,
                    _926 };
    assign _923 = pins_out[1:0];
    assign _922 = pins_out[7:3];
    assign _924 = { _922,
                    _917,
                    _923 };
    assign _920 = pins_out[0:0];
    assign _919 = pins_out[7:2];
    assign _921 = { _919,
                    _917,
                    _920 };
    assign _166 = _61[7:7];
    assign _165 = _61[6:6];
    assign _164 = _61[5:5];
    assign _163 = _61[4:4];
    assign _162 = _61[3:3];
    assign _161 = _61[2:2];
    assign _160 = _61[1:1];
    assign _61 = uio_in;
    assign _159 = _61[0:0];
    always @* begin
        case (arg)
        0:
            pin_arg <= _159;
        1:
            pin_arg <= _160;
        2:
            pin_arg <= _161;
        3:
            pin_arg <= _162;
        4:
            pin_arg <= _163;
        5:
            pin_arg <= _164;
        6:
            pin_arg <= _165;
        default:
            pin_arg <= _166;
        endcase
    end
    assign _880 = _209[6:0];
    assign _881 = { _880,
                    pin_arg };
    assign _876 = _209[6:0];
    assign _878 = { _876,
                    _1070 };
    assign _873 = arg == _266;
    assign _874 = _873 ? reg_write_value : _209;
    assign _875 = _749 ? _874 : _209;
    assign _879 = _871 ? _878 : _875;
    assign _868 = 5'b11011;
    assign _869 = op == _868;
    assign _882 = _869 ? _881 : _879;
    assign _883 = advance ? _882 : _209;
    assign _884 = host_run ? _883 : _209;
    assign _62 = _884;
    always @(posedge _113) begin
        if (_123)
            _209 <= _1032;
        else
            _209 <= _62;
    end
    assign _917 = _209[7:7];
    assign _916 = pins_out[7:1];
    assign _918 = { _916,
                    _917 };
    always @* begin
        case (arg)
        0:
            _939 <= _918;
        1:
            _939 <= _921;
        2:
            _939 <= _924;
        3:
            _939 <= _927;
        4:
            _939 <= _930;
        5:
            _939 <= _933;
        6:
            _939 <= _936;
        default:
            _939 <= _938;
        endcase
    end
    assign _912 = pins_out[6:0];
    assign _913 = { _892,
                    _912 };
    assign _910 = pins_out[5:0];
    assign _909 = pins_out[7:7];
    assign _911 = { _909,
                    _892,
                    _910 };
    assign _907 = pins_out[4:0];
    assign _906 = pins_out[7:6];
    assign _908 = { _906,
                    _892,
                    _907 };
    assign _904 = pins_out[3:0];
    assign _903 = pins_out[7:5];
    assign _905 = { _903,
                    _892,
                    _904 };
    assign _901 = pins_out[2:0];
    assign _900 = pins_out[7:4];
    assign _902 = { _900,
                    _892,
                    _901 };
    assign _898 = pins_out[1:0];
    assign _897 = pins_out[7:3];
    assign _899 = { _897,
                    _892,
                    _898 };
    assign _895 = pins_out[0:0];
    assign _894 = pins_out[7:2];
    assign _896 = { _894,
                    _892,
                    _895 };
    assign _892 = imm[0:0];
    assign _891 = pins_out[7:1];
    assign _893 = { _891,
                    _892 };
    always @* begin
        case (arg)
        0:
            _914 <= _893;
        1:
            _914 <= _896;
        2:
            _914 <= _899;
        3:
            _914 <= _902;
        4:
            _914 <= _905;
        5:
            _914 <= _908;
        6:
            _914 <= _911;
        default:
            _914 <= _913;
        endcase
    end
    assign _888 = arg == _280;
    assign _889 = _888 ? reg_write_value : pins_out;
    assign _890 = _749 ? _889 : pins_out;
    assign _885 = 5'b01100;
    assign _886 = op == _885;
    assign _915 = _886 ? _914 : _890;
    assign _870 = 5'b11010;
    assign _871 = op == _870;
    assign _940 = _871 ? _939 : _915;
    assign _941 = advance ? _940 : pins_out;
    assign _942 = host_run ? _941 : pins_out;
    assign _63 = _942;
    always @(posedge _113) begin
        if (_123)
            pins_out <= _1032;
        else
            pins_out <= _63;
    end
    assign _944 = arg == _287;
    assign _945 = _944 ? reg_write_value : _197;
    assign _946 = _749 ? _945 : _197;
    assign _947 = advance ? _946 : _197;
    assign _948 = host_run ? _947 : _197;
    assign _64 = _948;
    always @(posedge _113) begin
        if (_123)
            _197 <= _1032;
        else
            _197 <= _64;
    end
    assign _423 = _206 - _324;
    assign _952 = arg == _294;
    assign _953 = _952 ? reg_write_value : _206;
    assign _954 = _749 ? _953 : _206;
    assign _950 = op == _420;
    assign _955 = _950 ? _423 : _954;
    assign _956 = advance ? _955 : _206;
    assign _957 = host_run ? _956 : _206;
    assign _65 = _957;
    always @(posedge _113) begin
        if (_123)
            _206 <= _1032;
        else
            _206 <= _65;
    end
    assign _961 = prog_wr_data[1:1];
    assign _958 = 8'b00000110;
    assign _959 = _361 == _958;
    assign _960 = _625 & _959;
    assign reset_core = _960 & _961;
    assign host_reset_core = reset_core;
    assign _123 = _122 | host_reset_core;
    assign _964 = arg == _304;
    assign _965 = _964 ? reg_write_value : fifo_tx_data;
    assign _966 = _749 ? _965 : fifo_tx_data;
    assign _967 = advance ? _966 : fifo_tx_data;
    assign _968 = host_run ? _967 : fifo_tx_data;
    assign _67 = _968;
    always @(posedge _113) begin
        if (_123)
            fifo_tx_data <= _1032;
        else
            fifo_tx_data <= _67;
    end
    always @* begin
        case (arg)
        0:
            reg_val <= fifo_tx_data;
        1:
            reg_val <= _206;
        2:
            reg_val <= _197;
        3:
            reg_val <= pins_out;
        4:
            reg_val <= oe;
        5:
            reg_val <= _209;
        6:
            reg_val <= _212;
        default:
            reg_val <= _215;
        endcase
    end
    assign _779 = _771[0:0];
    assign _783 = _779 ? _782 : reg_val;
    assign _778 = _771[1:1];
    assign _787 = _778 ? _786 : _783;
    assign _777 = _771[2:2];
    assign _791 = _777 ? _790 : _787;
    assign _776 = _771[3:3];
    assign _793 = _776 ? _1032 : _791;
    assign _775 = _771[4:4];
    assign _795 = _775 ? _1032 : _793;
    assign _774 = _771[5:5];
    assign _797 = _774 ? _1032 : _795;
    assign _773 = _771[6:6];
    assign _799 = _773 ? _1032 : _797;
    assign imm = _73[7:0];
    assign _769 = imm == _1032;
    assign _771 = _769 ? _695 : imm;
    assign _772 = _771[7:7];
    assign _801 = _772 ? _1032 : _799;
    assign _767 = op[2:0];
    always @* begin
        case (_767)
        0:
            alu_result <= _801;
        1:
            alu_result <= _831;
        2:
            alu_result <= _837;
        3:
            alu_result <= _837;
        4:
            alu_result <= _841;
        5:
            alu_result <= _842;
        6:
            alu_result <= _843;
        default:
            alu_result <= _844;
        endcase
    end
    assign _766 = op == _143;
    assign _846 = _766 ? rx_data : alu_result;
    assign _763 = 5'b11001;
    assign _764 = op == _763;
    assign _847 = _764 ? _61 : _846;
    assign _761 = 5'b11000;
    assign _762 = op == _761;
    assign _852 = _762 ? _851 : _847;
    assign _759 = op == _223;
    assign _757 = op == _145;
    assign _760 = _757 | _759;
    assign _853 = _760 ? data_mem_host_rdata : _852;
    assign _754 = 5'b00010;
    assign _755 = op == _754;
    assign _856 = _755 ? reg_src : _853;
    assign _752 = 5'b00001;
    assign _753 = op == _752;
    assign reg_write_value = _753 ? imm : _856;
    assign arg = _73[10:8];
    assign _970 = arg == _259;
    assign _971 = _970 ? reg_write_value : _212;
    assign _748 = op == _143;
    assign _745 = op == _763;
    assign _742 = op == _761;
    assign _739 = op == _223;
    assign _736 = op == _145;
    assign _725 = op == _754;
    assign _723 = op == _752;
    assign _726 = _723 | _725;
    assign _734 = _726 | _733;
    assign _737 = _734 | _736;
    assign _740 = _737 | _739;
    assign _743 = _740 | _742;
    assign _746 = _743 | _745;
    assign _749 = _746 | _748;
    assign _972 = _749 ? _971 : _212;
    assign _730 = 5'b01001;
    assign _731 = _730 < op;
    assign _732 = ~ _731;
    assign _727 = 5'b00011;
    assign _728 = op < _727;
    assign _729 = ~ _728;
    assign _733 = _729 & _732;
    assign _987 = _733 ? _986 : _972;
    assign _988 = advance ? _987 : _212;
    assign _989 = host_run ? _988 : _212;
    assign _68 = _989;
    always @(posedge _113) begin
        if (_123)
            _212 <= _1032;
        else
            _212 <= _68;
    end
    assign _393 = _212[0:0];
    assign _391 = 5'b10001;
    assign _392 = op == _391;
    assign _394 = _392 & _393;
    assign _389 = 5'b10000;
    assign _390 = op == _389;
    assign _395 = _390 | _394;
    assign _400 = _395 | _399;
    assign _405 = _400 | _404;
    assign _410 = _405 | _409;
    assign _414 = _410 | _413;
    assign _419 = _414 | _418;
    assign _428 = _419 | branch_taken;
    assign fetch_addr = _428 ? imm : pc;
    assign _990 = host_prog_wr ? host_prog_wr_addr : fetch_addr;
    assign _69 = _990;
    assign host_run = run;
    assign _995 = ~ host_run;
    assign _996 = advance | _995;
    assign _994 = ~ host_prog_wr;
    assign _997 = _994 & _996;
    assign _71 = _997;
    assign _999 = _361 == _362;
    assign _1000 = _625 & _999;
    assign prog_wr = _1000 & _368;
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
          .A_BM(_1005),
          .A_BIST_CLK(gnd),
          .A_BIST_EN(gnd),
          .A_BIST_MEN(gnd),
          .A_BIST_WEN(gnd),
          .A_BIST_REN(gnd),
          .A_BIST_ADDR(_1032),
          .A_BIST_DIN(_1004),
          .A_BIST_BM(_1005),
          .A_DOUT(_1007[15:0]) );
    assign _73 = _1007;
    assign op = _73[15:11];
    assign _136 = op == _319;
    assign advance = _136 ? _181 : _177;
    assign fifo_tx_push = advance & _1009;
    assign core_tx_push = fifo_tx_push;
    assign _245 = core_tx_push & _244;
    assign _1019 = ~ _245;
    assign _310 = ~ fifo_empty_0;
    assign _1017 = ~ tx_empty;
    assign _1014 = 8'b00001001;
    assign _1015 = prog_wr_data == _1014;
    assign _1012 = _604 == _356;
    assign _1013 = _1012 & _624;
    assign _1016 = _1013 & _1015;
    assign fifo_tx_pop = _1016 & _1017;
    assign host_tx_pop = fifo_tx_pop;
    assign _311 = host_tx_pop & _310;
    assign _1020 = _311 & _1019;
    assign _1028 = _1020 ? _1027 : _1025;
    assign _76 = _1028;
    always @(posedge _113) begin
        if (_122)
            fifo_level_0 <= _1053;
        else
            fifo_level_0 <= _76;
    end
    assign fifo_empty_0 = fifo_level_0 == _1053;
    assign tx_empty = fifo_empty_0;
    assign _1051 = tx_empty ? _1050 : tx_data;
    assign _1048 = prog_wr_data == _1014;
    assign _1052 = _1048 ? _1051 : _1032;
    assign _1045 = 8'b00000111;
    assign _1046 = prog_wr_data == _1045;
    assign _1059 = _1046 ? _1058 : _1052;
    assign _1043 = 8'b00000101;
    assign _1044 = prog_wr_data == _1043;
    assign _1060 = _1044 ? core_data_out : _1059;
    assign _1061 = _1042 ? _1060 : _1033;
    assign _1034 = _356 == _604;
    assign _1062 = _1034 ? _1061 : _1033;
    assign _1063 = _353 ? _1062 : _1033;
    assign _1064 = _348 ? _1063 : _1033;
    assign _1065 = _341 ? _1064 : _1033;
    assign _1029 = ~ _336;
    assign _1030 = _1029 & _339;
    assign _1073 = _1030 ? _1072 : _1065;
    assign _78 = _1073;
    always @(posedge _113) begin
        if (_122)
            _1033 <= _1032;
        else
            _1033 <= _78;
    end
    assign _1413 = _1033[7:7];
    assign gnd = 1'b0;
    assign _1411 = _1066 == _356;
    assign _1412 = _348 & _1411;
    assign miso = _1412 ? _1413 : gnd;
    assign _1077 = prog_wr_data[0:0];
    assign _1076 = _361 == _958;
    assign _1078 = _1076 ? _1077 : run;
    assign _1074 = _356 == _457;
    assign _1079 = _1074 ? _1078 : run;
    assign _1080 = _353 ? _1079 : run;
    assign _1081 = _348 ? _1080 : run;
    assign _1082 = _341 ? _1081 : run;
    assign _79 = _1082;
    always @(posedge _113) begin
        if (_122)
            run <= _1070;
        else
            run <= _79;
    end
    assign _1415 = { run,
                     miso };
    assign _1100 = { prog_wr_data,
                     pat_data_lo };
    assign _1091 = 4'b1111;
    assign _1092 = pat_data_idx == _1091;
    assign _1093 = pat_data_wr & _1092;
    assign _1101 = _1093 ? _1100 : _1096;
    assign _80 = _1101;
    always @(posedge _113) begin
        if (_122)
            _1096 <= _1004;
        else
            _1096 <= _80;
    end
    assign _1108 = { prog_wr_data,
                     pat_data_lo };
    assign _1102 = 4'b1110;
    assign _1103 = pat_data_idx == _1102;
    assign _1104 = pat_data_wr & _1103;
    assign _1109 = _1104 ? _1108 : _1107;
    assign _81 = _1109;
    always @(posedge _113) begin
        if (_122)
            _1107 <= _1004;
        else
            _1107 <= _81;
    end
    assign _1116 = { prog_wr_data,
                     pat_data_lo };
    assign _1110 = 4'b1101;
    assign _1111 = pat_data_idx == _1110;
    assign _1112 = pat_data_wr & _1111;
    assign _1117 = _1112 ? _1116 : _1115;
    assign _82 = _1117;
    always @(posedge _113) begin
        if (_122)
            _1115 <= _1004;
        else
            _1115 <= _82;
    end
    assign _1124 = { prog_wr_data,
                     pat_data_lo };
    assign _1118 = 4'b1100;
    assign _1119 = pat_data_idx == _1118;
    assign _1120 = pat_data_wr & _1119;
    assign _1125 = _1120 ? _1124 : _1123;
    assign _83 = _1125;
    always @(posedge _113) begin
        if (_122)
            _1123 <= _1004;
        else
            _1123 <= _83;
    end
    assign _1132 = { prog_wr_data,
                     pat_data_lo };
    assign _1126 = 4'b1011;
    assign _1127 = pat_data_idx == _1126;
    assign _1128 = pat_data_wr & _1127;
    assign _1133 = _1128 ? _1132 : _1131;
    assign _84 = _1133;
    always @(posedge _113) begin
        if (_122)
            _1131 <= _1004;
        else
            _1131 <= _84;
    end
    assign _1140 = { prog_wr_data,
                     pat_data_lo };
    assign _1134 = 4'b1010;
    assign _1135 = pat_data_idx == _1134;
    assign _1136 = pat_data_wr & _1135;
    assign _1141 = _1136 ? _1140 : _1139;
    assign _85 = _1141;
    always @(posedge _113) begin
        if (_122)
            _1139 <= _1004;
        else
            _1139 <= _85;
    end
    assign _1148 = { prog_wr_data,
                     pat_data_lo };
    assign _1142 = 4'b1001;
    assign _1143 = pat_data_idx == _1142;
    assign _1144 = pat_data_wr & _1143;
    assign _1149 = _1144 ? _1148 : _1147;
    assign _86 = _1149;
    always @(posedge _113) begin
        if (_122)
            _1147 <= _1004;
        else
            _1147 <= _86;
    end
    assign _1156 = { prog_wr_data,
                     pat_data_lo };
    assign _1151 = pat_data_idx == _242;
    assign _1152 = pat_data_wr & _1151;
    assign _1157 = _1152 ? _1156 : _1155;
    assign _87 = _1157;
    always @(posedge _113) begin
        if (_122)
            _1155 <= _1004;
        else
            _1155 <= _87;
    end
    assign _1164 = { prog_wr_data,
                     pat_data_lo };
    assign _1158 = 4'b0111;
    assign _1159 = pat_data_idx == _1158;
    assign _1160 = pat_data_wr & _1159;
    assign _1165 = _1160 ? _1164 : _1163;
    assign _88 = _1165;
    always @(posedge _113) begin
        if (_122)
            _1163 <= _1004;
        else
            _1163 <= _88;
    end
    assign _1172 = { prog_wr_data,
                     pat_data_lo };
    assign _1166 = 4'b0110;
    assign _1167 = pat_data_idx == _1166;
    assign _1168 = pat_data_wr & _1167;
    assign _1173 = _1168 ? _1172 : _1171;
    assign _89 = _1173;
    always @(posedge _113) begin
        if (_122)
            _1171 <= _1004;
        else
            _1171 <= _89;
    end
    assign _1180 = { prog_wr_data,
                     pat_data_lo };
    assign _1174 = 4'b0101;
    assign _1175 = pat_data_idx == _1174;
    assign _1176 = pat_data_wr & _1175;
    assign _1181 = _1176 ? _1180 : _1179;
    assign _90 = _1181;
    always @(posedge _113) begin
        if (_122)
            _1179 <= _1004;
        else
            _1179 <= _90;
    end
    assign _1188 = { prog_wr_data,
                     pat_data_lo };
    assign _1182 = 4'b0100;
    assign _1183 = pat_data_idx == _1182;
    assign _1184 = pat_data_wr & _1183;
    assign _1189 = _1184 ? _1188 : _1187;
    assign _91 = _1189;
    always @(posedge _113) begin
        if (_122)
            _1187 <= _1004;
        else
            _1187 <= _91;
    end
    assign _1196 = { prog_wr_data,
                     pat_data_lo };
    assign _1190 = 4'b0011;
    assign _1191 = pat_data_idx == _1190;
    assign _1192 = pat_data_wr & _1191;
    assign _1197 = _1192 ? _1196 : _1195;
    assign _92 = _1197;
    always @(posedge _113) begin
        if (_122)
            _1195 <= _1004;
        else
            _1195 <= _92;
    end
    assign _1204 = { prog_wr_data,
                     pat_data_lo };
    assign _1198 = 4'b0010;
    assign _1199 = pat_data_idx == _1198;
    assign _1200 = pat_data_wr & _1199;
    assign _1205 = _1200 ? _1204 : _1203;
    assign _93 = _1205;
    always @(posedge _113) begin
        if (_122)
            _1203 <= _1004;
        else
            _1203 <= _93;
    end
    assign _1212 = { prog_wr_data,
                     pat_data_lo };
    assign _1207 = pat_data_idx == _1026;
    assign _1208 = pat_data_wr & _1207;
    assign _1213 = _1208 ? _1212 : _1211;
    assign _94 = _1213;
    always @(posedge _113) begin
        if (_122)
            _1211 <= _1004;
        else
            _1211 <= _94;
    end
    assign _1220 = _366 == _362;
    assign _1221 = _1220 ? prog_wr_data : pat_data_lo;
    assign _1222 = _1218 ? pat_data_lo : _1221;
    assign _1223 = _1216 ? _1222 : pat_data_lo;
    assign _1214 = _356 == _457;
    assign _1224 = _1214 ? _1223 : pat_data_lo;
    assign _1225 = _353 ? _1224 : pat_data_lo;
    assign _1226 = _348 ? _1225 : pat_data_lo;
    assign _1227 = _341 ? _1226 : pat_data_lo;
    assign _95 = _1227;
    always @(posedge _113) begin
        if (_122)
            pat_data_lo <= _1032;
        else
            pat_data_lo <= _95;
    end
    assign _1241 = { prog_wr_data,
                     pat_data_lo };
    assign _1218 = _366 == _459;
    assign _1229 = _1218 ? prog_wr_data : _1089;
    assign _1215 = 8'b00001100;
    assign _1216 = _361 == _1215;
    assign _1230 = _1216 ? _1229 : _1089;
    assign _1228 = _356 == _457;
    assign _1231 = _1228 ? _1230 : _1089;
    assign _1232 = _353 ? _1231 : _1089;
    assign _1233 = _348 ? _1232 : _1089;
    assign _1234 = _341 ? _1233 : _1089;
    assign _96 = _1234;
    always @(posedge _113) begin
        if (_122)
            _1089 <= _1032;
        else
            _1089 <= _96;
    end
    assign pat_data_idx = _1089[3:0];
    assign _1236 = pat_data_idx == _1053;
    assign _1084 = _361 == _1215;
    assign _623 = _351 == _1158;
    assign _624 = _341 & _623;
    assign _621 = _457 == _356;
    assign _625 = _621 & _624;
    assign _1085 = _625 & _1084;
    assign pat_data_wr = _1085 & _368;
    assign _1237 = pat_data_wr & _1236;
    assign _1242 = _1237 ? _1241 : _1240;
    assign _97 = _1242;
    always @(posedge _113) begin
        if (_122)
            _1240 <= _1004;
        else
            _1240 <= _97;
    end
    assign _1402 = _1271 + _1026;
    assign _1250 = _366 == _362;
    assign _1251 = _1250 ? prog_wr_data : pat_len;
    assign _1252 = _368 ? pat_len : _1251;
    assign _1253 = _1248 ? _1252 : pat_len;
    assign _1246 = _356 == _457;
    assign _1254 = _1246 ? _1253 : pat_len;
    assign _1255 = _353 ? _1254 : pat_len;
    assign _1256 = _348 ? _1255 : pat_len;
    assign _1257 = _341 ? _1256 : pat_len;
    assign _98 = _1257;
    always @(posedge _113) begin
        if (_122)
            pat_len <= _1032;
        else
            pat_len <= _98;
    end
    assign _1398 = pat_len - _324;
    assign _1399 = _1398[3:0];
    assign _1400 = _1271 == _1399;
    assign _1404 = _1400 ? _1053 : _1402;
    assign _1273 = _1272[15:8];
    assign _1276 = _1264 + _324;
    assign _1278 = _1274 ? _324 : _1276;
    assign _1280 = _1268 ? _324 : _1278;
    assign _1281 = _1261 ? _1280 : _1264;
    assign _99 = _1281;
    always @(posedge _113) begin
        if (_122)
            _1264 <= _1032;
        else
            _1264 <= _99;
    end
    assign _1274 = _1264 == _1273;
    assign _1405 = _1274 ? _1404 : _1271;
    assign _100 = _1261;
    always @(posedge _113) begin
        if (_122)
            _1267 <= _1070;
        else
            _1267 <= _100;
    end
    assign _1268 = ~ _1267;
    assign _1407 = _1268 ? _1053 : _1405;
    assign _1391 = _368 ? prog_wr_data : pat_ctrl;
    assign _1247 = 8'b00001011;
    assign _1282 = _356 == _604;
    assign _1283 = _1282 ? prog_wr_data : _361;
    assign _1284 = _353 ? _1283 : _361;
    assign _1285 = _348 ? _1284 : _361;
    assign _1286 = _341 ? _1285 : _361;
    assign _101 = _1286;
    always @(posedge _113) begin
        if (_122)
            _361 <= _1032;
        else
            _361 <= _101;
    end
    assign _1248 = _361 == _1247;
    assign _1392 = _1248 ? _1391 : pat_ctrl;
    assign _1066 = 2'b11;
    assign _1365 = _1331 ? _457 : _1357;
    assign _1366 = _1042 ? _1066 : _1365;
    assign _1041 = prog_wr_data == _1014;
    assign _1038 = prog_wr_data == _1045;
    assign _1036 = prog_wr_data == _1043;
    assign _1039 = _1036 | _1038;
    assign _1042 = _1039 | _1041;
    assign _1363 = ~ _1042;
    assign _1362 = ~ _1331;
    assign _1364 = _1362 & _1363;
    assign _1367 = _1364 ? _446 : _1366;
    assign _1343 = prog_wr_data == _467;
    assign _1340 = prog_wr_data == _362;
    assign _1338 = prog_wr_data == _324;
    assign _1341 = _1338 | _1340;
    assign _1344 = _1341 | _1343;
    assign _1347 = _1344 ? _362 : _324;
    assign _1335 = prog_wr_data == _1215;
    assign _1333 = prog_wr_data == _1247;
    assign _1336 = _1333 | _1335;
    assign _1349 = _1336 ? _459 : _1347;
    assign _1330 = prog_wr_data == _1215;
    assign _1327 = prog_wr_data == _1247;
    assign _1324 = prog_wr_data == _467;
    assign _1321 = prog_wr_data == _695;
    assign _1318 = prog_wr_data == _958;
    assign _1315 = prog_wr_data == _484;
    assign _1312 = prog_wr_data == _459;
    assign _1309 = prog_wr_data == _362;
    assign new_shift = _115[2:2];
    assign _1287 = _373[6:0];
    assign _1288 = { _1287,
                     new_shift };
    assign _1289 = _348 ? _1288 : _373;
    assign _1290 = _341 ? _1289 : _373;
    assign _102 = _1290;
    always @(posedge _113) begin
        if (_122)
            _373 <= _1032;
        else
            _373 <= _102;
    end
    assign _374 = _373[6:0];
    assign prog_wr_data = { _374,
                            new_shift };
    assign _1307 = prog_wr_data == _324;
    assign _1310 = _1307 | _1309;
    assign _1313 = _1310 | _1312;
    assign _1316 = _1313 | _1315;
    assign _1319 = _1316 | _1318;
    assign _1322 = _1319 | _1321;
    assign _1325 = _1322 | _1324;
    assign _1328 = _1325 | _1327;
    assign _1331 = _1328 | _1330;
    assign _1350 = _1331 ? _1349 : _1300;
    assign _1304 = _366 - _324;
    assign _1302 = _356 == _457;
    assign _1305 = _1302 ? _1304 : _1300;
    assign _1301 = _356 == _604;
    assign _1351 = _1301 ? _1350 : _1305;
    assign _1352 = _353 ? _1351 : _1300;
    assign _1353 = _348 ? _1352 : _1300;
    assign _1298 = _1296 ? _1032 : _366;
    assign _1300 = _1295 ? _1032 : _1298;
    assign _1354 = _341 ? _1353 : _1300;
    assign _103 = _1354;
    always @(posedge _113) begin
        if (_122)
            _366 <= _1032;
        else
            _366 <= _103;
    end
    assign _368 = _366 == _324;
    assign _1360 = _368 ? _446 : _1357;
    assign _1359 = _356 == _457;
    assign _1361 = _1359 ? _1360 : _1357;
    assign _1358 = _356 == _604;
    assign _1368 = _1358 ? _1367 : _1361;
    assign _1369 = _353 ? _1368 : _1357;
    assign _1370 = _348 ? _1369 : _1357;
    assign _1355 = _1296 ? _604 : _356;
    assign _1357 = _1295 ? _446 : _1355;
    assign _1371 = _341 ? _1370 : _1357;
    assign _104 = _1371;
    always @(posedge _113) begin
        if (_122)
            _356 <= _446;
        else
            _356 <= _104;
    end
    assign _1390 = _356 == _457;
    assign _1393 = _1390 ? _1392 : pat_ctrl;
    assign _1377 = _351 + _1026;
    assign _1379 = _353 ? _1053 : _1377;
    assign _1380 = _348 ? _1379 : _1375;
    assign _1296 = _348 & _1293;
    assign _1373 = _1296 ? _1053 : _351;
    assign _105 = _347;
    always @(posedge _113) begin
        if (_122)
            _1293 <= _1070;
        else
            _1293 <= _105;
    end
    assign _1294 = ~ _1293;
    assign _1295 = _347 & _1294;
    assign _1375 = _1295 ? _1053 : _1373;
    assign _1381 = _341 ? _1380 : _1375;
    assign _106 = _1381;
    always @(posedge _113) begin
        if (_122)
            _351 <= _1053;
        else
            _351 <= _106;
    end
    assign _353 = _351 == _1158;
    assign _1394 = _353 ? _1393 : pat_ctrl;
    assign _1382 = _115[0:0];
    assign _107 = _1382;
    always @(posedge _113) begin
        if (_122)
            _1385 <= _1070;
        else
            _1385 <= _107;
    end
    assign _108 = _1385;
    always @(posedge _113) begin
        if (_122)
            _347 <= _1070;
        else
            _347 <= _108;
    end
    assign _348 = ~ _347;
    assign _1395 = _348 ? _1394 : pat_ctrl;
    assign _109 = _336;
    always @(posedge _113) begin
        if (_122)
            _339 <= _1070;
        else
            _339 <= _109;
    end
    assign _340 = ~ _339;
    assign vdd = 1'b1;
    assign _111 = rst_n;
    assign _122 = ~ _111;
    assign _113 = clk;
    assign _115 = ui_in;
    assign _1386 = _115[1:1];
    assign _116 = _1386;
    always @(posedge _113) begin
        if (_122)
            _1389 <= _1070;
        else
            _1389 <= _116;
    end
    assign _117 = _1389;
    always @(posedge _113) begin
        if (_122)
            _336 <= _1070;
        else
            _336 <= _117;
    end
    assign _341 = _336 & _340;
    assign _1396 = _341 ? _1395 : pat_ctrl;
    assign _118 = _1396;
    always @(posedge _113) begin
        if (_122)
            pat_ctrl <= _1032;
        else
            pat_ctrl <= _118;
    end
    assign _1261 = pat_ctrl[0:0];
    assign _1408 = _1261 ? _1407 : _1271;
    assign _119 = _1408;
    always @(posedge _113) begin
        if (_122)
            _1271 <= _1053;
        else
            _1271 <= _119;
    end
    always @* begin
        case (_1271)
        0:
            _1272 <= _1240;
        1:
            _1272 <= _1211;
        2:
            _1272 <= _1203;
        3:
            _1272 <= _1195;
        4:
            _1272 <= _1187;
        5:
            _1272 <= _1179;
        6:
            _1272 <= _1171;
        7:
            _1272 <= _1163;
        8:
            _1272 <= _1155;
        9:
            _1272 <= _1147;
        10:
            _1272 <= _1139;
        11:
            _1272 <= _1131;
        12:
            _1272 <= _1123;
        13:
            _1272 <= _1115;
        14:
            _1272 <= _1107;
        default:
            _1272 <= _1096;
        endcase
    end
    assign pat_pins = _1272[7:0];
    assign _1410 = pat_pins[7:2];
    assign _1416 = { _1410,
                     _1415 };
    assign prog_wr_addr = host_data_rd_addr_0;
    assign data_wr_addr = host_data_rd_addr_0;
    assign status = run;
    assign data_wr_data = prog_wr_data;
    assign fifo_rx_data = prog_wr_data;
    assign pat_data_hi = prog_wr_data;
    assign uo_out = _1416;
    assign uio_out = pins_out;
    assign uio_oe = _130;

endmodule
