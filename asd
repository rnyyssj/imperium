// ===============================|  REAL SOCCER ARGENTINA  |===============================
//		Version: 2.0.3
//		Build Date: 7/07/2022 - Build update
//		Author: Randy
//		* ARSA | Real Soccer Revolution (RSR)
//      Changelog:
//     	2.0.0 Anti-DU system, Anti spam system. 
//		2.0.1 AutoRec system.
//		2.0.2 fix bug console chat, fix bug console log. 
//		2.0.3 Password admin host, add camisetas.
//		2.0.3 Upgrade Anti-du system, upgrade AutoRec system and add report match.
//
// =========================================================================

// =========================================================================
// Usefull Links
// ------------------------------------------------
// https://www.haxball.com/headless
// https://github.com/haxball/haxball-issues/wiki/Headless-Host
// https://www.haxball.com/headlesstoken
// https://www.haxball.com/playerauth
// =========================================================================


//Real Soccer Variables

var throwTimeOut = 420; // 7 seconds (var is in game ticks)
var gkTimeOut = 600; // 10 seconds (var is in game ticks)
var ckTimeOut = 600; // 10 seconds (var is in game ticks)
var throwinDistance = 270; // distance players can move the ball during throw in
var mapBGColor = "86A578"; // default 718C5A
var superAdminCode = "ARSA7823"; //
var allowPublicAdmin = true; // if true then !admin command is enabled

