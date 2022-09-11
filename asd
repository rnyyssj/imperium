// ===============================|  REAL SOCCER ARGENTINA  |===============================
//		Version: 1.1.5
//		Build Date: 20-April-21
//		Author: Kuma @ hbanz
//		Website: hbanz.org/realsoccer
//		* Real Soccer Revolution (RSR)
//      Changelog:
//		1.0 Official Release
//		1.1 Private message players with @[player] [pm msg]
//		1.1.1 Bug Fix, Changed pm to @@
//		1.1.2 Bug Fix
//		1.1.3 Bug Fix
//		1.1.4 sideline calibration (thanks to jakso96)
//		1.1.5 Fixed gametime resetting to 10 mins after each game(will keep what it was last set to)
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
var allowPublicAdmin = true; // if true then !admin command is enabled
var masterPassword = 10000 + getRandomInt(90000);
var allowPublicAdmin = true; // if true then !admin command is enabled

/*-------------------------------- STADIUMS ---------------------------------*/

const realSoccerMap = `{"name":"ARSA Stadium - RSR","width":1300,"height":670,"spawnDistance":560,"bg":{"type":"grass","width":1150,"height":600,"kickOffRadius":180,"cornerRadius":0,"color":"`+mapBGColor+`"},
"playerPhysics":{"bCoef":0.4,"invMass":0.5,"damping":0.9605,"acceleration":0.12,"kickingAcceleration":0.07,"kickingDamping":0.96,"kickStrength":5.65},
"ballPhysics":{"radius":9,"bCoef":0.5,"invMass":1.05,"damping":0.99,"color":"FFFFFF","cMask":["all"],"cGroup":["ball"]},
"vertexes":[{"x":0,"y":675,"trait":"kickOffBarrier"},{"x":0,"y":180,"trait":"kickOffBarrier"},{"x":0,"y":-180,"trait":"kickOffBarrier"},{"x":0,"y":-675,"trait":"kickOffBarrier"},{"x":1150,"y":320,"trait":"line"},{"x":840,"y":320,"trait":"line"},{"x":1150,"y":-320,"trait":"line"},{"x":840,"y":-320,"trait":"line"},{"x":1150,"y":180,"trait":"line"},{"x":1030,"y":180,"trait":"line"},{"x":1150,"y":-180,"trait":"line"},{"x":1030,"y":-180,"trait":"line"},{"x":840,"y":-130,"trait":"line","curve":-130},{"x":840,"y":130,"trait":"line","curve":-130},{"x":-1150,"y":-320,"trait":"line"},{"x":-840,"y":-320,"trait":"line"},{"x":-1150,"y":320,"trait":"line"},{"x":-840,"y":320,"trait":"line"},{"x":-1150,"y":-175,"trait":"line"},{"x":-1030,"y":-175,"trait":"line"},{"x":-1150,"y":175,"trait":"line"},{"x":-1030,"y":175,"trait":"line"},{"x":-840,"y":130,"trait":"line","curve":-130},{"x":-840,"y":-130,"trait":"line","curve":-130},{"x":935,"y":3,"trait":"line"},{"x":935,"y":-3,"trait":"line"},{"x":-935,"y":3,"trait":"line"},{"x":-935,"y":-3,"trait":"line"},{"x":-1150,"y":570,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"x":-1120,"y":600,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"x":-1120,"y":-600,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"x":-1150,"y":-570,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"x":1120,"y":600,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"x":1150,"y":570,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"x":1150,"y":-570,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"x":1120,"y":-600,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"x":0,"y":180,"bCoef":0.1,"cMask":["red","blue"],"cGroup":["blueKO"],"trait":"kickOffBarrier","curve":-180},{"x":0,"y":-180,"bCoef":0.1,"cMask":["red","blue"],"cGroup":["redKO"],"trait":"kickOffBarrier","curve":180},{"x":0,"y":180,"bCoef":0.1,"cMask":["red","blue"],"cGroup":["redKO"],"trait":"kickOffBarrier","curve":180},{"x":-1030,"y":-40,"bCoef":-5.7,"cMask":["ball"],"cGroup":["c0"],"trait":"line","curve":70,"color":"576C46","vis":false},{"x":-1030,"y":40,"bCoef":-5.7,"cMask":["ball"],"cGroup":["c0"],"trait":"line","curve":70,"color":"576C46","vis":false},{"x":1030,"y":-40,"bCoef":-5.7,"cMask":["ball"],"cGroup":["c0"],"trait":"line","curve":-70,"color":"576C46","vis":false},{"x":1030,"y":40,"bCoef":-5.7,"cMask":["ball"],"cGroup":["c0"],"trait":"line","curve":-70,"color":"576C46","vis":false},{"x":1030,"y":-40,"trait":"line","color":"576C46"},{"x":1030,"y":40,"trait":"line","color":"576C46"},{"x":-1030,"y":-40,"trait":"line","color":"576C46"},{"x":-1030,"y":40,"trait":"line","color":"576C46"},{"x":0,"y":3,"trait":"line"},{"x":0,"y":-3,"trait":"line"},{"x":-1157,"y":605,"bCoef":0,"cMask":["ball"],"trait":"ballArea"},{"x":-1157,"y":655,"bCoef":0,"cMask":["ball"],"trait":"ballArea"},{"x":-1157,"y":-655,"bCoef":0,"cMask":["ball"],"trait":"ballArea"},{"x":-1157,"y":-605,"bCoef":0,"cMask":["ball"],"trait":"ballArea"},{"x":1157,"y":605,"bCoef":0,"cMask":["ball"],"trait":"ballArea"},{"x":1157,"y":655,"bCoef":0,"cMask":["ball"],"trait":"ballArea"},{"x":1157,"y":-655,"bCoef":0,"cMask":["ball"],"trait":"ballArea"},{"x":1157,"y":-605,"bCoef":0,"cMask":["ball"],"trait":"ballArea"},{"x":-1300,"y":-485,"bCoef":0,"cMask":["c1"],"cGroup":["red","blue"],"color":"ec644b","vis":false},{"x":1300,"y":-485,"bCoef":0,"cMask":["c1"],"cGroup":["red","blue"],"color":"ec644b","vis":false},{"x":-1300,"y":485,"bCoef":0,"cMask":["c1"],"cGroup":["red","blue"],"color":"ec644b","vis":false},{"x":1300,"y":485,"bCoef":0,"cMask":["c1"],"cGroup":["red","blue"],"color":"ec644b","vis":false},{"x":-1295,"y":-320,"cMask":["c0"],"cGroup":["red","blue"]},{"x":-840,"y":-320,"cMask":["c0"],"cGroup":["red","blue"]},{"x":-840,"y":320,"cMask":["c0"],"cGroup":["red","blue"]},{"x":-1295,"y":320,"cMask":["c0"],"cGroup":["red","blue"]},{"x":1295,"y":-320,"cMask":["c0"],"cGroup":["red","blue"]},{"x":840,"y":-320,"cMask":["c0"],"cGroup":["red","blue"]},{"x":840,"y":320,"cMask":["c0"],"cGroup":["red","blue"]},{"x":1295,"y":320,"cMask":["c0"],"cGroup":["red","blue"]},{"x":-1150,"y":-124,"bCoef":0,"cMask":["ball","red","blue"]},{"x":-1210,"y":-124,"bCoef":0,"cMask":["ball"],"bias":0,"curve":5},{"x":-1150,"y":124,"bCoef":0,"cMask":["ball","red","blue"]},{"x":-1210,"y":124,"bCoef":0,"cMask":["ball"],"bias":0,"curve":5},{"x":-1250,"y":-158,"bCoef":0,"cMask":["ball"]},{"x":-1250,"y":158,"bCoef":0,"cMask":["ball"]},{"x":1150,"y":124,"bCoef":0,"cMask":["ball","red","blue"]},{"x":1210,"y":124,"bCoef":0,"cMask":["ball"],"curve":-5},{"x":1150,"y":-124,"bCoef":0,"cMask":["ball","red","blue"]},{"x":1210,"y":-124,"bCoef":0,"cMask":["ball"],"curve":-5},{"x":1250,"y":-158,"bCoef":0,"cMask":["ball"]},{"x":1250,"y":158,"bCoef":0,"cMask":["ball"]}],
"segments":[{"v0":0,"v1":1,"trait":"kickOffBarrier"},{"v0":2,"v1":3,"trait":"kickOffBarrier"},{"v0":4,"v1":5,"trait":"line","y":320},{"v0":5,"v1":7,"trait":"line","x":840},{"v0":6,"v1":7,"trait":"line","y":-320},{"v0":8,"v1":9,"trait":"line","y":180},{"v0":9,"v1":11,"trait":"line","x":1030},{"v0":10,"v1":11,"trait":"line","y":-180},{"v0":12,"v1":13,"curve":-130,"trait":"line","x":840},{"v0":14,"v1":15,"trait":"line","y":-320},{"v0":15,"v1":17,"trait":"line","x":-840},{"v0":16,"v1":17,"trait":"line","y":320},{"v0":18,"v1":19,"trait":"line","y":-175},{"v0":19,"v1":21,"trait":"line","x":-1030},{"v0":20,"v1":21,"trait":"line","y":175},{"v0":22,"v1":23,"curve":-130,"trait":"line","x":-840},{"v0":24,"v1":25,"curve":-180,"trait":"line","x":935},{"v0":26,"v1":27,"curve":-180,"trait":"line","x":-935},{"v0":24,"v1":25,"curve":180,"trait":"line","x":935},{"v0":26,"v1":27,"curve":180,"trait":"line","x":-935},{"v0":24,"v1":25,"curve":90,"trait":"line","x":935},{"v0":26,"v1":27,"curve":90,"trait":"line","x":-935},{"v0":24,"v1":25,"curve":-90,"trait":"line","x":935},{"v0":26,"v1":27,"curve":-90,"trait":"line","x":-935},{"v0":24,"v1":25,"trait":"line","x":935},{"v0":26,"v1":27,"trait":"line","x":-935},{"v0":28,"v1":29,"curve":90,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"v0":30,"v1":31,"curve":90,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"v0":32,"v1":33,"curve":90,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"v0":34,"v1":35,"curve":90,"bCoef":-2.65,"cMask":["ball"],"cGroup":["c0"],"trait":"line"},{"v0":37,"v1":36,"curve":-180,"vis":false,"bCoef":0.1,"cGroup":["blueKO"],"trait":"kickOffBarrier"},{"v0":39,"v1":40,"curve":70,"vis":false,"color":"576C46","bCoef":-5.7,"cMask":["ball"],"cGroup":["c0"],"trait":"line","x":-1030},{"v0":41,"v1":42,"curve":-70,"vis":false,"color":"576C46","bCoef":-5.7,"cMask":["ball"],"cGroup":["c0"],"trait":"line","x":1030},{"v0":37,"v1":38,"curve":180,"vis":false,"bCoef":0.1,"cMask":["red","blue"],"cGroup":["redKO"],"trait":"kickOffBarrier"},{"v0":43,"v1":44,"vis":true,"color":"576C46","trait":"line","x":1030},{"v0":45,"v1":46,"vis":true,"color":"576C46","trait":"line","x":-1030},{"v0":47,"v1":48,"curve":-180,"trait":"line","x":-935},{"v0":47,"v1":48,"curve":180,"trait":"line","x":-935},{"v0":47,"v1":48,"curve":90,"trait":"line","x":-935},{"v0":47,"v1":48,"curve":-90,"trait":"line","x":-935},{"v0":47,"v1":48,"trait":"line","x":-935},{"v0":49,"v1":50,"color":"FFFF00","bCoef":0,"cMask":["ball"],"trait":"ballArea","x":-1157},{"v0":51,"v1":52,"color":"FFFF00","bCoef":0,"cMask":["ball"],"trait":"ballArea","x":-1157},{"v0":53,"v1":54,"color":"FFFF00","bCoef":0,"cMask":["ball"],"trait":"ballArea","x":1157},{"v0":55,"v1":56,"color":"FFFF00","bCoef":0,"cMask":["ball"],"trait":"ballArea","x":1157},{"v0":57,"v1":58,"vis":false,"color":"ec644b","bCoef":0,"cMask":["c1"],"cGroup":["red","blue"],"y":-485},{"v0":59,"v1":60,"vis":false,"color":"ec644b","bCoef":0,"cMask":["c1"],"cGroup":["red","blue"],"y":485},{"v0":61,"v1":62,"vis":false,"color":"ec644b","cMask":["c0"],"cGroup":["red","blue"]},{"v0":62,"v1":63,"vis":false,"color":"ec644b","cMask":["c0"],"cGroup":["red","blue"]},{"v0":63,"v1":64,"vis":false,"color":"ec644b","cMask":["c0"],"cGroup":["red","blue"]},{"v0":65,"v1":66,"vis":false,"cMask":["c0"],"cGroup":["red","blue"]},{"v0":66,"v1":67,"vis":false,"cMask":["c0"],"cGroup":["red","blue"]},{"v0":67,"v1":68,"vis":false,"cMask":["c0"],"cGroup":["red","blue"]},{"v0":69,"v1":70,"color":"FFFFFF","bCoef":0,"cMask":["ball","red","blue"],"y":-124},{"v0":71,"v1":72,"color":"FFFFFF","bCoef":0,"cMask":["ball","red","blue"],"y":124},{"v0":72,"v1":70,"curve":5,"color":"FFFFFF","bCoef":0,"cMask":["ball","red","blue"],"bias":0},{"v0":70,"v1":73,"color":"FFFFFF","bCoef":0,"cMask":["ball"]},{"v0":72,"v1":74,"color":"FFFFFF","bCoef":0,"cMask":["ball"]},{"v0":75,"v1":76,"color":"FFFFFF","bCoef":0,"cMask":["ball","red","blue"],"y":124},{"v0":77,"v1":78,"color":"FFFFFF","bCoef":0,"cMask":["ball","red","blue"],"y":-124},{"v0":76,"v1":78,"curve":-5,"color":"FFFFFF","bCoef":0,"cMask":["ball","red","blue"]},{"v0":78,"v1":79,"color":"FFFFFF","bCoef":0,"cMask":["ball"]},{"v0":76,"v1":80,"color":"FFFFFF","bCoef":0,"cMask":["ball"]}],
"goals":[{"p0":[-1162.45,124],"p1":[-1162.45,-124],"team":"red"},{"p0":[1162.45,124],"p1":[1162.45,-124],"team":"blue","radius":0,"invMass":1}],
"discs":[{"radius":0,"invMass":0,"pos":[-1311,-19],"color":"ffffffff","bCoef":0,"cMask":["red"],"cGroup":["ball"]},{"radius":0,"invMass":0,"pos":[-1310,29],"color":"ffffffff","bCoef":0,"cMask":["blue"],"cGroup":["ball"]},{"radius":0,"invMass":0,"pos":[-1308,62],"color":"ffffffff","bCoef":0,"cMask":["red","blue"],"cGroup":["ball"]},{"radius":2.7,"pos":[-1150,600],"cGroup":["ball"],"trait":"cornerflag"},{"radius":2.7,"pos":[1150,-600],"cGroup":["ball"],"trait":"cornerflag"},{"radius":2.7,"pos":[1150,600],"cGroup":["ball"],"trait":"cornerflag"},{"radius":5,"invMass":0,"pos":[-1150,-124],"bCoef":0.5,"trait":"goalPost"},{"radius":5,"invMass":0,"pos":[-1150,124],"bCoef":0.5,"trait":"goalPost"},{"radius":2,"invMass":0,"pos":[-1250,-158],"color":"000000","bCoef":1,"trait":"goalPost"},{"radius":2,"invMass":0,"pos":[-1250,158],"color":"000000","bCoef":1,"trait":"goalPost"},{"radius":5,"invMass":0,"pos":[1150,-124],"bCoef":0.5,"trait":"goalPost"},{"radius":5,"invMass":0,"pos":[1150,124],"bCoef":0.5,"trait":"goalPost"},{"radius":2,"invMass":0,"pos":[1250,-158],"color":"000000","bCoef":1,"trait":"goalPost"},{"radius":2,"invMass":0,"pos":[1250,158],"color":"000000","bCoef":1,"trait":"goalPost"},{"radius":2.7,"pos":[-1150,-600],"cGroup":["ball"],"trait":"cornerflag"},{"radius":0,"pos":[-1149,-485],"cMask":["none"]},{"radius":0,"pos":[1149,-485],"cMask":["none"]},{"radius":0,"pos":[-1149,-485],"cMask":["none"]},{"radius":0,"pos":[1149,-485],"cMask":["none"]},{"radius":0,"pos":[-1149,485],"cMask":["none"]},{"radius":0,"pos":[1149,485],"cMask":["none"]},{"radius":0,"pos":[-1149,485],"cMask":["none"]},{"radius":0,"pos":[1149,485],"cMask":["none"]}],
"planes":[{"normal":[0,1],"dist":-627,"bCoef":0,"cGroup":["ball"],"trait":"ballArea","_data":{"extremes":{"normal":[0,1],"dist":-627,"canvas_rect":[-1311,-675,1300,675],"a":[-1311,-627],"b":[1300,-627]}}},{"normal":[0,-1],"dist":-627,"bCoef":0,"cGroup":["ball"],"trait":"ballArea","_data":{"extremes":{"normal":[0,-1],"dist":-627,"canvas_rect":[-1311,-675,1300,675],"a":[-1311,627],"b":[1300,627]},"mirror":{}}},{"normal":[0,1],"dist":-670,"bCoef":0,"_data":{"extremes":{"normal":[0,1],"dist":-670,"canvas_rect":[-1311,-675,1300,675],"a":[-1311,-670],"b":[1300,-670]},"mirror":{}}},{"normal":[0,-1],"dist":-670,"bCoef":0,"_data":{"extremes":{"normal":[0,-1],"dist":-670,"canvas_rect":[-1311,-675,1300,675],"a":[-1311,670],"b":[1300,670]},"mirror":{}}},{"normal":[1,0],"dist":-1300,"bCoef":0,"_data":{"extremes":{"normal":[1,0],"dist":-1300,"canvas_rect":[-1311,-675,1300,675],"a":[-1300,-675],"b":[-1300,675]}}},{"normal":[-1,0],"dist":-1300,"bCoef":0.1,"_data":{"extremes":{"normal":[-1,0],"dist":-1300,"canvas_rect":[-1311,-675,1300,675],"a":[1300,-675],"b":[1300,675]}}},{"normal":[1,0],"dist":-1230,"bCoef":0,"cMask":["ball"],"cGroup":["ball"],"_data":{"extremes":{"normal":[1,0],"dist":-1230,"canvas_rect":[-1311,-675,1300,675],"a":[-1230,-675],"b":[-1230,675]}}},{"normal":[-1,0],"dist":-1230,"bCoef":0,"cMask":["ball"],"cGroup":["ball"],"_data":{"extremes":{"normal":[-1,0],"dist":-1230,"canvas_rect":[-1311,-675,1300,675],"a":[1230,-675],"b":[1230,675]}}}],
"traits":{"ballArea":{"vis":false,"bCoef":0,"cMask":["ball"],"cGroup":["ball"]},"goalPost":{"radius":5,"invMass":0,"bCoef":1,"cGroup":["ball"]},"rightNet":{"radius":0,"invMass":1,"bCoef":0,"cGroup":["ball","c3"]},"leftNet":{"radius":0,"invMass":1,"bCoef":0,"cGroup":["ball","c2"]},"stanchion":{"radius":3,"invMass":0,"bCoef":3,"cMask":["none"]},"cornerflag":{"radius":3,"invMass":0,"bCoef":0.2,"color":"FFFF00","cMask":["ball"]},"reargoalNetleft":{"vis":true,"bCoef":0.1,"cMask":["ball","red","blue"],"curve":10,"color":"C7E6BD"},"reargoalNetright":{"vis":true,"bCoef":0.1,"cMask":["ball","red","blue"],"curve":-10,"color":"C7E6BD"},"sidegoalNet":{"vis":true,"bCoef":1,"cMask":["ball","red","blue"],"color":"C7E6BD"},"kickOffBarrier":{"vis":false,"bCoef":0.1,"cGroup":["redKO","blueKO"],"cMask":["red","blue"]},"line":{"vis":true,"cMask":[],"color":"C7E6BD"}},"joints":[{"d0":16,"d1":17,"strength":"rigid","color":"ec7458","length":null},{"d0":18,"d1":19,"strength":"rigid","color":"48bef9","length":null},{"d0":20,"d1":21,"strength":"rigid","color":"ec7458","length":null},{"d0":22,"d1":23,"strength":"rigid","color":"48bef9","length":null}],
"redSpawnPoints":[],"blueSpawnPoints":[],"canBeStored":false}`;
var currentStadium = 'ARSA Stadium - RSR';

