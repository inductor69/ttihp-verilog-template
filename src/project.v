module tt_um_protocore (
    uio_in,
    rst_n,
    clk,
    ui_in,
    ena,
    uo_out,
    uio_out,
    uio_oe
);

    input [7:0] uio_in;
    input rst_n;
    input clk;
    input [7:0] ui_in;
    input ena;
    output [7:0] uo_out;
    output [7:0] uio_out;
    output [7:0] uio_oe;

    wire [7:0] _1018;
    wire _1056;
    wire [6:0] _1055;
    wire [7:0] _1057;
    wire _1053;
    wire _1054;
    wire [7:0] _1058;
    wire [7:0] core_data_out;
    wire [1:0] _1041;
    wire _1040;
    wire [2:0] _1042;
    wire [3:0] _1043;
    wire [3:0] _1039;
    wire [7:0] _1044;
    wire [7:0] _1036;
    wire [2:0] _142;
    wire _143;
    wire [7:0] _144;
    wire [7:0] _145;
    wire [7:0] _4;
    reg [7:0] _138;
    wire [2:0] _149;
    wire _150;
    wire [7:0] _151;
    wire [7:0] _152;
    wire [7:0] _5;
    reg [7:0] _148;
    wire [2:0] _156;
    wire _157;
    wire [7:0] _158;
    wire [7:0] _159;
    wire [7:0] _6;
    reg [7:0] _155;
    wire [2:0] _163;
    wire _164;
    wire [7:0] _165;
    wire [7:0] _166;
    wire [7:0] _7;
    reg [7:0] _162;
    wire [2:0] _170;
    wire _171;
    wire [7:0] _172;
    wire [7:0] _173;
    wire [7:0] _8;
    reg [7:0] _169;
    wire [2:0] _177;
    wire _178;
    wire [7:0] _179;
    wire [7:0] _180;
    wire [7:0] _9;
    reg [7:0] _176;
    wire [2:0] _184;
    wire _185;
    wire [7:0] _186;
    wire [7:0] _187;
    wire [7:0] _10;
    reg [7:0] _183;
    wire [7:0] core_tx_data;
    wire [2:0] _197;
    wire [2:0] _192;
    wire [2:0] _193;
    wire [2:0] _12;
    reg [2:0] _141;
    wire _198;
    wire [7:0] _199;
    wire [7:0] _200;
    wire [7:0] _13;
    reg [7:0] _196;
    wire [2:0] _209;
    wire [2:0] _210;
    wire [2:0] _14;
    reg [2:0] _207;
    reg [7:0] fifo_data;
    wire [7:0] tx_data;
    wire [3:0] _1012;
    wire [3:0] _1013;
    wire [3:0] _1010;
    wire _134;
    wire [4:0] _998;
    wire _999;
    wire [7:0] _222;
    wire [7:0] _223;
    wire _220;
    wire [7:0] _224;
    wire [4:0] _216;
    wire _217;
    wire [7:0] _225;
    wire [7:0] _226;
    wire [7:0] _16;
    reg [7:0] _214;
    wire _329;
    wire [7:0] _326;
    wire _327;
    wire _320;
    wire _321;
    wire [3:0] _132;
    wire fifo_full;
    wire tx_full;
    wire _308;
    wire rx_empty;
    wire _306;
    wire _305;
    wire [4:0] _295;
    wire _296;
    wire _307;
    wire _294;
    wire _309;
    wire [4:0] _291;
    wire _292;
    wire _322;
    wire [4:0] _289;
    wire _290;
    wire _328;
    wire [15:0] _995;
    wire [15:0] _994;
    wire _267;
    wire [7:0] _260;
    wire _261;
    wire _268;
    wire [7:0] _275;
    wire _256;
    wire [7:0] _276;
    wire [7:0] _277;
    wire [7:0] _278;
    wire [7:0] _279;
    wire [7:0] _19;
    reg [7:0] _242;
    wire [15:0] _280;
    wire [15:0] host_prog_wr_data;
    wire [7:0] host_prog_wr_addr;
    wire [7:0] _379;
    wire [7:0] _380;
    wire [7:0] _381;
    wire [7:0] _22;
    reg [7:0] pc;
    wire _373;
    wire _374;
    wire [4:0] _365;
    wire _366;
    wire branch_taken;
    wire _362;
    wire [4:0] _360;
    wire _361;
    wire _363;
    wire [4:0] _356;
    wire _357;
    wire _358;
    wire _353;
    wire [4:0] _351;
    wire _352;
    wire _354;
    wire _348;
    wire [4:0] _346;
    wire _347;
    wire _349;
    wire _343;
    wire [4:0] _341;
    wire _342;
    wire _344;
    wire _980;
    wire _974;
    wire _973;
    wire _971;
    wire _970;
    reg _978;
    wire [1:0] _981;
    wire [5:0] _969;
    wire [7:0] _982;
    wire [2:0] _847;
    reg [7:0] reg_src;
    wire _385;
    wire _386;
    wire [7:0] _393;
    wire [7:0] _394;
    wire [7:0] _23;
    reg [7:0] _384;
    wire [4:0] _387;
    wire _388;
    wire [7:0] _392;
    wire _396;
    wire _397;
    wire _398;
    wire _24;
    reg _304;
    wire [7:0] _614;
    wire [7:0] host_data_rd_addr;
    wire _300;
    wire [4:0] _297;
    wire _298;
    wire _301;
    wire [7:0] _615;
    wire [7:0] _406;
    wire [15:0] _399;
    wire [15:0] _400;
    wire [15:0] _401;
    wire [15:0] _26;
    reg [15:0] cyc;
    wire [7:0] _405;
    reg [7:0] _407;
    wire [7:0] cap_wr_data;
    wire [7:0] host_data_wr_data;
    wire [7:0] _608;
    wire [7:0] _609;
    wire [7:0] _436;
    wire [7:0] _438;
    wire [7:0] _433;
    wire [7:0] _435;
    wire [7:0] _416;
    wire [7:0] _417;
    wire [7:0] _418;
    wire [7:0] _419;
    wire [7:0] _29;
    reg [7:0] _413;
    wire [7:0] _426;
    wire [7:0] _427;
    wire _423;
    wire [7:0] _428;
    wire [7:0] _429;
    wire [7:0] _430;
    wire [7:0] _431;
    wire [7:0] _30;
    reg [7:0] cap_base;
    wire [7:0] _432;
    reg [7:0] _439;
    wire [7:0] cap_wr_addr;
    wire [7:0] _457;
    wire [7:0] _453;
    wire [7:0] _450;
    wire _449;
    wire [7:0] _451;
    wire _446;
    wire _447;
    wire [7:0] _454;
    wire _444;
    wire [7:0] _455;
    wire [7:0] _441;
    wire _442;
    wire [7:0] _458;
    wire _440;
    wire [7:0] _459;
    wire [7:0] _460;
    wire [7:0] _461;
    wire [7:0] _462;
    wire [7:0] _32;
    reg [7:0] host_data_rd_addr_0;
    wire [7:0] prog_wr_addr;
    wire [7:0] data_wr_addr;
    wire [7:0] host_data_wr_addr;
    wire [4:0] _596;
    wire _597;
    wire [7:0] _598;
    wire [7:0] _599;
    wire [7:0] _600;
    wire [1:0] _414;
    wire [1:0] _403;
    wire [1:0] _561;
    wire [1:0] _562;
    wire [1:0] _563;
    wire [1:0] _559;
    wire [1:0] _560;
    wire [1:0] _564;
    wire [1:0] _34;
    reg [1:0] _404;
    wire _415;
    wire _576;
    wire _572;
    wire _549;
    wire _550;
    wire _551;
    wire _552;
    wire _553;
    wire _554;
    wire _555;
    wire _544;
    wire _545;
    wire _543;
    wire _546;
    wire _541;
    wire _539;
    wire _540;
    wire _542;
    wire _547;
    wire _535;
    wire _536;
    wire _534;
    wire _537;
    wire _532;
    wire _530;
    wire _531;
    wire _533;
    wire _538;
    wire _526;
    wire _527;
    wire _525;
    wire _528;
    wire _523;
    wire _521;
    wire _522;
    wire _524;
    wire _529;
    wire _517;
    wire _518;
    wire _516;
    wire _519;
    wire _514;
    wire _512;
    wire _513;
    wire _515;
    wire _520;
    wire _508;
    wire _509;
    wire _507;
    wire _510;
    wire _505;
    wire _503;
    wire _504;
    wire _506;
    wire _511;
    wire _499;
    wire _500;
    wire _498;
    wire _501;
    wire _496;
    wire _494;
    wire _495;
    wire _497;
    wire _502;
    wire _490;
    wire _491;
    wire _489;
    wire _492;
    wire _487;
    wire _485;
    wire _486;
    wire _488;
    wire _493;
    wire _481;
    wire _482;
    wire _480;
    wire _483;
    wire [7:0] _35;
    reg [7:0] _477;
    wire _478;
    wire _473;
    wire _474;
    wire _479;
    wire _472;
    wire _484;
    wire [2:0] _471;
    reg _548;
    wire _470;
    wire _556;
    wire _469;
    wire _557;
    wire _573;
    wire _467;
    wire [7:0] _566;
    wire [7:0] _424;
    wire _425;
    wire [7:0] _567;
    wire _565;
    wire [7:0] _568;
    wire [7:0] _569;
    wire [7:0] _570;
    wire [7:0] _571;
    wire [7:0] _36;
    reg [7:0] cap_ctrl;
    wire _466;
    wire _468;
    wire _574;
    wire _577;
    wire _37;
    reg _410;
    wire cap_wr;
    wire _591;
    wire _592;
    wire [4:0] _586;
    wire _587;
    wire _588;
    wire _584;
    wire data_wr;
    wire host_data_wr;
    wire _589;
    wire _593;
    wire _594;
    wire [7:0] _622;
    wire [7:0] data_mem_host_rdata;
    wire [7:0] _41;
    reg [7:0] _845;
    wire [2:0] _839;
    reg pin_imm;
    wire [6:0] _838;
    wire [7:0] _841;
    wire _634;
    wire [7:0] _635;
    wire [7:0] _636;
    wire [7:0] _42;
    reg [7:0] _629;
    wire _641;
    wire [7:0] _642;
    wire [7:0] _643;
    wire [7:0] _43;
    reg [7:0] _639;
    wire _648;
    wire [7:0] _649;
    wire [7:0] _650;
    wire [7:0] _44;
    reg [7:0] _646;
    wire _655;
    wire [7:0] _656;
    wire [7:0] _657;
    wire [7:0] _45;
    reg [7:0] _653;
    wire _662;
    wire [7:0] _663;
    wire [7:0] _664;
    wire [7:0] _46;
    reg [7:0] _660;
    wire _669;
    wire [7:0] _670;
    wire [7:0] _671;
    wire [7:0] _47;
    reg [7:0] _667;
    wire _676;
    wire [7:0] _677;
    wire [7:0] _678;
    wire [7:0] _48;
    reg [7:0] _674;
    wire [7:0] host_rx_data;
    wire [2:0] _680;
    wire [2:0] _681;
    wire [2:0] _50;
    reg [2:0] _632;
    wire _686;
    wire [7:0] _687;
    wire [7:0] _688;
    wire [7:0] _51;
    reg [7:0] _684;
    wire [2:0] _709;
    wire [3:0] _700;
    wire [3:0] _697;
    wire _625;
    wire fifo_full_0;
    wire rx_full;
    wire _692;
    wire [7:0] _689;
    wire _690;
    wire _691;
    wire fifo_rx_push;
    wire host_rx_push;
    wire _626;
    wire [3:0] _698;
    wire [3:0] _701;
    wire [3:0] _54;
    reg [3:0] _229;
    wire fifo_empty;
    wire _694;
    wire _703;
    wire fifo_rx_pop;
    wire core_rx_pop;
    wire _695;
    wire [2:0] _710;
    wire [2:0] _56;
    reg [2:0] _707;
    reg [7:0] fifo_data_0;
    wire [7:0] rx_data;
    wire [7:0] _834;
    wire [7:0] _833;
    wire [7:0] _832;
    wire [8:0] _829;
    wire [8:0] _830;
    wire [7:0] _831;
    wire [8:0] _825;
    wire [8:0] _823;
    wire [8:0] _826;
    wire [7:0] _827;
    wire [3:0] _809;
    wire [7:0] _810;
    wire [5:0] _805;
    wire [7:0] _806;
    wire [6:0] _801;
    wire [7:0] _802;
    wire _799;
    wire [7:0] _803;
    wire _798;
    wire [7:0] _807;
    wire _797;
    wire [7:0] _811;
    wire _796;
    wire [7:0] _813;
    wire _795;
    wire [7:0] _815;
    wire _794;
    wire [7:0] _817;
    wire _793;
    wire [7:0] _819;
    wire _792;
    wire [7:0] _821;
    wire [3:0] _778;
    wire [7:0] _780;
    wire [5:0] _774;
    wire [7:0] _776;
    wire [6:0] _770;
    wire [7:0] _772;
    wire _741;
    wire [7:0] _851;
    wire [7:0] _852;
    wire [7:0] _853;
    wire [7:0] _854;
    wire [7:0] _58;
    reg [7:0] _606;
    wire _856;
    wire [7:0] _857;
    wire [7:0] _858;
    wire [7:0] _859;
    wire [7:0] _860;
    wire [7:0] _59;
    reg [7:0] oe;
    wire [6:0] _930;
    wire [7:0] _931;
    wire [5:0] _928;
    wire _927;
    wire [7:0] _929;
    wire [4:0] _925;
    wire [1:0] _924;
    wire [7:0] _926;
    wire [3:0] _922;
    wire [2:0] _921;
    wire [7:0] _923;
    wire [2:0] _919;
    wire [3:0] _918;
    wire [7:0] _920;
    wire [1:0] _916;
    wire [4:0] _915;
    wire [7:0] _917;
    wire _913;
    wire [5:0] _912;
    wire [7:0] _914;
    wire _318;
    wire _317;
    wire _316;
    wire _315;
    wire _314;
    wire _313;
    wire _312;
    wire [7:0] _61;
    wire _311;
    reg pin_arg;
    wire [6:0] _873;
    wire [7:0] _874;
    wire [6:0] _869;
    wire [7:0] _871;
    wire _866;
    wire [7:0] _867;
    wire [7:0] _868;
    wire [7:0] _872;
    wire [4:0] _861;
    wire _862;
    wire [7:0] _875;
    wire [7:0] _876;
    wire [7:0] _877;
    wire [7:0] _62;
    reg [7:0] _603;
    wire _910;
    wire [6:0] _909;
    wire [7:0] _911;
    reg [7:0] _932;
    wire [6:0] _905;
    wire [7:0] _906;
    wire [5:0] _903;
    wire _902;
    wire [7:0] _904;
    wire [4:0] _900;
    wire [1:0] _899;
    wire [7:0] _901;
    wire [3:0] _897;
    wire [2:0] _896;
    wire [7:0] _898;
    wire [2:0] _894;
    wire [3:0] _893;
    wire [7:0] _895;
    wire [1:0] _891;
    wire [4:0] _890;
    wire [7:0] _892;
    wire _888;
    wire [5:0] _887;
    wire [7:0] _889;
    wire _885;
    wire [6:0] _884;
    wire [7:0] _886;
    reg [7:0] _907;
    wire _881;
    wire [7:0] _882;
    wire [7:0] _883;
    wire [4:0] _878;
    wire _879;
    wire [7:0] _908;
    wire [4:0] _863;
    wire _864;
    wire [7:0] _933;
    wire [7:0] _934;
    wire [7:0] _935;
    wire [7:0] _63;
    reg [7:0] pins_out;
    wire _937;
    wire [7:0] _938;
    wire [7:0] _939;
    wire [7:0] _940;
    wire [7:0] _941;
    wire [7:0] _64;
    reg [7:0] _391;
    wire [7:0] _371;
    wire _945;
    wire [7:0] _946;
    wire [7:0] _947;
    wire _943;
    wire [7:0] _948;
    wire [7:0] _949;
    wire [7:0] _950;
    wire [7:0] _65;
    reg [7:0] _369;
    wire _954;
    wire [7:0] _951;
    wire _952;
    wire _953;
    wire reset_core;
    wire host_reset_core;
    wire _122;
    wire _957;
    wire [7:0] _958;
    wire [7:0] _959;
    wire [7:0] _960;
    wire [7:0] _961;
    wire [7:0] _67;
    reg [7:0] fifo_tx_data;
    reg [7:0] reg_val;
    wire _769;
    wire [7:0] _773;
    wire _768;
    wire [7:0] _777;
    wire _767;
    wire [7:0] _781;
    wire _766;
    wire [7:0] _783;
    wire _765;
    wire [7:0] _785;
    wire _764;
    wire [7:0] _787;
    wire _763;
    wire [7:0] _789;
    wire [7:0] imm;
    wire _759;
    wire [7:0] _761;
    wire _762;
    wire [7:0] _791;
    wire [2:0] _757;
    reg [7:0] alu_result;
    wire _756;
    wire [7:0] _836;
    wire [4:0] _753;
    wire _754;
    wire [7:0] _837;
    wire [4:0] _751;
    wire _752;
    wire [7:0] _842;
    wire _749;
    wire _747;
    wire _750;
    wire [7:0] _846;
    wire [4:0] _744;
    wire _745;
    wire [7:0] _849;
    wire [4:0] _742;
    wire _743;
    wire [7:0] reg_write_value;
    wire [2:0] arg;
    wire _966;
    wire [7:0] _967;
    wire _738;
    wire _735;
    wire _732;
    wire _729;
    wire _726;
    wire _715;
    wire _713;
    wire _716;
    wire _724;
    wire _727;
    wire _730;
    wire _733;
    wire _736;
    wire _739;
    wire [7:0] _968;
    wire [4:0] _720;
    wire _721;
    wire _722;
    wire [4:0] _717;
    wire _718;
    wire _719;
    wire _723;
    wire [7:0] _983;
    wire [7:0] _984;
    wire host_run;
    wire [7:0] _985;
    wire [7:0] _69;
    reg [7:0] _337;
    wire _338;
    wire [4:0] _333;
    wire _334;
    wire _339;
    wire [4:0] _331;
    wire _332;
    wire _340;
    wire _345;
    wire _350;
    wire _355;
    wire _359;
    wire _364;
    wire _376;
    wire [7:0] fetch_addr;
    wire [7:0] _986;
    wire [7:0] _70;
    wire _991;
    wire _988;
    wire _989;
    wire prog_wr;
    wire host_prog_wr;
    wire [15:0] _997;
    wire [15:0] _72;
    wire [4:0] op;
    wire _288;
    wire advance;
    wire fifo_tx_push;
    wire core_tx_push;
    wire _135;
    wire [3:0] _1011;
    wire _203;
    wire _1007;
    wire [7:0] _1004;
    wire _1005;
    wire _1002;
    wire _1003;
    wire _1006;
    wire fifo_tx_pop;
    wire host_tx_pop;
    wire _204;
    wire [3:0] _1014;
    wire [3:0] _75;
    reg [3:0] _131;
    wire fifo_empty_0;
    wire tx_empty;
    wire [7:0] _1037;
    wire _1034;
    wire [7:0] _1038;
    wire [7:0] _1031;
    wire _1032;
    wire [7:0] _1045;
    wire [7:0] _1029;
    wire _1030;
    wire [7:0] _1046;
    wire [7:0] _1047;
    wire _1020;
    wire [7:0] _1048;
    wire [7:0] _1049;
    wire [7:0] _1050;
    wire [7:0] _1051;
    wire _1015;
    wire _1016;
    wire [7:0] _1059;
    wire [7:0] _77;
    reg [7:0] _1019;
    wire _1399;
    wire gnd;
    wire _1397;
    wire _1398;
    wire miso;
    wire _1063;
    wire _1062;
    wire _1064;
    wire _1060;
    wire _1065;
    wire _1066;
    wire _1067;
    wire _1068;
    wire _78;
    reg run;
    wire status;
    wire [1:0] _1401;
    wire [15:0] _1086;
    wire [3:0] _1077;
    wire _1078;
    wire _1079;
    wire [15:0] _1087;
    wire [15:0] _79;
    reg [15:0] _1082;
    wire [15:0] _1094;
    wire [3:0] _1088;
    wire _1089;
    wire _1090;
    wire [15:0] _1095;
    wire [15:0] _80;
    reg [15:0] _1093;
    wire [15:0] _1102;
    wire [3:0] _1096;
    wire _1097;
    wire _1098;
    wire [15:0] _1103;
    wire [15:0] _81;
    reg [15:0] _1101;
    wire [15:0] _1110;
    wire [3:0] _1104;
    wire _1105;
    wire _1106;
    wire [15:0] _1111;
    wire [15:0] _82;
    reg [15:0] _1109;
    wire [15:0] _1118;
    wire [3:0] _1112;
    wire _1113;
    wire _1114;
    wire [15:0] _1119;
    wire [15:0] _83;
    reg [15:0] _1117;
    wire [15:0] _1126;
    wire [3:0] _1120;
    wire _1121;
    wire _1122;
    wire [15:0] _1127;
    wire [15:0] _84;
    reg [15:0] _1125;
    wire [15:0] _1134;
    wire [3:0] _1128;
    wire _1129;
    wire _1130;
    wire [15:0] _1135;
    wire [15:0] _85;
    reg [15:0] _1133;
    wire [15:0] _1142;
    wire _1137;
    wire _1138;
    wire [15:0] _1143;
    wire [15:0] _86;
    reg [15:0] _1141;
    wire [15:0] _1150;
    wire [3:0] _1144;
    wire _1145;
    wire _1146;
    wire [15:0] _1151;
    wire [15:0] _87;
    reg [15:0] _1149;
    wire [15:0] _1158;
    wire [3:0] _1152;
    wire _1153;
    wire _1154;
    wire [15:0] _1159;
    wire [15:0] _88;
    reg [15:0] _1157;
    wire [15:0] _1166;
    wire [3:0] _1160;
    wire _1161;
    wire _1162;
    wire [15:0] _1167;
    wire [15:0] _89;
    reg [15:0] _1165;
    wire [15:0] _1174;
    wire [3:0] _1168;
    wire _1169;
    wire _1170;
    wire [15:0] _1175;
    wire [15:0] _90;
    reg [15:0] _1173;
    wire [15:0] _1182;
    wire [3:0] _1176;
    wire _1177;
    wire _1178;
    wire [15:0] _1183;
    wire [15:0] _91;
    reg [15:0] _1181;
    wire [15:0] _1190;
    wire [3:0] _1184;
    wire _1185;
    wire _1186;
    wire [15:0] _1191;
    wire [15:0] _92;
    reg [15:0] _1189;
    wire [15:0] _1198;
    wire _1193;
    wire _1194;
    wire [15:0] _1199;
    wire [15:0] _93;
    reg [15:0] _1197;
    wire _1206;
    wire [7:0] _1207;
    wire [7:0] _1208;
    wire [7:0] _1209;
    wire _1200;
    wire [7:0] _1210;
    wire [7:0] _1211;
    wire [7:0] _1212;
    wire [7:0] _1213;
    wire [7:0] _94;
    reg [7:0] pat_data_lo;
    wire [15:0] _1227;
    wire _1204;
    wire [7:0] _1215;
    wire [7:0] _1201;
    wire _1202;
    wire [7:0] _1216;
    wire _1214;
    wire [7:0] _1217;
    wire [7:0] _1218;
    wire [7:0] _1219;
    wire [7:0] _1220;
    wire [7:0] _95;
    reg [7:0] _1075;
    wire [3:0] pat_data_idx;
    wire _1222;
    wire _1070;
    wire _580;
    wire _581;
    wire _578;
    wire _582;
    wire _1071;
    wire pat_data_wr;
    wire _1223;
    wire [15:0] _1228;
    wire [15:0] _96;
    reg [15:0] _1226;
    wire [3:0] _1388;
    wire _1236;
    wire [7:0] _1237;
    wire [7:0] _1238;
    wire [7:0] _1239;
    wire _1232;
    wire [7:0] _1240;
    wire [7:0] _1241;
    wire [7:0] _1242;
    wire [7:0] _1243;
    wire [7:0] _97;
    reg [7:0] pat_len;
    wire [7:0] _1384;
    wire [3:0] _1385;
    wire _1386;
    wire [3:0] _1390;
    wire [7:0] _1259;
    wire [7:0] _1262;
    wire [7:0] _1264;
    wire [7:0] _1266;
    wire [7:0] _1267;
    wire [7:0] _98;
    reg [7:0] _1250;
    wire _1260;
    wire [3:0] _1391;
    wire _99;
    reg _1253;
    wire _1254;
    wire [3:0] _1393;
    wire [7:0] _1377;
    wire [7:0] _1233;
    wire _1268;
    wire [7:0] _1269;
    wire [7:0] _1270;
    wire [7:0] _1271;
    wire [7:0] _1272;
    wire [7:0] _100;
    reg [7:0] _259;
    wire _1234;
    wire [7:0] _1378;
    wire [1:0] _1052;
    wire [1:0] _1351;
    wire [1:0] _1352;
    wire _1027;
    wire _1024;
    wire _1022;
    wire _1025;
    wire _1028;
    wire _1349;
    wire _1348;
    wire _1350;
    wire [1:0] _1353;
    wire _1329;
    wire _1326;
    wire _1324;
    wire _1327;
    wire _1330;
    wire [7:0] _1333;
    wire _1321;
    wire _1319;
    wire _1322;
    wire [7:0] _1335;
    wire _1316;
    wire _1313;
    wire _1310;
    wire _1307;
    wire _1304;
    wire _1301;
    wire _1298;
    wire _1295;
    wire new_shift;
    wire [6:0] _1273;
    wire [7:0] _1274;
    wire [7:0] _1275;
    wire [7:0] _1276;
    wire [7:0] _101;
    reg [7:0] _271;
    wire [6:0] _272;
    wire [7:0] prog_wr_data;
    wire [7:0] data_wr_data;
    wire [7:0] fifo_rx_data;
    wire [7:0] pat_data_hi;
    wire _1293;
    wire _1296;
    wire _1299;
    wire _1302;
    wire _1305;
    wire _1308;
    wire _1311;
    wire _1314;
    wire _1317;
    wire [7:0] _1336;
    wire [7:0] _1290;
    wire _1288;
    wire [7:0] _1291;
    wire _1287;
    wire [7:0] _1337;
    wire [7:0] _1338;
    wire [7:0] _1339;
    wire [7:0] _1284;
    wire [7:0] _1286;
    wire [7:0] _1340;
    wire [7:0] _102;
    reg [7:0] _264;
    wire _266;
    wire [1:0] _1346;
    wire _1345;
    wire [1:0] _1347;
    wire _1344;
    wire [1:0] _1354;
    wire [1:0] _1355;
    wire [1:0] _1356;
    wire [1:0] _1341;
    wire [1:0] _1343;
    wire [1:0] _1357;
    wire [1:0] _103;
    reg [1:0] _254;
    wire _1376;
    wire [7:0] _1379;
    wire [3:0] _1363;
    wire [3:0] _1365;
    wire [3:0] _1366;
    wire _1282;
    wire [3:0] _1359;
    wire _104;
    reg _1279;
    wire _1280;
    wire _1281;
    wire [3:0] _1361;
    wire [3:0] _1367;
    wire [3:0] _105;
    reg [3:0] _249;
    wire _251;
    wire [7:0] _1380;
    wire _1368;
    wire _106;
    reg _1371;
    wire _107;
    reg _245;
    wire _246;
    wire [7:0] _1381;
    wire _108;
    reg _237;
    wire _238;
    wire vdd;
    wire _110;
    wire _121;
    wire _112;
    wire [7:0] _114;
    wire _1372;
    wire _115;
    reg _1375;
    wire _116;
    reg _234;
    wire _239;
    wire [7:0] _1382;
    wire [7:0] _117;
    reg [7:0] pat_ctrl;
    wire _1247;
    wire [3:0] _1394;
    wire [3:0] _118;
    reg [3:0] _1257;
    reg [15:0] _1258;
    wire [7:0] pat_pins;
    wire [5:0] _1396;
    wire [7:0] _1402;
    assign _1018 = 8'b00000000;
    assign _1056 = 1'b0;
    assign _1055 = _1019[6:0];
    assign _1057 = { _1055,
                     _1056 };
    assign _1053 = _1052 == _254;
    assign _1054 = _246 & _1053;
    assign _1058 = _1054 ? _1057 : _1051;
    assign core_data_out = data_mem_host_rdata;
    assign _1041 = { vdd,
                     run };
    assign _1040 = ~ tx_empty;
    assign _1042 = { _1040,
                     _1041 };
    assign _1043 = { rx_full,
                     _1042 };
    assign _1039 = 4'b0000;
    assign _1044 = { _1039,
                     _1043 };
    assign _1036 = 8'b11111111;
    assign _142 = 3'b111;
    assign _143 = _141 == _142;
    assign _144 = _143 ? core_tx_data : _138;
    assign _145 = _135 ? _144 : _138;
    assign _4 = _145;
    always @(posedge _112) begin
        if (_121)
            _138 <= _1018;
        else
            _138 <= _4;
    end
    assign _149 = 3'b110;
    assign _150 = _141 == _149;
    assign _151 = _150 ? core_tx_data : _148;
    assign _152 = _135 ? _151 : _148;
    assign _5 = _152;
    always @(posedge _112) begin
        if (_121)
            _148 <= _1018;
        else
            _148 <= _5;
    end
    assign _156 = 3'b101;
    assign _157 = _141 == _156;
    assign _158 = _157 ? core_tx_data : _155;
    assign _159 = _135 ? _158 : _155;
    assign _6 = _159;
    always @(posedge _112) begin
        if (_121)
            _155 <= _1018;
        else
            _155 <= _6;
    end
    assign _163 = 3'b100;
    assign _164 = _141 == _163;
    assign _165 = _164 ? core_tx_data : _162;
    assign _166 = _135 ? _165 : _162;
    assign _7 = _166;
    always @(posedge _112) begin
        if (_121)
            _162 <= _1018;
        else
            _162 <= _7;
    end
    assign _170 = 3'b011;
    assign _171 = _141 == _170;
    assign _172 = _171 ? core_tx_data : _169;
    assign _173 = _135 ? _172 : _169;
    assign _8 = _173;
    always @(posedge _112) begin
        if (_121)
            _169 <= _1018;
        else
            _169 <= _8;
    end
    assign _177 = 3'b010;
    assign _178 = _141 == _177;
    assign _179 = _178 ? core_tx_data : _176;
    assign _180 = _135 ? _179 : _176;
    assign _9 = _180;
    always @(posedge _112) begin
        if (_121)
            _176 <= _1018;
        else
            _176 <= _9;
    end
    assign _184 = 3'b001;
    assign _185 = _141 == _184;
    assign _186 = _185 ? core_tx_data : _183;
    assign _187 = _135 ? _186 : _183;
    assign _10 = _187;
    always @(posedge _112) begin
        if (_121)
            _183 <= _1018;
        else
            _183 <= _10;
    end
    assign core_tx_data = fifo_tx_data;
    assign _197 = 3'b000;
    assign _192 = _141 + _184;
    assign _193 = _135 ? _192 : _141;
    assign _12 = _193;
    always @(posedge _112) begin
        if (_121)
            _141 <= _197;
        else
            _141 <= _12;
    end
    assign _198 = _141 == _197;
    assign _199 = _198 ? core_tx_data : _196;
    assign _200 = _135 ? _199 : _196;
    assign _13 = _200;
    always @(posedge _112) begin
        if (_121)
            _196 <= _1018;
        else
            _196 <= _13;
    end
    assign _209 = _207 + _184;
    assign _210 = _204 ? _209 : _207;
    assign _14 = _210;
    always @(posedge _112) begin
        if (_121)
            _207 <= _197;
        else
            _207 <= _14;
    end
    always @* begin
        case (_207)
        0:
            fifo_data <= _196;
        1:
            fifo_data <= _183;
        2:
            fifo_data <= _176;
        3:
            fifo_data <= _169;
        4:
            fifo_data <= _162;
        5:
            fifo_data <= _155;
        6:
            fifo_data <= _148;
        default:
            fifo_data <= _138;
        endcase
    end
    assign tx_data = fifo_data;
    assign _1012 = 4'b0001;
    assign _1013 = _131 - _1012;
    assign _1010 = _131 + _1012;
    assign _134 = ~ fifo_full;
    assign _998 = 5'b11100;
    assign _999 = op == _998;
    assign _222 = 8'b00000001;
    assign _223 = _214 + _222;
    assign _220 = _214 < imm;
    assign _224 = _220 ? _223 : _1018;
    assign _216 = 5'b01101;
    assign _217 = op == _216;
    assign _225 = _217 ? _224 : _1018;
    assign _226 = host_run ? _225 : _214;
    assign _16 = _226;
    always @(posedge _112) begin
        if (_122)
            _214 <= _1018;
        else
            _214 <= _16;
    end
    assign _329 = _214 == imm;
    assign _326 = cyc[7:0];
    assign _327 = _326 == imm;
    assign _320 = imm[0:0];
    assign _321 = pin_arg == _320;
    assign _132 = 4'b1000;
    assign fifo_full = _131 == _132;
    assign tx_full = fifo_full;
    assign _308 = ~ tx_full;
    assign rx_empty = fifo_empty;
    assign _306 = ~ rx_empty;
    assign _305 = _301 ? _304 : vdd;
    assign _295 = 5'b11101;
    assign _296 = op == _295;
    assign _307 = _296 ? _306 : _305;
    assign _294 = op == _998;
    assign _309 = _294 ? _308 : _307;
    assign _291 = 5'b01111;
    assign _292 = op == _291;
    assign _322 = _292 ? _321 : _309;
    assign _289 = 5'b01110;
    assign _290 = op == _289;
    assign _328 = _290 ? _327 : _322;
    assign _995 = 16'b1111111111111111;
    assign _994 = 16'b0000000000000000;
    assign _267 = ~ _266;
    assign _260 = 8'b00000010;
    assign _261 = _259 == _260;
    assign _268 = _261 & _267;
    assign _275 = _268 ? prog_wr_data : _242;
    assign _256 = _254 == _414;
    assign _276 = _256 ? _275 : _242;
    assign _277 = _251 ? _276 : _242;
    assign _278 = _246 ? _277 : _242;
    assign _279 = _239 ? _278 : _242;
    assign _19 = _279;
    always @(posedge _112) begin
        if (_121)
            _242 <= _1018;
        else
            _242 <= _19;
    end
    assign _280 = { _242,
                    prog_wr_data };
    assign host_prog_wr_data = _280;
    assign host_prog_wr_addr = host_data_rd_addr_0;
    assign _379 = fetch_addr + _222;
    assign _380 = advance ? _379 : pc;
    assign _381 = host_run ? _380 : pc;
    assign _22 = _381;
    always @(posedge _112) begin
        if (_122)
            pc <= _1018;
        else
            pc <= _22;
    end
    assign _373 = _371 == _1018;
    assign _374 = ~ _373;
    assign _365 = 5'b10111;
    assign _366 = op == _365;
    assign branch_taken = _366 & _374;
    assign _362 = ~ pin_arg;
    assign _360 = 5'b10110;
    assign _361 = op == _360;
    assign _363 = _361 & _362;
    assign _356 = 5'b10101;
    assign _357 = op == _356;
    assign _358 = _357 & pin_arg;
    assign _353 = ~ _348;
    assign _351 = 5'b10100;
    assign _352 = op == _351;
    assign _354 = _352 & _353;
    assign _348 = _337[1:1];
    assign _346 = 5'b10011;
    assign _347 = op == _346;
    assign _349 = _347 & _348;
    assign _343 = ~ _338;
    assign _341 = 5'b10010;
    assign _342 = op == _341;
    assign _344 = _342 & _343;
    assign _980 = alu_result == _1018;
    assign _974 = _830[8:8];
    assign _973 = _826[8:8];
    assign _971 = reg_val[0:0];
    assign _970 = reg_val[7:7];
    always @* begin
        case (_757)
        0:
            _978 <= _970;
        1:
            _978 <= _971;
        2:
            _978 <= _1056;
        3:
            _978 <= _973;
        4:
            _978 <= _974;
        5:
            _978 <= _1056;
        6:
            _978 <= _1056;
        default:
            _978 <= _1056;
        endcase
    end
    assign _981 = { _978,
                    _980 };
    assign _969 = 6'b000000;
    assign _982 = { _969,
                    _981 };
    assign _847 = imm[2:0];
    always @* begin
        case (_847)
        0:
            reg_src <= fifo_tx_data;
        1:
            reg_src <= _369;
        2:
            reg_src <= _391;
        3:
            reg_src <= pins_out;
        4:
            reg_src <= oe;
        5:
            reg_src <= _603;
        6:
            reg_src <= _337;
        default:
            reg_src <= _606;
        endcase
    end
    assign _385 = ~ _304;
    assign _386 = _301 & _385;
    assign _393 = _386 ? _392 : _384;
    assign _394 = host_run ? _393 : _384;
    assign _23 = _394;
    always @(posedge _112) begin
        if (_122)
            _384 <= _1018;
        else
            _384 <= _23;
    end
    assign _387 = 5'b01010;
    assign _388 = op == _387;
    assign _392 = _388 ? _391 : imm;
    assign _396 = ~ _304;
    assign _397 = _301 ? _396 : _1056;
    assign _398 = host_run ? _397 : _304;
    assign _24 = _398;
    always @(posedge _112) begin
        if (_122)
            _304 <= _1056;
        else
            _304 <= _24;
    end
    assign _614 = _304 ? _384 : _392;
    assign host_data_rd_addr = host_data_rd_addr_0;
    assign _300 = op == _387;
    assign _297 = 5'b11110;
    assign _298 = op == _297;
    assign _301 = _298 | _300;
    assign _615 = _301 ? _614 : host_data_rd_addr;
    assign _406 = cyc[15:8];
    assign _399 = 16'b0000000000000001;
    assign _400 = cyc + _399;
    assign _401 = host_run ? _400 : cyc;
    assign _26 = _401;
    always @(posedge _112) begin
        if (_122)
            cyc <= _994;
        else
            cyc <= _26;
    end
    assign _405 = cyc[7:0];
    always @* begin
        case (_404)
        0:
            _407 <= _61;
        1:
            _407 <= _405;
        default:
            _407 <= _406;
        endcase
    end
    assign cap_wr_data = _407;
    assign host_data_wr_data = prog_wr_data;
    assign _608 = host_data_wr ? host_data_wr_data : reg_val;
    assign _609 = cap_wr ? cap_wr_data : _608;
    assign _436 = cap_base + _413;
    assign _438 = _436 + _260;
    assign _433 = cap_base + _413;
    assign _435 = _433 + _222;
    assign _416 = 8'b00000011;
    assign _417 = _413 + _416;
    assign _418 = _415 ? _417 : _413;
    assign _419 = _410 ? _418 : _413;
    assign _29 = _419;
    always @(posedge _112) begin
        if (_121)
            _413 <= _1018;
        else
            _413 <= _29;
    end
    assign _426 = _266 ? cap_base : prog_wr_data;
    assign _427 = _425 ? _426 : cap_base;
    assign _423 = _254 == _414;
    assign _428 = _423 ? _427 : cap_base;
    assign _429 = _251 ? _428 : cap_base;
    assign _430 = _246 ? _429 : cap_base;
    assign _431 = _239 ? _430 : cap_base;
    assign _30 = _431;
    always @(posedge _112) begin
        if (_121)
            cap_base <= _1018;
        else
            cap_base <= _30;
    end
    assign _432 = cap_base + _413;
    always @* begin
        case (_404)
        0:
            _439 <= _432;
        1:
            _439 <= _435;
        default:
            _439 <= _438;
        endcase
    end
    assign cap_wr_addr = _439;
    assign _457 = host_data_rd_addr_0 + _222;
    assign _453 = host_data_rd_addr_0 + _222;
    assign _450 = _266 ? prog_wr_data : host_data_rd_addr_0;
    assign _449 = _259 == _222;
    assign _451 = _449 ? _450 : host_data_rd_addr_0;
    assign _446 = _259 == _260;
    assign _447 = _446 & _266;
    assign _454 = _447 ? _453 : _451;
    assign _444 = _259 == _416;
    assign _455 = _444 ? prog_wr_data : _454;
    assign _441 = 8'b00000100;
    assign _442 = _259 == _441;
    assign _458 = _442 ? _457 : _455;
    assign _440 = _254 == _414;
    assign _459 = _440 ? _458 : host_data_rd_addr_0;
    assign _460 = _251 ? _459 : host_data_rd_addr_0;
    assign _461 = _246 ? _460 : host_data_rd_addr_0;
    assign _462 = _239 ? _461 : host_data_rd_addr_0;
    assign _32 = _462;
    always @(posedge _112) begin
        if (_121)
            host_data_rd_addr_0 <= _1018;
        else
            host_data_rd_addr_0 <= _32;
    end
    assign host_data_wr_addr = host_data_rd_addr_0;
    assign _596 = 5'b01011;
    assign _597 = op == _596;
    assign _598 = _597 ? _391 : imm;
    assign _599 = host_data_wr ? host_data_wr_addr : _598;
    assign _600 = cap_wr ? cap_wr_addr : _599;
    assign _414 = 2'b10;
    assign _403 = 2'b00;
    assign _561 = 2'b01;
    assign _562 = _404 + _561;
    assign _563 = _415 ? _560 : _562;
    assign _559 = _557 ? _403 : _404;
    assign _560 = _468 ? _559 : _404;
    assign _564 = _410 ? _563 : _560;
    assign _34 = _564;
    always @(posedge _112) begin
        if (_121)
            _404 <= _403;
        else
            _404 <= _34;
    end
    assign _415 = _404 == _414;
    assign _576 = _415 ? _1056 : _574;
    assign _572 = 1'b1;
    assign _549 = _484 | _493;
    assign _550 = _549 | _502;
    assign _551 = _550 | _511;
    assign _552 = _551 | _520;
    assign _553 = _552 | _529;
    assign _554 = _553 | _538;
    assign _555 = _554 | _547;
    assign _544 = _477[7:7];
    assign _545 = ~ _544;
    assign _543 = _61[7:7];
    assign _546 = _543 & _545;
    assign _541 = _477[7:7];
    assign _539 = _61[7:7];
    assign _540 = ~ _539;
    assign _542 = _540 & _541;
    assign _547 = _472 ? _546 : _542;
    assign _535 = _477[6:6];
    assign _536 = ~ _535;
    assign _534 = _61[6:6];
    assign _537 = _534 & _536;
    assign _532 = _477[6:6];
    assign _530 = _61[6:6];
    assign _531 = ~ _530;
    assign _533 = _531 & _532;
    assign _538 = _472 ? _537 : _533;
    assign _526 = _477[5:5];
    assign _527 = ~ _526;
    assign _525 = _61[5:5];
    assign _528 = _525 & _527;
    assign _523 = _477[5:5];
    assign _521 = _61[5:5];
    assign _522 = ~ _521;
    assign _524 = _522 & _523;
    assign _529 = _472 ? _528 : _524;
    assign _517 = _477[4:4];
    assign _518 = ~ _517;
    assign _516 = _61[4:4];
    assign _519 = _516 & _518;
    assign _514 = _477[4:4];
    assign _512 = _61[4:4];
    assign _513 = ~ _512;
    assign _515 = _513 & _514;
    assign _520 = _472 ? _519 : _515;
    assign _508 = _477[3:3];
    assign _509 = ~ _508;
    assign _507 = _61[3:3];
    assign _510 = _507 & _509;
    assign _505 = _477[3:3];
    assign _503 = _61[3:3];
    assign _504 = ~ _503;
    assign _506 = _504 & _505;
    assign _511 = _472 ? _510 : _506;
    assign _499 = _477[2:2];
    assign _500 = ~ _499;
    assign _498 = _61[2:2];
    assign _501 = _498 & _500;
    assign _496 = _477[2:2];
    assign _494 = _61[2:2];
    assign _495 = ~ _494;
    assign _497 = _495 & _496;
    assign _502 = _472 ? _501 : _497;
    assign _490 = _477[1:1];
    assign _491 = ~ _490;
    assign _489 = _61[1:1];
    assign _492 = _489 & _491;
    assign _487 = _477[1:1];
    assign _485 = _61[1:1];
    assign _486 = ~ _485;
    assign _488 = _486 & _487;
    assign _493 = _472 ? _492 : _488;
    assign _481 = _477[0:0];
    assign _482 = ~ _481;
    assign _480 = _61[0:0];
    assign _483 = _480 & _482;
    assign _35 = _61;
    always @(posedge _112) begin
        if (_121)
            _477 <= _1018;
        else
            _477 <= _35;
    end
    assign _478 = _477[0:0];
    assign _473 = _61[0:0];
    assign _474 = ~ _473;
    assign _479 = _474 & _478;
    assign _472 = cap_ctrl[1:1];
    assign _484 = _472 ? _483 : _479;
    assign _471 = cap_ctrl[4:2];
    always @* begin
        case (_471)
        0:
            _548 <= _484;
        1:
            _548 <= _493;
        2:
            _548 <= _502;
        3:
            _548 <= _511;
        4:
            _548 <= _520;
        5:
            _548 <= _529;
        6:
            _548 <= _538;
        default:
            _548 <= _547;
        endcase
    end
    assign _470 = cap_ctrl[5:5];
    assign _556 = _470 ? _555 : _548;
    assign _469 = _466 & _467;
    assign _557 = _469 & _556;
    assign _573 = _557 ? _572 : _410;
    assign _467 = ~ _410;
    assign _566 = _266 ? prog_wr_data : cap_ctrl;
    assign _424 = 8'b00001010;
    assign _425 = _259 == _424;
    assign _567 = _425 ? _566 : cap_ctrl;
    assign _565 = _254 == _414;
    assign _568 = _565 ? _567 : cap_ctrl;
    assign _569 = _251 ? _568 : cap_ctrl;
    assign _570 = _246 ? _569 : cap_ctrl;
    assign _571 = _239 ? _570 : cap_ctrl;
    assign _36 = _571;
    always @(posedge _112) begin
        if (_121)
            cap_ctrl <= _1018;
        else
            cap_ctrl <= _36;
    end
    assign _466 = cap_ctrl[0:0];
    assign _468 = _466 & _467;
    assign _574 = _468 ? _573 : _410;
    assign _577 = _410 ? _576 : _574;
    assign _37 = _577;
    always @(posedge _112) begin
        if (_121)
            _410 <= _1056;
        else
            _410 <= _37;
    end
    assign cap_wr = _410;
    assign _591 = op == _596;
    assign _592 = advance & _591;
    assign _586 = 5'b11111;
    assign _587 = op == _586;
    assign _588 = advance & _587;
    assign _584 = _259 == _441;
    assign data_wr = _582 & _584;
    assign host_data_wr = data_wr;
    assign _589 = host_data_wr | _588;
    assign _593 = _589 | _592;
    assign _594 = _593 | cap_wr;
    RM_IHPSG13_2P_256x8_c2_bm_bist
        the_RM_IHPSG13_2P_256x8_c2_bm_bist
        ( .A_CLK(_112),
          .A_MEN(vdd),
          .A_WEN(_594),
          .A_REN(gnd),
          .A_ADDR(_600),
          .A_DIN(_609),
          .A_DLY(gnd),
          .A_BM(_1036),
          .A_BIST_CLK(gnd),
          .A_BIST_EN(gnd),
          .A_BIST_MEN(gnd),
          .A_BIST_WEN(gnd),
          .A_BIST_REN(gnd),
          .A_BIST_ADDR(_1018),
          .A_BIST_DIN(_1018),
          .A_BIST_BM(_1036),
          .B_CLK(_112),
          .B_MEN(vdd),
          .B_WEN(gnd),
          .B_REN(vdd),
          .B_ADDR(_615),
          .B_DIN(_1018),
          .B_DLY(gnd),
          .B_BM(_1036),
          .B_BIST_CLK(gnd),
          .B_BIST_EN(gnd),
          .B_BIST_MEN(gnd),
          .B_BIST_WEN(gnd),
          .B_BIST_REN(gnd),
          .B_BIST_ADDR(_1018),
          .B_BIST_DIN(_1018),
          .B_BIST_BM(_1036),
          .B_DOUT(_622[7:0]) );
    assign data_mem_host_rdata = _622;
    assign _41 = data_mem_host_rdata;
    always @(posedge _112) begin
        if (_122)
            _845 <= _1018;
        else
            _845 <= _41;
    end
    assign _839 = imm[2:0];
    always @* begin
        case (_839)
        0:
            pin_imm <= _311;
        1:
            pin_imm <= _312;
        2:
            pin_imm <= _313;
        3:
            pin_imm <= _314;
        4:
            pin_imm <= _315;
        5:
            pin_imm <= _316;
        6:
            pin_imm <= _317;
        default:
            pin_imm <= _318;
        endcase
    end
    assign _838 = 7'b0000000;
    assign _841 = { _838,
                    pin_imm };
    assign _634 = _632 == _142;
    assign _635 = _634 ? host_rx_data : _629;
    assign _636 = _626 ? _635 : _629;
    assign _42 = _636;
    always @(posedge _112) begin
        if (_121)
            _629 <= _1018;
        else
            _629 <= _42;
    end
    assign _641 = _632 == _149;
    assign _642 = _641 ? host_rx_data : _639;
    assign _643 = _626 ? _642 : _639;
    assign _43 = _643;
    always @(posedge _112) begin
        if (_121)
            _639 <= _1018;
        else
            _639 <= _43;
    end
    assign _648 = _632 == _156;
    assign _649 = _648 ? host_rx_data : _646;
    assign _650 = _626 ? _649 : _646;
    assign _44 = _650;
    always @(posedge _112) begin
        if (_121)
            _646 <= _1018;
        else
            _646 <= _44;
    end
    assign _655 = _632 == _163;
    assign _656 = _655 ? host_rx_data : _653;
    assign _657 = _626 ? _656 : _653;
    assign _45 = _657;
    always @(posedge _112) begin
        if (_121)
            _653 <= _1018;
        else
            _653 <= _45;
    end
    assign _662 = _632 == _170;
    assign _663 = _662 ? host_rx_data : _660;
    assign _664 = _626 ? _663 : _660;
    assign _46 = _664;
    always @(posedge _112) begin
        if (_121)
            _660 <= _1018;
        else
            _660 <= _46;
    end
    assign _669 = _632 == _177;
    assign _670 = _669 ? host_rx_data : _667;
    assign _671 = _626 ? _670 : _667;
    assign _47 = _671;
    always @(posedge _112) begin
        if (_121)
            _667 <= _1018;
        else
            _667 <= _47;
    end
    assign _676 = _632 == _184;
    assign _677 = _676 ? host_rx_data : _674;
    assign _678 = _626 ? _677 : _674;
    assign _48 = _678;
    always @(posedge _112) begin
        if (_121)
            _674 <= _1018;
        else
            _674 <= _48;
    end
    assign host_rx_data = prog_wr_data;
    assign _680 = _632 + _184;
    assign _681 = _626 ? _680 : _632;
    assign _50 = _681;
    always @(posedge _112) begin
        if (_121)
            _632 <= _197;
        else
            _632 <= _50;
    end
    assign _686 = _632 == _197;
    assign _687 = _686 ? host_rx_data : _684;
    assign _688 = _626 ? _687 : _684;
    assign _51 = _688;
    always @(posedge _112) begin
        if (_121)
            _684 <= _1018;
        else
            _684 <= _51;
    end
    assign _709 = _707 + _184;
    assign _700 = _229 - _1012;
    assign _697 = _229 + _1012;
    assign _625 = ~ fifo_full_0;
    assign fifo_full_0 = _229 == _132;
    assign rx_full = fifo_full_0;
    assign _692 = ~ rx_full;
    assign _689 = 8'b00001000;
    assign _690 = _259 == _689;
    assign _691 = _582 & _690;
    assign fifo_rx_push = _691 & _692;
    assign host_rx_push = fifo_rx_push;
    assign _626 = host_rx_push & _625;
    assign _698 = _626 ? _697 : _229;
    assign _701 = _695 ? _700 : _698;
    assign _54 = _701;
    always @(posedge _112) begin
        if (_121)
            _229 <= _1039;
        else
            _229 <= _54;
    end
    assign fifo_empty = _229 == _1039;
    assign _694 = ~ fifo_empty;
    assign _703 = op == _295;
    assign fifo_rx_pop = advance & _703;
    assign core_rx_pop = fifo_rx_pop;
    assign _695 = core_rx_pop & _694;
    assign _710 = _695 ? _709 : _707;
    assign _56 = _710;
    always @(posedge _112) begin
        if (_121)
            _707 <= _197;
        else
            _707 <= _56;
    end
    always @* begin
        case (_707)
        0:
            fifo_data_0 <= _684;
        1:
            fifo_data_0 <= _674;
        2:
            fifo_data_0 <= _667;
        3:
            fifo_data_0 <= _660;
        4:
            fifo_data_0 <= _653;
        5:
            fifo_data_0 <= _646;
        6:
            fifo_data_0 <= _639;
        default:
            fifo_data_0 <= _629;
        endcase
    end
    assign rx_data = fifo_data_0;
    assign _834 = reg_val ^ imm;
    assign _833 = reg_val | imm;
    assign _832 = reg_val & imm;
    assign _829 = { _1056,
                    reg_val };
    assign _830 = _829 - _825;
    assign _831 = _830[7:0];
    assign _825 = { _1056,
                    imm };
    assign _823 = { _1056,
                    reg_val };
    assign _826 = _823 + _825;
    assign _827 = _826[7:0];
    assign _809 = _807[7:4];
    assign _810 = { _1039,
                    _809 };
    assign _805 = _803[7:2];
    assign _806 = { _403,
                    _805 };
    assign _801 = reg_val[7:1];
    assign _802 = { _1056,
                    _801 };
    assign _799 = _761[0:0];
    assign _803 = _799 ? _802 : reg_val;
    assign _798 = _761[1:1];
    assign _807 = _798 ? _806 : _803;
    assign _797 = _761[2:2];
    assign _811 = _797 ? _810 : _807;
    assign _796 = _761[3:3];
    assign _813 = _796 ? _1018 : _811;
    assign _795 = _761[4:4];
    assign _815 = _795 ? _1018 : _813;
    assign _794 = _761[5:5];
    assign _817 = _794 ? _1018 : _815;
    assign _793 = _761[6:6];
    assign _819 = _793 ? _1018 : _817;
    assign _792 = _761[7:7];
    assign _821 = _792 ? _1018 : _819;
    assign _778 = _777[3:0];
    assign _780 = { _778,
                    _1039 };
    assign _774 = _773[5:0];
    assign _776 = { _774,
                    _403 };
    assign _770 = reg_val[6:0];
    assign _772 = { _770,
                    _1056 };
    assign _741 = arg == _142;
    assign _851 = _741 ? reg_write_value : _606;
    assign _852 = _739 ? _851 : _606;
    assign _853 = advance ? _852 : _606;
    assign _854 = host_run ? _853 : _606;
    assign _58 = _854;
    always @(posedge _112) begin
        if (_122)
            _606 <= _1018;
        else
            _606 <= _58;
    end
    assign _856 = arg == _163;
    assign _857 = _856 ? reg_write_value : oe;
    assign _858 = _739 ? _857 : oe;
    assign _859 = advance ? _858 : oe;
    assign _860 = host_run ? _859 : oe;
    assign _59 = _860;
    always @(posedge _112) begin
        if (_122)
            oe <= _1018;
        else
            oe <= _59;
    end
    assign _930 = pins_out[6:0];
    assign _931 = { _910,
                    _930 };
    assign _928 = pins_out[5:0];
    assign _927 = pins_out[7:7];
    assign _929 = { _927,
                    _910,
                    _928 };
    assign _925 = pins_out[4:0];
    assign _924 = pins_out[7:6];
    assign _926 = { _924,
                    _910,
                    _925 };
    assign _922 = pins_out[3:0];
    assign _921 = pins_out[7:5];
    assign _923 = { _921,
                    _910,
                    _922 };
    assign _919 = pins_out[2:0];
    assign _918 = pins_out[7:4];
    assign _920 = { _918,
                    _910,
                    _919 };
    assign _916 = pins_out[1:0];
    assign _915 = pins_out[7:3];
    assign _917 = { _915,
                    _910,
                    _916 };
    assign _913 = pins_out[0:0];
    assign _912 = pins_out[7:2];
    assign _914 = { _912,
                    _910,
                    _913 };
    assign _318 = _61[7:7];
    assign _317 = _61[6:6];
    assign _316 = _61[5:5];
    assign _315 = _61[4:4];
    assign _314 = _61[3:3];
    assign _313 = _61[2:2];
    assign _312 = _61[1:1];
    assign _61 = uio_in;
    assign _311 = _61[0:0];
    always @* begin
        case (arg)
        0:
            pin_arg <= _311;
        1:
            pin_arg <= _312;
        2:
            pin_arg <= _313;
        3:
            pin_arg <= _314;
        4:
            pin_arg <= _315;
        5:
            pin_arg <= _316;
        6:
            pin_arg <= _317;
        default:
            pin_arg <= _318;
        endcase
    end
    assign _873 = _603[6:0];
    assign _874 = { _873,
                    pin_arg };
    assign _869 = _603[6:0];
    assign _871 = { _869,
                    _1056 };
    assign _866 = arg == _156;
    assign _867 = _866 ? reg_write_value : _603;
    assign _868 = _739 ? _867 : _603;
    assign _872 = _864 ? _871 : _868;
    assign _861 = 5'b11011;
    assign _862 = op == _861;
    assign _875 = _862 ? _874 : _872;
    assign _876 = advance ? _875 : _603;
    assign _877 = host_run ? _876 : _603;
    assign _62 = _877;
    always @(posedge _112) begin
        if (_122)
            _603 <= _1018;
        else
            _603 <= _62;
    end
    assign _910 = _603[7:7];
    assign _909 = pins_out[7:1];
    assign _911 = { _909,
                    _910 };
    always @* begin
        case (arg)
        0:
            _932 <= _911;
        1:
            _932 <= _914;
        2:
            _932 <= _917;
        3:
            _932 <= _920;
        4:
            _932 <= _923;
        5:
            _932 <= _926;
        6:
            _932 <= _929;
        default:
            _932 <= _931;
        endcase
    end
    assign _905 = pins_out[6:0];
    assign _906 = { _885,
                    _905 };
    assign _903 = pins_out[5:0];
    assign _902 = pins_out[7:7];
    assign _904 = { _902,
                    _885,
                    _903 };
    assign _900 = pins_out[4:0];
    assign _899 = pins_out[7:6];
    assign _901 = { _899,
                    _885,
                    _900 };
    assign _897 = pins_out[3:0];
    assign _896 = pins_out[7:5];
    assign _898 = { _896,
                    _885,
                    _897 };
    assign _894 = pins_out[2:0];
    assign _893 = pins_out[7:4];
    assign _895 = { _893,
                    _885,
                    _894 };
    assign _891 = pins_out[1:0];
    assign _890 = pins_out[7:3];
    assign _892 = { _890,
                    _885,
                    _891 };
    assign _888 = pins_out[0:0];
    assign _887 = pins_out[7:2];
    assign _889 = { _887,
                    _885,
                    _888 };
    assign _885 = imm[0:0];
    assign _884 = pins_out[7:1];
    assign _886 = { _884,
                    _885 };
    always @* begin
        case (arg)
        0:
            _907 <= _886;
        1:
            _907 <= _889;
        2:
            _907 <= _892;
        3:
            _907 <= _895;
        4:
            _907 <= _898;
        5:
            _907 <= _901;
        6:
            _907 <= _904;
        default:
            _907 <= _906;
        endcase
    end
    assign _881 = arg == _170;
    assign _882 = _881 ? reg_write_value : pins_out;
    assign _883 = _739 ? _882 : pins_out;
    assign _878 = 5'b01100;
    assign _879 = op == _878;
    assign _908 = _879 ? _907 : _883;
    assign _863 = 5'b11010;
    assign _864 = op == _863;
    assign _933 = _864 ? _932 : _908;
    assign _934 = advance ? _933 : pins_out;
    assign _935 = host_run ? _934 : pins_out;
    assign _63 = _935;
    always @(posedge _112) begin
        if (_122)
            pins_out <= _1018;
        else
            pins_out <= _63;
    end
    assign _937 = arg == _177;
    assign _938 = _937 ? reg_write_value : _391;
    assign _939 = _739 ? _938 : _391;
    assign _940 = advance ? _939 : _391;
    assign _941 = host_run ? _940 : _391;
    assign _64 = _941;
    always @(posedge _112) begin
        if (_122)
            _391 <= _1018;
        else
            _391 <= _64;
    end
    assign _371 = _369 - _222;
    assign _945 = arg == _184;
    assign _946 = _945 ? reg_write_value : _369;
    assign _947 = _739 ? _946 : _369;
    assign _943 = op == _365;
    assign _948 = _943 ? _371 : _947;
    assign _949 = advance ? _948 : _369;
    assign _950 = host_run ? _949 : _369;
    assign _65 = _950;
    always @(posedge _112) begin
        if (_122)
            _369 <= _1018;
        else
            _369 <= _65;
    end
    assign _954 = prog_wr_data[1:1];
    assign _951 = 8'b00000110;
    assign _952 = _259 == _951;
    assign _953 = _582 & _952;
    assign reset_core = _953 & _954;
    assign host_reset_core = reset_core;
    assign _122 = _121 | host_reset_core;
    assign _957 = arg == _197;
    assign _958 = _957 ? reg_write_value : fifo_tx_data;
    assign _959 = _739 ? _958 : fifo_tx_data;
    assign _960 = advance ? _959 : fifo_tx_data;
    assign _961 = host_run ? _960 : fifo_tx_data;
    assign _67 = _961;
    always @(posedge _112) begin
        if (_122)
            fifo_tx_data <= _1018;
        else
            fifo_tx_data <= _67;
    end
    always @* begin
        case (arg)
        0:
            reg_val <= fifo_tx_data;
        1:
            reg_val <= _369;
        2:
            reg_val <= _391;
        3:
            reg_val <= pins_out;
        4:
            reg_val <= oe;
        5:
            reg_val <= _603;
        6:
            reg_val <= _337;
        default:
            reg_val <= _606;
        endcase
    end
    assign _769 = _761[0:0];
    assign _773 = _769 ? _772 : reg_val;
    assign _768 = _761[1:1];
    assign _777 = _768 ? _776 : _773;
    assign _767 = _761[2:2];
    assign _781 = _767 ? _780 : _777;
    assign _766 = _761[3:3];
    assign _783 = _766 ? _1018 : _781;
    assign _765 = _761[4:4];
    assign _785 = _765 ? _1018 : _783;
    assign _764 = _761[5:5];
    assign _787 = _764 ? _1018 : _785;
    assign _763 = _761[6:6];
    assign _789 = _763 ? _1018 : _787;
    assign imm = _72[7:0];
    assign _759 = imm == _1018;
    assign _761 = _759 ? _689 : imm;
    assign _762 = _761[7:7];
    assign _791 = _762 ? _1018 : _789;
    assign _757 = op[2:0];
    always @* begin
        case (_757)
        0:
            alu_result <= _791;
        1:
            alu_result <= _821;
        2:
            alu_result <= _827;
        3:
            alu_result <= _827;
        4:
            alu_result <= _831;
        5:
            alu_result <= _832;
        6:
            alu_result <= _833;
        default:
            alu_result <= _834;
        endcase
    end
    assign _756 = op == _295;
    assign _836 = _756 ? rx_data : alu_result;
    assign _753 = 5'b11001;
    assign _754 = op == _753;
    assign _837 = _754 ? _61 : _836;
    assign _751 = 5'b11000;
    assign _752 = op == _751;
    assign _842 = _752 ? _841 : _837;
    assign _749 = op == _387;
    assign _747 = op == _297;
    assign _750 = _747 | _749;
    assign _846 = _750 ? _845 : _842;
    assign _744 = 5'b00010;
    assign _745 = op == _744;
    assign _849 = _745 ? reg_src : _846;
    assign _742 = 5'b00001;
    assign _743 = op == _742;
    assign reg_write_value = _743 ? imm : _849;
    assign arg = _72[10:8];
    assign _966 = arg == _149;
    assign _967 = _966 ? reg_write_value : _337;
    assign _738 = op == _295;
    assign _735 = op == _753;
    assign _732 = op == _751;
    assign _729 = op == _387;
    assign _726 = op == _297;
    assign _715 = op == _744;
    assign _713 = op == _742;
    assign _716 = _713 | _715;
    assign _724 = _716 | _723;
    assign _727 = _724 | _726;
    assign _730 = _727 | _729;
    assign _733 = _730 | _732;
    assign _736 = _733 | _735;
    assign _739 = _736 | _738;
    assign _968 = _739 ? _967 : _337;
    assign _720 = 5'b01001;
    assign _721 = _720 < op;
    assign _722 = ~ _721;
    assign _717 = 5'b00011;
    assign _718 = op < _717;
    assign _719 = ~ _718;
    assign _723 = _719 & _722;
    assign _983 = _723 ? _982 : _968;
    assign _984 = advance ? _983 : _337;
    assign host_run = run;
    assign _985 = host_run ? _984 : _337;
    assign _69 = _985;
    always @(posedge _112) begin
        if (_122)
            _337 <= _1018;
        else
            _337 <= _69;
    end
    assign _338 = _337[0:0];
    assign _333 = 5'b10001;
    assign _334 = op == _333;
    assign _339 = _334 & _338;
    assign _331 = 5'b10000;
    assign _332 = op == _331;
    assign _340 = _332 | _339;
    assign _345 = _340 | _344;
    assign _350 = _345 | _349;
    assign _355 = _350 | _354;
    assign _359 = _355 | _358;
    assign _364 = _359 | _363;
    assign _376 = _364 | branch_taken;
    assign fetch_addr = _376 ? imm : pc;
    assign _986 = host_prog_wr ? host_prog_wr_addr : fetch_addr;
    assign _70 = _986;
    assign _991 = ~ host_prog_wr;
    assign _988 = _259 == _260;
    assign _989 = _582 & _988;
    assign prog_wr = _989 & _266;
    assign host_prog_wr = prog_wr;
    RM_IHPSG13_1P_256x16_c2_bm_bist
        the_RM_IHPSG13_1P_256x16_c2_bm_bist
        ( .A_CLK(_112),
          .A_MEN(vdd),
          .A_WEN(host_prog_wr),
          .A_REN(_991),
          .A_ADDR(_70),
          .A_DIN(host_prog_wr_data),
          .A_DLY(gnd),
          .A_BM(_995),
          .A_BIST_CLK(gnd),
          .A_BIST_EN(gnd),
          .A_BIST_MEN(gnd),
          .A_BIST_WEN(gnd),
          .A_BIST_REN(gnd),
          .A_BIST_ADDR(_1018),
          .A_BIST_DIN(_994),
          .A_BIST_BM(_995),
          .A_DOUT(_997[15:0]) );
    assign _72 = _997;
    assign op = _72[15:11];
    assign _288 = op == _216;
    assign advance = _288 ? _329 : _328;
    assign fifo_tx_push = advance & _999;
    assign core_tx_push = fifo_tx_push;
    assign _135 = core_tx_push & _134;
    assign _1011 = _135 ? _1010 : _131;
    assign _203 = ~ fifo_empty_0;
    assign _1007 = ~ tx_empty;
    assign _1004 = 8'b00001001;
    assign _1005 = prog_wr_data == _1004;
    assign _1002 = _561 == _254;
    assign _1003 = _1002 & _581;
    assign _1006 = _1003 & _1005;
    assign fifo_tx_pop = _1006 & _1007;
    assign host_tx_pop = fifo_tx_pop;
    assign _204 = host_tx_pop & _203;
    assign _1014 = _204 ? _1013 : _1011;
    assign _75 = _1014;
    always @(posedge _112) begin
        if (_121)
            _131 <= _1039;
        else
            _131 <= _75;
    end
    assign fifo_empty_0 = _131 == _1039;
    assign tx_empty = fifo_empty_0;
    assign _1037 = tx_empty ? _1036 : tx_data;
    assign _1034 = prog_wr_data == _1004;
    assign _1038 = _1034 ? _1037 : _1018;
    assign _1031 = 8'b00000111;
    assign _1032 = prog_wr_data == _1031;
    assign _1045 = _1032 ? _1044 : _1038;
    assign _1029 = 8'b00000101;
    assign _1030 = prog_wr_data == _1029;
    assign _1046 = _1030 ? core_data_out : _1045;
    assign _1047 = _1028 ? _1046 : _1019;
    assign _1020 = _254 == _561;
    assign _1048 = _1020 ? _1047 : _1019;
    assign _1049 = _251 ? _1048 : _1019;
    assign _1050 = _246 ? _1049 : _1019;
    assign _1051 = _239 ? _1050 : _1019;
    assign _1015 = ~ _234;
    assign _1016 = _1015 & _237;
    assign _1059 = _1016 ? _1058 : _1051;
    assign _77 = _1059;
    always @(posedge _112) begin
        if (_121)
            _1019 <= _1018;
        else
            _1019 <= _77;
    end
    assign _1399 = _1019[7:7];
    assign gnd = 1'b0;
    assign _1397 = _1052 == _254;
    assign _1398 = _246 & _1397;
    assign miso = _1398 ? _1399 : gnd;
    assign _1063 = prog_wr_data[0:0];
    assign _1062 = _259 == _951;
    assign _1064 = _1062 ? _1063 : run;
    assign _1060 = _254 == _414;
    assign _1065 = _1060 ? _1064 : run;
    assign _1066 = _251 ? _1065 : run;
    assign _1067 = _246 ? _1066 : run;
    assign _1068 = _239 ? _1067 : run;
    assign _78 = _1068;
    always @(posedge _112) begin
        if (_121)
            run <= _1056;
        else
            run <= _78;
    end
    assign _1401 = { run,
                     miso };
    assign _1086 = { prog_wr_data,
                     pat_data_lo };
    assign _1077 = 4'b1111;
    assign _1078 = pat_data_idx == _1077;
    assign _1079 = pat_data_wr & _1078;
    assign _1087 = _1079 ? _1086 : _1082;
    assign _79 = _1087;
    always @(posedge _112) begin
        if (_121)
            _1082 <= _994;
        else
            _1082 <= _79;
    end
    assign _1094 = { prog_wr_data,
                     pat_data_lo };
    assign _1088 = 4'b1110;
    assign _1089 = pat_data_idx == _1088;
    assign _1090 = pat_data_wr & _1089;
    assign _1095 = _1090 ? _1094 : _1093;
    assign _80 = _1095;
    always @(posedge _112) begin
        if (_121)
            _1093 <= _994;
        else
            _1093 <= _80;
    end
    assign _1102 = { prog_wr_data,
                     pat_data_lo };
    assign _1096 = 4'b1101;
    assign _1097 = pat_data_idx == _1096;
    assign _1098 = pat_data_wr & _1097;
    assign _1103 = _1098 ? _1102 : _1101;
    assign _81 = _1103;
    always @(posedge _112) begin
        if (_121)
            _1101 <= _994;
        else
            _1101 <= _81;
    end
    assign _1110 = { prog_wr_data,
                     pat_data_lo };
    assign _1104 = 4'b1100;
    assign _1105 = pat_data_idx == _1104;
    assign _1106 = pat_data_wr & _1105;
    assign _1111 = _1106 ? _1110 : _1109;
    assign _82 = _1111;
    always @(posedge _112) begin
        if (_121)
            _1109 <= _994;
        else
            _1109 <= _82;
    end
    assign _1118 = { prog_wr_data,
                     pat_data_lo };
    assign _1112 = 4'b1011;
    assign _1113 = pat_data_idx == _1112;
    assign _1114 = pat_data_wr & _1113;
    assign _1119 = _1114 ? _1118 : _1117;
    assign _83 = _1119;
    always @(posedge _112) begin
        if (_121)
            _1117 <= _994;
        else
            _1117 <= _83;
    end
    assign _1126 = { prog_wr_data,
                     pat_data_lo };
    assign _1120 = 4'b1010;
    assign _1121 = pat_data_idx == _1120;
    assign _1122 = pat_data_wr & _1121;
    assign _1127 = _1122 ? _1126 : _1125;
    assign _84 = _1127;
    always @(posedge _112) begin
        if (_121)
            _1125 <= _994;
        else
            _1125 <= _84;
    end
    assign _1134 = { prog_wr_data,
                     pat_data_lo };
    assign _1128 = 4'b1001;
    assign _1129 = pat_data_idx == _1128;
    assign _1130 = pat_data_wr & _1129;
    assign _1135 = _1130 ? _1134 : _1133;
    assign _85 = _1135;
    always @(posedge _112) begin
        if (_121)
            _1133 <= _994;
        else
            _1133 <= _85;
    end
    assign _1142 = { prog_wr_data,
                     pat_data_lo };
    assign _1137 = pat_data_idx == _132;
    assign _1138 = pat_data_wr & _1137;
    assign _1143 = _1138 ? _1142 : _1141;
    assign _86 = _1143;
    always @(posedge _112) begin
        if (_121)
            _1141 <= _994;
        else
            _1141 <= _86;
    end
    assign _1150 = { prog_wr_data,
                     pat_data_lo };
    assign _1144 = 4'b0111;
    assign _1145 = pat_data_idx == _1144;
    assign _1146 = pat_data_wr & _1145;
    assign _1151 = _1146 ? _1150 : _1149;
    assign _87 = _1151;
    always @(posedge _112) begin
        if (_121)
            _1149 <= _994;
        else
            _1149 <= _87;
    end
    assign _1158 = { prog_wr_data,
                     pat_data_lo };
    assign _1152 = 4'b0110;
    assign _1153 = pat_data_idx == _1152;
    assign _1154 = pat_data_wr & _1153;
    assign _1159 = _1154 ? _1158 : _1157;
    assign _88 = _1159;
    always @(posedge _112) begin
        if (_121)
            _1157 <= _994;
        else
            _1157 <= _88;
    end
    assign _1166 = { prog_wr_data,
                     pat_data_lo };
    assign _1160 = 4'b0101;
    assign _1161 = pat_data_idx == _1160;
    assign _1162 = pat_data_wr & _1161;
    assign _1167 = _1162 ? _1166 : _1165;
    assign _89 = _1167;
    always @(posedge _112) begin
        if (_121)
            _1165 <= _994;
        else
            _1165 <= _89;
    end
    assign _1174 = { prog_wr_data,
                     pat_data_lo };
    assign _1168 = 4'b0100;
    assign _1169 = pat_data_idx == _1168;
    assign _1170 = pat_data_wr & _1169;
    assign _1175 = _1170 ? _1174 : _1173;
    assign _90 = _1175;
    always @(posedge _112) begin
        if (_121)
            _1173 <= _994;
        else
            _1173 <= _90;
    end
    assign _1182 = { prog_wr_data,
                     pat_data_lo };
    assign _1176 = 4'b0011;
    assign _1177 = pat_data_idx == _1176;
    assign _1178 = pat_data_wr & _1177;
    assign _1183 = _1178 ? _1182 : _1181;
    assign _91 = _1183;
    always @(posedge _112) begin
        if (_121)
            _1181 <= _994;
        else
            _1181 <= _91;
    end
    assign _1190 = { prog_wr_data,
                     pat_data_lo };
    assign _1184 = 4'b0010;
    assign _1185 = pat_data_idx == _1184;
    assign _1186 = pat_data_wr & _1185;
    assign _1191 = _1186 ? _1190 : _1189;
    assign _92 = _1191;
    always @(posedge _112) begin
        if (_121)
            _1189 <= _994;
        else
            _1189 <= _92;
    end
    assign _1198 = { prog_wr_data,
                     pat_data_lo };
    assign _1193 = pat_data_idx == _1012;
    assign _1194 = pat_data_wr & _1193;
    assign _1199 = _1194 ? _1198 : _1197;
    assign _93 = _1199;
    always @(posedge _112) begin
        if (_121)
            _1197 <= _994;
        else
            _1197 <= _93;
    end
    assign _1206 = _264 == _260;
    assign _1207 = _1206 ? prog_wr_data : pat_data_lo;
    assign _1208 = _1204 ? pat_data_lo : _1207;
    assign _1209 = _1202 ? _1208 : pat_data_lo;
    assign _1200 = _254 == _414;
    assign _1210 = _1200 ? _1209 : pat_data_lo;
    assign _1211 = _251 ? _1210 : pat_data_lo;
    assign _1212 = _246 ? _1211 : pat_data_lo;
    assign _1213 = _239 ? _1212 : pat_data_lo;
    assign _94 = _1213;
    always @(posedge _112) begin
        if (_121)
            pat_data_lo <= _1018;
        else
            pat_data_lo <= _94;
    end
    assign _1227 = { prog_wr_data,
                     pat_data_lo };
    assign _1204 = _264 == _416;
    assign _1215 = _1204 ? prog_wr_data : _1075;
    assign _1201 = 8'b00001100;
    assign _1202 = _259 == _1201;
    assign _1216 = _1202 ? _1215 : _1075;
    assign _1214 = _254 == _414;
    assign _1217 = _1214 ? _1216 : _1075;
    assign _1218 = _251 ? _1217 : _1075;
    assign _1219 = _246 ? _1218 : _1075;
    assign _1220 = _239 ? _1219 : _1075;
    assign _95 = _1220;
    always @(posedge _112) begin
        if (_121)
            _1075 <= _1018;
        else
            _1075 <= _95;
    end
    assign pat_data_idx = _1075[3:0];
    assign _1222 = pat_data_idx == _1039;
    assign _1070 = _259 == _1201;
    assign _580 = _249 == _1144;
    assign _581 = _239 & _580;
    assign _578 = _414 == _254;
    assign _582 = _578 & _581;
    assign _1071 = _582 & _1070;
    assign pat_data_wr = _1071 & _266;
    assign _1223 = pat_data_wr & _1222;
    assign _1228 = _1223 ? _1227 : _1226;
    assign _96 = _1228;
    always @(posedge _112) begin
        if (_121)
            _1226 <= _994;
        else
            _1226 <= _96;
    end
    assign _1388 = _1257 + _1012;
    assign _1236 = _264 == _260;
    assign _1237 = _1236 ? prog_wr_data : pat_len;
    assign _1238 = _266 ? pat_len : _1237;
    assign _1239 = _1234 ? _1238 : pat_len;
    assign _1232 = _254 == _414;
    assign _1240 = _1232 ? _1239 : pat_len;
    assign _1241 = _251 ? _1240 : pat_len;
    assign _1242 = _246 ? _1241 : pat_len;
    assign _1243 = _239 ? _1242 : pat_len;
    assign _97 = _1243;
    always @(posedge _112) begin
        if (_121)
            pat_len <= _1018;
        else
            pat_len <= _97;
    end
    assign _1384 = pat_len - _222;
    assign _1385 = _1384[3:0];
    assign _1386 = _1257 == _1385;
    assign _1390 = _1386 ? _1039 : _1388;
    assign _1259 = _1258[15:8];
    assign _1262 = _1250 + _222;
    assign _1264 = _1260 ? _222 : _1262;
    assign _1266 = _1254 ? _222 : _1264;
    assign _1267 = _1247 ? _1266 : _1250;
    assign _98 = _1267;
    always @(posedge _112) begin
        if (_121)
            _1250 <= _1018;
        else
            _1250 <= _98;
    end
    assign _1260 = _1250 == _1259;
    assign _1391 = _1260 ? _1390 : _1257;
    assign _99 = _1247;
    always @(posedge _112) begin
        if (_121)
            _1253 <= _1056;
        else
            _1253 <= _99;
    end
    assign _1254 = ~ _1253;
    assign _1393 = _1254 ? _1039 : _1391;
    assign _1377 = _266 ? prog_wr_data : pat_ctrl;
    assign _1233 = 8'b00001011;
    assign _1268 = _254 == _561;
    assign _1269 = _1268 ? prog_wr_data : _259;
    assign _1270 = _251 ? _1269 : _259;
    assign _1271 = _246 ? _1270 : _259;
    assign _1272 = _239 ? _1271 : _259;
    assign _100 = _1272;
    always @(posedge _112) begin
        if (_121)
            _259 <= _1018;
        else
            _259 <= _100;
    end
    assign _1234 = _259 == _1233;
    assign _1378 = _1234 ? _1377 : pat_ctrl;
    assign _1052 = 2'b11;
    assign _1351 = _1317 ? _414 : _1343;
    assign _1352 = _1028 ? _1052 : _1351;
    assign _1027 = prog_wr_data == _1004;
    assign _1024 = prog_wr_data == _1031;
    assign _1022 = prog_wr_data == _1029;
    assign _1025 = _1022 | _1024;
    assign _1028 = _1025 | _1027;
    assign _1349 = ~ _1028;
    assign _1348 = ~ _1317;
    assign _1350 = _1348 & _1349;
    assign _1353 = _1350 ? _403 : _1352;
    assign _1329 = prog_wr_data == _424;
    assign _1326 = prog_wr_data == _260;
    assign _1324 = prog_wr_data == _222;
    assign _1327 = _1324 | _1326;
    assign _1330 = _1327 | _1329;
    assign _1333 = _1330 ? _260 : _222;
    assign _1321 = prog_wr_data == _1201;
    assign _1319 = prog_wr_data == _1233;
    assign _1322 = _1319 | _1321;
    assign _1335 = _1322 ? _416 : _1333;
    assign _1316 = prog_wr_data == _1201;
    assign _1313 = prog_wr_data == _1233;
    assign _1310 = prog_wr_data == _424;
    assign _1307 = prog_wr_data == _689;
    assign _1304 = prog_wr_data == _951;
    assign _1301 = prog_wr_data == _441;
    assign _1298 = prog_wr_data == _416;
    assign _1295 = prog_wr_data == _260;
    assign new_shift = _114[2:2];
    assign _1273 = _271[6:0];
    assign _1274 = { _1273,
                     new_shift };
    assign _1275 = _246 ? _1274 : _271;
    assign _1276 = _239 ? _1275 : _271;
    assign _101 = _1276;
    always @(posedge _112) begin
        if (_121)
            _271 <= _1018;
        else
            _271 <= _101;
    end
    assign _272 = _271[6:0];
    assign prog_wr_data = { _272,
                            new_shift };
    assign _1293 = prog_wr_data == _222;
    assign _1296 = _1293 | _1295;
    assign _1299 = _1296 | _1298;
    assign _1302 = _1299 | _1301;
    assign _1305 = _1302 | _1304;
    assign _1308 = _1305 | _1307;
    assign _1311 = _1308 | _1310;
    assign _1314 = _1311 | _1313;
    assign _1317 = _1314 | _1316;
    assign _1336 = _1317 ? _1335 : _1286;
    assign _1290 = _264 - _222;
    assign _1288 = _254 == _414;
    assign _1291 = _1288 ? _1290 : _1286;
    assign _1287 = _254 == _561;
    assign _1337 = _1287 ? _1336 : _1291;
    assign _1338 = _251 ? _1337 : _1286;
    assign _1339 = _246 ? _1338 : _1286;
    assign _1284 = _1282 ? _1018 : _264;
    assign _1286 = _1281 ? _1018 : _1284;
    assign _1340 = _239 ? _1339 : _1286;
    assign _102 = _1340;
    always @(posedge _112) begin
        if (_121)
            _264 <= _1018;
        else
            _264 <= _102;
    end
    assign _266 = _264 == _222;
    assign _1346 = _266 ? _403 : _1343;
    assign _1345 = _254 == _414;
    assign _1347 = _1345 ? _1346 : _1343;
    assign _1344 = _254 == _561;
    assign _1354 = _1344 ? _1353 : _1347;
    assign _1355 = _251 ? _1354 : _1343;
    assign _1356 = _246 ? _1355 : _1343;
    assign _1341 = _1282 ? _561 : _254;
    assign _1343 = _1281 ? _403 : _1341;
    assign _1357 = _239 ? _1356 : _1343;
    assign _103 = _1357;
    always @(posedge _112) begin
        if (_121)
            _254 <= _403;
        else
            _254 <= _103;
    end
    assign _1376 = _254 == _414;
    assign _1379 = _1376 ? _1378 : pat_ctrl;
    assign _1363 = _249 + _1012;
    assign _1365 = _251 ? _1039 : _1363;
    assign _1366 = _246 ? _1365 : _1361;
    assign _1282 = _246 & _1279;
    assign _1359 = _1282 ? _1039 : _249;
    assign _104 = _245;
    always @(posedge _112) begin
        if (_121)
            _1279 <= _1056;
        else
            _1279 <= _104;
    end
    assign _1280 = ~ _1279;
    assign _1281 = _245 & _1280;
    assign _1361 = _1281 ? _1039 : _1359;
    assign _1367 = _239 ? _1366 : _1361;
    assign _105 = _1367;
    always @(posedge _112) begin
        if (_121)
            _249 <= _1039;
        else
            _249 <= _105;
    end
    assign _251 = _249 == _1144;
    assign _1380 = _251 ? _1379 : pat_ctrl;
    assign _1368 = _114[0:0];
    assign _106 = _1368;
    always @(posedge _112) begin
        if (_121)
            _1371 <= _1056;
        else
            _1371 <= _106;
    end
    assign _107 = _1371;
    always @(posedge _112) begin
        if (_121)
            _245 <= _1056;
        else
            _245 <= _107;
    end
    assign _246 = ~ _245;
    assign _1381 = _246 ? _1380 : pat_ctrl;
    assign _108 = _234;
    always @(posedge _112) begin
        if (_121)
            _237 <= _1056;
        else
            _237 <= _108;
    end
    assign _238 = ~ _237;
    assign vdd = 1'b1;
    assign _110 = rst_n;
    assign _121 = ~ _110;
    assign _112 = clk;
    assign _114 = ui_in;
    assign _1372 = _114[1:1];
    assign _115 = _1372;
    always @(posedge _112) begin
        if (_121)
            _1375 <= _1056;
        else
            _1375 <= _115;
    end
    assign _116 = _1375;
    always @(posedge _112) begin
        if (_121)
            _234 <= _1056;
        else
            _234 <= _116;
    end
    assign _239 = _234 & _238;
    assign _1382 = _239 ? _1381 : pat_ctrl;
    assign _117 = _1382;
    always @(posedge _112) begin
        if (_121)
            pat_ctrl <= _1018;
        else
            pat_ctrl <= _117;
    end
    assign _1247 = pat_ctrl[0:0];
    assign _1394 = _1247 ? _1393 : _1257;
    assign _118 = _1394;
    always @(posedge _112) begin
        if (_121)
            _1257 <= _1039;
        else
            _1257 <= _118;
    end
    always @* begin
        case (_1257)
        0:
            _1258 <= _1226;
        1:
            _1258 <= _1197;
        2:
            _1258 <= _1189;
        3:
            _1258 <= _1181;
        4:
            _1258 <= _1173;
        5:
            _1258 <= _1165;
        6:
            _1258 <= _1157;
        7:
            _1258 <= _1149;
        8:
            _1258 <= _1141;
        9:
            _1258 <= _1133;
        10:
            _1258 <= _1125;
        11:
            _1258 <= _1117;
        12:
            _1258 <= _1109;
        13:
            _1258 <= _1101;
        14:
            _1258 <= _1093;
        default:
            _1258 <= _1082;
        endcase
    end
    assign pat_pins = _1258[7:0];
    assign _1396 = pat_pins[7:2];
    assign _1402 = { _1396,
                     _1401 };
    assign prog_wr_addr = host_data_rd_addr_0;
    assign data_wr_addr = host_data_rd_addr_0;
    assign status = run;
    assign data_wr_data = prog_wr_data;
    assign fifo_rx_data = prog_wr_data;
    assign pat_data_hi = prog_wr_data;
    assign uo_out = _1402;
    assign uio_out = pins_out;
    assign uio_oe = oe;

endmodule