/*-------------------------------- STADIUMS ---------------------------------*/
function getRealSoccerMap() {
	var realSoccerMap = `{"name":"ARSA Stadium - RSR","width":1300,"height":670,"spawnDistance":560,"bg":{"type":"grass","width":1150,"height":600,"kickOffRadius":180,"cornerRadius":0,"color":"`+mapBGColor+`"},"playerPhysics":{"bCoef":0.3,"invMass":0.5,"damping":0.96,"acceleration":0.12,"kickingAcceleration":0.07,"kickingDamping":0.96,"kickStrength":5.65},"ballPhysics":{"radius":9,"bCoef":0.5,"invMass":1.05,"damping":0.99,"color":"FFFFFF","cMask":["all"],"cGroup":["ball"]},"vertexes" : [
		/* 0 */ { "x" : 0, "y" : 675, "trait" : "kickOffBarrier" },
		/* 1 */ { "x" : 0, "y" : 180, "trait" : "kickOffBarrier" },
		/* 2 */ { "x" : 0, "y" : -180, "trait" : "kickOffBarrier" },
		/* 3 */ { "x" : 0, "y" : -675, "trait" : "kickOffBarrier" },
		
		/* 4 */ { "x" : 1150, "y" : 320, "trait" : "line" },
		/* 5 */ { "x" : 840, "y" : 320, "trait" : "line" },
		/* 6 */ { "x" : 1150, "y" : -320, "trait" : "line" },
		/* 7 */ { "x" : 840, "y" : -320, "trait" : "line" },
		/* 8 */ { "x" : 1150, "y" : 180, "trait" : "line" },
		/* 9 */ { "x" : 1030, "y" : 180, "trait" : "line" },
		/* 10 */ { "x" : 1150, "y" : -180, "trait" : "line" },
		/* 11 */ { "x" : 1030, "y" : -180, "trait" : "line" },
		/* 12 */ { "x" : 840, "y" : -130, "trait" : "line", "curve" : -130 },
		/* 13 */ { "x" : 840, "y" : 130, "trait" : "line", "curve" : -130 },
		/* 14 */ { "x" : -1150, "y" : -320, "trait" : "line" },
		/* 15 */ { "x" : -840, "y" : -320, "trait" : "line" },
		/* 16 */ { "x" : -1150, "y" : 320, "trait" : "line" },
		/* 17 */ { "x" : -840, "y" : 320, "trait" : "line" },
		/* 18 */ { "x" : -1150, "y" : -175, "trait" : "line" },
		/* 19 */ { "x" : -1030, "y" : -175, "trait" : "line" },
		/* 20 */ { "x" : -1150, "y" : 175, "trait" : "line" },
		/* 21 */ { "x" : -1030, "y" : 175, "trait" : "line" },
		/* 22 */ { "x" : -840, "y" : 130, "trait" : "line", "curve" : -130 },
		/* 23 */ { "x" : -840, "y" : -130, "trait" : "line", "curve" : -130 },
		/* 24 */ { "x" : 935, "y" : 3, "trait" : "line" },
		/* 25 */ { "x" : 935, "y" : -3, "trait" : "line" },
		/* 26 */ { "x" : -935, "y" : 3, "trait" : "line" },
		/* 27 */ { "x" : -935, "y" : -3, "trait" : "line" },
		/* 28 */ { "x" : -1150, "y" : 570, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		/* 29 */ { "x" : -1120, "y" : 600, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		/* 30 */ { "x" : -1120, "y" : -600, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		/* 31 */ { "x" : -1150, "y" : -570, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		/* 32 */ { "x" : 1120, "y" : 600, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		/* 33 */ { "x" : 1150, "y" : 570, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		/* 34 */ { "x" : 1150, "y" : -570, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		/* 35 */ { "x" : 1120, "y" : -600, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		
		/* 36 */ { "x" : 0, "y" : 180, "bCoef" : 0.1, "cMask" : ["red","blue" ], "cGroup" : ["blueKO" ], "trait" : "kickOffBarrier", "curve" : -180 },
		
		/* 37 */ { "x" : 0, "y" : -180, "bCoef" : 0.1, "cMask" : ["red","blue" ], "cGroup" : ["redKO" ], "trait" : "line", "curve" : 180, "color" : "6d925c" },
		/* 38 */ { "x" : 0, "y" : 180, "bCoef" : 0.1, "cMask" : ["red","blue" ], "cGroup" : ["redKO" ], "trait" : "line", "curve" : 180, "color" : "6d925c" },
		/* 39 */ { "x" : -1030, "y" : -40, "bCoef" : -5.7, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line", "curve" : 70, "color" : "576C46", "vis" : false },
		/* 40 */ { "x" : -1030, "y" : 40, "bCoef" : -5.7, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line", "curve" : 70, "color" : "576C46", "vis" : false },
		/* 41 */ { "x" : 1030, "y" : -40, "bCoef" : -5.7, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line", "curve" : -70, "color" : "576C46", "vis" : false },
		/* 42 */ { "x" : 1030, "y" : 40, "bCoef" : -5.7, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line", "curve" : -70, "color" : "576C46", "vis" : false },
		/* 43 */ { "x" : 1030, "y" : -40, "trait" : "line", "color" : "576C46" },
		/* 44 */ { "x" : 1030, "y" : 40, "trait" : "line", "color" : "576C46" },
		/* 45 */ { "x" : -1030, "y" : -40, "trait" : "line", "color" : "576C46" },
		/* 46 */ { "x" : -1030, "y" : 40, "trait" : "line", "color" : "576C46" },
		
		/* 47 */ { "x" : -1157, "y" : 605, "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea" },
		/* 48 */ { "x" : -1157, "y" : 655, "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea" },
		/* 49 */ { "x" : -1157, "y" : -655, "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea" },
		/* 50 */ { "x" : -1157, "y" : -605, "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea" },
		/* 51 */ { "x" : 1157, "y" : 605, "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea" },
		/* 52 */ { "x" : 1157, "y" : 655, "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea" },
		/* 53 */ { "x" : 1157, "y" : -655, "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea" },
		/* 54 */ { "x" : 1157, "y" : -605, "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea" },
		
		/* 55 */ { "x" : -1300, "y" : -485, "bCoef" : 0, "cMask" : ["c1" ], "cGroup" : ["red","blue" ], "color" : "ec644b", "vis" : false },
		/* 56 */ { "x" : 1300, "y" : -485, "bCoef" : 0, "cMask" : ["c1" ], "cGroup" : ["red","blue" ], "color" : "ec644b", "vis" : false },
		/* 57 */ { "x" : -1300, "y" : 485, "bCoef" : 0, "cMask" : ["c1" ], "cGroup" : ["red","blue" ], "color" : "ec644b", "vis" : false },
		/* 58 */ { "x" : 1300, "y" : 485, "bCoef" : 0, "cMask" : ["c1" ], "cGroup" : ["red","blue" ], "color" : "ec644b", "vis" : false },
		/* 59 */ { "x" : -1295, "y" : -320, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		/* 60 */ { "x" : -840, "y" : -320, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		/* 61 */ { "x" : -840, "y" : 320, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		/* 62 */ { "x" : -1295, "y" : 320, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		/* 63 */ { "x" : 1295, "y" : -320, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		/* 64 */ { "x" : 840, "y" : -320, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		/* 65 */ { "x" : 840, "y" : 320, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		/* 66 */ { "x" : 1295, "y" : 320, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		/* 67 */ { "x" : -1150, "y" : -124, "bCoef" : 0, "cMask" : ["ball","red","blue" ] },
		/* 68 */ { "x" : -1210, "y" : -124, "bCoef" : 0, "cMask" : ["ball" ], "bias" : 0, "curve" : 5 },
		/* 69 */ { "x" : -1150, "y" : 124, "bCoef" : 0, "cMask" : ["ball","red","blue" ] },
		/* 70 */ { "x" : -1210, "y" : 124, "bCoef" : 0, "cMask" : ["ball" ], "bias" : 0, "curve" : 5 },
		/* 71 */ { "x" : -1250, "y" : -158, "bCoef" : 0, "cMask" : ["ball" ] },
		/* 72 */ { "x" : -1250, "y" : 158, "bCoef" : 0, "cMask" : ["ball" ] },
		/* 73 */ { "x" : 1150, "y" : 124, "bCoef" : 0, "cMask" : ["ball","red","blue" ] },
		/* 74 */ { "x" : 1210, "y" : 124, "bCoef" : 0, "cMask" : ["ball" ], "curve" : -5 },
		/* 75 */ { "x" : 1150, "y" : -124, "bCoef" : 0, "cMask" : ["ball","red","blue" ] },
		/* 76 */ { "x" : 1210, "y" : -124, "bCoef" : 0, "cMask" : ["ball" ], "curve" : -5 },
		/* 77 */ { "x" : 1250, "y" : -158, "bCoef" : 0, "cMask" : ["ball" ] },
		/* 78 */ { "x" : 1250, "y" : 158, "bCoef" : 0, "cMask" : ["ball" ] },
		
		/* 79 */ { "trait" : "line", "x" : 0.3333740234375, "y" : -131.66665649414062 },
		/* 80 */ { "x" : 0.3333740234375, "y" : 124, "trait" : "line" },
		/* 81 */ { "x" : -0.6666259765625, "y" : 56, "trait" : "line" },
		/* 82 */ { "trait" : "line", "x" : 0.3333740234375, "y" : -1, "color" : "7b9d6b" },
		/* 83 */ { "trait" : "line", "x" : 0.3333740234375, "y" : -63, "color" : "7b9d6b" },
		/* 84 */ { "x" : -127.61466028620669, "y" : -106.92884190476701, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 85 */ { "x" : -127.61466028620669, "y" : 9.05423165220509, "color" : "C7E6BD", "vis" : true, "curve" : -82.46294058172923, "trait" : "line" },
		/* 86 */ { "x" : 124.74411514544684, "y" : -106.92884190476701, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 87 */ { "x" : 124.74411514544684, "y" : 9.05423165220509, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 88 */ { "x" : -127.61466028620669, "y" : -106.92884190476701, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 89 */ { "x" : 124.74411514544684, "y" : -106.92884190476701, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 90 */ { "x" : -1.4352725703799223, "y" : 161.99894403502543, "color" : "C7E6BD", "vis" : true, "curve" : -82.46294058172923, "trait" : "line" },
		/* 91 */ { "x" : -107.2220319684973, "y" : -86.5362135870576, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 92 */ { "x" : -107.2220319684973, "y" : 7.779692382348259, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 93 */ { "x" : -76.63308949193325, "y" : 98.2719805421836, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 94 */ { "x" : 96.70425120859646, "y" : -86.5362135870576, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 95 */ { "x" : -66.43677533307851, "y" : 108.4682947010383, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 96 */ { "x" : 104.35148682773746, "y" : -72.51628161863249, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 97 */ { "x" : -54.965921904367036, "y" : 119.93914812974978, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 98 */ { "x" : 104.35148682773746, "y" : -48.30003549135256, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 99 */ { "x" : -107.2220319684973, "y" : 7.779692382348259, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 100 */ { "x" : -42.22052920579864, "y" : 127.58638374889085, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 101 */ { "x" : 104.35148682773746, "y" : -26.632867903786348, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 102 */ { "x" : -28.92605796751664, "y" : 136.95908009817504, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 103 */ { "x" : 104.35148682773746, "y" : -3.6911610463632485, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 104 */ { "x" : -11.807968919664077, "y" : 142.05723717760236, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 105 */ { "x" : 104.35148682773746, "y" : 20.525085080916597, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 106 */ { "x" : 13.133737937758966, "y" : 140.7826979077455, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 107 */ { "x" : 103.07694755788062, "y" : 47.29040974791019, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 108 */ { "x" : 58.4680731128914, "y" : 118.66460885989298, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 109 */ { "x" : 80.13524070045756, "y" : 95.72290200246991, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		/* 110 */ { "x" : -94.89804175309521, "y" : -43.196369923281395, "trait" : "line", "color" : "C7E6BD" },
		/* 111 */ { "x" : -86.7135068811765, "y" : -74.2293979793065, "trait" : "line", "color" : "C7E6BD" },
		/* 112 */ { "x" : -79.2110165819177, "y" : -74.2293979793065, "trait" : "line", "color" : "C7E6BD" },
		/* 113 */ { "x" : -71.70852628265888, "y" : -43.196369923281395, "trait" : "line", "color" : "C7E6BD" },
		/* 114 */ { "x" : -87.73657374016636, "y" : -43.31004399162265, "trait" : "line", "color" : "C7E6BD" },
		/* 115 */ { "x" : -78.86999429558782, "y" : -43.31004399162265, "trait" : "line", "color" : "C7E6BD" },
		/* 116 */ { "x" : -86.03146230851664, "y" : -51.494578863541506, "trait" : "line", "color" : "C7E6BD" },
		/* 117 */ { "x" : -80.57510572723746, "y" : -51.494578863541506, "trait" : "line", "color" : "C7E6BD" },
		/* 118 */ { "x" : -85.69044002218664, "y" : -56.26889087216068, "trait" : "line", "color" : "C7E6BD" },
		/* 119 */ { "x" : -80.57510572723746, "y" : -56.26889087216068, "trait" : "line", "color" : "C7E6BD" },
		/* 120 */ { "x" : -82.96226173154707, "y" : -66.49955946205904, "trait" : "line", "color" : "C7E6BD" },
		/* 121 */ { "x" : -31.808918782055287, "y" : -42.51432535062156, "trait" : "line", "color" : "C7E6BD" },
		/* 122 */ { "x" : -23.6243839101366, "y" : -73.54735340664655, "trait" : "line", "color" : "C7E6BD" },
		/* 123 */ { "x" : -16.121893610877777, "y" : -73.54735340664655, "trait" : "line", "color" : "C7E6BD" },
		/* 124 */ { "x" : -8.619403311618981, "y" : -42.51432535062156, "trait" : "line", "color" : "C7E6BD" },
		/* 125 */ { "x" : -24.647450769126408, "y" : -42.627999418962816, "trait" : "line", "color" : "C7E6BD" },
		/* 126 */ { "x" : -15.78087132454786, "y" : -42.627999418962816, "trait" : "line", "color" : "C7E6BD" },
		/* 127 */ { "x" : -22.94233933747671, "y" : -50.81253429088139, "trait" : "line", "color" : "C7E6BD" },
		/* 128 */ { "x" : -17.48598275619753, "y" : -50.81253429088139, "trait" : "line", "color" : "C7E6BD" },
		/* 129 */ { "x" : -22.601317051146708, "y" : -55.586846299500735, "trait" : "line", "color" : "C7E6BD" },
		/* 130 */ { "x" : -17.48598275619753, "y" : -55.586846299500735, "trait" : "line", "color" : "C7E6BD" },
		/* 131 */ { "x" : -19.873138760507203, "y" : -65.81751488939904, "trait" : "line", "color" : "C7E6BD" },
		/* 132 */ { "x" : -69.32137027834929, "y" : -43.31004399162265, "trait" : "line", "color" : "C7E6BD" },
		/* 133 */ { "x" : -69.32137027834929, "y" : -74.34307204764775, "curve" : 0, "trait" : "line", "color" : "C7E6BD" },
		/* 134 */ { "x" : -62.84194683808025, "y" : -43.31004399162265, "trait" : "line", "color" : "C7E6BD" },
		/* 135 */ { "x" : -62.84194683808025, "y" : -54.904801726840844, "trait" : "line", "color" : "C7E6BD" },
		/* 136 */ { "x" : -59.05822349936207, "y" : -50.30911935168018, "curve" : 0, "trait" : "line", "color" : "C7E6BD" },
		/* 137 */ { "x" : -59.05822349936207, "y" : -43.1476513387513, "curve" : 0, "trait" : "line", "color" : "C7E6BD" },
		/* 138 */ { "x" : -52.919822345423, "y" : -43.1476513387513, "trait" : "line", "color" : "C7E6BD" },
		/* 139 */ { "x" : -52.919822345423, "y" : -53.37831992864966, "trait" : "line", "color" : "C7E6BD" },
		/* 140 */ { "x" : -57.01208978138234, "y" : -58.834676509928784, "trait" : "line", "color" : "C7E6BD" },
		/* 141 */ { "x" : -57.35311206771232, "y" : -74.18067939477635, "curve" : 0, "trait" : "line", "color" : "C7E6BD" },
		/* 142 */ { "x" : -62.46844636266147, "y" : -69.06534509982708, "curve" : 0, "trait" : "line", "color" : "C7E6BD" },
		/* 143 */ { "x" : -62.46844636266147, "y" : -62.244899373228236, "curve" : 0, "trait" : "line", "color" : "C7E6BD" },
		/* 144 */ { "x" : -50.19164405478341, "y" : -53.37831992864966, "trait" : "line", "color" : "C7E6BD" },
		/* 145 */ { "x" : -44.05324290084445, "y" : -53.37831992864966, "trait" : "line", "color" : "C7E6BD" },
		/* 146 */ { "x" : -49.85062176845355, "y" : -47.239918774710645, "trait" : "line", "color" : "C7E6BD" },
		/* 147 */ { "x" : -40.643020037545, "y" : -48.94503020636046, "trait" : "line", "color" : "C7E6BD" },
		/* 148 */ { "x" : -39.27893089222519, "y" : -53.71934221497963, "curve" : 0, "trait" : "line", "color" : "C7E6BD" },
		/* 149 */ { "x" : -47.80448805047385, "y" : -60.88081022790851, "curve" : 0, "trait" : "line", "color" : "C7E6BD" },
		/* 150 */ { "x" : -33.140529738286176, "y" : -56.44752050561914, "trait" : "line", "color" : "C7E6BD" },
		/* 151 */ { "x" : -35.186663456265876, "y" : -44.85276277040106, "trait" : "line", "color" : "C7E6BD" },
		/* 152 */ { "x" : -32.13915232888439, "y" : -65.11001135226707, "trait" : "line", "color" : "C7E6BD" },
		/* 153 */ { "x" : -38.277499751966445, "y" : -65.08432789024585, "trait" : "line", "color" : "C7E6BD" },
		/* 154 */ { "x" : -32.15627463689856, "y" : -69.20224296765514, "trait" : "line", "color" : "C7E6BD" },
		/* 155 */ { "x" : -42.391140147143375, "y" : -64.21492381856348, "curve" : 0, "trait" : "line", "color" : "C7E6BD" },
		/* 156 */ { "x" : -33.13078649918168, "y" : -56.223521552719376, "curve" : 0, "trait" : "line", "color" : "C7E6BD" },
		/* 157 */ { "x" : -47.81746709367437, "y" : -60.94641887653438, "trait" : "line", "color" : "C7E6BD" },
		/* 158 */ { "x" : -46.83009260504741, "y" : -71.52802313958068, "trait" : "line", "color" : "C7E6BD" },
		/* 159 */ { "x" : -42.65120841948519, "y" : -67.06227956084712, "trait" : "line", "color" : "C7E6BD" }

	],

	"segments" : [
		{ "v0" : 0, "v1" : 1, "trait" : "kickOffBarrier" },
		{ "v0" : 2, "v1" : 3, "trait" : "kickOffBarrier" },
		
		{ "v0" : 4, "v1" : 5, "trait" : "line", "y" : 320 },
		{ "v0" : 5, "v1" : 7, "trait" : "line", "x" : 840 },
		{ "v0" : 6, "v1" : 7, "trait" : "line", "y" : -320 },
		{ "v0" : 8, "v1" : 9, "trait" : "line", "y" : 180 },
		{ "v0" : 9, "v1" : 11, "trait" : "line", "x" : 1030 },
		{ "v0" : 10, "v1" : 11, "trait" : "line", "y" : -180 },
		{ "v0" : 12, "v1" : 13, "curve" : -130, "trait" : "line", "x" : 840 },
		{ "v0" : 14, "v1" : 15, "trait" : "line", "y" : -320 },
		{ "v0" : 15, "v1" : 17, "trait" : "line", "x" : -840 },
		{ "v0" : 16, "v1" : 17, "trait" : "line", "y" : 320 },
		{ "v0" : 18, "v1" : 19, "trait" : "line", "y" : -175 },
		{ "v0" : 19, "v1" : 21, "trait" : "line", "x" : -1030 },
		{ "v0" : 20, "v1" : 21, "trait" : "line", "y" : 175 },
		{ "v0" : 22, "v1" : 23, "curve" : -130, "trait" : "line", "x" : -840 },
		{ "v0" : 24, "v1" : 25, "curve" : -180, "trait" : "line", "x" : 935 },
		{ "v0" : 26, "v1" : 27, "curve" : -180, "trait" : "line", "x" : -935 },
		{ "v0" : 24, "v1" : 25, "curve" : 180, "trait" : "line", "x" : 935 },
		{ "v0" : 26, "v1" : 27, "curve" : 180, "trait" : "line", "x" : -935 },
		{ "v0" : 24, "v1" : 25, "curve" : 90, "trait" : "line", "x" : 935 },
		{ "v0" : 26, "v1" : 27, "curve" : 90, "trait" : "line", "x" : -935 },
		{ "v0" : 24, "v1" : 25, "curve" : -90, "trait" : "line", "x" : 935 },
		{ "v0" : 26, "v1" : 27, "curve" : -90, "trait" : "line", "x" : -935 },
		{ "v0" : 24, "v1" : 25, "trait" : "line", "x" : 935 },
		{ "v0" : 26, "v1" : 27, "trait" : "line", "x" : -935 },
		{ "v0" : 28, "v1" : 29, "curve" : 90, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		{ "v0" : 30, "v1" : 31, "curve" : 90, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		{ "v0" : 32, "v1" : 33, "curve" : 90, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		{ "v0" : 34, "v1" : 35, "curve" : 90, "bCoef" : -2.65, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line" },
		
		{ "v0" : 37, "v1" : 36, "curve" : -180, "vis" : false, "bCoef" : 0.1, "cGroup" : ["blueKO" ], "trait" : "kickOffBarrier" },
		
		{ "v0" : 39, "v1" : 40, "curve" : 70, "vis" : false, "color" : "576C46", "bCoef" : -5.7, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line", "x" : -1030 },
		{ "v0" : 41, "v1" : 42, "curve" : -70, "vis" : false, "color" : "576C46", "bCoef" : -5.7, "cMask" : ["ball" ], "cGroup" : ["c0" ], "trait" : "line", "x" : 1030 },
		
		{ "v0" : 37, "v1" : 38, "curve" : 180, "vis" : false, "bCoef" : 0.1, "cMask" : ["red","blue" ], "cGroup" : ["redKO" ], "trait" : "kickOffBarrier" },
		
		{ "v0" : 43, "v1" : 44, "vis" : true, "color" : "576C46", "trait" : "line", "x" : 1030 },
		{ "v0" : 45, "v1" : 46, "vis" : true, "color" : "576C46", "trait" : "line", "x" : -1030 },
		
		{ "v0" : 47, "v1" : 48, "color" : "FFFF00", "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea", "x" : -1157 },
		{ "v0" : 49, "v1" : 50, "color" : "FFFF00", "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea", "x" : -1157 },
		{ "v0" : 51, "v1" : 52, "color" : "FFFF00", "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea", "x" : 1157 },
		{ "v0" : 53, "v1" : 54, "color" : "FFFF00", "bCoef" : 0, "cMask" : ["ball" ], "trait" : "ballArea", "x" : 1157 },
		
		{ "v0" : 55, "v1" : 56, "vis" : false, "color" : "ec644b", "bCoef" : 0, "cMask" : ["c1" ], "cGroup" : ["red","blue" ], "y" : -485 },
		{ "v0" : 57, "v1" : 58, "vis" : false, "color" : "ec644b", "bCoef" : 0, "cMask" : ["c1" ], "cGroup" : ["red","blue" ], "y" : 485 },
		{ "v0" : 59, "v1" : 60, "vis" : false, "color" : "ec644b", "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		{ "v0" : 60, "v1" : 61, "vis" : false, "color" : "ec644b", "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		{ "v0" : 61, "v1" : 62, "vis" : false, "color" : "ec644b", "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		{ "v0" : 63, "v1" : 64, "vis" : false, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		{ "v0" : 64, "v1" : 65, "vis" : false, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		{ "v0" : 65, "v1" : 66, "vis" : false, "cMask" : ["c0" ], "cGroup" : ["red","blue" ] },
		{ "v0" : 67, "v1" : 68, "color" : "FFFFFF", "bCoef" : 0, "cMask" : ["ball","red","blue" ], "y" : -124 },
		{ "v0" : 69, "v1" : 70, "color" : "FFFFFF", "bCoef" : 0, "cMask" : ["ball","red","blue" ], "y" : 124 },
		{ "v0" : 70, "v1" : 68, "curve" : 5, "color" : "FFFFFF", "bCoef" : 0, "cMask" : ["ball","red","blue" ], "bias" : 0 },
		{ "v0" : 68, "v1" : 71, "color" : "FFFFFF", "bCoef" : 0, "cMask" : ["ball" ] },
		{ "v0" : 70, "v1" : 72, "color" : "FFFFFF", "bCoef" : 0, "cMask" : ["ball" ] },
		{ "v0" : 73, "v1" : 74, "color" : "FFFFFF", "bCoef" : 0, "cMask" : ["ball","red","blue" ], "y" : 124 },
		{ "v0" : 75, "v1" : 76, "color" : "FFFFFF", "bCoef" : 0, "cMask" : ["ball","red","blue" ], "y" : -124 },
		{ "v0" : 74, "v1" : 76, "curve" : -5, "color" : "FFFFFF", "bCoef" : 0, "cMask" : ["ball","red","blue" ] },
		{ "v0" : 76, "v1" : 77, "color" : "FFFFFF", "bCoef" : 0, "cMask" : ["ball" ] },
		{ "v0" : 74, "v1" : 78, "color" : "FFFFFF", "bCoef" : 0, "cMask" : ["ball" ] },
		
		{ "vis" : true, "color" : "6d925c", "trait" : "line", "v0" : 37, "v1" : 38 },
		{ "vis" : true, "color" : "7b9d6b", "trait" : "line", "v0" : 37, "v1" : 79 },
		{ "vis" : true, "color" : "7b9d6b", "v0" : 80, "v1" : 81, "trait" : "line" },
		{ "vis" : true, "color" : "7b9d6b", "trait" : "line", "v0" : 82, "v1" : 83 },
		{ "v0" : 84, "v1" : 85, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "v0" : 86, "v1" : 87, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "v0" : 88, "v1" : 89, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "v0" : 87, "v1" : 90, "curve" : 82.46294058172923, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "v0" : 91, "v1" : 92, "curve" : 0, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "v0" : 92, "v1" : 93, "curve" : -41.3908996948777, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "curve" : 0, "v0" : 91, "v1" : 94, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "curve" : 0, "v0" : 93, "v1" : 94, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "curve" : 0, "v0" : 95, "v1" : 96, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "curve" : 0, "v0" : 97, "v1" : 98, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "curve" : 0, "v0" : 100, "v1" : 101, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "curve" : 0, "v0" : 102, "v1" : 103, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "curve" : 0, "v0" : 104, "v1" : 105, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "curve" : 0, "v0" : 106, "v1" : 107, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "curve" : 0, "v0" : 108, "v1" : 109, "color" : "C7E6BD", "vis" : true, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 110, "v1" : 111, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 111, "v1" : 112, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 112, "v1" : 113, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 110, "v1" : 114, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 113, "v1" : 115, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 114, "v1" : 116, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 117, "v1" : 115, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 116, "v1" : 117, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 118, "v1" : 119, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 118, "v1" : 120, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 120, "v1" : 119, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 121, "v1" : 122, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 122, "v1" : 123, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 123, "v1" : 124, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 121, "v1" : 125, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 124, "v1" : 126, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 125, "v1" : 127, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 128, "v1" : 126, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 127, "v1" : 128, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 129, "v1" : 130, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 129, "v1" : 131, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 131, "v1" : 130, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 132, "v1" : 133, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 132, "v1" : 134, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 134, "v1" : 135, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 135, "v1" : 136, "curve" : 70.73348563195691, "trait" : "line" },
		{ "curve" : 0, "vis" : true, "color" : "C7E6BD", "v0" : 136, "v1" : 137, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 137, "v1" : 138, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 138, "v1" : 139, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 139, "v1" : 140, "curve" : -49.55028113766388, "trait" : "line" },
		{ "curve" : 0, "vis" : true, "color" : "C7E6BD", "v0" : 133, "v1" : 141, "trait" : "line" },
		{ "curve" : 123.89416258818858, "vis" : true, "color" : "C7E6BD", "v0" : 141, "v1" : 140, "trait" : "line" },
		{ "curve" : 0, "vis" : true, "color" : "C7E6BD", "v0" : 142, "v1" : 143, "trait" : "line" },
		{ "curve" : 189.14784251980186, "vis" : true, "color" : "C7E6BD", "v0" : 142, "v1" : 143, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 144, "v1" : 145, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 144, "v1" : 146, "trait" : "line" },
		{ "curve" : -146.14497387171184, "vis" : true, "color" : "C7E6BD", "v0" : 145, "v1" : 147, "trait" : "line" },
		{ "curve" : -106.6513006608564, "vis" : true, "color" : "C7E6BD", "v0" : 147, "v1" : 148, "trait" : "line" },
		{ "curve" : 0, "vis" : true, "color" : "C7E6BD", "v0" : 148, "v1" : 149, "trait" : "line" },
		{ "curve" : 81.36794496026877, "vis" : true, "color" : "C7E6BD", "v0" : 150, "v1" : 151, "trait" : "line" },
		{ "curve" : -103.24533319076292, "vis" : true, "color" : "C7E6BD", "v0" : 146, "v1" : 151, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 152, "v1" : 153, "trait" : "line" },
		{ "vis" : true, "color" : "C7E6BD", "v0" : 152, "v1" : 154, "trait" : "line" },
		{ "curve" : -1.2445482342437741, "vis" : true, "color" : "C7E6BD", "v0" : 155, "v1" : 156, "trait" : "line" },
		{ "curve" : 69.8786204093525, "vis" : true, "color" : "C7E6BD", "v0" : 157, "v1" : 158, "trait" : "line" },
		{ "curve" : -82.46294058172923, "vis" : true, "color" : "C7E6BD", "v0" : 85, "v1" : 90, "trait" : "line" },
		{ "curve" : 105.49163677479804, "vis" : true, "color" : "C7E6BD", "v0" : 158, "v1" : 154, "trait" : "line" },
		{ "curve" : 46.30040741870661, "vis" : true, "color" : "C7E6BD", "v0" : 155, "v1" : 159, "trait" : "line" },
		{ "curve" : 165.0601312179737, "vis" : true, "color" : "C7E6BD", "v0" : 159, "v1" : 153, "trait" : "line" }

	],"goals":[{"p0":[-1162.45,124],"p1":[-1162.45,-124],"team":"red"},{"p0":[1162.45,124],"p1":[1162.45,-124],"team":"blue","radius":0,"invMass":1}],"discs":[{"radius":0,"invMass":0,"pos":[-1311,-19],"color":"ffffffff","bCoef":0,"cMask":["red"],"cGroup":["ball"]},{"radius":0,"invMass":0,"pos":[-1310,29],"color":"ffffffff","bCoef":0,"cMask":["blue"],"cGroup":["ball"]},{"radius":0,"invMass":0,"pos":[-1308,62],"color":"ffffffff","bCoef":0,"cMask":["red","blue"],"cGroup":["ball"]},{"radius":2.7,"pos":[-1150,600],"cGroup":["ball"],"trait":"cornerflag"},{"radius":2.7,"pos":[1150,-600],"cGroup":["ball"],"trait":"cornerflag"},{"radius":2.7,"pos":[1150,600],"cGroup":["ball"],"trait":"cornerflag"},{"radius":5,"invMass":0,"pos":[-1150,-124],"bCoef":0.5,"trait":"goalPost"},{"radius":5,"invMass":0,"pos":[-1150,124],"bCoef":0.5,"trait":"goalPost"},{"radius":2,"invMass":0,"pos":[-1250,-158],"color":"000000","bCoef":1,"trait":"goalPost"},{"radius":2,"invMass":0,"pos":[-1250,158],"color":"000000","bCoef":1,"trait":"goalPost"},{"radius":5,"invMass":0,"pos":[1150,-124],"bCoef":0.5,"trait":"goalPost"},{"radius":5,"invMass":0,"pos":[1150,124],"bCoef":0.5,"trait":"goalPost"},{"radius":2,"invMass":0,"pos":[1250,-158],"color":"000000","bCoef":1,"trait":"goalPost"},{"radius":2,"invMass":0,"pos":[1250,158],"color":"000000","bCoef":1,"trait":"goalPost"},{"radius":2.7,"pos":[-1150,-600],"cGroup":["ball"],"trait":"cornerflag"},{"radius":0,"pos":[-1149,-485],"cMask":["none"]},{"radius":0,"pos":[1149,-485],"cMask":["none"]},{"radius":0,"pos":[-1149,-485],"cMask":["none"]},{"radius":0,"pos":[1149,-485],"cMask":["none"]},{"radius":0,"pos":[-1149,485],"cMask":["none"]},{"radius":0,"pos":[1149,485],"cMask":["none"]},{"radius":0,"pos":[-1149,485],"cMask":["none"]},{"radius":0,"pos":[1149,485],"cMask":["none"]}],"planes":[{"normal":[0,1],"dist":-627,"bCoef":0,"cGroup":["ball"],"trait":"ballArea","_data":{"extremes":{"normal":[0,1],"dist":-627,"canvas_rect":[-1311,-675,1300,675],"a":[-1311,-627],"b":[1300,-627]}}},{"normal":[0,-1],"dist":-627,"bCoef":0,"cGroup":["ball"],"trait":"ballArea","_data":{"extremes":{"normal":[0,-1],"dist":-627,"canvas_rect":[-1311,-675,1300,675],"a":[-1311,627],"b":[1300,627]},"mirror":{}}},{"normal":[0,1],"dist":-670,"bCoef":0,"_data":{"extremes":{"normal":[0,1],"dist":-670,"canvas_rect":[-1311,-675,1300,675],"a":[-1311,-670],"b":[1300,-670]},"mirror":{}}},{"normal":[0,-1],"dist":-670,"bCoef":0,"_data":{"extremes":{"normal":[0,-1],"dist":-670,"canvas_rect":[-1311,-675,1300,675],"a":[-1311,670],"b":[1300,670]},"mirror":{}}},{"normal":[1,0],"dist":-1300,"bCoef":0,"_data":{"extremes":{"normal":[1,0],"dist":-1300,"canvas_rect":[-1311,-675,1300,675],"a":[-1300,-675],"b":[-1300,675]}}},{"normal":[-1,0],"dist":-1300,"bCoef":0.1,"_data":{"extremes":{"normal":[-1,0],"dist":-1300,"canvas_rect":[-1311,-675,1300,675],"a":[1300,-675],"b":[1300,675]}}},{"normal":[1,0],"dist":-1230,"bCoef":0,"cMask":["ball"],"cGroup":["ball"],"_data":{"extremes":{"normal":[1,0],"dist":-1230,"canvas_rect":[-1311,-675,1300,675],"a":[-1230,-675],"b":[-1230,675]}}},{"normal":[-1,0],"dist":-1230,"bCoef":0,"cMask":["ball"],"cGroup":["ball"],"_data":{"extremes":{"normal":[-1,0],"dist":-1230,"canvas_rect":[-1311,-675,1300,675],"a":[1230,-675],"b":[1230,675]}}}],"traits":{"ballArea":{"vis":false,"bCoef":0,"cMask":["ball"],"cGroup":["ball"]},"goalPost":{"radius":5,"invMass":0,"bCoef":1,"cGroup":["ball"]},"rightNet":{"radius":0,"invMass":1,"bCoef":0,"cGroup":["ball","c3"]},"leftNet":{"radius":0,"invMass":1,"bCoef":0,"cGroup":["ball","c2"]},"stanchion":{"radius":3,"invMass":0,"bCoef":3,"cMask":["none"]},"cornerflag":{"radius":3,"invMass":0,"bCoef":0.2,"color":"FFFF00","cMask":["ball"]},"reargoalNetleft":{"vis":true,"bCoef":0.1,"cMask":["ball","red","blue"],"curve":10,"color":"C7E6BD"},"reargoalNetright":{"vis":true,"bCoef":0.1,"cMask":["ball","red","blue"],"curve":-10,"color":"C7E6BD"},"sidegoalNet":{"vis":true,"bCoef":1,"cMask":["ball","red","blue"],"color":"C7E6BD"},"kickOffBarrier":{"vis":false,"bCoef":0.1,"cGroup":["redKO","blueKO"],"cMask":["red","blue"]},"line":{"vis":true,"cMask":[],"color":"C7E6BD"}},"joints":[{"d0":16,"d1":17,"strength":"rigid","color":"ec7458","length":null},{"d0":18,"d1":19,"strength":"rigid","color":"48bef9","length":null},{"d0":20,"d1":21,"strength":"rigid","color":"ec7458","length":null},{"d0":22,"d1":23,"strength":"rigid","color":"48bef9","length":null}],"redSpawnPoints":[],"blueSpawnPoints":[],"canBeStored":false}`;
	
	return realSoccerMap;
}