/*------------------------------ END OF STADIUMS ----------------------------*/

// ------------------------------------------------
// Global Variables
// ------------------------------------------------
var roomName = "🔵⚪🔵 𝗥𝗘𝗔𝗟 𝗦𝗢𝗖𝗖𝗘𝗥 𝟮𝟰/𝟳 | 🏅 ARSA 🏆";
var roomPassword = null;
var maxPlayers = 24;
var roomPublic = true;
var linkWebhook= "https://discord.com/api/webhooks/1015410034353655918/nrCWmkLjr6HMQl_O01ULuxitUKCiAp20aZcFJDuxGiGf4kySHExkGVdidP2paEc7eDvB";
var logWebhook = "https://discord.com/api/webhooks/989696429427658772/Vvz8S-gyG-yviVTIJU2DLeFv0hC-fSSz_laKWu5wfo3kt1U7r0pyQs4sY9VGDqwWg1UX";
var roomWebhook = 'https://discord.com/api/webhooks/992887701130969238/AcYuXTYVqNP6FRUukVWGUzQdS3glpFXXH-en4Y5Op-Tq6HcxgBLWa0l0fTfv5u_LfN98'; // this webhook is used to send the details of the room (chat, join, leave) ; it should be in a private discord channel
var gameWebhook = 'https://discord.com/api/webhooks/992887819070619799/toq6Cm-Vl2xtcH8PlWVZ9o0KAd9gMvv41hfLb8BeEIR8aFEPSVDvE1_DpI1v6UGbp1X3'; // this webhook is used to send the summary of the games ; it should be in a public discord channel
var chatWebhook = 'https://discord.com/api/webhooks/989697437935480832/E_lgIZK0FhCrtbjv5bm_i62OdcKytk8YXdVtK4D_MG2i2ChQaQ9bWnETnTmbZhItfGcC'
var ingresosWebhook = 'https://discord.com/api/webhooks/1000188603424583720/42GEGDK8uxIZVPmPzhl6TIMgIgPIFbmZZ1jruSSu9vanKXK7qbsfrcbC1ncAqxTnaoBL';
var token = "";
var roomLink = "";
var map = "RSR";
var fetchRecordingVariable = true;
var timeLimit = 5;
var scoreLimit = 3;

var room = HBInit({
	roomName: roomName,
	password: roomPassword,
	maxPlayers: maxPlayers,
	public: roomPublic,
	geo: {code: "AR", lat: -34.603722, lon: -58.381592},
	noPlayer: true,
	token: token
});


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

class MutePlayer {
    constructor(name, id, auth) {
        this.id = MutePlayer.incrementId();
        this.name = name;
        this.playerId = id;
        this.auth = auth;
        this.unmuteTimeout = null;
    }

    static incrementId() {
        if (!this.latestId) this.latestId = 1
        else this.latestId++
        return this.latestId
    }

    setDuration(minutes) {
        this.unmuteTimeout = setTimeout(() => {
            room.sendAnnouncement(
                `Has sido desmuteado.`,
                this.playerId,
                announcementColor,
                "bold",
                HaxNotification.CHAT
            );
            this.remove();
        }, minutes * 60 * 1000);
        muteArray.add(this);
    }

    remove() {
        this.unmuteTimeout = null;
        muteArray.removeById(this.id);
    }
}

class MuteList {
    constructor() {
        this.list = [];
    }

    add(mutePlayer) {
        this.list.push(mutePlayer);
        return mutePlayer;
    }

    getById(id) {
        var index = this.list.findIndex(mutePlayer => mutePlayer.id === id);
        if (index !== -1) {
            return this.list[index];
        }
        return null;
    }

    getByPlayerId(id) {
        var index = this.list.findIndex(mutePlayer => mutePlayer.playerId === id);
        if (index !== -1) {
            return this.list[index];
        }
        return null;
    }

    getByAuth(auth) {
        var index = this.list.findIndex(mutePlayer => mutePlayer.auth === auth);
        if (index !== -1) {
            return this.list[index];
        }
        return null;
    }

    removeById(id) {
        var index = this.list.findIndex(mutePlayer => mutePlayer.id === id);
        if (index !== -1) {
            this.list.splice(index, 1);
        }
    }