/*------------------------------ END OF STADIUMS ----------------------------*/

// ------------------------------------------------
// Global Variables Editables
// ------------------------------------------------

var roomName = "💙🤍💙 SERVIDOR PARA OFICIALES #ARSA #RSIAmérica 🏆"; // Nombre de la sala, cambiar siempre entre ""
var roomPassword = null; // password siempre entre "", en caso de no definir password dejar null.
var maxPlayers = 20; // maximo de jugadores en la sala, dejar 20 por defecto
var roomPublic = true; // room publico: dejar true, room oculto: dejar false. 
var token = ""; // https://www.haxball.com/headlesstoken para obtenerlo.
var AdminHostCode = "michael"; // !admin password te otorga admin, cambie el valor por el que guste.

/* VARIABLES */

var roomLink = "";
var gameTime = 10;
var scoreLimit = 0; 
var map = "RSR";
var superAdmins = [];

/* INTEGRATIONS */

var logWebhook = "https://discord.com/api/webhooks/976598730428022804/U3-Tkjz6XvkiQluyhOHXEByOa5IS-bclZMblLdSeEdZ0ZPnmEwefAY4K4yVSh7HpBbp9";
var chatWebhook = 'https://discord.com/api/webhooks/994067941836464178/MHGvUNRLoEOdpxJ72uFDEj7thJU08ibMElRaSsZKuGx80g4aM4uSgcu-yKCsVxiRKjss';
var recWebhook = 'https://discord.com/api/webhooks/983243574810378252/mw1lWZvA3QcS5dJdTBjO5o_QYDmCp_A2zQdbGSKZqq73tW-LqZ915VKy9AG_9t1JeENI';
var ofiWebhook = 'https://discord.com/api/webhooks/989696429427658772/Vvz8S-gyG-yviVTIJU2DLeFv0hC-fSSz_laKWu5wfo3kt1U7r0pyQs4sY9VGDqwWg1UX';

var fetchRecordingVariable = true;	

/* PLAYERS */

const Team = { SPECTATORS: 0, RED: 1, BLUE: 2 };
const State = { PLAY: 0, PAUSE: 1, STOP: 2 };
const HaxNotification = { NONE: 0, CHAT: 1, MENTION: 2 };
const Situation = { STOP: 0, KICKOFF: 1, PLAY: 2, GOAL: 3 };

var gameState = State.STOP;
var playSituation = Situation.STOP;

var playersAll = [];
var players = [];
var teamRed = [];
var teamBlue = [];
var teamSpec = [];

var blacklist = [{Auth: "47opJIRv15JYYnobBcSeXpDDdWuxYbcrEDO6dG-QeTA", Conn: ""}, {Auth: "2R5fbWSHlPnwfZ9ZC0RygSP2pv6_8m5k-MdfZ176tdw", Conn: "3138312E39382E35322E3433"}, {Auth: "U634vO8MLeppnP0x6-hsuPxQ4KC3HDVqrKLZC6kzJgk", Conn: "3139302E3234362E3132302E313133"}]; //The same structure goes...

/* STATS */

var possession = [0, 0];
var actionZoneHalf = [0, 0];

/* AUTH */

var authArray = [];
var PlayerInfoObject = {};

/* ROOM CONFIG */

var room = HBInit({
	roomName: roomName,
	password: roomPassword,
	maxPlayers: maxPlayers,
	public: roomPublic,
	geo: {code: "AR", lat: -34.61315, lon: -58.37723},
	noPlayer: true,
	token: token
});

/* GAME */

var lastTouches = Array(2).fill(null);
var lastTeamTouched;

var speedCoefficient = 100 / (5 * (0.99 ** 60 + 1));
var ballSpeed = 0;
var playerRadius = 15;
var ballRadius = 10;
var triggerDistance = playerRadius + ballRadius + 0.01;


/* AUXILIARY */

var checkTimeVariable = false;
var checkStadiumVariable = true;
var endGameVariable = false;
var cancelGameVariable = false;
var kickFetchVariable = false;

var stopTimeout;
var startTimeout;
var unpauseTimeout;

/* OPTIONS */

var mentionPlayersUnpause = true;


/* COLORS */

var welcomeColor = 0xc4ff65;
var announcementColor = 0xffefd6;
var infoColor = 0xbebebe;
var redColor = 0xff4c4c;
var blueColor = 0x62cbff;
var warningColor = 0xffa135;
var errorColor = 0xa40000;
var successColor = 0x75ff75;
var defaultColor = null;

// -------------------------------------------------
// Classes
// -------------------------------------------------
class Game {
	constructor() {
		this.date = Date.now();
        this.scores = room.getScores();
        this.playerComp = getStartingLineups();
        this.goals = [];
        this.rec = room.startRecording();
        this.touchArray = [];
		this.time = 0;
		this.paused = false;
		this.ballRadius;
		this.rsTouchTeam = 0;
		this.rsActive = true;
		this.rsReady = false;
		this.rsCorner = false;
		this.rsGoalKick = false;
		this.rsSwingTimer = 1000;
		this.rsTimer;
		this.ballOutPositionX;
		this.ballOutPositionY;
		this.throwInPosY;
		this.outStatus = "";
		this.warningCount = 0;
		this.bringThrowBack = false;
		this.extraTime = false;
		this.extraTimeCount = 0;
		this.extraTimeEnd;
		this.extraTimeAnnounced = false;
		this.lastPlayAnnounced = false;
		this.boosterState;
		this.throwinKicked = false;
		this.pushedOut;
		this.lastKickerId;
		this.lastKickerName;
		this.lastKickerTeam;
		this.secondLastKickerId;
		this.secondLastKickerName;
		this.secondLastKickerTeam;
		this.redScore = 0;
		this.blueScore = 0;
	}
	
	updateLastKicker(id, name, team) {
		this.secondLastKickerId = this.lastKickerId;
		this.secondLastKickerName = this.lastKickerName;
		this.secondLastKickerTeam = this.lastKickerTeam;
		
		this.lastKickerId = id;
		this.lastKickerName = name;
		this.lastKickerTeam = team;
	}
}

/* OBJECTS */

class Goal {
    constructor(time, team, striker, assist) {
        this.time = time;
        this.team = team;
        this.striker = striker;
        this.assist = assist;
    }
}


class PlayerComposition {
    constructor(player, auth, timeEntry, timeExit) {
        this.player = player;
        this.auth = auth;
        this.timeEntry = timeEntry;
        this.timeExit = timeExit;
        this.inactivityTicks = 0;
        this.GKTicks = 0;
    }
}

class BallTouch {
    constructor(player, time, goal, position) {
        this.player = player;
        this.time = time;
        this.goal = goal;
        this.position = position;
    }
}

room.setCustomStadium(getRealSoccerMap());
room.setScoreLimit(scoreLimit);
room.setTimeLimit(0);

room.onRoomLink = function(url) {
	roomLink = url;
	console.log(roomLink);
}

room.onStadiumChange = function(newStadiumName, byPlayer) {
	checkStadiumVariable = true;
	if (byPlayer != null) {
		map = "custom";
	}
	else {
		map = "RSR";
	}
}

room.onPlayerJoin = function(player) {
	authArray[player.id] = [player.auth, player.conn];
	if(isBlacklisted(player) == true) room.kickPlayer(player.id,"Has sido permabaneado, comunicate con un Administrador si no es asi.",true);
	if (!PlayerInfoObject[player.id]) PlayerInfoObject[player.id] = { id: player.id, name: player.name, auth: player.auth, conn: player.conn };
    function decryptHex(str) {
    let hexString = str;
    let strOut = "";
    for (let x = 0; x < hexString.length; x += 2) {
      strOut += String.fromCharCode(parseInt(hexString.substr(x, 2), 16));
    }
    return strOut;
  }	
    if (logWebhook != '') {
        fetch(logWebhook, {
            method: 'POST',
            body: JSON.stringify({
                content: `**HORA DE INGRESO:** [${getDate()}]\n ➡️ JOIN (${playersAll.length + 1}/${maxPlayers})\n**` +
                    `NOMBRE:** ${player.name}\n **AUTH:** [${authArray[player.id][0]}]\n **IP:** {${authArray[player.id][1]}}` + " - " + decryptHex(player.conn),
                username: roomName,
            }),
            headers: {
                'Content-Type': 'application/json',
            },
        }).then((res) => res);
    }
	console.log(player.name + " ha ingresado a la sala!");
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░█████╗░██████╗░░██████╗░█████╗░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██╔══██╗██╔══██╗██╔════╝██╔══██╗▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███████║██████╔╝╚█████╗░███████║▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██╔══██║██╔══██╗░╚═══██╗██╔══██║▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██║░░██║██║░░██║██████╔╝██║░░██║▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
	whisper("📢      𝘽𝙞𝙚𝙣𝙫𝙚𝙣𝙞𝙙𝙤𝙨 𝙖 𝙡𝙖 𝘼𝙨𝙤𝙘𝙞𝙖𝙘𝙞𝙤́𝙣 𝙙𝙚 𝙍𝙚𝙖𝙡 𝙎𝙤𝙘𝙘𝙚𝙧 𝘼𝙧𝙜𝙚𝙣𝙩𝙞𝙣𝙤     ❗", player.id, 0x61ddff, "bold", 0);
	whisper("📢      𝙀𝙨𝙘𝙧𝙞𝙗𝙚 !𝙝𝙚𝙡𝙥 𝙥𝙖𝙧𝙖 𝙫𝙚𝙧 𝙡𝙤𝙨 𝙘𝙤𝙢𝙖𝙣𝙙𝙤𝙨 𝙙𝙞𝙨𝙥𝙤𝙣𝙞𝙗𝙡𝙚𝙨     ❗", player.id, 0x61e7ff, "bold", 0);
        whisper("📢      𝙑𝙞𝙨𝙞𝙩𝙖 𝙣𝙪𝙚𝙨𝙩𝙧𝙤 𝙙𝙞𝙨𝙘𝙤𝙧𝙙 𝙥𝙖𝙧𝙖 𝙨𝙖𝙗𝙚𝙧 𝙢𝙖𝙨 𝙨𝙤𝙗𝙧𝙚 𝙣𝙤𝙨𝙤𝙩𝙧𝙤𝙨: https://discord.gg/QRuJ3fvDbM     ❗", player.id, 0x61e7ff, "bold", 0);
                              
	displayAdminMessage();
}

room.onPlayerLeave = function(player) {
	displayAdminMessage();
	setTimeout(() => {
        if (!kickFetchVariable) {
            if (logWebhook != '') {
                var stringContent = `**HORA DE SALIDA:** [${getDate()}]\n ⬅️ LEAVE (${playersAll.length}/${maxPlayers})\n **NOMBRE:** ${player.name}` +
                    `\n**AUTH:** [${authArray[player.id][0]}]\n **IP:** {${authArray[player.id][1]}}`;
                fetch(logWebhook, {
                    method: 'POST',
                    body: JSON.stringify({
                        content: stringContent,
                        username: roomName,
                    }),
                    headers: {
                        'Content-Type': 'application/json',
                    },
                }).then((res) => res);
            }
        } else kickFetchVariable = false;
    }, 10);
	console.log(player.name + " left the room");

	let index = superAdmins.indexOf(player.id);
	if (index > -1) {
		sleep(100).then(() => {
			superAdmins.splice(index, 1);
		});
	}
}

room.onPlayerAdminChange = function(changedPlayer, byPlayer) {
	updateTeams();
	if (byPlayer != null) {
		if (changedPlayer.id != byPlayer.id) {
			if (superAdmins.indexOf(changedPlayer.id) > -1) {
				room.kickPlayer(byPlayer.id, "Tú no puedes remover a un Super Admin", false);
				room.setPlayerAdmin(changedPlayer.id, true);
			}
		}
		else {
			if (changedPlayer.admin == false) {
				let index = superAdmins.indexOf(changedPlayer.id);
				if (index > -1) {
				  superAdmins.splice(index, 1);
				}
			}
		}
	}
}

room.onGameStart = function(byPlayer) {
	if (map == "RSR") {
		clearTimeout(startTimeout);
    	game = new Game();
    	possession = [0, 0];
    	actionZoneHalf = [0, 0];
    	gameState = State.PLAY;
    	endGameVariable = false;
    	playSituation = Situation.KICKOFF;
    	lastTouches = Array(2).fill(null);
    	lastTeamTouched = Team.SPECTATORS;
    	calculateStadiumVariables();
		if (byPlayer == null) {
			game = new Game();	
			announce("Duración del juego establecida en " + gameTime + " minutos");
                        room.sendAnnouncement("La partida esta siendo grabada.");
		}
		else {
			if (room.getScores().timeLimit != 0) {
				gameTime = room.getScores().timeLimit / 60;
			}
			else {
				gameTime = 10;
			}
			room.stopGame();
			room.setTimeLimit(0);
			room.setScoreLimit(0);			
			room.startGame();
		}
	}
}

room.onGameStop = function(byPlayer) {
	if (map == "RSR") {
		clearTimeout(stopTimeout);
    clearTimeout(unpauseTimeout);
    if (byPlayer != null) clearTimeout(startTimeout);
    game.rec = room.stopRecording();
    if (
        !cancelGameVariable && game.playerComp[0].length + game.playerComp[1].length > 0 &&
        (
            (game.scores.timeLimit != 0 &&
                ((game.scores.time >= 0.5 * game.scores.timeLimit &&
                    game.scores.time < 0.75 * game.scores.timeLimit &&
                    game.scores.red != game.scores.blue) ||
                    game.scores.time >= 0.75 * game.scores.timeLimit)
            ) ||
            endGameVariable
        )
    ) {
        fetchSummaryEmbed(game);
        if (fetchRecordingVariable) {
            setTimeout((gameEnd) => { fetchRecording(gameEnd); }, 500, game);
        }
    }
    cancelGameVariable = false;
    gameState = State.STOP;
    playSituation = Situation.STOP;
    updateTeams();
	room.setTimeLimit(gameTime);
	}
}

room.onGamePause = function (byPlayer) {
    if (mentionPlayersUnpause && gameState == State.PAUSE) {
        if (byPlayer != null) {
            room.sendAnnouncement(
                `Juego pausado por ${byPlayer.name} !`,
                null,
                defaultColor,
                'bold',
                HaxNotification.NONE
            );
        } else {
            room.sendAnnouncement(
                `Juego pausado !`,
                null,
                defaultColor,
                'bold',
                HaxNotification.NONE
            );
        }
    }
    clearTimeout(unpauseTimeout);
    gameState = State.PAUSE;
};

room.onGameUnpause = function (byPlayer) {
    unpauseTimeout = setTimeout(() => {
        gameState = State.PLAY;
    }, 2000);
    if (mentionPlayersUnpause) {
        if (byPlayer != null) {
            room.sendAnnouncement(
                `Juego en marcha por ${byPlayer.name} !`,
                null,
                defaultColor,
                'bold',
                HaxNotification.NONE
            );
        } else {
            room.sendAnnouncement(
                `Se reanuda el juego !`,
                null,
                defaultColor,
                'bold',
                HaxNotification.NONE
            );
        }
    }
};

room.onPlayerBallKick = function(player) {	
	if (map == "RSR") {
		if (playSituation != Situation.GOAL) {
        var ballPosition = room.getBallPosition();
        if (game.touchArray.length == 0 || player.id != game.touchArray[game.touchArray.length - 1].player.id) {
            if (playSituation == Situation.KICKOFF) playSituation = Situation.PLAY;
            lastTeamTouched = player.team;
            game.touchArray.push(
                new BallTouch(
                    player,
                    game.scores.time,
                    getGoalGame(),
                    ballPosition
                )
            );
            lastTouches[0] = checkGoalKickTouch(
                game.touchArray,
                game.touchArray.length - 1,
                getGoalGame()
            );
            lastTouches[1] = checkGoalKickTouch(
                game.touchArray,
                game.touchArray.length - 2,
                getGoalGame()
            );
        }
    }
		game.rsTouchTeam = player.team;
		game.updateLastKicker(player.id, player.name, player.team);
		
		if (game.rsReady == true) {
			var players = room.getPlayerList().filter((player) => player.team != 0);
			players.forEach(function(player) {			
				if (room.getPlayerDiscProperties(player.id).invMass.toFixed(1) != 0.3) {
					room.setPlayerDiscProperties(player.id, {invMass: 0.3});
				}
			});
		}
			
		if (game.rsActive == false && game.rsReady == true && (game.rsCorner == true || game.rsGoalKick == true)) { // make game active on kick from CK/GK
			game.boosterState = true;
			
			game.rsActive = true;
			game.rsReady = false;
			room.setDiscProperties(1, {x: 2000, y: 2000 });
			room.setDiscProperties(2, {x: 2000, y: 2000 });
			room.setDiscProperties(0, {color: "0xffffff"});
			game.rsTimer = 1000000;
			game.warningCount++;	
			
			// set gravity for real soccer corners/goalkicks
			if (game.rsCorner == true) {
				if (room.getDiscProperties(0).y < 0) { //top corner
					room.setDiscProperties(0, {xgravity: room.getPlayerDiscProperties(player.id).xspeed/35*-1, ygravity: 0.05});
					//room.setDiscProperties(0, {xgravity: -0.08, ygravity: 0.05});
				}
				else { //bottom corner
					room.setDiscProperties(0, {xgravity: room.getPlayerDiscProperties(player.id).xspeed/35*-1, ygravity: -0.05});
					//room.setDiscProperties(0, {xgravity: -0.08, ygravity: -0.05});
				}
			}	
			if (game.rsGoalKick == true) {			
				room.setDiscProperties(0, {xgravity: 0, ygravity: room.getPlayerDiscProperties(player.id).yspeed/40*-1});		
			}
			
			game.rsCorner = false;
			game.rsGoalKick = false;
			game.outStatus = "";		
		}		

		if (game.outStatus == "redThrow" || game.outStatus == "blueThrow") {
			game.throwinKicked = true;
		}
	}
}

room.onPlayerKicked = function(kickedPlayer, reason, ban, byPlayer) {
	kickFetchVariable = true;
    if (logWebhook != '') {
        var stringContent = `[${getDate()}] ⛔ ${ban ? 'BAN' : 'KICK'} (${players.length}/${maxPlayers})\n` +
            `**${kickedPlayer.name}** [${authArray[kickedPlayer.id][0]}] {${authArray[kickedPlayer.id][1]}} was ${ban ? 'banned' : 'kicked'}` +
            `${byPlayer != null ? ' by **' + byPlayer.name + '** [' + authArray[byPlayer.id][0] + '] {' + authArray[byPlayer.id][1] + '}' : ''}`
        fetch(logWebhook, {
            method: 'POST',
            body: JSON.stringify({
                content: stringContent,
                username: roomName,
            }),
            headers: {
                'Content-Type': 'application/json',
            },
        }).then((res) => res);
    }	
	if (superAdmins.indexOf(kickedPlayer.id) > -1 && byPlayer != null) {
		room.kickPlayer(byPlayer.id, "Tú no puedes kick/ban a un Super Admin", false);
		room.clearBans();
	}
}

room.onPlayerChat = (player, message) => {

		let spacePos = message.search(" ");
    	let command = message.substr(0, spacePos !== -1 ? spacePos : message.length);
    	if (commands2.hasOwnProperty(command) == true) return commands2[command](player, message);

        if (message.match(regex)) {
        room.sendAnnouncement("No puedes poner esto.", player.id);
        return false;
        }
    	
        if (message == "!discord") {
        	whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████╗░██╗░██████╗░█████╗░░█████╗░██████╗░██████╗░▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        	whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██╔══██╗██║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        	whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██║░░██║██║╚█████╗░██║░░╚═╝██║░░██║██████╔╝██║░░██║▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        	whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██║░░██║██║░╚═══██╗██║░░██╗██║░░██║██╔══██╗██║░░██║▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        	whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████╔╝██║██████╔╝╚█████╔╝╚█████╔╝██║░░██║██████╔╝▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        	whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╚═════╝░╚═╝╚═════╝░░╚════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        	whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒💬 𝑼𝑵𝑰𝑻𝑬 𝑨𝑳 𝑫𝑰𝑺𝑪𝑶𝑹𝑫 𝑫𝑬 𝑨𝑹𝑺𝑨 ➡ https://discord.gg/QRuJ3fvDbM ⬅", player.id, 0x61ddff,"bold", 0);
        };

        if (message == "!firmo"){
    	if (ofiWebhook != '') {
        var stringContent = `**NOMBRE:** ${player.name}\n**HORA DE FIRMA:** ${getDate()}\n **ROOM NAME:** ${roomName}\n**ID:**  ${player.id}\n**AUTH:** - ${PlayerInfoObject[player.id].auth}\n**CONN:** - ${PlayerInfoObject[player.id].conn}\n\n**${player.name} FIRMO CON EXITO [:white_check_mark:]**\n\n =====================`;
        fetch(ofiWebhook, {
            method: 'POST',
            body: JSON.stringify({
                content: stringContent,
                username: roomName,
            }),
            headers: {
                'Content-Type': 'application/json',
            },
        }).then((res) => res);
    	}
    		room.sendAnnouncement("Has firmado con exito! preparate para jugar el partido.", player.id);
    		room.sendAnnouncement("Recorda que si usas este comando sin estar en un oficial, es motivo de ban permanente.", player.id)	
    	}

    if (chatWebhook != '')
            fetch(chatWebhook, {
                method: 'POST',
                body: JSON.stringify({
                    content: `[${getDate()}]  **${player.name}** : ${message.replace('@', '@ ')}`,
                    username: roomName,
                }),
                headers: {
                    'Content-Type': 'application/json',
                },
            }).then((res) => res);

	if (message.startsWith("!")) {
		message = message.substr(1);
		let args = message.split(" ");
		
		if (args[0] == "admin" && args.length == 1 && allowPublicAdmin == true) {
			if (isAdminPresent() == false) {
				room.setPlayerAdmin(player.id, true);
			}
			else {
				whisper("El administrador ya está presente o el comando !admin no está permitido", player.id);
			}
		}
		else if (args[0] == "admin" && args.length == 2) {
			if (args[1] == superAdminCode) {
				room.setPlayerAdmin(player.id, true);
				if (superAdmins.indexOf(player.id) === -1) {
					superAdmins.push(player.id);
				}
				announce(player.name + " ha adquirido Super Admin");
			}
			if (args[1] == AdminHostCode) {
				room.setPlayerAdmin(player.id, true);
				announce(player.name + " ha adquirido Admin");
			}
		}
		else if (args[0] == "clearbans") {
			if (player.admin) {
				room.clearBans();
				announce("Los bans han sido limpiados por " + player.name);
			}
			else {
				whisper("Comando solo de Admin", player.id);
			}
		}
		else if (args[0] == "court" && args.length == 1) {
			whisper("El color de fondo actual es " + mapBGColor);
		}
		else if (args[0] == "court" && args.length == 2 && player.admin) {
			if (room.getScores() == null) {
				if (args[1] == "reset") {
					mapBGColor = "86A578";
					announce("El color de fondo del mapa ha sido restablecido por " + player.name);
				}
				else {
					mapBGColor = args[1];
					announce("Color de fondo del mapa establecido en " + args[1] + " by " + player.name);
				}
				room.setCustomStadium(getRealSoccerMap());				
			}
			else {
				whisper("No se puede cambiar el color de fondo del mapa mientras el juego está en proceso", player.id);
			}
		}
		else if (args[0] == "swap") {
			if (player.admin) {
				if (args.length == 1) {
					var players = room.getPlayerList().filter((player) => player.id != 0 );
					if ( players.length == 0 ) return false;
					players.forEach(function(player) {	
						if (player.team == 1) {
							room.setPlayerTeam(player.id, 2);
						}
						if (player.team == 2) {
							room.setPlayerTeam(player.id, 1);
						}
					});
					announce("🔄 Los equipos han sido intercambiados");
				}
			}
			else {
				whisper("Comando solo de Admin", player.id);
		}

                }
		else if (args[0] == "setpassword" && args.length == 2 && player.admin) {
			room.setPassword(args[1]);
			roomPassword = args[1];
			announce("La contraseña ha sido cambiada por " + player.name);
		}
		else if (args[0] == "clearpassword" && player.admin) {
			room.setPassword(null);
			roomPassword = null;
			announce("La contraseña ha sido borrada por " + player.name);
               }
		else if (args[0] == "rs" && player.admin) {
			if (room.getScores() == null) {
				room.setCustomStadium(getRealSoccerMap());
			}
			else {
				whisper("No se puede cambiar de mapa mientras el juego está en progreso", player.id);
			}
		}
		else if (args[0] == "rr" && player.admin) {
			room.stopGame();
			room.startGame();
		}
		else if (args[0] == "bb") {
			room.kickPlayer(player.id, "Adiós 👋", false);
		}			
		else if (args[0] == "help") {
			displayHelp(player.id, args[1]);
		}
		else if (args[0] == "super") {
			let superMsg = "Super Admins: ";
			superAdmins.forEach(function(id) {
				if (room.getPlayer(id) != null || room.getPlayer(id) != undefined) {
					superMsg = superMsg + room.getPlayer(id).name + ", ";
				}
			});
			if (superAdmins.length > 0) {
				superMsg = superMsg.slice(0, -2); 
			}
			else {
				superMsg = "No hay Super Admins presentes";
			}
			whisper(superMsg, player.id);
		}
		return false;
	}

	if (message.startsWith("t ")) {
		teamMsg = message.substring(1).trim();
		if (player.team == 1) {
			var players = room.getPlayerList().filter((player) => player.team == 1);
			players.forEach(function(teamPlayer) {
				room.sendAnnouncement("[Team] " + player.name + ": " + teamMsg, teamPlayer.id, 0xED6A5A, "normal", 1);
			});
		}
		if (player.team == 2) {
			var players = room.getPlayerList().filter((player) => player.team == 2);
			players.forEach(function(teamPlayer) {
				room.sendAnnouncement("[Team] " + player.name + ": " + teamMsg, teamPlayer.id, 0x5995ED, "normal", 1);
			});
		}
		if (player.team == 0) {
			var players = room.getPlayerList().filter((player) => player.team == 0);
			players.forEach(function(teamPlayer) {
				room.sendAnnouncement("[Spec] " + player.name + ": " + teamMsg, teamPlayer.id, 0xdee7fa, "normal", 1);
			});
		}
		return false;
	}
	if (message.startsWith("@@")) {
		message = message.substr(2).trim();
		if (message.indexOf(' ') !== -1) {
			let args = message.match(/^(\S+)\s(.*)/).slice(1);
			
			if (args.length > 1) {
				var pmMsg = args[1];
				var players = room.getPlayerList();
				var pmSent = false;
				players.forEach(function(pmPlayer) {
					if (pmPlayer.name === args[0] || pmPlayer.name === args[0].replace(/_/g, ' ')) {
						whisper("[PM > " + pmPlayer.name + "] " + player.name + ": " + pmMsg, player.id, 0xff20ff, "normal", 1);	
						whisper("[PM] " + player.name + ": " + pmMsg, pmPlayer.id, 0xff20ff, "normal", 1);
						pmSent = true;					
					}
				});
				if (pmSent == false) {
					whisper("No se puede encontrar el usuario '" + args[0] + "'", player.id, 0xff20ff, "normal", 1);
				}
				return false;
			}
		}			
	}
}

function displayHelp(id, selection) {
	if (selection == null) {
		whisper("Comandos: !rs, !rr, !bb, !admin, !firmo [SOLO PARA OFICIALES], !camisetas [TODAS LAS CAMISETAS DE ARSA], !discord, !setpassword, !clearpassword, !super, !clearbans, !swap, @@[player] [pm msg] , t [team chat msg], !court, !court [hexcolor], !court reset", id, null, "small");
	}
}

room.onPlayerTeamChange = function(changedPlayer, byPlayer) {
	if (map == "RSR") {
		handleLineupChangeTeamChange(changedPlayer);
		if (room.getScores() != null) {
			if (game.rsActive == false) {
				room.getPlayerList().forEach(function(player) {
					if (player != undefined) {
						if (game.rsGoalKick == true || game.rsCorner == true) {
							room.setPlayerDiscProperties(player.id, {invMass: 9999999});
						}
					}
				});
			}
		}
	}
}

room.onTeamGoal = function(team) {
	if (map == "RSR") {
	const scores = room.getScores();
    game.scores = scores;
    playSituation = Situation.GOAL;
    ballSpeed = getBallSpeed();
    var goalString = getGoalString(team);
    if ((scores.scoreLimit != 0 && (scores.red == scores.scoreLimit || scores.blue == scores.scoreLimit))) {
        endGame(team);
        stopTimeout = setTimeout(() => {
            room.stopGame();
        }, 1000);
    }
    var red = scores.red;
    var blue = scores.blue;
    var time = scores.time;
		game.rsActive = false;
		
		let goalTime = secondsToMinutes(Math.floor(room.getScores().time));
		let scorer;
		let assister = "";
		let goalType;
		if (team == 1) {
			if (game.lastKickerTeam == 1) { //if goal type is goal
				goalType = "GOL!";
				scorer = "⚽" + game.lastKickerName;
				avatarCelebration(game.lastKickerId, "⚽");
				if (game.secondLastKickerTeam == 1 && game.lastKickerId != game.secondLastKickerId) { // if assist is from teammate
					assister = " (Assist: " + game.secondLastKickerName + ")";
					avatarCelebration(game.secondLastKickerId, "🅰️");
				}
			}		
			if (game.lastKickerTeam == 2) { //if goal type is owngoal
				goalType = "GOL EN CONTRA!";
				scorer = "🐸" + game.lastKickerName;
				avatarCelebration(game.lastKickerId, "🐸");
				if (game.secondLastKickerTeam == 1) { // if owngoal was assisted
					assister = " (Assist: " + game.secondLastKickerName + ")";
					avatarCelebration(game.secondLastKickerId, "🅰️");
				}
			}
			game.redScore++;
		}
		if (team == 2) {
			if (game.lastKickerTeam == 2) { //if goal type is goal
				goalType = "GOL!";
				scorer = "⚽" + game.lastKickerName;
				avatarCelebration(game.lastKickerId, "⚽");
				if (game.secondLastKickerTeam == 2 && game.lastKickerId != game.secondLastKickerId) { // if assist is from teammate
					assister = " (Assist: " + game.secondLastKickerName + ")";
					avatarCelebration(game.secondLastKickerId, "🅰️");
				}
			}		
			if (game.lastKickerTeam == 1) { //if goal type is owngoal
				goalType = "GOL EN CONTRA!";
				scorer = "🐸" + game.lastKickerName;
				avatarCelebration(game.lastKickerId, "🐸");
				if (game.secondLastKickerTeam == 2) { // if owngoal was assisted
					assister = " (Assist: " + game.secondLastKickerName + ")";
					avatarCelebration(game.secondLastKickerId, "🅰️");
				}
			}
			game.blueScore++;
		}
		announce(goalType + " 🟥 " + game.redScore + " - " + game.blueScore + " 🟦 🕒" + goalTime + " " + scorer + assister);
		game.lastKicker = undefined;
		game.secondLastKicker = undefined;
		game.lastKickerTeam = undefined;
		game.secondLastKickerTeam = undefined;
	}
}

room.onPositionsReset = function() {
	if (map == "RSR") {
		if (game.lastPlayAnnounced == true) {
			room.pauseGame(true);
			game.lastPlayAnnounced = false;
			lastTouches = Array(2).fill(null);
    		lastTeamTouched = Team.SPECTATORS;
    		playSituation = Situation.KICKOFF;
			announce("Termino");
            room.sendAnnouncement("La partida ha sido enviada a discord.");
            {
        		fetchSummaryEmbed(game);
        		if (fetchRecordingVariable) {
            	setTimeout((gameEnd) => { fetchRecording(gameEnd); }, 500, game);
        			}
    			}
		}
	}
}

room.onGameTick = function() {
	if (map == "RSR") {
		 checkTime();
    	getLastTouchOfTheBall();
    	getGameStats();
		updateGameStatus();
		handleBallTouch();
		realSoccerRef();
	}	
}