    removeByAuth(auth) {
        var index = this.list.findIndex(mutePlayer => mutePlayer.auth === auth);
        if (index !== -1) {
            this.list.splice(index, 1);
        }
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

class HaxStatistics {
    constructor(playerName = '') {
        this.playerName = playerName;
        this.games = 0;
        this.wins = 0;
        this.winrate = '0.00%';
        this.playtime = 0;
        this.goals = 0;
        this.assists = 0;
        this.CS = 0;
        this.ownGoals = 0;
    }
}

/* PLAYERS */

const Team = { SPECTATORS: 0, RED: 1, BLUE: 2 };
const State = { PLAY: 0, PAUSE: 1, STOP: 2 };
const Role = { PLAYER: 0, ADMIN_TEMP: 1, ADMIN_PERM: 2, MASTER: 3 };
const HaxNotification = { NONE: 0, CHAT: 1, MENTION: 2 };
const Situation = { STOP: 0, KICKOFF: 1, PLAY: 2, GOAL: 3 };

var gameState = State.STOP;
var playSituation = Situation.STOP;
var goldenGoal = false;

var playersAll = [];
var players = [];
var teamRed = [];
var teamBlue = [];
var teamSpec = [];

var teamRedStats = [];
var teamBlueStats = [];

var banList = [];

/* STATS */

var possession = [0, 0];
var actionZoneHalf = [0, 0];
var lastWinner = Team.SPECTATORS;
var streak = 0;

/* AUTH */

var authArray = [];
var adminList = ['e9D0-jYBn9GPLVjHFRh9OCqo7cQTPpmTmj1AVkH10Ew','-nglZYFDeaBaAkcHPm4vvoBCejtldY-ThswSjbDp5Kc','1p89ev1gaQXFnK2-6jphinee2T_Fi38Y54ZBuzMN8nk', 'NMwZKvvzvC27aHU6c4GGEQ44d9WPVv-Qt-eybwDesaE', 'fzAidysBJ_-I9A-8ZfJeGHTCCLB7pzOyrfGv2TW8N84','sHZ8dgs98xrd1iGVAfZyEGJEECMziHaTFXClpj98XeI','aa-G63Ijn4IyIqIn3JlqUp4p-dCXSZPYwh6NJHMrpO4','4ISHSOT1_Ji8zsxumqkTEB4_rmj7YkL1jCuAe5PE8ZQ', 'sjYql3IX4S0DYDP4XTolUbBu8CLtrkSYDvo7fUKbZOk','iD3UyE6ugy5dnbnnNs81Ta1K2L5bQDn9CCGvyAcStGE', 'CwEmzWN1Wfmgcw4YhtHF72mtbwqrfBu112re7-rB1iI','kNy7rmnxa5T12zoJEH-JHQQcWmt0D3KjVsF3js8hLR0','_FyFJ9XOzfCjIv64OT7pyOLaWxxYE5_KD1UzFzxBtqE'];
				
				//["fzAidysBJ_-I9A-8ZfJeGHTCCLB7pzOyrfGv2TW8N84", "chueking"];
				//["clGQ5J-zpYqb5e77etybJR3zpBguZ70Dy9vCqPcy7n4", "pompéyar"];
				//["aa-G63Ijn4IyIqIn3JlqUp4p-dCXSZPYwh6NJHMrpO4", "Roman"];
				//["4ISHSOT1_Ji8zsxumqkTEB4_rmj7YkL1jCuAe5PE8ZQ", "sanogo'"];
				//["clGQ5J-zpYqb5e77etybJR3zpBguZ70Dy9vCqPcy7n4", "mgrx'"];
				//["kNy7rmnxa5T12zoJEH-JHQQcWmt0D3KjVsF3js8hLR0", "Sombrero"];
				//["CwEmzWN1Wfmgcw4YhtHF72mtbwqrfBu112re7-rB1iI", "Nicolas Colazo"];
				//["iD3UyE6ugy5dnbnnNs81Ta1K2L5bQDn9CCGvyAcStGE", "ashkyyy :p"];
    // ['INSERT_AUTH_HERE_1', 'NICK_OF_ADMIN_1'],
    // ['INSERT_AUTH_HERE_2', 'NICK_OF_ADMIN_2'],

var masterList = ['ZGfpCZvSqTEyDqq7q8SVEHQJdJnw0j4NXXCzmHAZQrA','Zcqny8SrHV4czrpr_Wr1NFAywVu2ixx0AJAiXTIp8O4','BudPgC7_MGZQriwogDgz5azqdkq-RJNFRRVEHdjYfrQ','iD3UyE6ugy5dnbnnNs81Ta1K2L5bQDn9CCGvyAcStGE','q1nPc99JIO5vKrLSG66hEkpLC8UKfqs2Xgi2zRmQ9c8','clGQ5J-zpYqb5e77etybJR3zpBguZ70Dy9vCqPcy7n4','kNy7rmnxa5T12zoJEH-JHQQcWmt0D3KjVsF3js8hLR0'];
    // 'INSERT_MASTER_AUTH_HERE',
    // 'INSERT_MASTER_AUTH_HERE_2'

/* FESTEJO */

const frasesgoles = [" Mira que te como dijó ", " ¡Vestite que no se puede jugar desnudo en la cancha ", " Apareciendo cuando mas se le necesita, el amo y señor de haxball ", " estás on fire 🔥🔥🔥 ", " Increible el golazo de ", " Futbol champagne señores! de parte de ", " ¡BARRILETE COSMICO! ¿De que planeta viniste? ", " Impresionante definicion de ", " Que locura de gol acaba de hacer "];
const frasesasis = [" 🔥🔥¡Y el pase milimetrico de ", " ¡Y donde pone el ojo pone el pase ", " ¡con tremendo pase de ", " ¡asistencia fenomenal de ", " ¡pase milimetrico de "];
const frasesautogol = [" ¡Prende el monitor! ", " Para que te trajeee ", " ¡El troll de troles es ", " ¡Increible lo que hace este muchacho, pero sería mejor hacerlo en el arco contrario ", " ¡Genial ahora en el otro arco ", " ¡Se equivoco de arco ", " ¡Para el otro lado "];

/* ADDES */

var isTimeAddedShown = false;
var isTimeAddedShowndos = false;
var isTimeAddedShowntres = false;
var isTimeAddedShowncuatro = false;
var isTimeAddedShowncinco = false;
var isTimeAddedShownseis = false;
var isTimeAddedShownquince = false;
var isTimeAddedShownsiete = false;



room.setScoreLimit(scoreLimit);
room.setTimeLimit(timeLimit);
room.setTeamsLock(true);

var drawTimeLimit = Infinity;
var teamSize = 4;
var maxAdmins = 0;
var disableBans = false;
var debugMode = false;
var afkLimit = debugMode ? Infinity : 12;

var defaultSlowMode = 0.5;
var chooseModeSlowMode = 1;
var slowMode = defaultSlowMode;
var SMSet = new Set();

var hideClaimMessage = true;
var mentionPlayersUnpause = true;

/* GAME */

var lastTouches = Array(2).fill(null);
var lastTeamTouched;

var speedCoefficient = 100 / (5 * (0.99 ** 60 + 1));
var ballSpeed = 0;
var playerRadius = 15;
var ballRadius = 10;
var triggerDistance = playerRadius + ballRadius + 0.01;

/* COLORS */

var welcomeColor = 0xc4ff65;
var announcementColor = 0xffefd6;
var infoColor = 0xbebebe;
var privateMessageColor = 0xffc933;
var redColor = 0xff4c4c;
var blueColor = 0x62cbff;
var warningColor = 0xffa135;
var errorColor = 0xa40000;
var successColor = 0x75ff75;
var defaultColor = null;
var announceColor2 = 0xBDBD33;


/* AUXILIARY */

var checkTimeVariable = false;
var checkStadiumVariable = true;
var endGameVariable = false;
var cancelGameVariable = false;
var kickFetchVariable = false;

var chooseMode = false;
var timeOutCap;
var capLeft = false;
var redCaptainChoice = '';
var blueCaptainChoice = '';
var chooseTime = 20;

var AFKSet = new Set();
var AFKMinSet = new Set();
var AFKCooldownSet = new Set();
var minAFKDuration = 0;
var maxAFKDuration = 320;
var AFKCooldown = 0;

var muteArray = new MuteList();
var muteDuration = 5;

var removingPlayers = false;
var insertingPlayers = false;

var stopTimeout;
var startTimeout;
var unpauseTimeout;
var removingTimeout;
var insertingTimeout;

var emptyPlayer = {
    id: 0,
};
stadiumCommand(emptyPlayer, "!rs");

room.onRoomLink = function(url) {
	roomLink = url;
	console.log(`${url}\nmasterPassword : ${masterPassword}`);
    if (linkWebhook != '') {
        fetch(linkWebhook, {
            method: 'POST',
            body: JSON.stringify({
                content: `🔗 LINK ${url}\n`,
                username: roomName,
            }),
            headers: {
                'Content-Type': 'application/json',
            },
        }).then((res) => res);
    }
	console.log(roomLink);
}

room.onStadiumChange = function(newStadiumName, byPlayer) {
     if (byPlayer !== null) {
        if (getRole(byPlayer) < currentStadium != 'other') {
            room.sendAnnouncement(
                `¡No puedes cambiar el estadio manualmente! Utilice los comandos del estadio.`,
                byPlayer.id,
                errorColor,
                'bold',
                HaxNotification.CHAT
            );
            room.setCustomStadium(realSoccerMap);
            stadiumCommand(emptyPlayer, `!${currentStadium}`);
        }
    }
    checkStadiumVariable = true;
};

room.onPlayerJoin = function(player) {
	 authArray = [player.id, player.auth, player.conn];
	 extendedP.push([player.id, player.auth, player.conn, false, 0, 0, false]);
	 if(isBlacklisted(player) == true) room.kickPlayer(player.id,"Has sido baneado permanentemente!",true);
    if (roomWebhook != '') {
        fetch(roomWebhook, {
            method: 'POST',
            body: JSON.stringify({
                content: `[${getDate()}] ➡️ JOIN (${playersAll.length + 1}/${maxPlayers})\n**` +
                    `${player.name}** [${authArray[player.id][0]}] {${authArray[player.id][1]}}`,
                username: roomName,
            }),
            headers: {
                'Content-Type': 'application/json',
            },
        }).then((res) => res);
    }
    if (ingresosWebhook != '') {
        fetch(ingresosWebhook, {
            method: 'POST',
            body: JSON.stringify({
                content: `**${player.name}** ha ingresado al server público **(${playersAll.length + 1}/${maxPlayers})\n**`,
                username: '💙🤍💙 SERVER PÚBLICO 🏆' + roomName,
            }),
            headers: {
                'Content-Type': 'application/json',
            },
        }).then((res) => res);
    }  
     	whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░█████╗░██████╗░░██████╗░█████╗░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██╔══██╗██╔══██╗██╔════╝██╔══██╗▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███████║██████╔╝╚█████╗░███████║▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██╔══██║██╔══██╗░╚═══██╗██╔══██║▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██║░░██║██║░░██║██████╔╝██║░░██║▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
        whisper("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒", player.id, 0x61ddff, "bold", 0);
		whisper("📢     𝘽𝙞𝙚𝙣𝙫𝙚𝙣𝙞𝙙𝙤𝙨 𝙖𝙡 𝘽𝙤𝙩 𝙋𝙪𝙗𝙡𝙞𝙘𝙤 𝙙𝙚 𝙡𝙖 𝘼𝙨𝙤𝙘𝙞𝙖𝙘𝙞𝙤𝙣 𝙙𝙚 𝙍𝙚𝙖𝙡 𝙎𝙤𝙘𝙘𝙚𝙧 𝘼𝙧𝙜𝙚𝙣𝙩𝙞𝙣𝙤  ❗", player.id, 0x61ddff, "bold", 0);
		whisper("📢      𝙀𝙨𝙘𝙧𝙞𝙗𝙚 !𝙝𝙚𝙡𝙥 𝙥𝙖𝙧𝙖 𝙫𝙚𝙧 𝙡𝙤𝙨 𝙘𝙤𝙢𝙖𝙣𝙙𝙤𝙨 𝙙𝙞𝙨𝙥𝙤𝙣𝙞𝙗𝙡𝙚𝙨.    ❗", player.id, 0x61e7ff, "bold", 0);
    	whisper("📢      𝙑𝙞𝙨𝙞𝙩𝙖 𝙣𝙪𝙚𝙨𝙩𝙧𝙤 𝙙𝙞𝙨𝙘𝙤𝙧𝙙 𝙥𝙖𝙧𝙖 𝙨𝙖𝙗𝙚𝙧 𝙢𝙖𝙨 𝙨𝙤𝙗𝙧𝙚 𝙣𝙤𝙨𝙤𝙩𝙧𝙤𝙨: https://discord.gg/QRuJ3fvDbM     ❗", player.id, 0x61e7ff, "bold", 0);
    updateTeams();
    updateAdmins();
    if (masterList.findIndex((auth) => auth == player.auth) != -1) {
        room.sendAnnouncement(
            `Super Admin ${player.name} se ha conectado !`,
            null,
            announcementColor,
            'bold',
            HaxNotification.CHAT
        );
        room.setPlayerAdmin(player.id, true);
    } else if (adminList.findIndex((auth) => auth == player.auth) != -1) {
        room.sendAnnouncement(
            `Admin ${player.name} se ha conectado !`,
            null,
            announcementColor,
            'bold',
            HaxNotification.CHAT
        );
        room.setPlayerAdmin(player.id, true);
    }
    var sameAuthCheck = playersAll.filter((p) => p.id != player.id && authArray[p.id][0] == player.auth);
    if (sameAuthCheck.length > 0 && !debugMode) {
        var oldPlayerArray = playersAll.filter((p) => p.id != player.id && authArray[p.id][0] == player.auth);
        for (let oldPlayer of oldPlayerArray) {
            ghostKickHandle(oldPlayer, player);
        }
    }
    handlePlayersJoin();
    if (localStorage.getItem(getAuth(player)) == null) {
		stats = [0, 0, 0, 0, "0.00", 0, 0, 0, 0, "0.00", "player", player.name]
		localStorage.setItem(getAuth(player), JSON.stringify(stats));
	}
}

room.onPlayerLeave = function(player) {
	 setTimeout(() => {
        if (!kickFetchVariable) {
            if (roomWebhook != '') {
                var stringContent = `[${getDate()}] ⬅️ LEAVE (${playersAll.length}/${maxPlayers})\n**${player.name}**` +
                    `[${authArray[player.id][0]}] {${authArray[player.id][1]}}`;
                fetch(roomWebhook, {
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
    handleLineupChangeLeave(player);
    checkCaptainLeave(player);
    updateTeams();
    updateAdmins();
    handlePlayersLeave();
}

room.onPlayerAdminChange = function(changedPlayer, byPlayer) {
	updateTeams();
    if (!changedPlayer.admin && getRole(changedPlayer) >= Role.ADMIN_TEMP) {
        room.setPlayerAdmin(changedPlayer.id, true);
        return;
    }
    updateAdmins(byPlayer != null && !changedPlayer.admin && changedPlayer.id == byPlayer.id ? changedPlayer.id : 0);
}

room.onGameStart = function(byPlayer) {
	if (map == "RSR") {
	 clearTimeout(startTimeout);
    if (byPlayer != null) clearTimeout(stopTimeout);
    game = new Game();
    possession = [0, 0];
    actionZoneHalf = [0, 0];
    gameState = State.PLAY;
    endGameVariable = false;
    goldenGoal = false;
    playSituation = Situation.KICKOFF;
    lastTouches = Array(2).fill(null);
    lastTeamTouched = Team.SPECTATORS;
    teamRedStats = [];
    teamBlueStats = [];
    GKList = [];
		allReds = [];
		allBlues = [];
    if (teamRed.length == teamSize && teamBlue.length == teamSize) {
        for (var i = 0; i < teamSize; i++) {
            teamRedStats.push(teamRed[i]);
            teamBlueStats.push(teamBlue[i]);
        }
        calculateStadiumVariables();
    }
		if (byPlayer == null) {
			game = new Game();	
			announce("Duración del juego establecida en " + timeLimit + " minutos");
                        room.sendAnnouncement("La partida esta siendo grabada.");
		}
		else {
			if (room.getScores().timeLimit != 0) {
				timeLimit = room.getScores().timeLimit / 60;
			}
			else {
				timeLimit = 0;
			}
			room.stopGame();
			room.setTimeLimit(5);
			room.setScoreLimit(3);			
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
    handlePlayersStop(byPlayer);
    handleActivityStop();
		if (byPlayer != null) {
			room.setTimeLimit(timeLimit)
		}
	}
}

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
		playerKickBall = player;
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
    if (roomWebhook != '') {
        var stringContent = `[${getDate()}] ⛔ ${ban ? 'BAN' : 'KICK'} (${playersAll.length}/${maxPlayers})\n` +
            `**${kickedPlayer.name}** [${authArray[kickedPlayer.id][0]}] {${authArray[kickedPlayer.id][1]}} was ${ban ? 'banned' : 'kicked'}` +
            `${byPlayer != null ? ' by **' + byPlayer.name + '** [' + authArray[byPlayer.id][0] + '] {' + authArray[byPlayer.id][1] + '}' : ''}`
        fetch(roomWebhook, {
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
    if ((ban && ((byPlayer != null &&
        (byPlayer.id == kickedPlayer.id || getRole(byPlayer) < Role.MASTER)) || getRole(kickedPlayer) == Role.MASTER)) || disableBans
    ) {
        room.clearBan(kickedPlayer.id);
        return;
    }
    if (byPlayer != null && getRole(byPlayer) < Role.ADMIN_PERM) {
    	room.kickPlayer(byPlayer.id);
        room.sendAnnouncement(
            'No puedes kickear o banear jugadores !',
            byPlayer.id,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
        room.setPlayerAdmin(byPlayer.id, false);
        return;
    }
    if (ban) banList.push([kickedPlayer.name, kickedPlayer.id]);

}

room.onPlayerChat = (player, message) => {

	let spacePos = message.search(" ");
    let command = message.substr(0, spacePos !== -1 ? spacePos : message.length);
    if (commands2.hasOwnProperty(command) == true) return commands2[command](player, message);

	if (gameState !== State.STOP && player.team != Team.SPECTATORS) {
        let pComp = getPlayerComp(player);
        if (pComp != null) pComp.inactivityTicks = 0;
    }
    let msgArray = message.split(/ +/);
    if (!hideClaimMessage || msgArray[0] != '!claim') {
        if (chatWebhook != '')
            fetch(chatWebhook, {
                method: 'POST',
                body: JSON.stringify({
                    content: `[${getDate()}] 💬 CHAT\n**${player.name}** : ${message.replace('@', '@ ')}`,
                    username: roomName,
                }),
                headers: {
                    'Content-Type': 'application/json',
                },
            }).then((res) => res);
    }
    if (msgArray[0].toLowerCase() == 't') {
        teamChat(player, message);
        return false;
    }
    if (msgArray[0].substring(0, 2) === '@@') {
        playerChat(player, message);
        return false;
    }
    if (chooseMode && teamRed.length * teamBlue.length != 0) {
        var choosingMessageCheck = chooseModeFunction(player, message);
        if (choosingMessageCheck) return false;
    }
    if (slowMode > 0) {
        var filter = slowModeFunction(player, message);
        if (filter) return false;
    }
    if (!player.admin && muteArray.getByAuth(authArray[player.id][0]) != null) {
        room.sendAnnouncement(
            `Estas muteado !`,
            player.id,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
        return false;
    }

        if (message.match(regex)) {
        room.sendAnnouncement("No puedes poner esto.", player.id);
        return false;
        }
        if (message == "!admin" && allowPublicAdmin == true) {
			if (isAdminPresent() == false) {
				room.setPlayerAdmin(player.id, true);
				getRole(player) == Role.ADMIN_TEMP;
			}
			else {
				whisper("El administrador ya está presente o el comando !admin no está permitido", player.id);
			}
		}
		if(message == "!llamaradmin"){
		sendAnnouncementToDiscord(`${roomName}\n\n**${player.name}** uso '!llamaradmin' <@&991912219229040751>`);
		room.sendAnnouncement("Se ha usado el comando llamar admin, recorda que spamear este comando implica ban permanente.", player.id, null, 'bold',2)
		}
		if(message == "!llamarjugadores"){
		sendAnnouncementToDiscord2(`**${player.name}** uso '!llamarjugadores' <@&1000178298304864256>`);
		room.sendAnnouncement("Se ha usado el comando llamar jugadores.", player.id, null, 'bold',2);
		room.sendAnnouncement("Recorda que podes pedir tu rol de jugador server público reaccionando en el canal rol jugador público.", player.id, null, 'bold',2)
		}
		if (msgArray[0].toLowerCase() == '!rangos') {
		var tableau = [];
		try {
			Object.keys(localStorage).forEach(function(key) {
				if (!["player_name", "view_mode", "geo", "avatar", "player_auth_key"].includes(key) && JSON.parse(localStorage.getItem(key))[Ss.WI] > 400) {
					tableau.push([(JSON.parse(localStorage.getItem(key))[Ss.NK]), (JSON.parse(localStorage.getItem(key))[Ss.WI])]);
				}
			});
		} catch {

		}
		if (tableau.length < 5) {
			room.sendAnnouncement("[PV] Aún nadie ha ganado tantos partidos.", player.id, 0x73EC59);
			return false;
		}
		tableau.sort(function(a, b) {
			return b[1] - a[1];
		});
		room.sendAnnouncement("[📄] ✅ RANGOS> #1 " + tableau[0][0] + ": " + tableau[0][1] + " #2 " + tableau[1][0] + ": " + tableau[1]
			[1] + " #3 " + tableau[2][0] + ": " + tableau[2][1] + " #4 " + tableau[3][0] + ": " + tableau[3][1] + " #5 " + tableau[4]
			[0] + ": " + tableau[4][1], player.id, 0x73EC59);
		return false;
	}
		if (msgArray[0][0] == '!') {
        let command = getCommand(msgArray[0].slice(1).toLowerCase());
        if (command != false && commands[command].roles <= getRole(player)) commands[command].function(player, message);
        return false;
    }
		if (localStorage.getItem(getAuth(player))) {
			stats = JSON.parse(localStorage.getItem(getAuth(player)));
			var announcement = "";
			var chatColor = "";
			if (stats[Ss.WI] > 399) {
				announcement += "🔥 「𝙍𝘼𝙉𝙂𝙊𝙎」"
				chatColor = "0xFF8000"
			} else if (stats[Ss.WI] > 199) {
				announcement += "🔸 「𝗦𝘂𝗽𝗲𝗿-𝗘𝘀𝘁𝗿𝗲𝗹𝗹𝗮」"
				chatColor = "0x0040FF"
			} else if (stats[Ss.WI] > 179) {
				announcement += "🔹 「𝗘𝘀𝘁𝗿𝗲𝗹𝗹𝗮」"
				chatColor = "0xFF7900"
			} else if (stats[Ss.WI] > 159) {
				announcement += "✓ 「𝗖𝗮𝗺𝗽𝗲𝗼𝗻」"
				chatColor = "0xFFFF00"
			} else if (stats[Ss.WI] > 129) {
				announcement += "👑 「𝗖𝗿𝗮𝗰𝗸」"
				chatColor = "0xFFC375"
			} else if (stats[Ss.WI] > 89) {
				announcement += "💲 「𝗟𝗲𝘆𝗲𝗻𝗱𝗮」"
				chatColor = "0xBFFF00"
			} else if (stats[Ss.WI] > 69) {
				announcement += "👿 「𝐄𝐱𝐩𝐞𝐫𝐭𝐨」"
				chatColor = "0xEC77CE"
			} else if (stats[Ss.WI] > 59) {
				announcement += "💪 「𝗥𝗲𝘃𝗲𝗹𝗮𝗰𝗶𝗼𝗻」"
				chatColor = "0xFA58DF"
			} else if (stats[Ss.WI] > 44) {
				announcement += "👽 「𝗩𝗲𝘁𝗲𝗿𝗮𝗻𝗼」"
				chatColor = "0x73EC59"
			} else if (stats[Ss.WI] > 34) {
				announcement += "👿 「𝗜𝗺𝗽𝗮𝗿𝗮𝗯𝗹𝗲」"
				chatColor = "0xFE2E2E"
			} else if (stats[Ss.WI] > 24) {
				announcement += "⚽ 「𝗣𝗿𝗼𝗳𝗲𝘀𝗶𝗼𝗻𝗮𝗹」"
				chatColor = "0x04B404"
			} else if (stats[Ss.WI] > 14) {
				announcement += "😎 「𝗔𝗽𝗿𝗲𝗻𝗱𝗶𝘇」"
				chatColor = "0x2EFEF7"
			} else if (stats[Ss.WI] > 4) {
				announcement += "🎖️ 「𝗣𝗿𝗶𝗻𝗰𝗶𝗽𝗶𝗮𝗻𝘁𝗲」"
				chatColor = "0xDDD4DB"
			} else {
				announcement += "㋡ 「𝗜𝗻𝗶𝗰𝗶𝗮𝗻𝘁𝗲」"
				chatColor = "0xDDD4DB"
			}
			if (player.admin) {
				announcement += "「🌟​」";
				chatColor = "0xF8FF00";
			}
			announcement += player.name + ": " + message
			room.sendAnnouncement(announcement, null, chatColor);
			return false;
        }
    }


room.onPlayerTeamChange = function(changedPlayer, byPlayer) {
	if (map == "RSR") {
	handleLineupChangeTeamChange(changedPlayer);
    if (AFKSet.has(changedPlayer.id) && changedPlayer.team != Team.SPECTATORS) {
        room.setPlayerTeam(changedPlayer.id, Team.SPECTATORS);
        room.sendAnnouncement(
            `${changedPlayer.name} esta AFK !`,
            null,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
        return;
    }
    updateTeams();
    if (gameState != State.STOP) {
        if (changedPlayer.team != Team.SPECTATORS && game.scores.time <= (3 / 4) * game.scores.timeLimit && Math.abs(game.scores.blue - game.scores.red) < 2) {
            changedPlayer.team == Team.RED ? teamRedStats.push(changedPlayer) : teamBlueStats.push(changedPlayer);
        }
    }
    handleActivityPlayerTeamChange(changedPlayer);
    handlePlayersTeamChange(byPlayer);
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
    for (let player of teamRed) {
        var playerComp = getPlayerComp(player);
        team == Team.RED ? playerComp.goalsScoredTeam++ : playerComp.goalsConcededTeam++;
    }
    for (let player of teamBlue) {
        var playerComp = getPlayerComp(player);
        team == Team.BLUE ? playerComp.goalsScoredTeam++ : playerComp.goalsConcededTeam++;
    }
    if ((scores.scoreLimit != 0 && (scores.red == scores.scoreLimit || scores.blue == scores.scoreLimit)) || goldenGoal) {
        endGame(team);
        goldenGoal = false;
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
		var frasegol = frasesgoles[(Math.random() * frasesgoles.length) | 0]
		var fraseasis = frasesasis[(Math.random() * frasesasis.length) | 0]
		var fraseautogol = frasesautogol[(Math.random() * frasesautogol.length) | 0]
		if (team == 1) {
			if (game.lastKickerTeam == 1) { //if goal type is goal
				goalType = "GOL!" + frasegol;
				scorer = "⚽" + game.lastKickerName;
				avatarCelebration(game.lastKickerId, "⚽");
				if (game.secondLastKickerTeam == 1 && game.lastKickerId != game.secondLastKickerId) { // if assist is from teammate
					assister = fraseasis + " de: " + game.secondLastKickerName;
					avatarCelebration(game.secondLastKickerId, "🅰️");
				}
			}		
			if (game.lastKickerTeam == 2) { //if goal type is owngoal
				goalType = "GOL EN CONTRA!" + fraseautogol;
				scorer = "🐸" + game.lastKickerName;
				avatarCelebration(game.lastKickerId, "🐸");
				if (game.secondLastKickerTeam == 1) { // if owngoal was assisted
					assister = " (Asistido por: " + game.secondLastKickerName + ")";
					avatarCelebration(game.secondLastKickerId, "🅰️");
				}
			}
			game.redScore++;
		}
		if (team == 2) {
			if (game.lastKickerTeam == 2) { //if goal type is goal
				goalType = "GOL!" + frasegol;
				scorer = "⚽" + game.lastKickerName;
				avatarCelebration(game.lastKickerId, "⚽");
				if (game.secondLastKickerTeam == 2 && game.lastKickerId != game.secondLastKickerId) { // if assist is from teammate
					assister = fraseasis + " de: " + game.secondLastKickerName;
					avatarCelebration(game.secondLastKickerId, "🅰️");
				}
			}		
			if (game.lastKickerTeam == 1) { //if goal type is owngoal
				goalType = "GOL EN CONTRA!" + fraseautogol;
				scorer = "🐸" + game.lastKickerName;
				avatarCelebration(game.lastKickerId, "🐸");
				if (game.secondLastKickerTeam == 2) { // if owngoal was assisted
					assister = " (Asistido por: " + game.secondLastKickerName + ")";
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
	 lastTouches = Array(2).fill(null);
    lastTeamTouched = Team.SPECTATORS;
    playSituation = Situation.KICKOFF;
		if (game.lastPlayAnnounced == true) {
			room.pauseGame(true);
			game.lastPlayAnnounced = false;
			announce("Termino");
		}
	}
}

room.onGameTick = function() {
	if (map == "RSR") {
	    checkTime();
    	getLastTouchOfTheBall();
    	getGameStats();
    	handleActivity();
		updateGameStatus();
		handleBallTouch();
		realSoccerRef();
		PublicitaDiscord();
		PublicitaHelp();
		PublicitaLiga();
		PublicitaDiscord2();
		PublicitaHelp2();
	}	
}

room.onPlayerActivity = function (player) {
    if (gameState !== State.STOP) {
        let pComp = getPlayerComp(player);
        if (pComp != null) pComp.inactivityTicks = 0;
    }
};

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
                `Saco la pausa ${byPlayer.name} !`,
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
    if (
        (teamRed.length == teamSize && teamBlue.length == teamSize && chooseMode) ||
        (teamRed.length == teamBlue.length && teamSpec.length < 2 && chooseMode)
    ) {
        deactivateChooseMode();
    }
};

function realSoccerRef() {
	blockThrowIn();
	blockGoalKick();
	removeBlock();
	
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
                                room.sendAnnouncement("La partida ha sido enviada a discord. mirala en #estadísticas-partido");
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
                                room.sendAnnouncement("La partida ha sido enviada a discord. mirala en #estadísticas-partido");
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
                                room.sendAnnouncement("La partida ha sido enviada a discord. mirala en #estadísticas-partido");
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


room.onTeamVictory = function(scores){

}


function sendAnnouncementToDiscord(message) {

var request = new XMLHttpRequest();
request.open("POST", "https://discord.com/api/webhooks/991913222473007164/579ACSLNpzDcQnKtIeKPzswktWmgih-9Kj0TVboLfdgrqLIw_OKNSetMl52jqDlFFHgL");

request.setRequestHeader('Content-type', 'application/json');

var params = {
avatar_url: '',
username: 'Server público',
content: message,
allowed_mentions: {
	parse: ["roles"]
	
	}
};

request.send(JSON.stringify(params));
}

function sendAnnouncementToDiscord2(message) {

var request = new XMLHttpRequest();
request.open("POST", "https://discord.com/api/webhooks/1000183478710710322/1hF0vEaGrETwfLHmHJNnYaEDLfpoe7ENV0HcymiONoSkQewgxmBY86ree-_22p8lKcOc");

request.setRequestHeader('Content-type', 'application/json');

var params = {
avatar_url: '',
username: 'Server-Público',
content: message,
allowed_mentions: {
	parse: ["roles"]
	
	}
};


request.send(JSON.stringify(params));
}

if (typeof String.prototype.replaceAll != 'function') {
    String.prototype.replaceAll = function (search, replacement) {
        var target = this;
        return target.split(search).join(replacement);
    };
}

function camisetasARSA(player) { // !camisetas
    room.sendAnnouncement("ARSA - 2022 🌍: !primeradiv ✦, !segundadiv ✦, !terceradiv ✦", player.id, 0xea9999, "bold", 0);
}

function primeraDiv(player) { // !primeradiv
    room.sendAnnouncement("🅰 1ra DIVISIÓN: | !PHT | !ST | !SUT | !MUT | !AAC | !VFC | !RM | !UCB | !PX", player.id, 0xADF4FF, "bold", 0); 
}

function segundaDiv(player) { // !segundadiv
    room.sendAnnouncement("🅰 2da DIVISIÓN: | !BF | !NYC | !ALR | !ATM | !CHT | !DMA | !SDH | !SM", player.id, 0xADF4FF, "bold", 0); 
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


var commands = {
	help: {
        aliases: ['commands', 'ayuda'],
        roles: Role.PLAYER,
        desc: `
	Este comando muestra todos los comandos disponibles. También puede mostrar la descripción de un comando en particular.
Ejemplo: \'!help bb\' mostrará la descripción del comando \'bb\'.`,
        function: helpCommand,
    },
    claim: {
        aliases: [],
        roles: Role.PLAYER,
        desc: false,
        function: masterCommand,
    },
    afk: {
        aliases: [],
        roles: Role.PLAYER,
        desc: `
        Este comando te hace ir AFK.
     Tiene limitaciones: 1 minuto mínimo de tiempo AFK, 5 minutos máximo y 10 minutos de cooldown.`,
        function: afkCommand,
    },
    afks: {
        aliases: ['afklist'],
        roles: Role.PLAYER,
        desc: `
        Este comando muestra todos los jugadores AFK.`,
        function: afkListCommand,
    },
    bb: {
        aliases: ['bye', 'adios', 'chau'],
        roles: Role.PLAYER,
        desc: `
	Este comando te hace salir al instante (uso recomendado).`,
        function: leaveCommand,
    },
    me: {
        aliases: ['stat', 'stats'],
        roles: Role.PLAYER,
        desc: `
        Este comando muestra tus estadísticas en la sala`,
        function: globalStatsCommand,
    },
    rename: {
        aliases: [],
        roles: Role.PLAYER,
        desc: `
        Este comando le permite cambiar su nombre para la tabla de clasificación.`,
        function: renameCommand,
    },
    games: {
        aliases: [],
        roles: Role.PLAYER,
        desc: `
        Este comando muestra los 5 mejores jugadores con más partidos en la sala.`,
        function: statsLeaderboardCommand,
    },
    wins: {
        aliases: [],
        roles: Role.PLAYER,
        desc: `
        Este comando muestra los 5 mejores jugadores con más victorias en la sala..`,
        function: statsLeaderboardCommand,
    },
    goals: {
        aliases: [],
        roles: Role.PLAYER,
        desc: `
        Este comando muestra los 5 mejores jugadores con más goles en la sala.`,
        function: statsLeaderboardCommand,
    },
    assists: {
        aliases: [],
        roles: Role.PLAYER,
        desc: `
        Este comando muestra los 5 mejores jugadores con más asistencias en la sala..`,
        function: statsLeaderboardCommand,
    },
    cs: {
        aliases: [],
        roles: Role.PLAYER,
        desc: `
        Este comando muestra los 5 mejores jugadores con más cleansheets en la sala.`,
        function: statsLeaderboardCommand,
    },
    playtime: {
        aliases: [],
        roles: Role.PLAYER,
        desc: `
        Este comando muestra los 5 mejores jugadores con más tiempo jugado en la sala.`,
        function: statsLeaderboardCommand,
    },
    rs: {
        aliases: [],
        roles: Role.ADMIN_TEMP,
        desc: `
        Este comando carga el estadio de ARSA | Real Soccer.`,
        function: stadiumCommand,
    },
    rr: {
        aliases: [],
        roles: Role.ADMIN_TEMP,
        desc: `
    Este comando reinicia el partido.`,
        function: restartCommand,
    },
    rrs: {
        aliases: [],
        roles: Role.ADMIN_TEMP,
        desc: `
    Este comando intercambia los equipos y reinicia el partido.`,
        function: restartSwapCommand,
    },
    swap: {
        aliases: ['s'],
        roles: Role.ADMIN_TEMP,
        desc: `
    Este comando cambia los equipos cuando se detiene el partido.`,
        function: swapCommand,
    },
    kickred: {
        aliases: ['kickr'],
        roles: Role.ADMIN_TEMP,
        desc: `
    Este comando kickea a todos los jugadores del red team, incluido el jugador que ingresó el comando. Puedes dar como argumento el motivo del kick.`,
        function: kickTeamCommand,
    },
    kickblue: {
        aliases: ['kickb'],
        roles: Role.ADMIN_TEMP,
        desc: `
    Este comando kickea a todos los jugadores del blue team, incluido el jugador que ingresó el comando. Puedes dar como argumento el motivo del kick.`,
        function: kickTeamCommand,
    },
    kickspec: {
        aliases: ['kicks'],
        roles: Role.ADMIN_TEMP,
        desc: `
Este comando kickea a todos los jugadores espectadores, incluido el jugador que ingresó el comando. Puedes dar como argumento el motivo del kick.`,        
	function: kickTeamCommand,
    },
    mute: {
        aliases: ['m'],
        roles: Role.ADMIN_TEMP,
        desc: `
        Este comando permite mutear a un jugador. No podrá hablar durante un tiempo determinado, y los administradores pueden desactivar el mute en cualquier momento.
     Se necesitan 2 argumentos:
     Argumento 1: #<id> donde <id> es la identificación del jugador objetivo. Esto no funcionará si el jugador es un administrador.
     Argumento 2 (opcional): <duration> donde <duration> es la duración del mute en minutos. Si no se proporciona ningún valor, el mute tiene la duración predeterminada, ${muteDuration} minutos.
     Ejemplo: !mute #3 20 silenciará al jugador con id 3 durante 20 minutos.`,
        function: muteCommand,
    },
    unmute: {
        aliases: ['um'],
        roles: Role.ADMIN_TEMP,
        desc: `
        Este comando permite desmutear a alguien.
     Toma 1 argumento:
     Argumento 1: #<id> donde <id> es el id del jugador muteado.
     O
     Argumento 1: <número> donde <número> es el número asociado con el silencio proporcionado por el comando 'muteList'.
     Ejemplo: !unmute #300 desmuteara al jugador con id 300,
              !unmute 8 desmuteara al jugador n°8 según el comando 'muteList'.`,
        function: unmuteCommand,
    },
    mutes: {
        aliases: [],
        roles: Role.ADMIN_TEMP,
        desc: `
        Este comando muestra la lista de muteados.`,
        function: muteListCommand,
    },
    clearbans: {
        aliases: [],
        roles: Role.MASTER,
        desc: `
	Este comando desbanea a todos. También puede desbanear a un jugador en particular, agregando su ID como argumento.`,
        function: clearbansCommand,
    },
    bans: {
        aliases: ['banlist'],
        roles: Role.MASTER,
        desc: `
    Este comando muestra todos los jugadores que fueron baneados y sus ID's.`,
        function: banListCommand,
    },
    admins: {
        aliases: ['adminlist'],
        roles: Role.MASTER,
        desc: `
    Este comando muestra todos los jugadores que son administradores permanentes.`,
        function: adminListCommand,
    },
    setadmin: {
        aliases: ['admin'],
        roles: Role.MASTER,
        desc: `
    Este comando permite establecer a alguien como administrador. Podrá conectarse como administrador y los Super Admins pueden eliminarlo en cualquier momento.
Toma 1 argumento:
Argumento 1: #<id> donde <id> es la identificación del jugador objetivo.
Ejemplo: !setadmin #3 le dará administrador al jugador con id 3.`,
        function: setAdminCommand,
    },
    removeadmin: {
        aliases: ['unadmin'],
        roles: Role.MASTER,
        desc: `
	Este comando permite eliminar a alguien como administrador.
Toma 1 argumento:
Argumento 1: #<id> donde <id> es la identificación del jugador objetivo.
O
Argumento 1: <número> donde <número> es el número asociado con el administrador proporcionado por el comando 'admins'.
Ejemplo: !removeadmin #300 eliminará el administrador del jugador con id 300,
          !removeadmin 2 eliminará al administrador n°2 según el comando 'admins'.`,
        function: removeAdminCommand,
    },
    password: {
        aliases: ['pw'],
        roles: Role.MASTER,
        desc: `
       Este comando permite agregar una contraseña a la sala.
     Toma 1 argumento:
     Argumento 1: <password> donde <password> es la contraseña que desea para la sala.
    
     Para eliminar la contraseña de la sala, simplemente ingrese '!password'.`,
        function: passwordCommand,
    },
}

var commands2 = {

	"!camisetas": camisetasARSA,
	"!primeradiv": primeraDiv,
	"!segundadiv": segundaDiv,
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
}	

	var game = new Game()

		/* AUXILIARY FUNCTIONS */
function getDate() {
    let d = new Date();
    return d.toLocaleDateString() + ' ' + d.toLocaleTimeString();
}

/* MATH FUNCTIONS */

function getRandomInt(max) {
    // returns a random number between 0 and max-1
    return Math.floor(Math.random() * Math.floor(max));
}

function pointDistance(p1, p2) {
    return Math.sqrt(Math.pow(p1.x - p2.x, 2) + Math.pow(p1.y - p2.y, 2));
}

/* TIME FUNCTIONS */

function getHoursStats(time) {
    return Math.floor(time / 3600);
}

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

function getMinutesStats(time) {
    return Math.floor(time / 60) - getHoursStats(time) * 60;
}

function getSecondsGame(time) {
    var t = Math.floor(time - Math.floor(time / 60) * 60);
    return `${Math.floor(t / 10)}${Math.floor(t % 10)}`;
}

function getSecondsReport(time) {
    var t = Math.round(time);
    return Math.floor(t - getMinutesReport(t) * 60);
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

function getTimeStats(time) {
    if (getHoursStats(time) > 0) {
        return `${getHoursStats(time)}h${getMinutesStats(time)}m`;
    } else {
        return `${getMinutesStats(time)}m`;
    }
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
    if (gameWebhook != "") {
        let form = new FormData();
        form.append(null, new File([game.rec], getRecordingName(game), { "type": "text/plain" }));
        form.append("payload_json", JSON.stringify({
            "username": roomName
        }));

        fetch(gameWebhook, {
            method: 'POST',
            body: form,
        }).then((res) => res);
    }
}

/* FEATURE FUNCTIONS */

function getCommand(commandStr) {
    if (commands.hasOwnProperty(commandStr)) return commandStr;
    for (const [key, value] of Object.entries(commands)) {
        for (let alias of value.aliases) {
            if (alias == commandStr) return key;
        }
    }
    return false;
}

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

function sendAnnouncementTeam(message, team, color, style, mention) {
    for (let player of team) {
        room.sendAnnouncement(message, player.id, color, style, mention);
    }
}

function teamChat(player, message) {
    var msgArray = message.split(/ +/).slice(1);
    var emoji = player.team == Team.RED ? '🔴' : player.team == Team.BLUE ? '🔵' : '⚪';
    var message = `${emoji} [TEAM] ${player.name}: ${msgArray.join(' ')}`;
    var team = getTeamArray(player.team);
    var color = player.team == Team.RED ? redColor : player.team == Team.BLUE ? blueColor : null;
    var style = 'bold';
    var mention = HaxNotification.CHAT;
    sendAnnouncementTeam(message, team, color, style, mention);
}

function playerChat(player, message) {
    var msgArray = message.split(/ +/);
    var playerTargetIndex = playersAll.findIndex(
        (p) => p.name.replaceAll(' ', '_') == msgArray[0].substring(2)
    );
    if (playerTargetIndex == -1) {
        room.sendAnnouncement(
            `Jugador inválido, asegúrese de que el nombre que ingresó sea correcto.`,
            player.id,
            errorColor,
            'bold',
            null
        );
        return false;
    }
    var playerTarget = playersAll[playerTargetIndex];
    if (player.id == playerTarget.id) {
        room.sendAnnouncement(
            `No puedes enviarte un PM a ti mismo!`,
            player.id,
            errorColor,
            'bold',
            null
        );
        return false;
    }
    var messageFrom = `📝 [PM con ${playerTarget.name}] ${player.name}: ${msgArray.slice(1).join(' ')}`

    var messageTo = `📝 [PM con ${player.name}] ${player.name}: ${msgArray.slice(1).join(' ')}`

    room.sendAnnouncement(
        messageFrom,
        player.id,
        privateMessageColor,
        'bold',
        HaxNotification.CHAT
    );
    room.sendAnnouncement(
        messageTo,
        playerTarget.id,
        privateMessageColor,
        'bold',
        HaxNotification.CHAT
    );
}

/* PHYSICS FUNCTIONS */


function checkGoalKickTouch(array, index, goal) {
    if (array != null && array.length >= index + 1) {
        var obj = array[index];
        if (obj != null && obj.goal != null && obj.goal == goal) return obj;
    }
    return null;
}

/* BUTTONS */

function topButton() {
    if (teamSpec.length > 0) {
        if (teamRed.length == teamBlue.length && teamSpec.length > 1) {
            room.setPlayerTeam(teamSpec[0].id, Team.RED);
            room.setPlayerTeam(teamSpec[1].id, Team.BLUE);
        } else if (teamRed.length < teamBlue.length)
            room.setPlayerTeam(teamSpec[0].id, Team.RED);
        else room.setPlayerTeam(teamSpec[0].id, Team.BLUE);
    }
}

function randomButton() {
    if (teamSpec.length > 0) {
        if (teamRed.length == teamBlue.length && teamSpec.length > 1) {
            var r = getRandomInt(teamSpec.length);
            room.setPlayerTeam(teamSpec[r].id, Team.RED);
            teamSpec = teamSpec.filter((spec) => spec.id != teamSpec[r].id);
            room.setPlayerTeam(teamSpec[getRandomInt(teamSpec.length)].id, Team.BLUE);
        } else if (teamRed.length < teamBlue.length)
            room.setPlayerTeam(teamSpec[getRandomInt(teamSpec.length)].id, Team.RED);
        else
            room.setPlayerTeam(teamSpec[getRandomInt(teamSpec.length)].id, Team.BLUE);
    }
}

function blueToSpecButton() {
    clearTimeout(removingTimeout);
    removingPlayers = true;
    removingTimeout = setTimeout(() => {
        removingPlayers = false;
    }, 100);
    for (var i = 0; i < teamBlue.length; i++) {
        room.setPlayerTeam(teamBlue[teamBlue.length - 1 - i].id, Team.SPECTATORS);
    }
}

function redToSpecButton() {
    clearTimeout(removingTimeout);
    removingPlayers = true;
    removingTimeout = setTimeout(() => {
        removingPlayers = false;
    }, 100);
    for (var i = 0; i < teamRed.length; i++) {
        room.setPlayerTeam(teamRed[teamRed.length - 1 - i].id, Team.SPECTATORS);
    }
}

function resetButton() {
    clearTimeout(removingTimeout);
    removingPlayers = true;
    removingTimeout = setTimeout(() => {
        removingPlayers = false;
    }, 100);
    for (let i = 0; i < Math.max(teamRed.length, teamBlue.length); i++) {
        if (Math.max(teamRed.length, teamBlue.length) - teamRed.length - i > 0)
            room.setPlayerTeam(teamBlue[teamBlue.length - 1 - i].id, Team.SPECTATORS);
        else if (Math.max(teamRed.length, teamBlue.length) - teamBlue.length - i > 0)
            room.setPlayerTeam(teamRed[teamRed.length - 1 - i].id, Team.SPECTATORS);
        else break;
    }
    for (let i = 0; i < Math.min(teamRed.length, teamBlue.length); i++) {
        room.setPlayerTeam(
            teamBlue[Math.min(teamRed.length, teamBlue.length) - 1 - i].id,
            Team.SPECTATORS
        );
        room.setPlayerTeam(
            teamRed[Math.min(teamRed.length, teamBlue.length) - 1 - i].id,
            Team.SPECTATORS
        );
    }
}

function swapButton() {
    clearTimeout(removingTimeout);
    removingPlayers = true;
    removingTimeout = setTimeout(() => {
        removingPlayers = false;
    }, 100);
    for (let player of teamBlue) {
        room.setPlayerTeam(player.id, Team.RED);
    }
    for (let player of teamRed) {
        room.setPlayerTeam(player.id, Team.BLUE);
    }
}

/* COMMAND FUNCTIONS */

/* PLAYER COMMANDS */

function leaveCommand(player, message) {
    room.kickPlayer(player.id, 'Bye !', false);
}

function helpCommand(player, message) {
    var msgArray = message.split(/ +/).slice(1);
    if (msgArray.length == 0) {
        var commandString = '「✅」 Comandos disponibles :';
        for (const [key, value] of Object.entries(commands)) {
            if (value.desc && value.roles == Role.PLAYER) commandString += ` !${key},`;
        }
        commandString = commandString.substring(0, commandString.length - 1) + '.\n';
        if (getRole(player) >= Role.ADMIN_TEMP) {
            commandString += `「👑​」 Admin Comandos :`;
            for (const [key, value] of Object.entries(commands)) {
                if (value.desc && value.roles == Role.ADMIN_TEMP) commandString += ` !${key},`;
            }
            if (commandString.slice(commandString.length - 1) == ':')
                commandString += ` None,`;
            commandString = commandString.substring(0, commandString.length - 1) + '.\n';
        }
        if (getRole(player) >= Role.MASTER) {
            commandString += `「🌠​」Super Admin Comandos :`;
            for (const [key, value] of Object.entries(commands)) {
                if (value.desc && value.roles == Role.MASTER) commandString += ` !${key},`;
            }
            if (commandString.slice(commandString.length - 1) == ':') commandString += ` None,`;
            commandString = commandString.substring(0, commandString.length - 1) + '.\n';
        }
        commandString += "\nPara obtener información sobre un comando específico, escriba '!help <nombre del comando>'.";
        room.sendAnnouncement(
            commandString,
            player.id,
            0xd733ff,
            'bold',
            HaxNotification.CHAT
        );
    } else if (msgArray.length >= 1) {
        var commandName = getCommand(msgArray[0].toLowerCase());
        if (commandName != false && commands[commandName].desc != false)
            room.sendAnnouncement(
                `\'${commandName}\' Comando :\n${commands[commandName].desc}`,
                player.id,
                infoColor,
                'bold',
                HaxNotification.CHAT
            );
        else
            room.sendAnnouncement(
                `El comando sobre el que intentó obtener información no existe. Para comprobar todos los comandos disponibles, escriba \'!help\'`,
                player.id,
                errorColor,
                'bold',
                HaxNotification.CHAT
            );
    }
}

function globalStatsCommand(player, message) {
    var stats = new HaxStatistics(player.name);
    var stats;
		localStorage.getItem(getAuth(player)) ? stats = JSON.parse(localStorage.getAuth(authArray(player))) : stats = [0, 0, 0, 0, "0.00", 0, 0, 0, 0, "0.00"];
		room.sendAnnouncement("[📄] Stats de " + player.name + ": 🎮 Partidos Jugados: " + stats[Ss.GA] + ", ✅ Victorias: " + stats[Ss.WI] + ", ❌ Derrotas: " + stats[Ss.LS] + ", WR: " + stats[Ss.WR] + "%, ⚽️ Goles: " + stats[Ss.GL] + ", 👟 Asistencias: " +
			stats[Ss.AS] + ", 🤚 GK: " + stats[Ss.GK] + ", 🤚 Vallas: " + stats[Ss.CS] + ", 🤚 CS%: " + stats[Ss.CP] + "%", player.id,
			0x73EC59, "bold");
}

function renameCommand(player, message) {
    var msgArray = message.split(/ +/).slice(1);
    if (localStorage.getItem(authArray[player.id][0])) {
        var stats = JSON.parse(localStorage.getItem(authArray[player.id][0]));
        if (msgArray.length == 0) {
            stats.playerName = player.name;
        } else {
            stats.playerName = msgArray.join(' ');
        }
        localStorage.setItem(authArray[player.id][0], JSON.stringify(stats));
        room.sendAnnouncement(
            `Te renombraste con éxito ${stats.playerName} !`,
            player.id,
            successColor,
            'bold',
            HaxNotification.CHAT
        );
    } else {
        room.sendAnnouncement(
            `¡Aún no has jugado ningún partido en esta sala!`,
            player.id,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
    }
}

function statsLeaderboardCommand(player, message) {
    var key = message.split(/ +/)[0].substring(1).toLowerCase();
    printRankings(key, player.id);
}

function afkCommand(player, message) {
    if (player.team == Team.SPECTATORS || players.length == 1) {
        if (AFKSet.has(player.id)) {
            if (AFKMinSet.has(player.id)) {
                room.sendAnnouncement(
                    `Hay un mínimo de ${minAFKDuration} minutos de tiempo AFK. No abuses del comando !`,
                    player.id,
                    errorColor,
                    'bold',
                    HaxNotification.CHAT
                );
            } else {
                AFKSet.delete(player.id);
                room.sendAnnouncement(
                    `🌅 ${player.name} ya no esta AFK !`,
                    null,
                    announcementColor,
                    'bold',
                    null
                );
                updateTeams();
                handlePlayersJoin();
            }
        } else {
            if (AFKCooldownSet.has(player.id)) {
                room.sendAnnouncement(
                    `Solo puedes estar AFK cada ${AFKCooldown} minutos. No abuses del comando !`,
                    player.id,
                    errorColor,
                    'bold',
                    HaxNotification.CHAT
                );
            } else {
                AFKSet.add(player.id);
                if (!player.admin) {
                    AFKMinSet.add(player.id);
                    AFKCooldownSet.add(player.id);
                    setTimeout(
                        (id) => {
                            AFKMinSet.delete(id);
                        },
                        minAFKDuration * 60 * 1000,
                        player.id
                    );
                    setTimeout(
                        (id) => {
                            AFKSet.delete(id);
                        },
                        maxAFKDuration * 60 * 1000,
                        player.id
                    );
                    setTimeout(
                        (id) => {
                            AFKCooldownSet.delete(id);
                        },
                        AFKCooldown * 60 * 1000,
                        player.id
                    );
                }
                room.setPlayerTeam(player.id, Team.SPECTATORS);
                room.sendAnnouncement(
                    `😴 ${player.name} esta AFK !`,
                    null,
                    announcementColor,
                    'bold',
                    null
                );
                updateTeams();
                handlePlayersLeave();
            }
        }
    } else {
        room.sendAnnouncement(
            `No puedes ir AFK mientras estás en un equipo !`,
            player.id,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
    }
}

function afkListCommand(player, message) {
    if (AFKSet.size == 0) {
        room.sendAnnouncement(
            "😴 No hay nadie en la lista AFK.",
            player.id,
            announcementColor,
            'bold',
            null
        );
        return;
    }
    var cstm = '😴 AFK list : ';
    AFKSet.forEach((_, value) => {
        var p = room.getPlayer(value);
        if (p != null) cstm += p.name + `, `;
    });
    cstm = cstm.substring(0, cstm.length - 2) + '.';
    room.sendAnnouncement(cstm, player.id, announcementColor, 'bold', null);
}

function masterCommand(player, message) {
    var msgArray = message.split(/ +/).slice(1);
    if (parseInt(msgArray[0]) == masterPassword) {
        if (!masterList.includes(authArray[player.id][0])) {
            room.setPlayerAdmin(player.id, true);
            adminList = adminList.filter((a) => a[0] != authArray[player.id][0]);
            masterList.push(authArray[player.id][0]);
            room.sendAnnouncement(
                `${player.name} es ahora un Super Admin !`,
                null,
                announcementColor,
                'bold',
                HaxNotification.CHAT
            );
        } else {
            room.sendAnnouncement(
                `ya eres un Super Admin !`,
                player.id,
                errorColor,
                'bold',
                HaxNotification.CHAT
            );
        }
    }
}

/* ADMIN COMMANDS */

function restartCommand(player, message) {
    instantRestart();
}

function restartSwapCommand(player, message) {
    room.stopGame();
    swapButton();
    startTimeout = setTimeout(() => {
        room.startGame();
    }, 10);
}

function swapCommand(player, message) {
    if (playSituation == Situation.STOP) {
        swapButton();
        room.sendAnnouncement(
            '✔️ esquipos rotados !',
            null,
            announcementColor,
            'bold',
            null
        );
    } else {
        room.sendAnnouncement(
            `Detenga el juego antes de cambiar.`,
            player.id,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
    }
}

function kickTeamCommand(player, message) {
    var msgArray = message.split(/ +/);
    var reasonString = `Team kick by ${player.name}`;
    if (msgArray.length > 1) {
        reasonString = msgArray.slice(1).join(' ');
    }
    if (['!kickred', '!kickr'].includes(msgArray[0].toLowerCase())) {
        for (let i = 0; i < teamRed.length; i++) {
            setTimeout(() => {
                room.kickPlayer(teamRed[0].id, reasonString, false);
            }, i * 20)
        }
    } else if (['!kickblue', '!kickb'].includes(msgArray[0].toLowerCase())) {
        for (let i = 0; i < teamBlue.length; i++) {
            setTimeout(() => {
                room.kickPlayer(teamBlue[0].id, reasonString, false);
            }, i * 20)
        }
    } else if (['!kickspec', '!kicks'].includes(msgArray[0].toLowerCase())) {
        for (let i = 0; i < teamSpec.length; i++) {
            setTimeout(() => {
                room.kickPlayer(teamSpec[0].id, reasonString, false);
            }, i * 20)
        }
    }
}

function stadiumCommand(player, message) {
    var msgArray = message.split(/ +/);
    if (gameState == State.STOP) {
        if (['!rs'].includes(msgArray[0].toLowerCase())) {
            if (JSON.parse(realSoccerMap).name == 'realSoccerMap') {
                room.setDefaultStadium('realSoccerMap');
            } else {
                room.setCustomStadium(realSoccerMap);
            }
            currentStadium = 'realSoccerMap';
        }
    }
}

function muteCommand(player, message) {
    var msgArray = message.split(/ +/).slice(1);
    if (msgArray.length > 0) {
        if (msgArray[0].length > 0 && msgArray[0][0] == '#') {
            msgArray[0] = msgArray[0].substring(1, msgArray[0].length);
            if (room.getPlayer(parseInt(msgArray[0])) != null) {
                var playerMute = room.getPlayer(parseInt(msgArray[0]));
                var minutesMute = muteDuration;
                if (msgArray.length > 1 && parseInt(msgArray[1]) > 0) {
                    minutesMute = parseInt(msgArray[1]);
                }
                if (!playerMute.admin) {
                    var muteObj = new MutePlayer(playerMute.name, playerMute.id, authArray[playerMute.id][0]);
                    muteObj.setDuration(minutesMute);
                    room.sendAnnouncement(
                        `${playerMute.name} ha sido muteado por ${minutesMute} minutos.`,
                        null,
                        announcementColor,
                        'bold',
                        null
                    );
                } else {
                    room.sendAnnouncement(
                        `No puedes mutear a un administrador.`,
                        player.id,
                        errorColor,
                        'bold',
                        HaxNotification.CHAT
                    );
                }
            } else {
                room.sendAnnouncement(
                    `No hay ningún jugador con tal ID en la sala. Ingrese "!help mute" para obtener más información.`,
                    player.id,
                    errorColor,
                    'bold',
                    HaxNotification.CHAT
                );
            }
        } else {
            room.sendAnnouncement(
                `Formato incorrecto para su argumento. Ingrese "!help mute" para obtener más información.`,
                player.id,
                errorColor,
                'bold',
                HaxNotification.CHAT
            );
        }
    } else {
        room.sendAnnouncement(
            `Número incorrecto de argumentos. Ingrese "!help mute" para obtener más información.`,
            player.id,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
    }
}

function unmuteCommand(player, message) {
    var msgArray = message.split(/ +/).slice(1);
    if (msgArray.length > 0) {
        if (msgArray[0].length > 0 && msgArray[0][0] == '#') {
            msgArray[0] = msgArray[0].substring(1, msgArray[0].length);
            if (room.getPlayer(parseInt(msgArray[0])) != null) {
                var playerUnmute = room.getPlayer(parseInt(msgArray[0]));
                if (muteArray.getByPlayerId(playerUnmute.id) != null) {
                    var muteObj = muteArray.getByPlayerId(playerUnmute.id);
                    muteObj.remove()
                    room.sendAnnouncement(
                        `${playerUnmute.name} ha sido desmuteado !`,
                        null,
                        announcementColor,
                        'bold',
                        HaxNotification.CHAT
                    );
                } else {
                    room.sendAnnouncement(
                        `Este jugador no está muteado !`,
                        player.id,
                        errorColor,
                        'bold',
                        HaxNotification.CHAT
                    );
                }
            } else {
                room.sendAnnouncement(
                    `No hay ningún jugador con tal ID en la sala. Ingresa "!help unmute" para obtener más información.`,
                    player.id,
                    errorColor,
                    'bold',
                    HaxNotification.CHAT
                );
            }
        } else if (msgArray[0].length > 0 && parseInt(msgArray[0]) > 0 && muteArray.getById(parseInt(msgArray[0])) != null) {
            var playerUnmute = muteArray.getById(parseInt(msgArray[0]));
            playerUnmute.remove();
            room.sendAnnouncement(
                `${playerUnmute.name} ha sido desmuteado !`,
                null,
                announcementColor,
                'bold',
                HaxNotification.CHAT
            );
        } else {
            room.sendAnnouncement(
                `Formato incorrecto para su argumento. Ingresa "!help unmute" para obtener más información.`,
                player.id,
                errorColor,
                'bold',
                HaxNotification.CHAT
            );
        }
    } else {
        room.sendAnnouncement(
            `Número incorrecto de argumentos. Ingresa "!help unmute" para obtener más información.`,
            player.id,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
    }
}

function muteListCommand(player, message) {
    if (muteArray.list.length == 0) {
        room.sendAnnouncement(
            "🔇 No hay nadie en la lista de muteados.",
            player.id,
            announcementColor,
            'bold',
            null
        );
        return false;
    }
    var cstm = '🔇 Mute list : ';
    for (let mute of muteArray.list) {
        cstm += mute.name + `[${mute.id}], `;
    }
    cstm = cstm.substring(0, cstm.length - 2) + '.';
    room.sendAnnouncement(
        cstm,
        player.id,
        announcementColor,
        'bold',
        null
    );
}

/* MASTER COMMANDS */

function clearbansCommand(player, message) {
    var msgArray = message.split(/ +/).slice(1);
    if (msgArray.length == 0) {
        room.clearBans();
        room.sendAnnouncement(
            '✔️ Los ban han sido limpiados !',
            null,
            announcementColor,
            'bold',
            null
        );
        banList = [];
    } else if (msgArray.length == 1) {
        if (parseInt(msgArray[0]) > 0) {
            var ID = parseInt(msgArray[0]);
            room.clearBan(ID);
            if (banList.length != banList.filter((p) => p[1] != ID).length) {
                room.sendAnnouncement(
                    `✔️ ${banList.filter((p) => p[1] == ID)[0][0]} has sido desbaneado de la sala !`,
                    null,
                    announcementColor,
                    'bold',
                    null
                );
            } else {
                room.sendAnnouncement(
                    `El ID que ingresó no tiene un ban asociado. Ingrese "!help clearbans" para obtener más información.`,
                    player.id,
                    errorColor,
                    'bold',
                    HaxNotification.CHAT
                );
            }
            banList = banList.filter((p) => p[1] != ID);
        } else {
            room.sendAnnouncement(
                `Se ingresó una ID invalida. Ingrese "!help clearbans" para obtener más información.`,
                player.id,
                errorColor,
                'bold',
                HaxNotification.CHAT
            );
        }
    } else {
        room.sendAnnouncement(
            `Número incorrecto de argumentos. Ingrese "!help clearbans" para obtener más información.`,
            player.id,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
    }
}

function banListCommand(player, message) {
    if (banList.length == 0) {
        room.sendAnnouncement(
            "📢 No hay nadie en la Ban list.",
            player.id,
            announcementColor,
            'bold',
            null
        );
        return false;
    }
    var cstm = '📢 Ban list : ';
    for (let ban of banList) {
        cstm += ban[0] + `[${ban[1]}], `;
    }
    cstm = cstm.substring(0, cstm.length - 2) + '.';
    room.sendAnnouncement(
        cstm,
        player.id,
        announcementColor,
        'bold',
        null
    );
}

function adminListCommand(player, message) {
    if (adminList.length == 0) {
        room.sendAnnouncement(
            "📢 No hay nadie en la admin list.",
            player.id,
            announcementColor,
            'bold',
            null
        );
        return false;
    }
    var cstm = '📢 Admin list : ';
    for (let i = 0; i < adminList.length; i++) {
        cstm += adminList[i][1] + `[${i}], `;
    }
    cstm = cstm.substring(0, cstm.length - 2) + '.';
    room.sendAnnouncement(
        cstm,
        player.id,
        announcementColor,
        'bold',
        null
    );
}

function setAdminCommand(player, message) {
    var msgArray = message.split(/ +/).slice(1);
    if (msgArray.length > 0) {
        if (msgArray[0].length > 0 && msgArray[0][0] == '#') {
            msgArray[0] = msgArray[0].substring(1, msgArray[0].length);
            if (room.getPlayer(parseInt(msgArray[0])) != null) {
                var playerAdmin = room.getPlayer(parseInt(msgArray[0]));

                if (!adminList.map((a) => a[0]).includes(authArray[playerAdmin.id][0])) {
                    if (!masterList.includes(authArray[playerAdmin.id][0])) {
                        room.setPlayerAdmin(playerAdmin.id, true);
                        adminList.push([authArray[playerAdmin.id][0], playerAdmin.name]);
                        room.sendAnnouncement(
                            `${playerAdmin.name} es ahora un Administrador !`,
                            null,
                            announcementColor,
                            'bold',
                            HaxNotification.CHAT
                        );
                    } else {
                        room.sendAnnouncement(
                            `Este jugador ya es un Super Admin !`,
                            player.id,
                            errorColor,
                            'bold',
                            HaxNotification.CHAT
                        );
                    }
                } else {
                    room.sendAnnouncement(
                        `Este jugador ya es un administrador permanente !`,
                        player.id,
                        errorColor,
                        'bold',
                        HaxNotification.CHAT
                    );
                }
            } else {
                room.sendAnnouncement(
                    `No hay ningún jugador con tal ID en la sala. Introduzca "!help setadmin" para obtener más información.`,
                    player.id,
                    errorColor,
                    'bold',
                    HaxNotification.CHAT
                );
            }
        } else {
            room.sendAnnouncement(
                `Formato incorrecto para su argumento. Introduzca "!help setadmin" para obtener más información.`,
                player.id,
                errorColor,
                'bold',
                HaxNotification.CHAT
            );
        }
    } else {
        room.sendAnnouncement(
            `Número incorrecto de argumentos. Introduzca "!help setadmin" para obtener más información.`,
            player.id,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
    }
}

function removeAdminCommand(player, message) {
    var msgArray = message.split(/ +/).slice(1);
    if (msgArray.length > 0) {
        if (msgArray[0].length > 0 && msgArray[0][0] == '#') {
            msgArray[0] = msgArray[0].substring(1, msgArray[0].length);
            if (room.getPlayer(parseInt(msgArray[0])) != null) {
                var playerAdmin = room.getPlayer(parseInt(msgArray[0]));

                if (adminList.map((a) => a[0]).includes(authArray[playerAdmin.id][0])) {
                    room.setPlayerAdmin(playerAdmin.id, false);
                    adminList = adminList.filter((a) => a[0] != authArray[playerAdmin.id][0]);
                    room.sendAnnouncement(
                        `${playerAdmin.name} ya no es un administrador de la sala !`,
                        null,
                        announcementColor,
                        'bold',
                        HaxNotification.CHAT
                    );
                } else {
                    room.sendAnnouncement(
                        `Este jugador no es un administrador permanente !`,
                        player.id,
                        errorColor,
                        'bold',
                        HaxNotification.CHAT
                    );
                }
            } else {
                room.sendAnnouncement(
                    `No hay ningún jugador con tal ID en la sala. Ingresa "!help removeadmin" para obtener más información.`,
                    player.id,
                    errorColor,
                    'bold',
                    HaxNotification.CHAT
                );
            }
        } else if (msgArray[0].length > 0 && parseInt(msgArray[0]) < adminList.length) {
            var index = parseInt(msgArray[0]);
            var playerAdmin = adminList[index];
            if (playersAll.findIndex((p) => authArray[p.id][0] == playerAdmin[0]) != -1) {
                // check if there is the removed admin in the room
                var indexRem = playersAll.findIndex((p) => authArray[p.id][0] == playerAdmin[0]);
                room.setPlayerAdmin(playersAll[indexRem].id, false);
            }
            adminList.splice(index);
            room.sendAnnouncement(
                `${playerAdmin[1]} is not a room admin anymore !`,
                null,
                announcementColor,
                'bold',
                HaxNotification.CHAT
            );
        } else {
            room.sendAnnouncement(
                `Incorrect format for your argument. Enter "!help removeadmin" for more information.`,
                player.id,
                errorColor,
                'bold',
                HaxNotification.CHAT
            );
        }
    } else {
        room.sendAnnouncement(
            `Wrong number of arguments. Enter "!help removeadmin" for more information.`,
            player.id,
            errorColor,
            'bold',
            HaxNotification.CHAT
        );
    }
}

function passwordCommand(player, message) {
    var msgArray = message.split(/ +/).slice(1);
    if (msgArray.length > 0) {
        if (msgArray.length == 1 && msgArray[0] == '') {
            roomPassword = '';
            room.setPassword(null);
            room.sendAnnouncement(
                `La password de la sala ha sido removida.`,
                player.id,
                announcementColor,
                'bold',
                HaxNotification.CHAT
            );
        }
        roomPassword = msgArray.join(' ');
        room.setPassword(roomPassword);
        room.sendAnnouncement(
            `La password de la sala es ${roomPassword}.`,
            player.id,
            announcementColor,
            'bold',
            HaxNotification.CHAT
        );
    } else {
        if (roomPassword != '') {
            roomPassword = '';
            room.setPassword(null);
            room.sendAnnouncement(
                `La password de la sala ha sido removida`,
                player.id,
                announcementColor,
                'bold',
                HaxNotification.CHAT
            );
        } else {
            room.sendAnnouncement(
                `La sala actualmente no tiene contraseña. Ingrese "!help password" para obtener más información.`,
                player.id,
                errorColor,
                'bold',
                HaxNotification.CHAT
            );
        }
    }
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
        if (drawTimeLimit != 0) {
            goldenGoal = true;
            room.sendAnnouncement(
                '⚽ El primer gol gana !',
                null,
                announcementColor,
                'bold',
                HaxNotification.CHAT
            );
        }
    }
    if (Math.abs(scores.time - drawTimeLimit * 60 - scores.timeLimit) <= 0.01 && scores.timeLimit != 0) {
        if (!checkTimeVariable) {
            checkTimeVariable = true;
            setTimeout(() => {
                checkTimeVariable = false;
            }, 10);
            endGame(Team.SPECTATORS);
            room.stopGame();
            goldenGoal = false;
        }
    }
}

function instantRestart() {
    room.stopGame();
    startTimeout = setTimeout(() => {
        room.startGame();
    }, 10);
}

function resumeGame() {
    startTimeout = setTimeout(() => {
        room.startGame();
    }, 1000);
    setTimeout(() => {
        room.pauseGame(false);
    }, 500);
}

function endGame(winner) {
    if (players.length >= 1 * teamSize - 1) activateChooseMode();
    const scores = room.getScores();
    game.scores = scores;
    lastWinner = winner;
    endGameVariable = true;
    if (winner == Team.RED) {
        streak++;
        room.sendAnnouncement(
            `✨ Red Team es el ganador ${scores.red} - ${scores.blue} ! Racha actual: ${streak}`,
            null,
            redColor,
            'bold',
            HaxNotification.CHAT
        );
    } else if (winner == Team.BLUE) {
        streak = 1;
        room.sendAnnouncement(
            `✨ Blue Team es el ganador ${scores.blue} - ${scores.red} ! Racha actual: ${streak}`,
            null,
            blueColor,
            'bold',
            HaxNotification.CHAT
        );
    } else {
        streak = 0;
        room.sendAnnouncement(
            '💤 Límite de sorteo alcanzado !',
            null,
            announcementColor,
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
        `📊 Zona de juego: 🔴 ${actionString}\n` +
        `${CSString}`,
        null,
        announcementColor,
        'bold',
        HaxNotification.NONE
    );
    updateStats();
}

/* CHOOSING FUNCTIONS */

function activateChooseMode() {
    chooseMode = true;
    slowMode = chooseModeSlowMode;
    room.sendAnnouncement(
        `🐢 El modo lento cambió para elegir la duración del modo en: ${chooseModeSlowMode}s.`,
        null,
        announcementColor,
        'bold',
        HaxNotification.CHAT
    );
}

function deactivateChooseMode() {
    chooseMode = false;
    clearTimeout(timeOutCap);
    if (slowMode != defaultSlowMode) {
        slowMode = defaultSlowMode;
        room.sendAnnouncement(
            `🐢 El modo lento cambió para elegir la duración del modo en: ${defaultSlowMode}s.`,
            null,
            announcementColor,
            'bold',
            HaxNotification.CHAT
        );
    }
    redCaptainChoice = '';
    blueCaptainChoice = '';
}

function getSpecList(player) {
    if (player == null) return null;
    var cstm = 'Players : ';
    for (let i = 0; i < teamSpec.length; i++) {
        cstm += teamSpec[i].name + `[${i + 1}], `;
    }
    cstm = cstm.substring(0, cstm.length - 2) + '.';
    room.sendAnnouncement(
        cstm,
        player.id,
        infoColor,
        'bold',
        HaxNotification.CHAT
    );
}

function choosePlayer() {
    clearTimeout(timeOutCap);
    let captain;
    if (teamRed.length <= teamBlue.length && teamRed.length != 0) {
        captain = teamRed[0];
    } else if (teamBlue.length < teamRed.length && teamBlue.length != 0) {
        captain = teamBlue[0];
    }
    if (captain != null) {
        room.sendAnnouncement(
            "Para elegir un jugador, ingrese su número en la lista dada o use 'top', 'random' o 'bottom'.",
            captain.id,
            infoColor,
            'bold',
            HaxNotification.MENTION
        );
        timeOutCap = setTimeout(
            (player) => {
                room.sendAnnouncement(
                    `Apresurate ${player.name}, solamente ${Number.parseInt(String(chooseTime / 2))} segundos quedan para elegir !`,
                    player.id,
                    warningColor,
                    'bold',
                    HaxNotification.MENTION
                );
                timeOutCap = setTimeout(
                    (player) => {
                        room.kickPlayer(
                            player.id,
                            "No has elegido a tiempo !",
                            false
                        );
                    },
                    chooseTime * 500,
                    captain
                );
            },
            chooseTime * 1000,
            captain
        );
    }
    if (teamRed.length != 0 && teamBlue.length != 0) {
        getSpecList(teamRed.length <= teamBlue.length ? teamRed[0] : teamBlue[0]);
    }
}

function chooseModeFunction(player, message) {
    var msgArray = message.split(/ +/);
    if (player.id == teamRed[0].id || player.id == teamBlue[0].id) {
        if (teamRed.length <= teamBlue.length && player.id == teamRed[0].id) {
            if (['top', 'auto'].includes(msgArray[0].toLowerCase())) {
                room.setPlayerTeam(teamSpec[0].id, Team.RED);
                redCaptainChoice = 'top';
                clearTimeout(timeOutCap);
                room.sendAnnouncement(
                    `${player.name} elegiste Top !`,
                    null,
                    announcementColor,
                    'bold',
                    HaxNotification.CHAT
                );
            } else if (['random', 'rand'].includes(msgArray[0].toLowerCase())) {
                var r = getRandomInt(teamSpec.length);
                room.setPlayerTeam(teamSpec[r].id, Team.RED);
                redCaptainChoice = 'random';
                clearTimeout(timeOutCap);
                room.sendAnnouncement(
                    `${player.name} elegiste Random !`,
                    null,
                    announcementColor,
                    'bold',
                    HaxNotification.CHAT
                );
            } else if (['bottom', 'bot'].includes(msgArray[0].toLowerCase())) {
                room.setPlayerTeam(teamSpec[teamSpec.length - 1].id, Team.RED);
                redCaptainChoice = 'bottom';
                clearTimeout(timeOutCap);
                room.sendAnnouncement(
                    `${player.name} elegiste Bottom !`,
                    null,
                    announcementColor,
                    'bold',
                    HaxNotification.CHAT
                );
            } else if (!Number.isNaN(Number.parseInt(msgArray[0]))) {
                if (Number.parseInt(msgArray[0]) > teamSpec.length || Number.parseInt(msgArray[0]) < 1) {
                    room.sendAnnouncement(
                        `El numero es invalido !`,
                        player.id,
                        errorColor,
                        'bold',
                        HaxNotification.CHAT
                    );
                } else {
                    room.setPlayerTeam(
                        teamSpec[Number.parseInt(msgArray[0]) - 1].id,
                        Team.RED
                    );
                    room.sendAnnouncement(
                        `${player.name} eligio ${teamSpec[Number.parseInt(msgArray[0]) - 1].name} !`,
                        null,
                        announcementColor,
                        'bold',
                        HaxNotification.CHAT
                    );
                }
            } else return false;
            return true;
        }
        if (teamRed.length > teamBlue.length && player.id == teamBlue[0].id) {
            if (['top', 'auto'].includes(msgArray[0].toLowerCase())) {
                room.setPlayerTeam(teamSpec[0].id, Team.BLUE);
                blueCaptainChoice = 'top';
                clearTimeout(timeOutCap);
                room.sendAnnouncement(
                    `${player.name} elegiste Top !`,
                    null,
                    announcementColor,
                    'bold',
                    HaxNotification.CHAT
                );
            } else if (['random', 'rand'].includes(msgArray[0].toLowerCase())) {
                room.setPlayerTeam(
                    teamSpec[getRandomInt(teamSpec.length)].id,
                    Team.BLUE
                );
                blueCaptainChoice = 'random';
                clearTimeout(timeOutCap);
                room.sendAnnouncement(
                    `${player.name} elegiste Random !`,
                    null,
                    announcementColor,
                    'bold',
                    HaxNotification.CHAT
                );
            } else if (['bottom', 'bot'].includes(msgArray[0].toLowerCase())) {
                room.setPlayerTeam(teamSpec[teamSpec.length - 1].id, Team.BLUE);
                blueCaptainChoice = 'bottom';
                clearTimeout(timeOutCap);
                room.sendAnnouncement(
                    `${player.name} elegiste Bottom !`,
                    null,
                    announcementColor,
                    'bold',
                    HaxNotification.CHAT
                );
            } else if (!Number.isNaN(Number.parseInt(msgArray[0]))) {
                if (Number.parseInt(msgArray[0]) > teamSpec.length || Number.parseInt(msgArray[0]) < 1) {
                    room.sendAnnouncement(
                        `El numero es invalido !`,
                        player.id,
                        errorColor,
                        'bold',
                        HaxNotification.CHAT
                    );
                } else {
                    room.setPlayerTeam(
                        teamSpec[Number.parseInt(msgArray[0]) - 1].id,
                        Team.BLUE
                    );
                    room.sendAnnouncement(
                        `${player.name} eligio ${teamSpec[Number.parseInt(msgArray[0]) - 1].name} !`,
                        null,
                        announcementColor,
                        'bold',
                        HaxNotification.CHAT
                    );
                }
            } else return false;
            return true;
        }
    }
}

function checkCaptainLeave(player) {
    if (
        (teamRed.findIndex((red) => red.id == player.id) == 0 && chooseMode && teamRed.length <= teamBlue.length) ||
        (teamBlue.findIndex((blue) => blue.id == player.id) == 0 && chooseMode && teamBlue.length < teamRed.length)
    ) {
        choosePlayer();
        capLeft = true;
        setTimeout(() => {
            capLeft = false;
        }, 10);
    }
}

function slowModeFunction(player, message) {
    if (!player.admin) {
        if (!SMSet.has(player.id)) {
            SMSet.add(player.id);
            setTimeout(
                (number) => {
                    SMSet.delete(number);
                },
                slowMode * 1000,
                player.id
            );
        } else {
            return true;
        }
    }
    return false;
}

/* PLAYER FUNCTIONS */

function updateTeams() {
    playersAll = room.getPlayerList();
    players = playersAll.filter((p) => !AFKSet.has(p.id));
    teamRed = players.filter((p) => p.team == Team.RED);
    teamBlue = players.filter((p) => p.team == Team.BLUE);
    teamSpec = players.filter((p) => p.team == Team.SPECTATORS);
}

function updateAdmins(excludedPlayerID = 0) {
    if (players.length != 0 && players.filter((p) => p.admin).length < maxAdmins) {
        let playerArray = players.filter((p) => p.id != excludedPlayerID && !p.admin);
        let arrayID = playerArray.map((player) => player.id);
        room.setPlayerAdmin(Math.min(...arrayID), true);
    }
}

function getRole(player) {
    return (
        !!masterList.find((a) => a == authArray[player.id][0]) * 2 +
        !!adminList.find((a) => a[0] == authArray[player.id][0]) * 1 +
        player.admin * 1
    );
}

function ghostKickHandle(oldP, newP) {
    var teamArrayId = getTeamArray(oldP.team).map((p) => p.id);
    teamArrayId.splice(teamArrayId.findIndex((id) => id == oldP.id), 1, newP.id);

    room.kickPlayer(oldP.id, 'Ghost kick', false);
    room.setPlayerTeam(newP.id, oldP.team);
    room.setPlayerAdmin(newP.id, oldP.admin);
    room.reorderPlayers(teamArrayId, true);

    if (oldP.team != Team.SPECTATORS && playSituation != Situation.STOP) {
        var discProp = room.getPlayerDiscProperties(oldP.id);
        room.setPlayerDiscProperties(newP.id, discProp);
    }
}

/* ACTIVITY FUNCTIONS */

function handleActivityPlayer(player) {
    let pComp = getPlayerComp(player);
    if (pComp != null) {
        pComp.inactivityTicks++;
        if (pComp.inactivityTicks == 120 * ((2 / 3) * afkLimit)) {
            room.sendAnnouncement(
                `⛔ ${player.name}, si no te mueves o envías un mensaje en los próximos ${Math.floor(afkLimit / 3)} segundos, serás kickeado !`,
                player.id,
                warningColor,
                'bold',
                HaxNotification.MENTION
            );
            return;
        }
        if (pComp.inactivityTicks >= 60 * afkLimit) {
            pComp.inactivityTicks = 0;
            if (game.scores.time <= afkLimit - 0.5) {
                setTimeout(() => {
                    !chooseMode ? instantRestart() : room.stopGame();
                }, 10);
            }
            room.kickPlayer(player.id, 'AFK', false);
        }
    }
}

function handleActivityPlayerTeamChange(changedPlayer) {
    if (changedPlayer.team == Team.SPECTATORS) {
        let pComp = getPlayerComp(changedPlayer);
        if (pComp != null) pComp.inactivityTicks = 0;
    }
}

function handleActivityStop() {
    for (let player of players) {
        let pComp = getPlayerComp(player);
        if (pComp != null) pComp.inactivityTicks = 0;
    }
}

function handleActivity() {
    if (gameState === State.PLAY && players.length > 1) {
        for (let player of teamRed) {
            handleActivityPlayer(player);
        }
        for (let player of teamBlue) {
            handleActivityPlayer(player);
        }
    }
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

/* TEAM BALANCE FUNCTIONS */

function balanceTeams() {
    if (!chooseMode) {
        if (players.length == 0) {
            room.stopGame();
            room.setScoreLimit(scoreLimit);
            room.setTimeLimit(timeLimit);
        } else if (players.length == 1 && teamRed.length == 0) {
            instantRestart();
            setTimeout(() => {
                stadiumCommand(emptyPlayer, `!rs`);
            }, 5);
            room.setPlayerTeam(players[0].id, Team.RED);
        } else if (Math.abs(teamRed.length - teamBlue.length) == teamSpec.length && teamSpec.length > 0) {
            const n = Math.abs(teamRed.length - teamBlue.length);
            if (players.length == 2) {
                instantRestart();
                setTimeout(() => {
                    stadiumCommand(emptyPlayer, `!rs`);
                }, 5);
            }
            if (teamRed.length > teamBlue.length) {
                for (var i = 0; i < n; i++) {
                    room.setPlayerTeam(teamSpec[i].id, Team.BLUE);
                }
            } else {
                for (var i = 0; i < n; i++) {
                    room.setPlayerTeam(teamSpec[i].id, Team.RED);
                }
            }
        } else if (Math.abs(teamRed.length - teamBlue.length) > teamSpec.length) {
            const n = Math.abs(teamRed.length - teamBlue.length);
            if (players.length == 1) {
                instantRestart();
                setTimeout(() => {
                    stadiumCommand(emptyPlayer, `!training`);
                }, 5);
                room.setPlayerTeam(players[0].id, Team.RED);
                return;
            } else if (teamSize > 2 && players.length == 5) {
                instantRestart();
                setTimeout(() => {
                    stadiumCommand(emptyPlayer, `!clasicc`);
                }, 5);
            }
            if (players.length == teamSize * 2 - 1) {
                teamRedStats = [];
                teamBlueStats = [];
            }
            if (teamRed.length > teamBlue.length) {
                for (var i = 0; i < n; i++) {
                    room.setPlayerTeam(
                        teamRed[teamRed.length - 1 - i].id,
                        Team.SPECTATORS
                    );
                }
            } else {
                for (var i = 0; i < n; i++) {
                    room.setPlayerTeam(
                        teamBlue[teamBlue.length - 1 - i].id,
                        Team.SPECTATORS
                    );
                }
            }
        } else if (Math.abs(teamRed.length - teamBlue.length) < teamSpec.length && teamRed.length != teamBlue.length) {
            room.pauseGame(true);
            activateChooseMode();
            choosePlayer();
        } else if (teamSpec.length >= 4 && teamRed.length == teamBlue.length && teamRed.length < teamSize) {
            if (teamRed.length == 4) {
                instantRestart();
                setTimeout(() => {
                    stadiumCommand(emptyPlayer, `!rs`);
                }, 5);
            }
            topButton();
        }
    }
}

function handlePlayersJoin() {
    if (chooseMode) {
        if (teamSize > 4 && players.length == 8) {
            setTimeout(() => {
                stadiumCommand(emptyPlayer, `!rs`);
            }, 5);
        }
        getSpecList(teamRed.length <= teamBlue.length ? teamRed[0] : teamBlue[0]);
    }
    balanceTeams();
}

function handlePlayersLeave() {
    if (gameState != State.STOP) {
        var scores = room.getScores();
        if (players.length >= 2 * teamSize && scores.time >= (5 / 6) * game.scores.timeLimit && teamRed.length != teamBlue.length) {
            var rageQuitCheck = false;
            if (teamRed.length < teamBlue.length) {
                if (scores.blue - scores.red == 2) {
                    endGame(Team.BLUE);
                    rageQuitCheck = true;
                }
            } else {
                if (scores.red - scores.blue == 2) {
                    endGame(Team.RED);
                    rageQuitCheck = true;
                }
            }
            if (rageQuitCheck) {
                room.sendAnnouncement(
                    "Ragequit detected, game ended.",
                    null,
                    infoColor,
                    'bold',
                    HaxNotification.MENTION
                )
                stopTimeout = setTimeout(() => {
                    room.stopGame();
                }, 100);
                return;
            }
        }
    }
    if (chooseMode) {
        if (teamSize > 2 && players.length == 5) {
            setTimeout(() => {
                stadiumCommand(emptyPlayer, `!rs`);
            }, 5);
        }
        if (teamRed.length == 0 || teamBlue.length == 0) {
            room.setPlayerTeam(teamSpec[0].id, teamRed.length == 0 ? Team.RED : Team.BLUE);
            return;
        }
        if (Math.abs(teamRed.length - teamBlue.length) == teamSpec.length) {
            deactivateChooseMode();
            resumeGame();
            var b = teamSpec.length;
            if (teamRed.length > teamBlue.length) {
                for (var i = 0; i < b; i++) {
                    clearTimeout(insertingTimeout);
                    insertingPlayers = true;
                    setTimeout(() => {
                        room.setPlayerTeam(teamSpec[0].id, Team.BLUE);
                    }, 5 * i);
                }
                insertingTimeout = setTimeout(() => {
                    insertingPlayers = false;
                }, 5 * b);
            } else {
                for (var i = 0; i < b; i++) {
                    clearTimeout(insertingTimeout);
                    insertingPlayers = true;
                    setTimeout(() => {
                        room.setPlayerTeam(teamSpec[0].id, Team.RED);
                    }, 5 * i);
                }
                insertingTimeout = setTimeout(() => {
                    insertingPlayers = false;
                }, 5 * b);
            }
            return;
        }
        if (streak == 0 && gameState == State.STOP) {
            if (Math.abs(teamRed.length - teamBlue.length) == 2) {
                var teamIn = teamRed.length > teamBlue.length ? teamRed : teamBlue;
                room.setPlayerTeam(teamIn[teamIn.length - 1].id, Team.SPECTATORS)
            }
        }
        if (teamRed.length == teamBlue.length && teamSpec.length < 2) {
            deactivateChooseMode();
            resumeGame();
            return;
        }

        if (capLeft) {
            choosePlayer();
        } else {
            getSpecList(teamRed.length <= teamBlue.length ? teamRed[0] : teamBlue[0]);
        }
    }
    balanceTeams();
}

function handlePlayersTeamChange(byPlayer) {
    if (chooseMode && !removingPlayers && byPlayer == null) {
        if (Math.abs(teamRed.length - teamBlue.length) == teamSpec.length) {
            deactivateChooseMode();
            resumeGame();
            var b = teamSpec.length;
            if (teamRed.length > teamBlue.length) {
                for (var i = 0; i < b; i++) {
                    clearTimeout(insertingTimeout);
                    insertingPlayers = true;
                    setTimeout(() => {
                        room.setPlayerTeam(teamSpec[0].id, Team.BLUE);
                    }, 5 * i);
                }
                insertingTimeout = setTimeout(() => {
                    insertingPlayers = false;
                }, 5 * b);
            } else {
                for (var i = 0; i < b; i++) {
                    clearTimeout(insertingTimeout);
                    insertingPlayers = true;
                    setTimeout(() => {
                        room.setPlayerTeam(teamSpec[0].id, Team.RED);
                    }, 5 * i);
                }
                insertingTimeout = setTimeout(() => {
                    insertingPlayers = false;
                }, 5 * b);
            }
            return;
        } else if (
            (teamRed.length == teamSize && teamBlue.length == teamSize) ||
            (teamRed.length == teamBlue.length && teamSpec.length < 2)
        ) {
            deactivateChooseMode();
            resumeGame();
        } else if (teamRed.length <= teamBlue.length && redCaptainChoice != '') {
            if (redCaptainChoice == 'top') {
                room.setPlayerTeam(teamSpec[0].id, Team.RED);
            } else if (redCaptainChoice == 'random') {
                var r = getRandomInt(teamSpec.length);
                room.setPlayerTeam(teamSpec[r].id, Team.RED);
            } else {
                room.setPlayerTeam(teamSpec[teamSpec.length - 1].id, Team.RED);
            }
            return;
        } else if (teamBlue.length < teamRed.length && blueCaptainChoice != '') {
            if (blueCaptainChoice == 'top') {
                room.setPlayerTeam(teamSpec[0].id, Team.BLUE);
            } else if (blueCaptainChoice == 'random') {
                var r = getRandomInt(teamSpec.length);
                room.setPlayerTeam(teamSpec[r].id, Team.BLUE);
            } else {
                room.setPlayerTeam(teamSpec[teamSpec.length - 1].id, Team.BLUE);
            }
            return;
        } else {
            choosePlayer();
        }
    }
}

function handlePlayersStop(byPlayer) {
    if (byPlayer == null && endGameVariable) {
        if (chooseMode) {
            if (players.length == 2 * teamSize) {
                chooseMode = false;
                resetButton();
                for (var i = 0; i < teamSize; i++) {
                    clearTimeout(insertingTimeout);
                    insertingPlayers = true;
                    setTimeout(() => {
                        randomButton();
                    }, 200 * i);
                }
                insertingTimeout = setTimeout(() => {
                    insertingPlayers = false;
                }, 200 * teamSize);
                startTimeout = setTimeout(() => {
                    room.startGame();
                }, 2000);
            } else {
                if (lastWinner == Team.RED) {
                    blueToSpecButton();
                } else if (lastWinner == Team.BLUE) {
                    redToSpecButton();
                    setTimeout(() => {
                        swapButton();
                    }, 10);
                } else {
                    resetButton();
                }
                clearTimeout(insertingTimeout);
                insertingPlayers = true;
                setTimeout(() => {
                    topButton();
                }, 300);
                insertingTimeout = setTimeout(() => {
                    insertingPlayers = false;
                }, 300);
            }
        } else {
            if (players.length == 2) {
                if (lastWinner == Team.BLUE) {
                    swapButton();
                }
                startTimeout = setTimeout(() => {
                    room.startGame();
                }, 2000);
            } else if (players.length == 3 || players.length >= 2 * teamSize + 1) {
                if (lastWinner == Team.RED) {
                    blueToSpecButton();
                } else {
                    redToSpecButton();
                    setTimeout(() => {
                        swapButton();
                    }, 5);
                }
                clearTimeout(insertingTimeout);
                insertingPlayers = true;
                setTimeout(() => {
                    topButton();
                }, 200);
                insertingTimeout = setTimeout(() => {
                    insertingPlayers = false;
                }, 300);
                startTimeout = setTimeout(() => {
                    room.startGame();
                }, 2000);
            } else if (players.length == 4) {
                resetButton();
                clearTimeout(insertingTimeout);
                insertingPlayers = true;
                setTimeout(() => {
                    randomButton();
                    setTimeout(() => {
                        randomButton();
                    }, 500);
                }, 500);
                insertingTimeout = setTimeout(() => {
                    insertingPlayers = false;
                }, 2000);
                startTimeout = setTimeout(() => {
                    room.startGame();
                }, 2000);
            } else if (players.length == 5 || players.length >= 2 * teamSize + 1) {
                if (lastWinner == Team.RED) {
                    blueToSpecButton();
                } else {
                    redToSpecButton();
                    setTimeout(() => {
                        swapButton();
                    }, 5);
                }
                clearTimeout(insertingTimeout);
                insertingPlayers = true;
                insertingTimeout = setTimeout(() => {
                    insertingPlayers = false;
                }, 200);
                setTimeout(() => {
                    topButton();
                }, 200);
                activateChooseMode();
            } else if (players.length == 6) {
                resetButton();
                clearTimeout(insertingTimeout);
                insertingPlayers = true;
                insertingTimeout = setTimeout(() => {
                    insertingPlayers = false;
                }, 1500);
                setTimeout(() => {
                    randomButton();
                    setTimeout(() => {
                        randomButton();
                        setTimeout(() => {
                            randomButton();
                        }, 500);
                    }, 500);
                }, 500);
                startTimeout = setTimeout(() => {
                    room.startGame();
                }, 2000);
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
        return "🥅 No CS";
    } else if (playersCS.length == 1) {
        return `🥅 ${playersCS[0]} tiene una CS.`;
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
        handleGK();
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
                goalString = `⚽ ${getTimeGame(scores.time)} Gol de ${goalAttribution[0].name} ! Asistido por ${goalAttribution[1].name}. Goal speed : ${ballSpeed.toFixed(2)}km/h.`;
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

/* ROOM STATS FUNCTIONS */

function updatePlayerStats(player, teamStats) {
    var stats = new HaxStatistics(player.name);
    var pComp = getPlayerComp(player);
    if (localStorage.getItem(authArray[player.id][0])) {
        stats = JSON.parse(localStorage.getItem(authArray[player.id][0]));
    }
    stats.games++;
    if (lastWinner == teamStats) stats.wins++;
    stats.winrate = ((100 * stats.wins) / (stats.games || 1)).toFixed(1) + `%`;
    stats.goals += getGoalsPlayer(pComp);
    stats.assists += getAssistsPlayer(pComp);
    stats.ownGoals += getOwnGoalsPlayer(pComp);
    stats.CS += getCSPlayer(pComp);
    stats.playtime += getGametimePlayer(pComp);
    localStorage.setItem(authArray[player.id][0], JSON.stringify(stats));
}

function updateStats() {
    if (
        players.length >= 2 * teamSize &&
        (
            game.scores.time >= (5 / 6) * game.scores.timeLimit ||
            game.scores.red == game.scores.scoreLimit ||
            game.scores.blue == game.scores.scoreLimit
        ) &&
        teamRedStats.length >= teamSize && teamBlueStats.length >= teamSize
    ) {
        for (let player of teamRedStats) {
            updatePlayerStats(player, Team.RED);
        }
        for (let player of teamBlueStats) {
            updatePlayerStats(player, Team.BLUE);
        }
    }
	if (players.length >= 2 * maxTeamSize && (game.scores.time >= (5 / 6) * game.scores.timeLimit || game.scores.red == game.scores.scoreLimit || game.scores.blue == game.scores.scoreLimit) && allReds.length >= maxTeamSize && allBlues.length >= maxTeamSize) {
		var stats;
		for (var i = 0; i < allReds.length; i++) {
			localStorage.getItem(getAuth(allReds[i])) ? stats = JSON.parse(localStorage.getItem(getAuth(allReds[i]))) : stats = [0,
				0, 0, 0, "0.00", 0, 0, 0, 0, "0.00", "player", allReds[i].name
			];
			stats[Ss.GA]++;
			lastWinner == Team.RED ? stats[Ss.WI]++ : lastWinner == Team.BLUE ? stats[Ss.LS]++ : stats[Ss.DR]++;
			stats[Ss.WR] = (100 * stats[Ss.WI] / stats[Ss.GA]).toPrecision(3);
			localStorage.setItem(getAuth(allReds[i]), JSON.stringify(stats));
		}
		for (var i = 0; i < allBlues.length; i++) {
			localStorage.getItem(getAuth(allBlues[i])) ? stats = JSON.parse(localStorage.getItem(getAuth(allBlues[i]))) : stats = [0, 0, 0, 0, "0.00", 0, 0, 0, 0, "0.00", "player", allBlues[i].name];
			stats[Ss.GA]++;
			lastWinner == Team.BLUE ? stats[Ss.WI]++ : lastWinner == Team.RED ? stats[Ss.LS]++ : stats[Ss.DR]++;
			stats[Ss.WR] = (100 * stats[Ss.WI] / stats[Ss.GA]).toPrecision(3);
			localStorage.setItem(getAuth(allBlues[i]), JSON.stringify(stats));
		}
		for (var i = 0; i < game.goals.length; i++) {
			if (game.goals[i].striker != null) {
				if ((allBlues.concat(allReds)).findIndex((player) => player.id == game.goals[i].striker.id) != -1) {
					stats = JSON.parse(localStorage.getItem(getAuth(game.goals[i].striker)));
					stats[Ss.GL]++;
					localStorage.setItem(getAuth(game.goals[i].striker), JSON.stringify(stats));
				}
			}
			if (game.goals[i].assist != null) {
				if ((allBlues.concat(allReds)).findIndex((player) => player.name == game.goals[i].assist.name) != -1) {
					stats = JSON.parse(localStorage.getItem(getAuth(game.goals[i].assist)));
					stats[Ss.AS]++;
					localStorage.setItem(getAuth(game.goals[i].assist), JSON.stringify(stats));
				}
			}
		}
		if (allReds.findIndex((player) => player.id == GKList[0].id) != -1) {
			stats = JSON.parse(localStorage.getItem(getAuth(GKList[0])));
			stats[Ss.GK]++;
			game.scores.blue == 0 ? stats[Ss.CS]++ : null;
			stats[Ss.CP] = (100 * stats[Ss.CS] / stats[Ss.GK]).toPrecision(3);
			localStorage.setItem(getAuth(GKList[0]), JSON.stringify(stats));
		}
		if (allBlues.findIndex((player) => player.id == GKList[1].id) != -1) {
			stats = JSON.parse(localStorage.getItem(getAuth(GKList[1])));
			stats[Ss.GK]++;
			game.scores.red == 0 ? stats[Ss.CS]++ : null;
			stats[Ss.CP] = (100 * stats[Ss.CS] / stats[Ss.GK]).toPrecision(3);
			localStorage.setItem(getAuth(GKList[1]), JSON.stringify(stats));
		}
	}
}

function printRankings(statKey, id = 0) {
    var leaderboard = [];
    for (var i = 0; i < localStorage.length; i++) {
        var key = localStorage.key(i);
        if (key.length == 43)
            leaderboard.push([
                JSON.parse(localStorage.getItem(key)).playerName,
                JSON.parse(localStorage.getItem(key))[statKey],
            ]);
    }
    if (leaderboard.length < 5) {
        if (id != 0) {
            room.sendAnnouncement(
                'Aún no se han jugado suficientes partidos !',
                id,
                errorColor,
                'bold',
                HaxNotification.CHAT
            );
        }
        return;
    }
    leaderboard.sort(function (a, b) { return b[1] - a[1]; });
    var rankingString = `${statKey.charAt(0).toUpperCase() + statKey.slice(1)}> `;
    for (let i = 0; i < 5; i++) {
        let playerName = leaderboard[i][0];
        let playerStat = leaderboard[i][1];
        if (statKey == 'tiempo de juego') playerStat = getTimeStats(playerStat);
        rankingString += `#${i + 1} ${playerName} : ${playerStat}, `;
    }
    rankingString = rankingString.substring(0, rankingString.length - 2);
    room.sendAnnouncement(
        rankingString,
        id,
        infoColor,
        'bold',
        HaxNotification.CHAT
    );
}

/* GET STATS FUNCTIONS */

function getGamePlayerStats(player) {
    var stats = new HaxStatistics(player.name);
    var pComp = getPlayerComp(player);
    stats.goals += getGoalsPlayer(pComp);
    stats.assists += getAssistsPlayer(pComp);
    stats.ownGoals += getOwnGoalsPlayer(pComp);
    stats.playtime += getGametimePlayer(pComp);
    stats.CS += getCSPlayer(pComp);
    return stats;
}

function getGametimePlayer(pComp) {
    var timePlayer = 0;
    for (let j = 0; j < pComp.timeEntry.length; j++) {
        if (pComp.timeExit.length < j + 1) {
            timePlayer += game.scores.time - pComp.timeEntry[j];
        } else {
            timePlayer += pComp.timeExit[j] - pComp.timeEntry[j];
        }
    }
    return Math.floor(timePlayer);
}

function getGoalsPlayer(pComp) {
    var goalPlayer = 0;
    for (let goal of game.goals) {
        if (goal.striker != null && goal.team === pComp.player.team) {
            if (authArray[goal.striker.id][0] == pComp.auth) {
                goalPlayer++;
            }
        }
    }
    return goalPlayer;
}

function getOwnGoalsPlayer(pComp) {
    var goalPlayer = 0;
    for (let goal of game.goals) {
        if (goal.striker != null && goal.team !== pComp.player.team) {
            if (authArray[goal.striker.id][0] == pComp.auth) {
                goalPlayer++;
            }
        }
    }
    return goalPlayer;
}

function getAssistsPlayer(pComp) {
    var assistPlayer = 0;
    for (let goal of game.goals) {
        if (goal.assist != null) {
            if (authArray[goal.assist.id][0] == pComp.auth) {
                assistPlayer++;
            }
        }
    }
    return assistPlayer;
}

function findGK() {
	var tab = [
		[-1, ""],
		[-1, ""]
	];
	for (var i = 0; i < extendedP.length; i++) {
		if (room.getPlayer(extendedP[i][eP.ID]) != null && room.getPlayer(extendedP[i][eP.ID]).team == Team.RED) {
			if (tab[0][0] < extendedP[i][eP.GK]) {
				tab[0][0] = extendedP[i][eP.GK];
				tab[0][1] = room.getPlayer(extendedP[i][eP.ID]);
			}
		} else if (room.getPlayer(extendedP[i][eP.ID]) != null && room.getPlayer(extendedP[i][eP.ID]).team == Team.BLUE) {
			if (tab[1][0] < extendedP[i][eP.GK]) {
				tab[1][0] = extendedP[i][eP.GK];
				tab[1][1] = room.getPlayer(extendedP[i][eP.ID]);
			}
		}
	}
	GKList = [tab[0][1], tab[1][1]];
}

function getGKPlayer(pComp) {
    let GKRed = getGK(Team.RED);
    if (pComp.auth == GKRed?.auth) {
        return Team.RED;
    }
    let GKBlue = getGK(Team.BLUE);
    if (pComp.auth == GKBlue?.auth) {
        return Team.BLUE;
    }
    return Team.SPECTATORS;
}

function getCSPlayer(pComp) {
    if (getGKPlayer(pComp) == Team.RED && game.scores.blue == 0) {
        return 1;
    } else if (getGKPlayer(pComp) == Team.BLUE && game.scores.red == 0) {
        return 1;
    }
    return 0;
}

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

/* PRINT FUNCTIONS */

function printPlayerStats(stats) {
    let statsString = '';
    for (let [key, value] of Object.entries(stats)) {
        if (key == 'playerName') statsString += `${value}: `;
        else {
            if (key == 'playtime') value = getTimeStats(value);
            let reCamelCase = /([A-Z](?=[a-z]+)|[A-Z]+(?![a-z]))/g;
            let statName = key.replaceAll(reCamelCase, ' $1').trim();
            statsString += `${statName.charAt(0).toUpperCase() + statName.slice(1)}: ${value}, `;
        }
    }
    statsString = statsString.substring(0, statsString.length - 2);
    return statsString;
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
    var redTeamTimes = game.playerComp[0].map((p) => [p.player, getGametimePlayer(p)]);
    var blueTeamTimes = game.playerComp[1].map((p) => [p.player, getGametimePlayer(p)]);

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
    for (let i = 0; i < game.goals.length; i++) {
        goals[game.goals[i].team - 1].push([game.goals[i].striker, game.goals[i].assist]);
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
    var logChannel = gameWebhook;
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
                title: `📝 REPORTE DEL PARTIDO #${getIdReport()}`,
                description:
                    `**${getTimeEmbed(game.scores.time)}** ` +
                    (win == 1 ? '**Red Team** ' : 'Red Team ') + game.scores.red +
                    ' - ' +
                    game.scores.blue + (win == 2 ? ' **Blue Team**' : ' Blue Team') +
                    '\n```c\nPosesion: ' + possRString + '% - ' + possBString + '%' +
                    '\nZona de juego: ' + zoneRString + '% - ' + zoneBString + '%\n```\n\n',
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

/* BLACKLIST */

var blacklist = [

{
    Auth: "qVSpQ6wbD4_50EO_FpJ7TjkSEZXuLpp9hUyM7n6mQ2Q",
    Conn: "3136372E35392E38362E313133"
},
{
    Auth: "qMKi-jI7AEe0pMsdMSVrCvWrZu89J0DkasBNaN2D8pk",
    Conn: "3139302E34352E33322E3435"
},
{
    Auth: "qMKi-jI7AEe0pMsdMSVrCvWrZu89J0DkasBNaN2D8pk",
    Conn: "3139302E34352E33322E3435"
},
{
    Auth: "lgOmYJr8IL1DB1jSXFye22OXXem5rKBbcyCvmyc0v-g",
    Conn: "3139302E34352E33322E3435"
},
{
    Auth: "nzyORqXqyHp2cGwuQgAnnSdGCrQgWgaXM69TlSaAk88",
    Conn: "3139302E35352E3137352E3231"
},
{
    Auth: "02OsqpHP5DiZTyz7KukeNAE7BWQl1gQryiYSCwK1bss",
    Conn: "3138362E32322E31362E3939"
}, {
    Auth: "LQEwoUnXiW-Pk6GDnuqOuUPkZR8F0jWE-uI-CRkWalg",
    Conn: "3139302E3233302E3131382E3334"
}, {
    Auth: "cw2oGzVW-rDZk8ItwTNGeiaLMwrS5Dv5xMYY05k3vVc",
    Conn: "3136372E35372E3133332E313730"
}, {
    Auth: "qMKi-jI7AEe0pMsdMSVrCvWrZu89J0DkasBNaN2D8pk",
    Conn: "3139312E3131342E31382E3131"
}, {
    Auth: "qMKi-jI7AEe0pMsdMSVrCvWrZu89J0DkasBNaN2D8pk",
    Conn: "3139312E3131342E31382E3131"
}, {
    Auth: "47opJIRv15JYYnobBcSeXpDDdWuxYbcrEDO6dG-QeTA",
    Conn: "3136372E35382E31332E3739"
}, {
    Auth: "-_k5Am3g3gP52DAkO3GX_DofWoyga-u0JYuYMeRpMsw",
    Conn: "3137372E3232302E3137392E3932"
}, {
    Auth: "IZZvesNkQmHiHDjErolN0_VouFeBz6yZNrf-CKl_Cx4",
    Conn: "3138312E34342E3131302E3238"
}, {
    Auth: "dKAq6HyoI84_K_jmANpyLhEnPpkMNnUtyvgq9zZ5cYE",
    Conn: "3137392E32362E3130352E313433"
}, {
    Auth: "WkY9qguPStnnrrQZ6GANKb4FyRCqkUiHctdTr2nrdIw",
    Conn: "3137392E32362E3130352E313433"
}, {
    Auth: "SMUvMJyNqZMb38X8HSVUZa7XIn1uJzgXHZAlD1EPUu4",
    Conn: "3230302E3132352E35302E3436"
}, {
    Auth: "WBOLwwY6FVVDWSCP4hc3mag1yFjwBLt7TqKSnfldPFU",
    Conn: "3138312E3132312E33342E313230"
}, {
    Auth: "02OsqpHP5DiZTyz7KukeNAE7BWQl1gQryiYSCwK1bss",
    Conn: "3138362E32322E31362E3939"
}, {
    Auth: "LQEwoUnXiW-Pk6GDnuqOuUPkZR8F0jWE-uI-CRkWalg",
    Conn: "3139302E3233302E3131382E3334"
}, {
    Auth: "cw2oGzVW-rDZk8ItwTNGeiaLMwrS5Dv5xMYY05k3vVc",
    Conn: "3136372E35372E3133332E313730"
}];

function isBlacklisted(player){
    return blacklist.filter(b => b.Auth == player.auth || b.Conn == player.conn).length > 0;
}

/* PUBLICIDAD */

function PublicitaDiscord(player) {
var scores = room.getScores();
if (scores.time > 20 && !isTimeAddedShownseis) {
room.sendAnnouncement("                                        ▒█▀▀▄ ▀█▀ ▒█▀▀▀█ ▒█▀▀█ ▒█▀▀▀█ ▒█▀▀█ ▒█▀▀▄ ", null, 0x9250FD, "bold")
room.sendAnnouncement("                                        ▒█░▒█ ▒█░ ░▀▀▀▄▄ ▒█░░░ ▒█░░▒█ ▒█▄▄▀ ▒█░▒█ ", null, 0x8466FD, "bold")
room.sendAnnouncement("                                        ▒█▄▄▀ ▄█▄ ▒█▄▄▄█ ▒█▄▄█ ▒█▄▄▄█ ▒█░▒█ ▒█▄▄▀ ", null, 0x7B73FD, "bold");
room.sendAnnouncement("                                        💬 https://discord.gg/QRuJ3fvDbM ⬅⬅⬅ 𝗔𝗦𝗢𝗖𝗜𝗔𝗖𝗜𝗢́𝗡 𝗗𝗘 𝗥𝗘𝗔𝗟 𝗦𝗢𝗖𝗖𝗘𝗥 𝗔𝗥𝗚𝗘𝗡𝗧𝗜𝗡𝗢", null, 0xF6FF43, "bold");
isTimeAddedShownseis = true;
}
}

function PublicitaHelp(player) {
var scores = room.getScores();
if (scores.time > 10 && !isTimeAddedShowncinco) {
room.sendAnnouncement("「📣」 ¡𝗨𝘀𝗮 '!help' 𝗽𝗮𝗿𝗮 𝘃𝗲𝗿 𝗹𝗮 𝗹𝗶𝘀𝘁𝗮 𝗱𝗲 𝗰𝗼𝗺𝗮𝗻𝗱𝗼𝘀 𝗱𝗶𝘀𝗽𝗼𝗻𝗶𝗯𝗹𝗲𝘀!", player, 0xd733ff, "bold", 0);
isTimeAddedShowncinco = true;
}
}

function PublicitaHelp2(player) {
var scores = room.getScores();
if (scores.time > 10 && !isTimeAddedShowncinco) {
room.sendAnnouncement(
        `👋 ${player.name}\n
        \nIngrese "-admin" para obtener admin si no hay ninguno en el host, "!camisetas" para poner las camisetas de los equipos de ARSA, "!llamaradmin" para solicitar un administrador y "!llamarjugadores" para que vengan a jugar. !`,
        player.id,
        welcomeColor,
        'bold',
        HaxNotification.CHAT
    );

isTimeAddedShowncinco = true;
}
}

function PublicitaDiscord2(player) {
var scores = room.getScores();
if (scores.time > 20 && !isTimeAddedShownseis) {
room.sendAnnouncement(`🌟​🏆​ 𝗟𝗢𝗦 𝗗𝗜𝗔𝗦 𝗩𝗜𝗘𝗥𝗡𝗘𝗦 𝗘𝗡𝗧𝗥𝗘𝗚𝗔𝗠𝗢𝗦 𝗟𝗢𝗦 𝗣𝗥𝗘𝗠𝗜𝗢𝗦 𝗦𝗘𝗠𝗔𝗡𝗔𝗟𝗘𝗦 𝗘𝗡 𝗡𝗨𝗘𝗦𝗧𝗥𝗢 𝗗𝗜𝗦𝗖𝗢𝗥𝗗 𝗢𝗙𝗜𝗖𝗜𝗔𝗟❗`, player, 0xd733ff, "bold", 0)
isTimeAddedShownseis = true;
}
}

function PublicitaLiga(player) {
var scores = room.getScores();
if (scores.time > 80 && !isTimeAddedShowncuatro) {
room.sendAnnouncement("「📣」 𝗔𝗥𝗦𝗔 𝗲𝘀 𝘂𝗻𝗮 𝗹𝗶𝗴𝗮 𝗵𝗶𝘀𝘁𝗼𝗿𝗶𝗰𝗮𝗺𝗲𝗻𝘁𝗲 𝗰𝗼𝗻𝘀𝗮𝗴𝗿𝗮𝗱𝗮 𝗰𝗼𝗺𝗼 𝗻𝘂𝗺𝗲𝗿𝗼 𝟭 𝗲𝗻 𝗥𝗲𝗮𝗹 𝗦𝗼𝗰𝗰𝗲𝗿, 𝗻𝘂𝗲𝘀𝘁𝗿𝗮 𝗶𝗻𝗺𝗲𝗻𝘀𝗮 𝗵𝗶𝘀𝘁𝗼𝗿𝗶𝗮, 𝗰𝗼𝗺𝗽𝗿𝗼𝗺𝗶𝘀𝗼 𝘆 𝗽𝗿𝗼𝗴𝗿𝗲𝘀𝗼 𝗵𝗮𝗰𝗶𝗮 𝗵𝗮𝘅𝗯𝗮𝗹𝗹 𝗻𝗼𝘀 𝗹𝗹𝗲𝘃𝗼 𝗮 𝗽𝗿𝗲𝘀𝘁𝗮𝗿 𝗱𝗶𝘀𝘁𝗶𝗻𝘁𝗮𝘀 𝗽𝗿𝗼𝗽𝘂𝗲𝘀𝘁𝗮𝘀 𝗱𝗲 𝗷𝘂𝗲𝗴𝗼 𝗮 𝗰𝗮𝗱𝗮 𝗽𝗲𝗿𝘀𝗼𝗻𝗮. 𝗤𝘂𝗲 𝗲𝘀𝘁𝗮𝘀 𝗲𝘀𝗽𝗲𝗿𝗮𝗻𝗱𝗼 𝗽𝗮𝗿𝗮 𝘀𝗲𝗿 𝗽𝗮𝗿𝘁𝗲 𝗱𝗲 𝗹𝗮 𝗺𝗲𝗷𝗼𝗿 𝗹𝗶𝗴𝗮 𝗱𝗲𝗹 𝗺𝘂𝗻𝗱𝗼❓ 𝗨𝗡𝗜𝗧𝗘❗ 𝗵𝘁𝘁𝗽𝘀://𝗱𝗶𝘀𝗰𝗼𝗿𝗱.𝗴𝗴/𝗤𝗥𝘂𝗝𝟯𝗳𝘃𝗗𝗯𝗠", player, 0xd733ff, "bold", 0);
isTimeAddedShowncuatro = true;
}
}

/* RANGOS */

var extendedP = [];
const eP = {
	ID: 0,
	AUTH: 1,
	CONN: 2,
};
const Ss = {
	GA: 0,
	WI: 1,
	DR: 2,
	LS: 3,
	WR: 4,
	GL: 5,
	AS: 6,
	GK: 7,
	CS: 8,
	CP: 9,
	RL: 10,
	NK: 11
}
var statNumber = 0;
var players;
var teamR;
var teamB;
var teamS;
var game;
var GKList = ["", ""];
var allBlues = []; // This is to count the players who should be counted for the stats. This includes players who left after the game has started, doesn't include those who came too late or ...
var allReds = []; // ... those who came in a very unequal game.
var statInterval = 6;
var maxTeamSize = 4;

function getAuth(player) {
	return extendedP.filter((a) => a[0] == player.id) != null ? extendedP.filter((a) => a[0] == player.id)[0][eP.AUTH] : null;
}

setInterval(() => {
	var tableau = [];
	if (statNumber % 5 == 0) {
		Object.keys(localStorage).forEach(function(key) {
			if (!["player_name", "view_mode", "geo", "avatar", "player_auth_key"].includes(key)) {
				tableau.push([(JSON.parse(localStorage.getItem(key))[Ss.NK]), (JSON.parse(localStorage.getItem(key))[Ss.GA])]);
			}
		});
		if (tableau.length < 5) {
			return false;
		}

		tableau.sort(function(a, b) {
			return b[1] - a[1];
		});
		room.sendChat("Partidos Jugados> #1 " + tableau[0][0] + ": " + tableau[0][1] + " #2 " + tableau[1][0] + ": " + tableau[1][1] + " #3 " + tableau[2][0] + ": " + tableau[2][1] + " #4 " + tableau[3][0] + ": " + tableau[3][1] + " #5 " + tableau[4]
			[0] + ": " + tableau[4][1]);
	}
	if (statNumber % 5 == 1) {
		Object.keys(localStorage).forEach(function(key) {
			if (!["player_name", "view_mode", "geo", "avatar", "player_auth_key"].includes(key)) {
				tableau.push([(JSON.parse(localStorage.getItem(key))[Ss.NK]), (JSON.parse(localStorage.getItem(key))[Ss.WI])]);
			}
		});
		if (tableau.length < 5) {
			return false;
		}
		tableau.sort(function(a, b) {
			return b[1] - a[1];
		});
		room.sendChat("Victorias> #1 " + tableau[0][0] + ": " + tableau[0][1] + " #2 " + tableau[1][0] + ": " + tableau[1][1] + "#3 " + tableau[2][0] + ": " + tableau[2][1] + " #4 " + tableau[3][0] + ": " + tableau[3][1] + " #5 " + tableau[4][0] + ": " + tableau[4][1]);
	}
	if (statNumber % 5 == 2) {
		Object.keys(localStorage).forEach(function(key) {
			if (!["player_name", "view_mode", "geo", "avatar", "player_auth_key"].includes(key)) {
				tableau.push([(JSON.parse(localStorage.getItem(key))[Ss.NK]), (JSON.parse(localStorage.getItem(key))[Ss.GL])]);
			}
		});
		if (tableau.length < 5) {
			return false;
		}
		tableau.sort(function(a, b) {
			return b[1] - a[1];
		});
		room.sendChat("Goles> #1 " + tableau[0][0] + ": " + tableau[0][1] + " #2 " + tableau[1][0] + ": " + tableau[1][1] + " #3 " +
			tableau[2][0] + ": " + tableau[2][1] + " #4 " + tableau[3][0] + ": " + tableau[3][1] + " #5 " + tableau[4][0] + ": " + tableau[4][1]);
	}
	if (statNumber % 5 == 3) {
		Object.keys(localStorage).forEach(function(key) {
			if (!["player_name", "view_mode", "geo", "avatar", "player_auth_key"].includes(key)) {
				tableau.push([(JSON.parse(localStorage.getItem(key))[Ss.NK]), (JSON.parse(localStorage.getItem(key))[Ss.AS])]);
			}
		});
		if (tableau.length < 5) {
			return false;
		}
		tableau.sort(function(a, b) {
			return b[1] - a[1];
		});
		room.sendChat("Asistencias> #1 " + tableau[0][0] + ": " + tableau[0][1] + " #2 " + tableau[1][0] + ": " + tableau[1][1] +
			"#3 " + tableau[2][0] + ": " + tableau[2][1] + " #4 " + tableau[3][0] + ": " + tableau[3][1] + " #5 " + tableau[4][0] + ": " + tableau[4][1])
	}
	if (statNumber % 5 == 4) {
		Object.keys(localStorage).forEach(function(key) {
			if (!["player_name", "view_mode", "geo", "avatar", "player_auth_key"].includes(key)) {
				tableau.push([(JSON.parse(localStorage.getItem(key))[Ss.NK]), (JSON.parse(localStorage.getItem(key))[Ss.CS])]);
			}
		});
		if (tableau.length < 5) {
			return false;
		}
		tableau.sort(function(a, b) {
			return b[1] - a[1];
		});
		room.sendChat("CS> #1 " + tableau[0][0] + ": " + tableau[0][1] + " #2 " + tableau[1][0] + ": " + tableau[1][1] + " #3 " +
			tableau[2][0] + ": " + tableau[2][1] + " #4 " + tableau[3][0] + ": " + tableau[3][1] + " #5 " + tableau[4][0] + ": " +
			tableau[4][1]);
	}
	statNumber++;
}, statInterval * 60 * 1000);


/*var data = pastethecodehere;
Object.assign(localStorage,data);
*/