function realSoccerRef() {
	blockThrowIn();
	blockGoalKick();
	removeBlock();
	if (game.time == gameTime * 60 && game.extraTimeAnnounced == false) {
		extraTime();
		game.extraTimeAnnounced = true;
	}
	
	if (game.time == game.extraTimeEnd && game.lastPlayAnnounced == false) {
		announce("Ultima jugada", null, null, null, 1);
		game.lastPlayAnnounced = true;
	}
	
	if (game.rsCorner == true || game.rsGoalKick == true) { //add extra time
		game.extraTimeCount++;
	}
	
	if (game.rsTimer < 99999 && game.paused == false && game.rsActive == false && game.rsReady == true) {
		game.rsTimer++;
	}
	
	if (game.rsSwingTimer < 150 && game.rsCorner == false && game.rsGoalKick == false) {
		game.rsSwingTimer++;
		if (game.rsSwingTimer > 5) {
			room.setDiscProperties(0, {xgravity: room.getDiscProperties(0).xgravity * 0.97, ygravity: room.getDiscProperties(0).ygravity * 0.97});
		}		
		if (game.rsSwingTimer == 150) {
			room.setDiscProperties(0, {xgravity: 0, ygravity: 0});
		}
	}
	
	
	if (game.boosterState == true) {
		game.boosterCount++;
	}
	
	if (game.boosterCount > 30) {
		game.boosterState = false;
		game.boosterCount = 0;
		room.setDiscProperties(0, {cMask: 63});
	}
	
	
	if (room.getBallPosition().x == 0 && room.getBallPosition().y == 0) {	
		game.rsActive = true;
		game.outStatus = "";
	}
	
	if (game.rsActive == false && game.rsReady == true) { //expire barrier time
		if (game.outStatus == "redThrow") {
			if (game.rsTimer == throwTimeOut - 120) { // warning indicator
				ballWarning("0xff3f34", ++game.warningCount);
			}
			if (game.rsTimer == throwTimeOut && game.bringThrowBack == false) { // switch to blue throw
				game.outStatus = "blueThrow";
				game.rsTimer = 0;				
				room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
				sleep(100).then(() => {
					room.setDiscProperties(0, {color: "0x0fbcf9", xspeed: 0, yspeed: 0, x: game.ballOutPositionX, y: game.throwInPosY});
				});
			}
		}
		else if (game.outStatus == "blueThrow") {
			if (game.rsTimer == throwTimeOut - 120) { // warning indicator
				ballWarning("0x0fbcf9", ++game.warningCount);
			}
			if (game.rsTimer == throwTimeOut && game.bringThrowBack == false) { // switch to red throw
				game.outStatus = "redThrow";
				game.rsTimer = 0;						
				room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
				sleep(100).then(() => {
					room.setDiscProperties(0, {color: "0xff3f34", xspeed: 0, yspeed: 0, x: game.ballOutPositionX, y: game.throwInPosY});
				});
			}
		}
		else if (game.outStatus == "blueGK" || game.outStatus == "redGK") {
			if (game.rsTimer == gkTimeOut - 120) { // warning indicator
				if (game.outStatus == "blueGK") {
					ballWarning("0x0fbcf9", ++game.warningCount);
				}
				if (game.outStatus == "redGK") {
					ballWarning("0xff3f34", ++game.warningCount);
				}
			}
			if (game.rsTimer == gkTimeOut) {
				game.outStatus = "";
				room.setDiscProperties(0, {color: "0xffffff"});
				game.rsTimer = 1000000;							
			}
		}
		else if (game.outStatus == "blueCK" || game.outStatus == "redCK") {
			if (game.rsTimer == ckTimeOut - 120) {
				if (game.outStatus == "blueCK") {
					ballWarning("0x0fbcf9", ++game.warningCount);
				}
				if (game.outStatus == "redCK") {
					ballWarning("0xff3f34", ++game.warningCount);
				}
			}
			if (game.rsTimer == ckTimeOut) {
				game.outStatus = "";
				room.setDiscProperties(1, {x: 0, y: 2000, radius: 0});
				room.setDiscProperties(2, {x: 0, y: 2000, radius: 0});
				room.setDiscProperties(0, {color: "0xffffff"});
				game.rsTimer = 1000000;							
			}
		}
	}
	
	if (game.rsActive == true) {
		if ((room.getBallPosition().y > 611.45 || room.getBallPosition().y < -611.45)) {
			game.rsActive = false;
			if (game.lastPlayAnnounced == true) {
				room.pauseGame(true);
				game.lastPlayAnnounced = false;
				announce("Termino");
                room.sendAnnouncement("La partida ha sido enviada a discord.");
                {
                game.rec = room.stopRecording();	
        		fetchSummaryEmbed(game);
        		if (fetchRecordingVariable) {
            	setTimeout((gameEnd) => { fetchRecording(gameEnd); }, 500, game);
        			}
    			}
			}
			
			room.setDiscProperties(0, {xgravity: 0, ygravity: 0});
			
			game.ballOutPositionX = Math.round(room.getBallPosition().x * 10) / 10;
			if (room.getBallPosition().y > 611.45) {
				game.ballOutPositionY = 400485;
				game.throwInPosY = 618;
			}
			if (room.getBallPosition().y < -611.45) {
				game.ballOutPositionY = -400485;
				game.throwInPosY = -618;
			}
			if (room.getBallPosition().x > 1130) {
				game.ballOutPositionX = 1130;
			}
			if (room.getBallPosition().x < -1130) {
				game.ballOutPositionX = -1130;
			}
			
			
			if (game.rsTouchTeam == 1) {				
				room.setDiscProperties(3, {x: game.ballOutPositionX, y: game.throwInPosY, radius: 18 });
				sleep(100).then(() => {
					game.outStatus = "blueThrow";
					game.throwinKicked = false;
					game.rsTimer = 0;
					game.rsReady = true;
					room.setDiscProperties(0, {xspeed: 0, yspeed: 0, x: game.ballOutPositionX, y: game.throwInPosY, xgravity: 0, ygravity: 0});
					//announce("🖐️ Throw In: 🔵 Blue");
					room.setDiscProperties(0, {color: "0x0fbcf9"});				
				});	
				sleep(100).then(() => {
					room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
				});
			}
			else {				
				room.setDiscProperties(3, {x: game.ballOutPositionX, y: game.throwInPosY, radius: 18 });
				sleep(100).then(() => {
					game.outStatus = "redThrow";
					game.throwinKicked = false;
					game.rsTimer = 0;
					game.rsReady = true;
					room.setDiscProperties(0, {xspeed: 0, yspeed: 0, x: game.ballOutPositionX, y: game.throwInPosY, xgravity: 0, ygravity: 0});
					//announce("🖐️ Throw In: 🔴 Red");
					room.setDiscProperties(0, {color: "0xff3f34"});				
				});	
				sleep(100).then(() => {
					room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
				});
			}
		}
	
		if (room.getBallPosition().x > 1162.45 && (room.getBallPosition().y > 124 || room.getBallPosition().y < -124)) {
			game.rsActive = false;	
			if (game.lastPlayAnnounced == true) {
				room.pauseGame(true);
				game.lastPlayAnnounced = false;
				announce("Termino");
                                room.sendAnnouncement("La partida ha sido enviada a discord.");
				{
			game.rec = room.stopRecording();
        	fetchSummaryEmbed(game);
        	if (fetchRecordingVariable) {
            setTimeout((gameEnd) => { fetchRecording(gameEnd); }, 500, game);
        		}
    		}

			}

			room.setDiscProperties(0, {xgravity: 0, ygravity: 0});
			room.getPlayerList().forEach(function(player) {
				room.setPlayerDiscProperties(player.id, {invMass: 100000});
			});
			
			if (game.rsTouchTeam == 1) {				
				room.setDiscProperties(3, {x: 1060, y: 0, radius: 18 });
				sleep(100).then(() => {					
					game.outStatus = "blueGK";
					game.rsTimer = 0;
					game.rsReady = true;
					//announce("🥅 Saque de Arco: 🔵 Blue");
					game.rsGoalKick = true;
					game.rsSwingTimer = 0;
					game.boosterCount = 0;
					game.boosterState = false;
					room.setDiscProperties(0, {xspeed: 0, yspeed: 0, x: 1060, y: 0, color: "0x0fbcf9", cMask: 268435519, xgravity: 0, ygravity: 0});
				});
				sleep(3000).then(() => {
					room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
				});
			}
			else {	
				//announce("🚩 Corner: 🔴 Red");							
				game.rsSwingTimer = 0;
				if (room.getBallPosition().y < -124) {					
					room.setDiscProperties(3, {x: 1140, y: -590, radius: 18 });
					sleep(100).then(() => {
						game.rsCorner = true;
						game.outStatus = "redCK";
						game.rsTimer = 0;
						game.rsReady = true;
						game.boosterCount = 0;
						game.boosterState = false;
						room.setDiscProperties(0, {x: 1140, y: -590, xspeed: 0, yspeed: 0, color: "0xff3f34", cMask: 268435519, xgravity: 0, ygravity: 0});
						room.setDiscProperties(2, {x: 1150, y: -670, radius: 420 });
						room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
					});
				}
				if (room.getBallPosition().y > 124) {
					room.setDiscProperties(3, {x: 1140, y: 590, radius: 18 });
					sleep(100).then(() => {
						game.rsCorner = true;
						game.outStatus = "redCK";
						game.rsTimer = 0;
						game.rsReady = true;
						game.boosterCount = 0;
						game.boosterState = false;
						room.setDiscProperties(0, {x: 1140, y: 590, xspeed: 0, yspeed: 0, color: "0xff3f34", cMask: 268435519, xgravity: 0, ygravity: 0});
						room.setDiscProperties(2, {x: 1150, y: 670, radius: 420 });
						room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
					});
				}
			}
		}
		if (room.getBallPosition().x < -1162.45 && (room.getBallPosition().y > 124 || room.getBallPosition().y < -124)) {
			game.rsActive = false;
			if (game.lastPlayAnnounced == true) {
				room.pauseGame(true);
				game.lastPlayAnnounced = false;
				announce("termino");
                                room.sendAnnouncement("La partida ha sido enviada a discord.");
                                {
            game.rec = room.stopRecording();
        	fetchSummaryEmbed(game);
        	if (fetchRecordingVariable) {
            setTimeout((gameEnd) => { fetchRecording(gameEnd); }, 500, game);
        			}
    			}
			}
			room.setDiscProperties(0, {xgravity: 0, ygravity: 0});
			room.getPlayerList().forEach(function(player) {
				room.setPlayerDiscProperties(player.id, {invMass: 100000});
			});
			
			if (game.rsTouchTeam == 1) {				
				//announce("🚩 Corner: 🔵 Blue");				
				game.rsSwingTimer = 0;
				if (room.getBallPosition().y < -124) {
					room.setDiscProperties(3, {x: -1140, y: -590, radius: 18 });
					sleep(100).then(() => {
						game.rsCorner = true;
						game.outStatus = "blueCK";
						game.rsTimer = 0;
						game.rsReady = true;
						game.boosterCount = 0;
						game.boosterState = false;
						room.setDiscProperties(0, {x: -1140, y: -590, xspeed: 0, yspeed: 0, color: "0x0fbcf9", cMask: 268435519, xgravity: 0, ygravity: 0});
						room.setDiscProperties(1, {x: -1150, y: -670, radius: 420 });
						room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
					});	
				}
				if (room.getBallPosition().y > 124) {
					room.setDiscProperties(3, {x: -1140, y: 590, radius: 18 });
					sleep(100).then(() => {
						game.rsCorner = true;
						game.outStatus = "blueCK";
						game.rsTimer = 0;
						game.rsReady = true;
						game.boosterCount = 0;
						game.boosterState = false;
						room.setDiscProperties(0, {x: -1140, y: 590, xspeed: 0, yspeed: 0, color: "0x0fbcf9", cMask: 268435519, xgravity: 0, ygravity: 0});
						room.setDiscProperties(1, {x: -1150, y: 670, radius: 420 });
						room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
					});		
				}				
			}
			else {				
				room.setDiscProperties(3, {x: -1060, y: 0, radius: 18 });
				sleep(100).then(() => {
					game.outStatus = "redGK";
					game.rsTimer = 0;
					game.rsReady = true;
					//announce("🥅 Saque de Arco: 🔴 Red");
					game.rsGoalKick = true;
					game.rsSwingTimer = 0;
					game.boosterCount = 0;
					game.boosterState = false;
					room.setDiscProperties(0, {xspeed: 0, yspeed: 0, x: -1060, y: 0, color: "0xff3f34", cMask: 268435519, xgravity: 0, ygravity: 0});
				});
				sleep(3000).then(() => {
					room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
				});
			}
		}
	}
	
	if (game.rsActive == false && (game.outStatus == "redThrow" || game.outStatus == "blueThrow")) { 
		if ((room.getBallPosition().y > 611.45 || room.getBallPosition().y < -611.45) && (room.getBallPosition().x < game.ballOutPositionX - throwinDistance || room.getBallPosition().x > game.ballOutPositionX + throwinDistance) && game.bringThrowBack == false) { //if bad throw from run too far
			game.bringThrowBack	= true;
			if (game.outStatus == "redThrow") { //switch to blue throw
				game.rsTimer = 0;
				game.warningCount++;
				game.outStatus = "blueThrow";								
				room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
				sleep(100).then(() => {
					room.setDiscProperties(0, {xspeed: 0, yspeed: 0, color: "0x0fbcf9", x: game.ballOutPositionX, y: game.throwInPosY});	
				});			
			}
			else if (game.outStatus == "blueThrow") { //switch to red throw
				game.rsTimer = 0;
				game.warningCount++;
				game.outStatus = "redThrow";										
				room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});	
				sleep(100).then(() => {
					room.setDiscProperties(0, {xspeed: 0, yspeed: 0, color: "0xff3f34", x: game.ballOutPositionX, y: game.throwInPosY});
				});
			}
				
		}
		
		if (room.getBallPosition().y < 611.45 && room.getBallPosition().y > -611.45 && game.throwinKicked == false && game.pushedOut == false) { //if bad throw from push ball back into active without kick		
			if (game.outStatus == "redThrow") { //switch to blue throw
				game.rsTimer = 0;
				game.warningCount++;
				game.outStatus = "blueThrow";								
				room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});
				sleep(100).then(() => {
					room.setDiscProperties(0, {xspeed: 0, yspeed: 0, color: "0x0fbcf9", x: game.ballOutPositionX, y: game.throwInPosY});
				});					
			}
			else if (game.outStatus == "blueThrow") { //switch to red throw
				game.rsTimer = 0;
				game.warningCount++;
				game.outStatus = "redThrow";										
				room.setDiscProperties(3, {x: 0, y: 2000, radius: 0});	
				sleep(100).then(() => {
					room.setDiscProperties(0, {xspeed: 0, yspeed: 0, color: "0xff3f34", x: game.ballOutPositionX, y: game.throwInPosY});
				});
			}
			game.pushedOut = true;
		}
		
		if (room.getBallPosition().y < 611.45 && room.getBallPosition().y > -611.45 && game.throwinKicked == true) { // if throw is good
			game.outStatus = "";
			game.rsActive = true;
			game.rsReady = false;
			room.setDiscProperties(0, {color: "0xffffff"});
			game.rsTimer = 1000000;
			game.warningCount++;
		}
		
		if (room.getBallPosition().y.toFixed(1) == game.throwInPosY.toFixed(1) && room.getBallPosition().x.toFixed(1) == game.ballOutPositionX.toFixed(1)) {
			game.bringThrowBack	= false;
			game.pushedOut = false;
		}
	}
}


function handleBallTouch() {
	var players = room.getPlayerList();
	var ballPosition = room.getBallPosition();
	var ballRadius = game.ballRadius;
	var playerRadius = 15;
	var triggerDistance = ballRadius + playerRadius + 0.01;
	
	for (var i = 0; i < players.length; i++) { // Iterate over all the players
		var player = players[i];
		if ( player.position == null ) continue;
		var distanceToBall = pointDistance(player.position, ballPosition);
		if ( distanceToBall < triggerDistance ) {				
			game.rsTouchTeam = player.team;
			game.throwinKicked = false;
			
			if (game.rsCorner == false && room.getDiscProperties(0).xgravity != 0) {
				room.setDiscProperties(0, {xgravity: 0, ygravity:0});
				game.rsSwingTimer = 10000;
			}
		}		
	}
}

function updateGameStatus() {
	game.time = Math.floor(room.getScores().time);
	game.ballRadius = room.getDiscProperties(0).radius;
}


function announce(msg, targetId, color, style, sound) {
	if (color == null) {
		color = 0xFFFD82;
	}
	if (style == null) {
		style = "bold";
	}
	if (sound == null) {
		sound = 0;
	}
	room.sendAnnouncement(msg, targetId, color, style, sound);
	console.log("Announce: " + msg);
}

function whisper(msg, targetId, color, style, sound) {
	if (color == null) {
		color = 0x66C7FF;
	}
	if (style == null) {
		style = "normal";
	}
	if (sound == null) {
		sound = 0;
	}
	room.sendAnnouncement(msg, targetId, color, style, sound);
	if (room.getPlayer(targetId) != null) {
		console.log("Whisper -> " + room.getPlayer(targetId).name + ": " + msg);
	}
}

function isAdminPresent() {
	var players = room.getPlayerList();
	if (players.find((player) => player.admin) != null) {
		return true;
	}
	else {
		return false;
	}
}

function displayAdminMessage() {
	if (isAdminPresent() == false && allowPublicAdmin == true) {
		announce("Ningún administrador presente: escriba !admin para tomar el control");
	}
}

function pointDistance(p1, p2) {
	var d1 = p1.x - p2.x;
	var d2 = p1.y - p2.y;
	return Math.sqrt(d1 * d1 + d2 * d2);
}

function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

function ballWarning(origColour, warningCount) {
	sleep(200).then(() => {
		if (game.warningCount == warningCount) {
			room.setDiscProperties(0, {color: "0xffffff"});
		}
	});
	sleep(400).then(() => {
		if (game.warningCount == warningCount) {
			room.setDiscProperties(0, {color: origColour});
		}
	});
	sleep(600).then(() => {
		if (game.warningCount == warningCount) {
			room.setDiscProperties(0, {color: "0xffffff"});
		}
	});
	sleep(800).then(() => {
		if (game.warningCount == warningCount) {
			room.setDiscProperties(0, {color: origColour});
		}
	});
	sleep(1000).then(() => {
		if (game.warningCount == warningCount) {
			room.setDiscProperties(0, {color: "0xffffff"});
		}
	});
	sleep(1200).then(() => {
		if (game.warningCount == warningCount) {
			room.setDiscProperties(0, {color: origColour});
		}
	});
	sleep(1400).then(() => {
		if (game.warningCount == warningCount) {
			room.setDiscProperties(0, {color: "0xffffff"});
		}
	});
	sleep(1600).then(() => {
		if (game.warningCount == warningCount) {
			room.setDiscProperties(0, {color: origColour});
		}
	});
	sleep(1675).then(() => {
		if (game.warningCount == warningCount) {
			room.setDiscProperties(0, {color: "0xffffff"});
		}
	});
	sleep(1750).then(() => {
		if (game.warningCount == warningCount) {
			room.setDiscProperties(0, {color: origColour});
		}
	});
}

function extraTime() {
	var extraSeconds = Math.ceil(game.extraTimeCount / 60);
	game.extraTimeEnd = (gameTime * 60) + extraSeconds;
	announce("Extra time: " + extraSeconds + " Seconds", null, null, null, 1);
}

function avatarCelebration(playerId, avatar) {
	room.setPlayerAvatar(playerId, avatar);
	sleep(250).then(() => {
		room.setPlayerAvatar(playerId, null);
	});
	sleep(500).then(() => {
		room.setPlayerAvatar(playerId, avatar);
	});
	sleep(750).then(() => {
		room.setPlayerAvatar(playerId, null);
	});
	sleep(1000).then(() => {
		room.setPlayerAvatar(playerId, avatar);
	});
	sleep(1250).then(() => {
		room.setPlayerAvatar(playerId, null);
	});
	sleep(1500).then(() => {
		room.setPlayerAvatar(playerId, avatar);
	});
	sleep(1750).then(() => {
		room.setPlayerAvatar(playerId, null);
	});
	sleep(2000).then(() => {
		room.setPlayerAvatar(playerId, avatar);
	});
	sleep(2250).then(() => {
		room.setPlayerAvatar(playerId, null);
	});
	sleep(2500).then(() => {
		room.setPlayerAvatar(playerId, avatar);
	});
	sleep(2750).then(() => {
		room.setPlayerAvatar(playerId, null);
	});
	sleep(3000).then(() => {
		room.setPlayerAvatar(playerId, avatar);
	});
	sleep(3250).then(() => {
		room.setPlayerAvatar(playerId, null);
	});
}

function secondsToMinutes(time) {
	// Hours, minutes and seconds
    var hrs = ~~(time / 3600);
    var mins = ~~((time % 3600) / 60);
    var secs = ~~time % 60;

    // Output like "1:01" or "4:03:59" or "123:03:59"
    var ret = "";
    if (hrs > 0) {
        ret += "" + hrs + ":" + (mins < 10 ? "0" : "");
    }
    ret += "" + mins + ":" + (secs < 10 ? "0" : "");
    ret += "" + secs;
    return ret;
}

function blockThrowIn() {
	var players = room.getPlayerList().filter((player) => player.team != 0);
	if (room.getBallPosition().y < 0) { // top throw line
		if (game.outStatus == "redThrow") {
			players.forEach(function(player) {
				if (player.team == 2 && room.getPlayerDiscProperties(player.id).y < 0) {
					if (room.getPlayerDiscProperties(player.id).cGroup != 536870918) {
						room.setPlayerDiscProperties(player.id, {cGroup: 536870918});
					}
					if (player.position.y < -485) {
						room.setPlayerDiscProperties(player.id, {y: -470});
					}
				}
				if (player.team == 1 && room.getPlayerDiscProperties(player.id).cGroup != 2) {
					room.setPlayerDiscProperties(player.id, {cGroup: 2});
				}
				if (room.getDiscProperties(17).x != 1149) { // show top red line
					room.setDiscProperties(17, {x: 1149});
				}
				if (room.getDiscProperties(19).x != -1149) { // hide top blue line
					room.setDiscProperties(19, {x: -1149});
				}
			});
		}
		if (game.outStatus == "blueThrow") {
			players.forEach(function(player) {
				if (player.team == 1 && room.getPlayerDiscProperties(player.id).y < 0) {
					if (room.getPlayerDiscProperties(player.id).cGroup != 536870918) {
						room.setPlayerDiscProperties(player.id, {cGroup: 536870918});
					}
					if (player.position.y < -485) {
						room.setPlayerDiscProperties(player.id, {y: -470});
					}
				}
				if (player.team == 2 && room.getPlayerDiscProperties(player.id).cGroup != 2) {
					room.setPlayerDiscProperties(player.id, {cGroup: 2});
				}
				if (room.getDiscProperties(19).x != 1149) { // show top blue line
					room.setDiscProperties(19, {x: 1149});
				}
				if (room.getDiscProperties(17).x != -1149) { // hide top red line
					room.setDiscProperties(17, {x: -1149});
				}
			});
		}
	}
	if (room.getBallPosition().y > 0) { // bottom throw line
		if (game.outStatus == "redThrow") {
			players.forEach(function(player) {
				if (player.team == 2 && room.getPlayerDiscProperties(player.id).y > 0) {
					if (room.getPlayerDiscProperties(player.id).cGroup != 536870918) {
						room.setPlayerDiscProperties(player.id, {cGroup: 536870918});
					}
					if (player.position.y > 485) {
						room.setPlayerDiscProperties(player.id, {y: 470});
					}
				}
				if (player.team == 1 && room.getPlayerDiscProperties(player.id).cGroup != 2) {
					room.setPlayerDiscProperties(player.id, {cGroup: 2});
				}
				if (room.getDiscProperties(21).x != 1149) { // show bottom red line
					room.setDiscProperties(21, {x: 1149});
				}
				if (room.getDiscProperties(23).x != -1149) { // hide bottom blue line
					room.setDiscProperties(23, {x: -1149});
				}
			});
		}
		if (game.outStatus == "blueThrow") {
			players.forEach(function(player) {
				if (player.team == 1 && room.getPlayerDiscProperties(player.id).y > 0) {
					if (room.getPlayerDiscProperties(player.id).cGroup != 536870918) {
						room.setPlayerDiscProperties(player.id, {cGroup: 536870918});
					}
					if (player.position.y > 485) {
						room.setPlayerDiscProperties(player.id, {y: 470});
					}
				}
				if (player.team == 2 && room.getPlayerDiscProperties(player.id).cGroup != 2) {
					room.setPlayerDiscProperties(player.id, {cGroup: 2});
				}
				if (room.getDiscProperties(23).x != 1149) { // show bottom blue line
					room.setDiscProperties(23, {x: 1149});
				}
				if (room.getDiscProperties(21).x != -1149) { // hide bottom red line
					room.setDiscProperties(21, {x: -1149});
				}
			});
		}		
	}	
}


function blockGoalKick() {
	var players = room.getPlayerList().filter((player) => player.team != 0);
	if (room.getBallPosition().x < 0) { // left side red goal kick
		if (game.outStatus == "redGK") {
			players.forEach(function(player) {
				if (player.team == 2 && room.getPlayerDiscProperties(player.id).x < 0) {
					if (room.getPlayerDiscProperties(player.id).cGroup != 268435462) {
						room.setPlayerDiscProperties(player.id, {cGroup: 268435462});
					}
					if (player.position.x < -840 && player.position.y > -320 && player.position.y < 320) {
						room.setPlayerDiscProperties(player.id, {x: -825});
					}
				}
				if (player.team == 1 && room.getPlayerDiscProperties(player.id).cGroup != 2) {
					room.setPlayerDiscProperties(player.id, {cGroup: 2});
				}
			});
		}
	}
	if (room.getBallPosition().x > 0) { // right side blue goal kick
		if (game.outStatus == "blueGK") {
			players.forEach(function(player) {
				if (player.team == 1 && room.getPlayerDiscProperties(player.id).x > 0) {
					if (room.getPlayerDiscProperties(player.id).cGroup != 268435462) {
						room.setPlayerDiscProperties(player.id, {cGroup: 268435462});
					}
					if (player.position.x > 840 && player.position.y > -320 && player.position.y < 320) {
						room.setPlayerDiscProperties(player.id, {x: 825});
					}
				}
				if (player.team == 2 && room.getPlayerDiscProperties(player.id).cGroup != 2) {
					room.setPlayerDiscProperties(player.id, {cGroup: 2});
				}
			});
		}		
	}	
}



function removeBlock() {
	var players = room.getPlayerList().filter((player) => player.team != 0);
	if (game.outStatus == "") {
		players.forEach(function(player) {
			if (player.team == 1 && room.getPlayerDiscProperties(player.id).cGroup != 2) {
				room.setPlayerDiscProperties(player.id, {cGroup: 2});
			}
			if (player.team == 2 && room.getPlayerDiscProperties(player.id).cGroup != 4) {
				room.setPlayerDiscProperties(player.id, {cGroup: 4});
			}
		});
		if (room.getDiscProperties(17).x != -1149) { // hide top red line
			room.setDiscProperties(17, {x: -1149});
		}
		if (room.getDiscProperties(19).x != -1149) { // hide top blue line
			room.setDiscProperties(19, {x: -1149});
		}
		if (room.getDiscProperties(21).x != -1149) { // hide bottom red line
			room.setDiscProperties(21, {x: -1149});
		}
		if (room.getDiscProperties(23).x != -1149) { // hide bottom blue line
			room.setDiscProperties(23, {x: -1149});
		}		
	}
}

let
palabras = ["ఌ", "甈", "㐷", "怅", "瘪", "㬆", "権", ],
regex = new RegExp(palabras.join("|"), 'gi');

room.onTeamVictory=(scores)=>{
}

function rfc3986EncodeURIComponent(str) {  
    return encodeURIComponent(str).replace(/[!'()*]/g, escape);  
}

/* FUNCTIONS */

/* AUXILIARY FUNCTIONS */

if (typeof String.prototype.replaceAll != 'function') {
    String.prototype.replaceAll = function (search, replacement) {
        var target = this;
        return target.split(search).join(replacement);
    };
}

function getDate() {
    let d = new Date();
    return d.toLocaleDateString() + ' ' + d.toLocaleTimeString();
}

/* TIME FUNCTIONS */

function getMinutesGame(time) {
    var t = Math.floor(time / 60);
    return `${Math.floor(t / 10)}${Math.floor(t % 10)}`;
}

function getMinutesReport(time) {
    return Math.floor(Math.round(time) / 60);
}

function getMinutesEmbed(time) {
    var t = Math.floor(Math.round(time) / 60);
    return `${Math.floor(t / 10)}${Math.floor(t % 10)}`;
}

function getSecondsGame(time) {
    var t = Math.floor(time - Math.floor(time / 60) * 60);
    return `${Math.floor(t / 10)}${Math.floor(t % 10)}`;
}

function getSecondsReport(time) {
    var t = Math.round(time);
    return Math.floor(t - Math.floor(t / 60) * 60);
}

function getSecondsEmbed(time) {
    var t = Math.round(time);
    var t2 = Math.floor(t - Math.floor(t / 60) * 60);
    return `${Math.floor(t2 / 10)}${Math.floor(t2 % 10)}`;
}

function getTimeGame(time) {
    return `[${getMinutesGame(time)}:${getSecondsGame(time)}]`;
}

function getTimeEmbed(time) {
    return `[${getMinutesEmbed(time)}:${getSecondsEmbed(time)}]`;
}

function getGoalGame() {
    return game.scores.red + game.scores.blue;
}

/* REPORT FUNCTIONS */

function findFirstNumberCharString(str) {
    let str_number = str[str.search(/[0-9]/g)];
    return str_number === undefined ? "0" : str_number;
}

function getIdReport() {
    var d = new Date();
    return `${d.getFullYear() % 100}${d.getMonth() < 9 ? '0' : ''}${d.getMonth() + 1}${d.getDate() < 10 ? '0' : ''}${d.getDate()}${d.getHours() < 10 ? '0' : ''}${d.getHours()}${d.getMinutes() < 10 ? '0' : ''}${d.getMinutes()}${d.getSeconds() < 10 ? '0' : ''}${d.getSeconds()}${findFirstNumberCharString(roomName)}`;
}

function getRecordingName(game) {
    let d = new Date();
    let redCap = game.playerComp[0][0] != undefined ? game.playerComp[0][0].player.name : 'Red';
    let blueCap = game.playerComp[1][0] != undefined ? game.playerComp[1][0].player.name : 'Blue';
    let day = d.getDate() < 10 ? '0' + d.getDate() : d.getDate();
    let month = d.getMonth() < 10 ? '0' + (d.getMonth() + 1) : (d.getMonth() + 1);
    let year = d.getFullYear() % 100 < 10 ? '0' + (d.getFullYear() % 100) : (d.getFullYear() % 100);
    let hour = d.getHours() < 10 ? '0' + d.getHours() : d.getHours();
    let minute = d.getMinutes() < 10 ? '0' + d.getMinutes() : d.getMinutes();
    return `${day}-${month}-${year}-${hour}h${minute}-${redCap}vs${blueCap}.hbr2`;
}

function fetchRecording(game) {
    if (recWebhook != "") {
        let form = new FormData();
        form.append(null, new File([game.rec], getRecordingName(game), { "type": "text/plain" }));
        form.append("payload_json", JSON.stringify({
            "username": roomName
        }));

        fetch(recWebhook, {
            method: 'POST',
            body: form,
        }).then((res) => res);
    }
}

// FEATURE //

function getPlayerComp(player) {
    if (player == null || player.id == 0) return null;
    var comp = game.playerComp;
    var index = comp[0].findIndex((c) => c.auth == authArray[player.id][0]);
    if (index != -1) return comp[0][index];
    index = comp[1].findIndex((c) => c.auth == authArray[player.id][0]);
    if (index != -1) return comp[1][index];
    return null;
}

function getTeamArray(team) {
    return team == Team.RED ? teamRed : team == Team.BLUE ? teamBlue : teamSpec;
}


/* PHYSICS FUNCTIONS */

function calculateStadiumVariables() {
    if (checkStadiumVariable && teamRed.length + teamBlue.length > 0) {
        checkStadiumVariable = false;
        setTimeout(() => {
            let ballDisc = room.getDiscProperties(0);
            let playerDisc = room.getPlayerDiscProperties(teamRed.concat(teamBlue)[0].id);
            ballRadius = ballDisc.radius;
            playerRadius = playerDisc.radius;
            triggerDistance = ballRadius + playerRadius + 0.01;
            speedCoefficient = 100 / (5 * ballDisc.invMass * (ballDisc.damping ** 60 + 1));
        }, 1);
    }
}

function checkGoalKickTouch(array, index, goal) {
    if (array != null && array.length >= index + 1) {
        var obj = array[index];
        if (obj != null && obj.goal != null && obj.goal == goal) return obj;
    }
    return null;
}

/* GAME FUNCTIONS */

function checkTime() {
    const scores = room.getScores();
    if (game != undefined) game.scores = scores;
    if (Math.abs(scores.time - scores.timeLimit) <= 0.01 && scores.timeLimit != 0 && playSituation == Situation.PLAY) {
        if (scores.red != scores.blue) {
            if (!checkTimeVariable) {
                checkTimeVariable = true;
                setTimeout(() => {
                    checkTimeVariable = false;
                }, 3000);
                scores.red > scores.blue ? endGame(Team.RED) : endGame(Team.BLUE);
                stopTimeout = setTimeout(() => {
                    room.stopGame();
                }, 2000);
            }
            return;
        }
    }
}

function endGame(winner) {
    const scores = room.getScores();
    game.scores = scores;
    endGameVariable = true;
    if (winner == Team.RED) {
        room.sendAnnouncement(
            `✨ Red Team gano ${scores.red} - ${scores.blue} !`,
            null,
            redColor,
            'bold',
            HaxNotification.CHAT
        );
    } else if (winner == Team.BLUE) {
        room.sendAnnouncement(
            `✨ Blue Team gano ${scores.blue} - ${scores.red} !`,
            null,
            blueColor,
            'bold',
            HaxNotification.CHAT
        );
    }
    let possessionRedPct = (possession[0] / (possession[0] + possession[1])) * 100;
    let possessionBluePct = 100 - possessionRedPct;
    let possessionString = `🔴 ${possessionRedPct.toFixed(0)}% - ${possessionBluePct.toFixed(0)}% 🔵`;
    let actionRedPct = (actionZoneHalf[0] / (actionZoneHalf[0] + actionZoneHalf[1])) * 100;
    let actionBluePct = 100 - actionRedPct;
    let actionString = `🔴 ${actionRedPct.toFixed(0)}% - ${actionBluePct.toFixed(0)}% 🔵`;
    let CSString = getCSString(scores);
    room.sendAnnouncement(
        `📊 Posesión: 🔴 ${possessionString}\n` +
        `📊 Zona de Juego: 🔴 ${actionString}\n` +
        `${CSString}`,
        null,
        announcementColor,
        'bold',
        HaxNotification.NONE
    );
}

/* PLAYER FUNCTIONS */

function updateTeams() {
    players = room.getPlayerList();
    teamRed = players.filter((p) => p.team == Team.RED);
    teamBlue = players.filter((p) => p.team == Team.BLUE);
    teamSpec = players.filter((p) => p.team == Team.SPECTATORS);
}

/* LINEUP FUNCTIONS */

function getStartingLineups() {
    var compositions = [[], []];
    for (let player of teamRed) {
        compositions[0].push(
            new PlayerComposition(player, authArray[player.id][0], [0], [])
        );
    }
    for (let player of teamBlue) {
        compositions[1].push(
            new PlayerComposition(player, authArray[player.id][0], [0], [])
        );
    }
    return compositions;
}

function handleLineupChangeTeamChange(changedPlayer) {
    if (gameState != State.STOP) {
        var playerLineup;
        if (changedPlayer.team == Team.RED) {
            // player gets in red team
            var redLineupAuth = game.playerComp[0].map((p) => p.auth);
            var ind = redLineupAuth.findIndex((auth) => auth == authArray[changedPlayer.id][0]);
            if (ind != -1) {
                // Player goes back in
                playerLineup = game.playerComp[0][ind];
                if (playerLineup.timeExit.includes(game.scores.time)) {
                    // gets subbed off then in at the exact same time -> no sub
                    playerLineup.timeExit = playerLineup.timeExit.filter((t) => t != game.scores.time);
                } else {
                    playerLineup.timeEntry.push(game.scores.time);
                }
            } else {
                playerLineup = new PlayerComposition(
                    changedPlayer,
                    authArray[changedPlayer.id][0],
                    [game.scores.time],
                    []
                );
                game.playerComp[0].push(playerLineup);
            }
        } else if (changedPlayer.team == Team.BLUE) {
            // player gets in blue team
            var blueLineupAuth = game.playerComp[1].map((p) => p.auth);
            var ind = blueLineupAuth.findIndex((auth) => auth == authArray[changedPlayer.id][0]);
            if (ind != -1) {
                // Player goes back in
                playerLineup = game.playerComp[1][ind];
                if (playerLineup.timeExit.includes(game.scores.time)) {
                    // gets subbed off then in at the exact same time -> no sub
                    playerLineup.timeExit = playerLineup.timeExit.filter((t) => t != game.scores.time);
                } else {
                    playerLineup.timeEntry.push(game.scores.time);
                }
            } else {
                playerLineup = new PlayerComposition(
                    changedPlayer,
                    authArray[changedPlayer.id][0],
                    [game.scores.time],
                    []
                );
                game.playerComp[1].push(playerLineup);
            }
        }
        if (teamRed.some((r) => r.id == changedPlayer.id)) {
            // player leaves red team
            var redLineupAuth = game.playerComp[0].map((p) => p.auth);
            var ind = redLineupAuth.findIndex((auth) => auth == authArray[changedPlayer.id][0]);
            playerLineup = game.playerComp[0][ind];
            if (playerLineup.timeEntry.includes(game.scores.time)) {
                // gets subbed off then in at the exact same time -> no sub
                if (game.scores.time == 0) {
                    game.playerComp[0].splice(ind, 1);
                } else {
                    playerLineup.timeEntry = playerLineup.timeEntry.filter((t) => t != game.scores.time);
                }
            } else {
                playerLineup.timeExit.push(game.scores.time);
            }
        } else if (teamBlue.some((r) => r.id == changedPlayer.id)) {
            // player leaves blue team
            var blueLineupAuth = game.playerComp[1].map((p) => p.auth);
            var ind = blueLineupAuth.findIndex((auth) => auth == authArray[changedPlayer.id][0]);
            playerLineup = game.playerComp[1][ind];
            if (playerLineup.timeEntry.includes(game.scores.time)) {
                // gets subbed off then in at the exact same time -> no sub
                if (game.scores.time == 0) {
                    game.playerComp[1].splice(ind, 1);
                } else {
                    playerLineup.timeEntry = playerLineup.timeEntry.filter((t) => t != game.scores.time);
                }
            } else {
                playerLineup.timeExit.push(game.scores.time);
            }
        }
    }
}

function handleLineupChangeLeave(player) {
    if (playSituation != Situation.STOP) {
        if (player.team == Team.RED) {
            // player gets in red team
            var redLineupAuth = game.playerComp[0].map((p) => p.auth);
            var ind = redLineupAuth.findIndex((auth) => auth == authArray[player.id][0]);
            var playerLineup = game.playerComp[0][ind];
            if (playerLineup.timeEntry.includes(game.scores.time)) {
                // gets subbed off then in at the exact same time -> no sub
                if (game.scores.time == 0) {
                    game.playerComp[0].splice(ind, 1);
                } else {
                    playerLineup.timeEntry = playerLineup.timeEntry.filter((t) => t != game.scores.time);
                }
            } else {
                playerLineup.timeExit.push(game.scores.time);
            }
        } else if (player.team == Team.BLUE) {
            // player gets in blue team
            var blueLineupAuth = game.playerComp[1].map((p) => p.auth);
            var ind = blueLineupAuth.findIndex((auth) => auth == authArray[player.id][0]);
            var playerLineup = game.playerComp[1][ind];
            if (playerLineup.timeEntry.includes(game.scores.time)) {
                // gets subbed off then in at the exact same time -> no sub
                if (game.scores.time == 0) {
                    game.playerComp[1].splice(ind, 1);
                } else {
                    playerLineup.timeEntry = playerLineup.timeEntry.filter((t) => t != game.scores.time);
                }
            } else {
                playerLineup.timeExit.push(game.scores.time);
            }
        }
    }
}

/* STATS FUNCTIONS */

/* GK FUNCTIONS */

function handleGKTeam(team) {
    if (team == Team.SPECTATORS) {
        return null;
    }
    let teamArray = team == Team.RED ? teamRed : teamBlue;
    let playerGK = teamArray.reduce((prev, current) => {
        if (team == Team.RED) {
            return (prev?.position.x < current.position.x) ? prev : current
        } else {
            return (prev?.position.x > current.position.x) ? prev : current
        }
    }, null);
    let playerCompGK = getPlayerComp(playerGK);
    return playerCompGK;
}

function handleGK() {
    let redGK = handleGKTeam(Team.RED);
    if (redGK != null) {
        redGK.GKTicks++;
    }
    let blueGK = handleGKTeam(Team.BLUE);
    if (blueGK != null) {
        blueGK.GKTicks++;
    }
}

function getGK(team) {
    if (team == Team.SPECTATORS) {
        return null;
    }
    let teamArray = team == Team.RED ? game.playerComp[0] : game.playerComp[1];
    let playerGK = teamArray.reduce((prev, current) => {
        return (prev?.GKTicks > current.GKTicks) ? prev : current
    }, null);
    return playerGK;
}

function getCS(scores) {
    let playersNameCS = [];
    let redGK = getGK(Team.RED);
    let blueGK = getGK(Team.BLUE);
    if (redGK != null && scores.blue == 0) {
        playersNameCS.push(redGK.player.name);
    }
    if (blueGK != null && scores.red == 0) {
        playersNameCS.push(blueGK.player.name);
    }
    return playersNameCS;
}

function getCSString(scores) {
    let playersCS = getCS(scores);
    if (playersCS.length == 0) {
        return "🥅 No hay CS";
    } else if (playersCS.length == 1) {
        return `🥅 ${playersCS[0]} consiguio una CS.`;
    } else {
        return `🥅 ${playersCS[0]} y ${playersCS[1]} tienen una CS.`;
    }
}

/* GLOBAL STATS FUNCTIONS */

function getLastTouchOfTheBall() {
    const ballPosition = room.getBallPosition();
    updateTeams();
    let playerArray = [];
    for (let player of players) {
        if (player.position != null) {
            var distanceToBall = pointDistance(player.position, ballPosition);
            if (distanceToBall < triggerDistance) {
                if (playSituation == Situation.KICKOFF) playSituation = Situation.PLAY;
                playerArray.push([player, distanceToBall]);
            }
        }
    }
    if (playerArray.length != 0) {
        let playerTouch = playerArray.sort((a, b) => a[1] - b[1])[0][0];
        if (lastTeamTouched == playerTouch.team || lastTeamTouched == Team.SPECTATORS) {
            if (lastTouches[0] == null || (lastTouches[0] != null && lastTouches[0].player.id != playerTouch.id)) {
                game.touchArray.push(
                    new BallTouch(
                        playerTouch,
                        game.scores.time,
                        getGoalGame(),
                        ballPosition
                    )
                );
                lastTouches[0] = checkGoalKickTouch(
                    game.touchArray,
                    game.touchArray.length - 1,
                    getGoalGame()
                );
                lastTouches[1] = checkGoalKickTouch(
                    game.touchArray,
                    game.touchArray.length - 2,
                    getGoalGame()
                );
            }
        }
        lastTeamTouched = playerTouch.team;
    }
}

function getBallSpeed() {
    var ballProp = room.getDiscProperties(0);
    return Math.sqrt(ballProp.xspeed ** 2 + ballProp.yspeed ** 2) * speedCoefficient;
}

function getGameStats() {
    if (playSituation == Situation.PLAY && gameState == State.PLAY) {
        lastTeamTouched == Team.RED ? possession[0]++ : possession[1]++;
        var ballPosition = room.getBallPosition();
        ballPosition.x < 0 ? actionZoneHalf[0]++ : actionZoneHalf[1]++;
    }
}

/* GOAL ATTRIBUTION FUNCTIONS */

function getGoalAttribution(team) {
    var goalAttribution = Array(2).fill(null);
    if (lastTouches[0] != null) {
        if (lastTouches[0].player.team == team) {
            // Direct goal scored by player
            if (lastTouches[1] != null && lastTouches[1].player.team == team) {
                goalAttribution = [lastTouches[0].player, lastTouches[1].player];
            } else {
                goalAttribution = [lastTouches[0].player, null];
            }
        } else {
            // Own goal
            goalAttribution = [lastTouches[0].player, null];
        }
    }
    return goalAttribution;
}

function getGoalString(team) {
    var goalString;
    var scores = game.scores;
    var goalAttribution = getGoalAttribution(team);
    if (goalAttribution[0] != null) {
        if (goalAttribution[0].team == team) {
            if (goalAttribution[1] != null && goalAttribution[1].team == team) {
                goalString = `⚽ ${getTimeGame(scores.time)} Goal by ${goalAttribution[0].name} ! Assist by ${goalAttribution[1].name}. Goal speed : ${ballSpeed.toFixed(2)}km/h.`;
                game.goals.push(
                    new Goal(
                        scores.time,
                        team,
                        goalAttribution[0],
                        goalAttribution[1]
                    )
                );
            } else {
                goalString = `⚽ ${getTimeGame(scores.time)} Goal by ${goalAttribution[0].name} ! Goal speed : ${ballSpeed.toFixed(2)}km/h.`;
                game.goals.push(
                    new Goal(scores.time, team, goalAttribution[0], null)
                );
            }
        } else {
            goalString = `😂 ${getTimeGame(scores.time)} Own goal by ${goalAttribution[0].name} ! Goal speed : ${ballSpeed.toFixed(2)}km/h.`;
            game.goals.push(
                new Goal(scores.time, team, goalAttribution[0], null)
            );
        }
    } else {
        goalString = `⚽ ${getTimeGame(scores.time)} Goal for ${team == Team.RED ? 'red' : 'blue'} team ! Goal speed : ${ballSpeed.toFixed(2)}km/h.`;
        game.goals.push(
            new Goal(scores.time, team, null, null)
        );
    }

    return goalString;
}

/* GET STATS FUNCTIONS */

function actionReportCountTeam(goals, team) {
    let playerActionSummaryTeam = [];
    let indexTeam = team == Team.RED ? 0 : 1;
    let indexOtherTeam = team == Team.RED ? 1 : 0;
    for (let goal of goals[indexTeam]) {
        if (goal[0] != null) {
            if (playerActionSummaryTeam.find(a => a[0].id == goal[0].id)) {
                let index = playerActionSummaryTeam.findIndex(a => a[0].id == goal[0].id);
                playerActionSummaryTeam[index][1]++;
            } else {
                playerActionSummaryTeam.push([goal[0], 1, 0, 0]);
            }
            if (goal[1] != null) {
                if (playerActionSummaryTeam.find(a => a[0].id == goal[1].id)) {
                    let index = playerActionSummaryTeam.findIndex(a => a[0].id == goal[1].id);
                    playerActionSummaryTeam[index][2]++;
                } else {
                    playerActionSummaryTeam.push([goal[1], 0, 1, 0]);
                }
            }
        }
    }
    if (goals[indexOtherTeam].length == 0) {
        let playerCS = getGK(team)?.player;
        if (playerCS != null) {
            if (playerActionSummaryTeam.find(a => a[0].id == playerCS.id)) {
                let index = playerActionSummaryTeam.findIndex(a => a[0].id == playerCS.id);
                playerActionSummaryTeam[index][3]++;
            } else {
                playerActionSummaryTeam.push([playerCS, 0, 0, 1]);
            }
        }
    }

    playerActionSummaryTeam.sort((a, b) => (a[1] + a[2] + a[3]) - (b[1] + b[2] + b[3]));
    return playerActionSummaryTeam;
}

/* FETCH FUNCTIONS */

function fetchGametimeReport(game) {
    var fieldGametimeRed = {
        name: '🔴        **RED TEAM STATS**',
        value: '⌛ __**Game Time:**__\n\n',
        inline: true,
    };
    var fieldGametimeBlue = {
        name: '🔵       **BLUE TEAM STATS**',
        value: '⌛ __**Game Time:**__\n\n',
        inline: true,
    };
    var redTeamTimes = game.playerComp[0].map((p) => [p.player, 0]);
    for (let i = 0; i < game.playerComp[0].length; i++) {
        var player = game.playerComp[0][i];
        for (let j = 0; j < player.timeEntry.length; j++) {
            if (player.timeExit.length < j + 1) {
                redTeamTimes[i][1] += game.scores.time - player.timeEntry[j];
            } else {
                redTeamTimes[i][1] += player.timeExit[j] - player.timeEntry[j];
            }
        }
    }
    var blueTeamTimes = game.playerComp[1].map((p) => [p.player, 0]);
    for (let i = 0; i < game.playerComp[1].length; i++) {
        var player = game.playerComp[1][i];
        for (let j = 0; j < player.timeEntry.length; j++) {
            if (player.timeExit.length < j + 1) {
                blueTeamTimes[i][1] += game.scores.time - player.timeEntry[j];
            } else {
                blueTeamTimes[i][1] += player.timeExit[j] - player.timeEntry[j];
            }
        }
    }

    for (let time of redTeamTimes) {
        var minutes = getMinutesReport(time[1]);
        var seconds = getSecondsReport(time[1]);
        fieldGametimeRed.value += `> **${time[0].name}:** ${minutes > 0 ? `${minutes}m` : ''}` +
            `${seconds > 0 || minutes == 0 ? `${seconds}s` : ''}\n`;
    }
    fieldGametimeRed.value += `\n${blueTeamTimes.length - redTeamTimes.length > 0 ? '\n'.repeat(blueTeamTimes.length - redTeamTimes.length) : ''
        }`;
    fieldGametimeRed.value += '=====================';

    for (let time of blueTeamTimes) {
        var minutes = getMinutesReport(time[1]);
        var seconds = getSecondsReport(time[1]);
        fieldGametimeBlue.value += `> **${time[0].name}:** ${minutes > 0 ? `${minutes}m` : ''}` +
            `${seconds > 0 || minutes == 0 ? `${seconds}s` : ''}\n`;
    }
    fieldGametimeBlue.value += `\n${redTeamTimes.length - blueTeamTimes.length > 0 ? '\n'.repeat(redTeamTimes.length - blueTeamTimes.length) : ''
        }`;
    fieldGametimeBlue.value += '=====================';

    return [fieldGametimeRed, fieldGametimeBlue];
}

function fetchActionsSummaryReport(game) {
    var fieldReportRed = {
        name: '🔴        **RED TEAM STATS**',
        value: '📊 __**Player Stats:**__\n\n',
        inline: true,
    };
    var fieldReportBlue = {
        name: '🔵       **BLUE TEAM STATS**',
        value: '📊 __**Player Stats:**__\n\n',
        inline: true,
    };
    var goals = [[], []];
    for (let goal of game.goals) {
        goals[goal.team - 1].push([goal.striker, goal.assist]);
    }
    var redActions = actionReportCountTeam(goals, Team.RED);
    if (redActions.length > 0) {
        for (let act of redActions) {
            fieldReportRed.value += `> **${act[0].team != Team.RED ? '[OG] ' : ''}${act[0].name}:**` +
                `${act[1] > 0 ? ` ${act[1]}G` : ''}` +
                `${act[2] > 0 ? ` ${act[2]}A` : ''}` +
                `${act[3] > 0 ? ` ${act[3]}CS` : ''}\n`;
        }
    }
    var blueActions = actionReportCountTeam(goals, Team.BLUE);
    if (blueActions.length > 0) {
        for (let act of blueActions) {
            fieldReportBlue.value += `> **${act[0].team != Team.BLUE ? '[OG] ' : ''}${act[0].name}:**` +
                `${act[1] > 0 ? ` ${act[1]}G` : ''}` +
                `${act[2] > 0 ? ` ${act[2]}A` : ''}` +
                `${act[3] > 0 ? ` ${act[3]}CS` : ''}\n`;
        }
    }

    fieldReportRed.value += `\n${blueActions.length - redActions.length > 0 ? '\n'.repeat(blueActions.length - redActions.length) : ''
        }`;
    fieldReportRed.value += '=====================';

    fieldReportBlue.value += `\n${redActions.length - blueActions.length > 0 ? '\n'.repeat(redActions.length - blueActions.length) : ''
        }`;
    fieldReportBlue.value += '=====================';

    return [fieldReportRed, fieldReportBlue];
}

function fetchSummaryEmbed(game) {
    var fetchEndgame = [fetchGametimeReport, fetchActionsSummaryReport];
    var logChannel = recWebhook;
    var fields = [
        {
            name: '🔴        **RED TEAM STATS**',
            value: '=====================\n\n',
            inline: true,
        },
        {
            name: '🔵       **BLUE TEAM STATS**',
            value: '=====================\n\n',
            inline: true,
        },
    ];
    for (let i = 0; i < fetchEndgame.length; i++) {
        var fieldsReport = fetchEndgame[i](game);
        fields[0].value += fieldsReport[0].value + '\n\n';
        fields[1].value += fieldsReport[1].value + '\n\n';
    }
    fields[0].value = fields[0].value.substring(0, fields[0].value.length - 2);
    fields[1].value = fields[1].value.substring(0, fields[1].value.length - 2);

    var possR = possession[0] / (possession[0] + possession[1]);
    var possB = 1 - possR;
    var possRString = (possR * 100).toFixed(0).toString();
    var possBString = (possB * 100).toFixed(0).toString();
    var zoneR = actionZoneHalf[0] / (actionZoneHalf[0] + actionZoneHalf[1]);
    var zoneB = 1 - zoneR;
    var zoneRString = (zoneR * 100).toFixed(0).toString();
    var zoneBString = (zoneB * 100).toFixed(0).toString();
    var win = (game.scores.red > game.scores.blue) * 1 + (game.scores.blue > game.scores.red) * 2;
    var objectBodyWebhook = {
        embeds: [
            {
                title: `📝 Informe del Partido #${getIdReport()}\n\n ${roomName}`,
                description:
                    `**${getTimeEmbed(game.scores.time)}** ` +
                    (win == 1 ? '**Red Team** ' : 'Red Team ') + game.scores.red +
                    ' - ' +
                    game.scores.blue + (win == 2 ? ' **Blue Team**' : ' Blue Team') +
                    '\n```c\nPosesion: ' + possRString + '% - ' + possBString + '%' +
                    '\nZona de Juego: ' + zoneRString + '% - ' + zoneBString + '%\n```\n\n',
                color: 9567999,
                fields: fields,
                footer: {
                    text: `Grabacion: ${getRecordingName(game)}`,
                },
                timestamp: new Date().toISOString(),
            },
        ],
        username: roomName
    };
    if (logChannel != '') {
        fetch(logChannel, {
            method: 'POST',
            body: JSON.stringify(objectBodyWebhook),
            headers: {
                'Content-Type': 'application/json',
            },
        }).then((res) => res);
    }
}

function isBlacklisted(player){
    return blacklist.filter(b => b.Auth == player.auth || b.Conn == player.conn).length > 0;
}

var commands2 = {

	"!camisetas": camisetasARSA,
	"!primeradiv": primeraDiv,
	"!segundadiv": segundaDiv,
	"!terceradiv": terceraDiv,
	"!PHT": pocoyoHaxballTeam,
	"pht/titular/red": phtTitularR,
	"pht/titular/blue": phtTitularB,
	"pht/alternativa/red": phtAlternativaR,
	"pht/alternativa/blue": phtAlternativaB,
	"!ST": starsTeam,
	"st/titular/red": stTitularR,
	"st/titular/blue": stTitularB,
	"st/alternativa/red": stAlternativaR,
	"st/alternativa/blue": stAlternativaB,
	"!SUT": swagUnitedTeam,
	"sut/titular/red": sutTitularR,
	"sut/titular/blue": sutTitularB,
	"sut/alternativa/red": sutAlternativaR,
	"sut/alternativa/blue": sutAlternativaB,
	"!MUT": manchesterUnitedTeam,
	"mut/titular/red": mutTitularR,
	"mut/titular/blue": mutTitularB,
	"mut/alternativa/red": mutAlternativaR,
	"mut/alternativa/blue": mutAlternativaB,
	"!AAC": almuniAtleticClub,
	"aac/titular/red": aacTitularR,
	"aac/titular/blue": aacTitularB,
	"aac/alternativa/red": aacAlternativaR,
	"aac/alternativa/blue": aacAlternativaB,
	"!VFC": villarealFutbolClub,
	"vfc/titular/red": vfcTitularR,
	"vfc/titular/blue": vfcTitularB,
	"!RM": realMadrid,
	"rm/titular/red": rmTitularR,
	"rm/titular/blue": rmTitularB,
	"rm/alternativa/red": rmAlternativaR,
	"rm/alternativa/blue": rmAlternativaB,
	"!UCB": unionClaypoleB,
	"ucb/titular/red": ucbTitularR,
	"ucb/titular/blue": ucbTitularB,
	"ucb/alternativa/red": ucbAlternativaR,
	"ucb/alternativa/blue": ucbAlternativaB,
	"!PX": primatesX,
	"px/titular/red": pxTitularR,
	"px/titular/blue": pxTitularB,
	"!BF": burkinaFaso,
	"bf/titular/red": bfTitularR,
	"bf/titular/blue": bfTitularB,
	"bf/alternativa/red": bfAlternativaR,
	"bf/alternativa/blue": bfAlternativaB,
	"!NYC": newYorkCity,
	"nyc/titular/red": nycTitularR,
	"nyc/titular/blue": nycTitularB,
	"nyc/alternativa/red": nycAlternativaR,
	"nyc/alternativa/blue": nycAlternativaB,
	"!ALR": alberdiHC,
	"alr/titular/red": alrTitularR,
	"alr/titular/blue": alrTitularB,
	"alr/alternativa/red": alrAlternativaR,
	"alr/alternativa/blue": alrAlternativaB,
	"!ATM": atleticoMadrid,
	"atm/titular/red": atmTitularR,
	"atm/titular/blue": atmTitularB,
	"atm/alternativa/red": atmAlternativaR,
	"atm/alternativa/blue": atmAlternativaB,
	"atm/tercera/red": atmTerceraR,
	"atm/tercera/blue": atmTerceraB,
	"!DMA": deportivoMacAlister,
	"dma/titular/red": dmaTitularR,
	"dma/titular/blue": dmaTitularB,
	"dma/alternativa/red": dmaAlternativaR,
	"dma/alternativa/blue": dmaAlternativaB,
	"!SDH": sorpresasDelHaxball,
	"sdh/titular/red": sdhTitularR,
	"sdh/titular/blue": sdhTitularB,
	"sdh/alternativa/red": sdhAlternativaR,
	"sdh/alternativa/blue": sdhAlternativaB,
	"!SM": sinMiedo,
	"sm/titular/red": smTitularR,
	"sm/titular/blue": smTitularB,
	"sm/alternativa/red": smAlternativaR,
	"sm/alternativa/blue": smAlternativaB,
	"!CDH": colchoneroDelHaxball,
	"cdh/titular/red": cdhTitularR,
	"cdh/titular/blue": cdhTitularB,
	"cdh/alternativa/red": cdhAlternativaR,
	"cdh/alternativa/blue": cdhAlternativaB,
	"cdh/tercera/red": cdhTerceraR,
	"cdh/tercera/blue": cdhTerceraB,
	"!RDLP": rioDeLaPlata,
	"rdlp/titular/red": rdlpTitularR,
	"rdlp/titular/blue": rdlpTitularB,
	"rdlp/alternativa/red": rdlpAlternativaR,
	"rdlp/alternativa/blue": rdlpAlternativaB,
	"!SR": swagReserva,
	"sr/titular/red": srTitularR,
	"sr/titular/blue": srTitularB,
	"sr/alternativa/red": srAlternativaR,
	"sr/alternativa/blue": srAlternativaB,
	"!NYCB": newYorkCityB,
	"nycb/titular/red": nycbTitularR,
	"nycb/titular/blue": nycbTitularB,
	"nycb/alternativa/red": nycbAlternativaR,
	"nycb/alternativa/blue": nycbAlternativaB,
	"!SAR": sarmiento,
	"sar/titular/red": sarTitularR,
	"sar/titular/blue": sarTitularB,
	"sar/alternativa/red": sarAlternativaR,
	"sar/alternativa/blue": sarAlternativaB,
	"sar/tercera/red": sarTerceraR,
	"sar/tercera/blue": sarTerceraB,
	"!UC3": unionClaypole3,
	"uc3/titular/red": uc3TitularR,
	"uc3/titular/blue": uc3TitularB,
	"!JRS": joyitasRealSoccer,
	"jrs/titular/red": jrsTitularR,
	"jrs/titular/blue": jrsTitularB,
	"jrs/alternativa/red": jrsAlternativaR,
	"jrs/alternativa/blue": jrsAlternativaB,
	"!CU": centralUnited,
	"cu/titular/red": cuTitularR,
	"cu/titular/blue": cuTitularB,
	"cu/alternativa/red": cuAlternativaR,
	"cu/alternativa/blue": cuAlternativaB,
	"!CHT": chelseaHaxballTeam,
	"cht/titular/red": chtTitularR,
	"cht/titular/blue": chtTitularB,
	"cht/alternativa/red": chtAlternativaR,
	"cht/alternativa/blue": chtAlternativaB,

}	

function camisetasARSA(player) { // !camisetas
    room.sendAnnouncement("ARSA - 2022 🌍: !primeradiv ✦, !segundadiv ✦, !terceradiv ✦", player.id, 0xea9999, "bold", 0);
}

function primeraDiv(player) { // !primeradiv
    room.sendAnnouncement("🅰 1ra DIVISIÓN: | !PHT | !ST | !SUT | !MUT | !AAC | !VFC | !RM | !UCB | !PX", player.id, 0xADF4FF, "bold", 0); 
}

function segundaDiv(player) { // !segundadiv
    room.sendAnnouncement("🅱 2da DIVISIÓN: | !BF | !NYC | !ALR | !ATM | !CHT | !DMA | !SDH | !SM | !CHT", player.id, 0xADF4FF, "bold", 0); 
}

function terceraDiv(player) { // !segundadiv
    room.sendAnnouncement("🆑 3ra DIVISIÓN: | !CDH | !RDLP | !SR | !NYCB | !SAR | !UC3 | !JRS | !CU", player.id, 0xADF4FF, "bold", 0); 
}

function pocoyoHaxballTeam(player) { // !PHT
    room.sendAnnouncement('Pocoyo Haxball Team - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('pht/titular/red | pht/titular/blue | pht/alternativa/red | pht/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function phtTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x000000, [0x36ddff, 0x07c1f0, 0x2793ff]);
    }
}

function phtTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x000000, [0x36ddff, 0x07c1f0, 0x2793ff]);
    }
}

function phtAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x3dc5ff, [0x292929, 0x292929]);
    }
}

function phtAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x3dc5ff, [0x292929, 0x292929]);
    }
}

function starsTeam(player) { // !PHT
    room.sendAnnouncement('Stars Team - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('st/titular/red | st/titular/blue | st/alternativa/red | st/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function stTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x002e52, [0xffffff, 0xffffff, 0x006cbf]);
    }
}

function stTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x002e52, [0xffffff, 0xffffff, 0x006cbf]);
    }
}

function stAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0xffffff, [0x002e52, 0x002e52, 0x0061ad]);
    }
}

function stAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xffffff, [0x002e52, 0x002e52, 0x0061ad]);
    }
}

function swagUnitedTeam(player) { // !PHT
    room.sendAnnouncement('Swag United Team - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('sut/titular/red | sut/titular/blue | sut/alternativa/red | sut/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function sutTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 65, 0x09a9e3, [0xf5f5f5, 0xebebeb, 0xe3e3e3]);
    }
}

function sutTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 65, 0x09a9e3, [0xf5f5f5, 0xebebeb, 0xe3e3e3]);
    }
}

function sutAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 65, 0xffffff, [0x0093bf, 0x0083ab, 0x007aa1]);
    }
}

function sutAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 65, 0xffffff, [0x0093bf, 0x0083ab, 0x007aa1]);
    }
}

function manchesterUnitedTeam(player) { // !PHT
    room.sendAnnouncement('Manchester United Team - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('mut/titular/red | mut/titular/blue | mut/alternativa/red | mut/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function mutTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0xf5e6e1, [0xda291c]);
    }
}

function mutTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xf5e6e1, [0xda291c]);
    }
}

function mutAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0xf5e6e1, [0x003090, 0x003090, 0x1d2975]);
    }
}

function mutAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xf5e6e1, [0x003090, 0x003090, 0x1d2975]);
    }
}

function almuniAtleticClub(player) { // !PHT
    room.sendAnnouncement('Alumni Atletic Club - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('aac/titular/red | aac/titular/blue | aac/alternativa/red | aac/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function aacTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 0, 0x000000, [0xff0d0d, 0xdbf2ff, 0xff0000]);
    }
}

function aacTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 0, 0x000000, [0xff0d0d, 0xdbf2ff, 0xff0000]);
    }
}

function aacAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0xfafffc, [0x42423f, 0x2e2e2e, 0x000000]);
    }
}

function aacAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xfafffc, [0x42423f, 0x2e2e2e, 0x000000]);
    }
}

function villarealFutbolClub(player) { // !PHT
    room.sendAnnouncement('Villareal Fútbol Club - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('vfc/titular/red | vfc/titular/blue', player.id, 0x6BFFB5, "normal", 0);
}

function vfcTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x000000, [0xffff19]);
    }
}

function vfcTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x000000, [0xffff19]);
    }
}

function realMadrid(player) { // !PHT
    room.sendAnnouncement('Real Madrid - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('rm/titular/red | rm/titular/blue | rm/alternativa/red | rm/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function rmTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x1f9fa3, [0xffffff, 0xf0f0f0, 0xebebeb]);
    }
}

function rmTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x1f9fa3, [0xffffff, 0xf0f0f0, 0xebebeb]);
    }
}

function rmAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x000000, [0x38ebff, 0xe9eaf0, 0x38ebff]);
    }
}

function rmAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x000000, [0x38ebff, 0xe9eaf0, 0x38ebff]);
    }
}

function unionClaypoleB(player) { // !PHT
    room.sendAnnouncement('Unión Claypole B - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('ucb/titular/red | ucb/titular/blue | ucb/alternativa/red | ucb/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function ucbTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 120, 0x000000, [0x2793ff, 0x2793ff, 0xffffff]);
    }
}

function ucbTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 120, 0x000000, [0x2793ff, 0x2793ff, 0xffffff]);
    }
}

function ucbAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 120, 0x2793ff, [0x000000, 0x0d0d0d, 0x000000]);
    }
}

function ucbAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 120, 0x2793ff, [0x000000, 0x0d0d0d, 0x000000]);
    }
}

function primatesX(player) { // !PHT
    room.sendAnnouncement('PrimateX - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('px/titular/red | px/titular/blue', player.id, 0x6BFFB5, "normal", 0);
}

function pxTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0xe60000, [0x191919, 0x191919, 0x212121]);
    }
}

function pxTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xe60000, [0x191919, 0x191919, 0x212121]);
    }
}

function burkinaFaso(player) { // !PHT
    room.sendAnnouncement('Burkina Faso - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('bf/titular/red | bf/titular/blue | bf/alternativa/red | bf/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function bfTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 0, 0xfcd116, [0x009e49, 0xef2b2d]);
    }
}

function bfTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 0, 0xfcd116, [0x009e49, 0xef2b2d]);
    }
}

function bfAlternativaR(player){
    if (player.admin == true){
      room.setTeamColors(1, 45, 0xdeba48, [0xffffff, 0xffffff, 0xef2b2d]);
    }
}

function bfAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 45, 0xdeba48, [0xffffff, 0xffffff, 0xef2b2d]);
    }
}

function newYorkCity(player) { // !PHT
    room.sendAnnouncement('New York City - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('nyc/titular/red | nyc/titular/blue | nyc/alternativa/red | nyc/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function nycTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x002033, [0x002033, 0x002033, 0x002033]);
    }
}

function nycTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x002033, [0x002033, 0x002033, 0x002033]);
    }
}

function nycAlternativaR(player){
    if (player.admin == true){
      room.setTeamColors(1, 60, 0x87a7ff, [0xffffff, 0xe6e6e6, 0xffffff]);
    }
}

function nycAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x87a7ff, [0xffffff, 0xe6e6e6, 0xffffff]);
    }
}

function alberdiHC(player) { // !PHT
    room.sendAnnouncement('Alberdi Haxball Club - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('alr/titular/red | alr/titular/blue | alr/alternativa/red | alr/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function alrTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 220, 0x1c1878, [0xaacede, 0xc7e7f2, 0xf4f2f2]);
    }
}

function alrTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 220, 0x1c1878, [0xaacede, 0xc7e7f2, 0xf4f2f2]);
    }
}

function alrAlternativaR(player){
    if (player.admin == true){
      room.setTeamColors(1, 129, 0xffffff, [0x1c1878, 0x231e96, 0x2722a8]);
    }
}

function alrAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 129, 0xffffff, [0x1c1878, 0x231e96, 0x2722a8]);
    }
}

function atleticoMadrid(player) { // !PHT
    room.sendAnnouncement('Atletico de Madrid - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('atm/titular/red | atm/titular/blue | atm/alternativa/red | atm/alternativa/blue | atm/tercera/red | atm/tercera/blue', player.id, 0x6BFFB5, "normal", 0);
}

function atmTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x331b1b, [0xff1f35, 0xd61c22]);
    }
}

function atmTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x331b1b, [0xff1f35, 0xd61c22]);
    }
}

function atmAlternativaR(player){
    if (player.admin == true){
      room.setTeamColors(1, 43, 0xff1f3d, [0x091070, 0x091070, 0x030f6e]);
    }
}

function atmAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 43, 0xff1f3d, [0x091070, 0x091070, 0x030f6e]);
    }
}

function atmTerceraR(player){
    if (player.admin == true){
      room.setTeamColors(1, 43, 0xfa2338, [0x3d3d3b]);
    }
}

function atmTerceraB(player){
    if (player.admin == true){
        room.setTeamColors(2, 43, 0xfa2338, [0x3d3d3b]);
    }
}

function deportivoMacAlister(player) { // !PHT
    room.sendAnnouncement('Deportivo Mac Allister - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('dma/titular/red | dma/titular/blue | dma/alternativa/red | dma/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function dmaTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0xff91d3, [0x000000]);
    }
}

function dmaTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xff91d3, [0x000000]);
    }
}

function dmaAlternativaR(player){
    if (player.admin == true){
      room.setTeamColors(2, 60, 0xff91d3, [0xffffff]);
    }
}

function dmaAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xff91d3, [0xffffff]);
    }
}

function sorpresasDelHaxball(player) { // !PHT
    room.sendAnnouncement('Sorprsas Del Haxball - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('sdh/titular/red | sdh/titular/blue | sdh/alternativa/red | sdh/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function sdhTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x000000, [0x000000]);
    }
}

function sdhTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x000000, [0x000000]);
    }
}

function sdhAlternativaR(player){
    if (player.admin == true){
      room.setTeamColors(1, 60, 0xffffff, [0x040640, 0x040640, 0x080b7a]);
    }
}

function sdhAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xffffff, [0x040640, 0x040640, 0x080b7a]);
    }
}

function sinMiedo(player) { // !PHT
    room.sendAnnouncement('Sin Miedo - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('sm/titular/red | sm/titular/blue | sm/alternativa/red | sm/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function smTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0xf8faf5, [0xa30583]);
    }
}

function smTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xf8faf5, [0xa30583]);
    }
}

function smAlternativaR(player){
    if (player.admin == true){
      room.setTeamColors(1, 60, 0xab188d, [0xedf7f1]);
    }
}

function smAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xab188d, [0xedf7f1]);
    }
}

function colchoneroDelHaxball(player) { // !PHT
    room.sendAnnouncement('Colchonero del Haxball - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('cdh/titular/red | cdh/titular/blue | cdh/alternativa/red | cdh/alternativa/blue | cdh/tercera/red | cdh/tercera/blue', player.id, 0x6BFFB5, "normal", 0);
}

function cdhTitularR(player){
    if (player.admin == true){
    room.setTeamColors(1, 60, 0x331b1b, [0xff1f35, 0xd61c22]);
    }
}

function cdhTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x331b1b, [0xff1f35, 0xd61c22]);
    }
}

function cdhAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 43, 0xff1f3d, [0x091070, 0x091070, 0x030f6e]);
    }
}

function cdhAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 43, 0xff1f3d, [0x091070, 0x091070, 0x030f6e]);
    }
}

function cdhTerceraR(player){
    if (player.admin == true){
       room.setTeamColors(1, 43, 0xfa2338, [0x3d3d3b]);
    }
}

function cdhTerceraB(player){
    if (player.admin == true){
        room.setTeamColors(2, 43, 0xfa2338, [0x3d3d3b]);
    }
}

function rioDeLaPlata(player) { // !PHT
    room.sendAnnouncement('Rio de La Plata - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('rdlp/titular/red | rdlp/titular/blue | rdlp/alternativa/red | rdlp/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function rdlpTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 0, 0xffffff, [0x000000, 0xe688c3, 0x000000]);
    }
}

function rdlpTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 0, 0xffffff, [0x000000, 0xe688c3, 0x000000]);
    }
}

function rdlpAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 50, 0xbd7913, [0xffffff, 0xff7881, 0xd4d4d4]);
    }
}

function rdlpAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 50, 0xbd7913, [0xffffff, 0xff7881, 0xd4d4d4]);
    }
}

function swagReserva(player) { // !PHT
    room.sendAnnouncement('Swag Reserva - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('sr/titular/red | sr/titular/blue | sr/alternativa/red | sr/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function srTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 65, 0x09a9e3, [0xf5f5f5, 0xebebeb, 0xe3e3e3]);
    }
}

function srTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 65, 0x09a9e3, [0xf5f5f5, 0xebebeb, 0xe3e3e3]);
    }
}

function srAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 65, 0xffffff, [0x0093bf, 0x0083ab, 0x007aa1]);
    }
}

function srAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 65, 0xffffff, [0x0093bf, 0x0083ab, 0x007aa1]);
    }
}

function newYorkCityB(player) { // !PHT
    room.sendAnnouncement('New York City B - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('nycb/titular/red | nycb/titular/blue | nycb/alternativa/red | nycb/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function nycbTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 64, 0xc9a253, [0x002142, 0x001b33, 0x001521]);
    }
}

function nycbTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 64, 0xc9a253, [0x002142, 0x001b33, 0x001521]);
    }
}

function nycbAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 55, 0x7e946f, [0xffebe6, 0xe3dac1, 0x5588a1]);
    }
}

function nycbAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 55, 0x7e946f, [0xffebe6, 0xe3dac1, 0x5588a1]);
    }
}

function sarmiento(player) { // !PHT
    room.sendAnnouncement('Sarmiento - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('sar/titular/red | sar/titular/blue | sar/alternativa/red | sar/alternativa/blue | sar/tercera/red | sar/tercera/blue', player.id, 0x6BFFB5, "normal", 0);
}

function sarTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x030800, [0x238200, 0x2b6b00, 0x176300]);
    }
}

function sarTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x030800, [0x238200, 0x2b6b00, 0x176300]);
    }
}

function sarAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x000000, [0x1c4000, 0xffffff, 0xffffff]);
    }
}

function sarAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x000000, [0x1c4000, 0xffffff, 0xffffff]);
    }
}

function sarTerceraR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0x44ff00, [0x1e0082, 0x16016b, 0x12005c]);
    }
}

function sarTerceraB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0x44ff00, [0x1e0082, 0x16016b, 0x12005c]);
    }
}


function unionClaypole3(player) { // !PHT
    room.sendAnnouncement('Unión Claypole 3 - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('uc3/titular/red | uc3/titular/blue', player.id, 0x6BFFB5, "normal", 0);
}

function uc3TitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 120, 0x000000, [0x2793ff, 0x2793ff, 0xffffff]);
    }
}

function uc3TitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 120, 0x000000, [0x2793ff, 0x2793ff, 0xffffff]);
    }
}

function joyitasRealSoccer(player) { // !PHT
    room.sendAnnouncement('Joyitas Real Soccer - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('jrs/titular/red | jrs/titular/blue | jrs/alternativa/red | jrs/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function jrsTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0xc2a30c, [0x0d0d0d, 0x000000, 0x121212]);
    }
}

function jrsTitularB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xc2a30c, [0x0d0d0d, 0x000000, 0x121212]);
    }
}

function jrsAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 60, 0xf7e11d, [0x8a8a8a, 0x8f8f8f, 0xa1a1a1]);
    }
}

function jrsAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 60, 0xf7e11d, [0x8a8a8a, 0x8f8f8f, 0xa1a1a1]);
    }
}

function centralUnited(player) { // !PHT
    room.sendAnnouncement('Central United - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('cu/titular/red | cu/titular/blue | cu/alternativa/red | cu/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function cuTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 63, 0x000000, [0xffee00, 0xffee00, 0x06a0d9]);
    }
}

function cuTitularB(player){
    if (player.admin == true){
    	room.setTeamColors(2, 63, 0x000000, [0xffee00, 0xffee00, 0x06a0d9]);

    }
}

function cuAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 63, 0x000f42, [0x06a0d9, 0xffee00]);
    }
}

function cuAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 63, 0x000f42, [0x06a0d9, 0xffee00]);
    }
}

function chelseaHaxballTeam(player) { // !PHT
    room.sendAnnouncement('Chelsea Haxball Team - 🇦🇷', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('Puedes elegir entre:', player.id, 0x6BFFB5, "normal", 0);
    room.sendAnnouncement('cht/titular/red | cht/titular/blue | cht/alternativa/red | cht/alternativa/blue', player.id, 0x6BFFB5, "normal", 0);
}

function chtTitularR(player){
    if (player.admin == true){
       room.setTeamColors(1, 0, 0xffcf0d, [0x0006a8, 0x0008cf, 0x0006a8]);
    }
}

function chtTitularB(player){
    if (player.admin == true){
    	room.setTeamColors(2, 0, 0xffcf0d, [0x0006a8, 0x0008cf, 0x0006a8]);

    }
}

function chtAlternativaR(player){
    if (player.admin == true){
       room.setTeamColors(1, 0, 0x000054, [0xa4aedb, 0xb0baeb, 0xa4aedb]);
    }
}

function chtAlternativaB(player){
    if (player.admin == true){
        room.setTeamColors(2, 0, 0x000054, [0xa4aedb, 0xb0baeb, 0xa4aedb]);
    }
}
