/*
 * Cette oeuvre, création, site ou texte est sous licence Creative Commons Attribution
 * - Pas d’Utilisation Commerciale
 * - Partage dans les Mêmes Conditions 4.0 International. 
 * Pour accéder à une copie de cette licence, merci de vous rendre à l'adresse suivante
 * http://creativecommons.org/licenses/by-nc-sa/4.0/ .
 *
 * Merci de respecter le travail fourni par le ou les auteurs 
 * https://www.ts-x.eu/ - kossolax@ts-x.eu
 */
#pragma semicolon 1

#include <sourcemod>
#include <sdktools>
#include <colors_csgo>	// https://forums.alliedmods.net/showthread.php?p=2205447#post2205447
#include <smlib>		// https://github.com/bcserv/smlib
#include <emitsoundany> // https://forums.alliedmods.net/showthread.php?t=237045

#define __LAST_REV__ 		"v:0.1.0"

#pragma newdecls required
#include <roleplay.inc>	// https://www.ts-x.eu

//#define DEBUG
#define QUEST_UNIQID	"000-tutorial"
#define	QUEST_NAME		"Tutorial"
#define	QUEST_TYPE		quest_story

public Plugin myinfo = {
	name = "Quête: Tutorial", author = "KoSSoLaX",
	description = "RolePlay - Quête: Tutorial",
	version = __LAST_REV__, url = "https://www.ts-x.eu"
};

int g_iQuest;
// TODO: Q8_Frame (say_team cc, /aide)
// TODO: Déplacer les récompenses dans les fonctions appropriées
// TODO: Menu parainage
// TODO: Core: appeler la fonction abort en cas d'annulation ou de déconnexion
// TODO: Core: Appeler la fonction done quand l'étape est terminée
// TODO: Core: retiré le hookframe quand le joueur déco, ou termine la quête

public void OnPluginStart() {
	g_iQuest = rp_RegisterQuest(QUEST_UNIQID, QUEST_NAME, QUEST_TYPE, fwdCanStart);
	if( g_iQuest == -1 )
		SetFailState("Erreur lors de la création de la quête %s %s", QUEST_UNIQID, QUEST_NAME);
	
	rp_QuestAddStep(g_iQuest, Q_Start, Q1_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q2_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q3_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q4_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q5_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q6_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q7_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q8_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q9_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q10_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q11_Frame, QUEST_NULL, QUEST_NULL);
	rp_QuestAddStep(g_iQuest, Q_Start, Q12_Frame, QUEST_NULL, QUEST_NULL);
	
}
public bool fwdCanStart(int client) {
	PrintToServer("%N veut savoir s'il a le droit de faire la quete %d", client, g_iQuest);
	return true;
}
public void Q_Start(int objectiveID, int client) {
	PrintToServer("%N started objective: %d", client, objectiveID);
}
public void Q1_Frame(int objectiveID, int client) {
	float origin[3], target[3] = {1372.0, 30.0, -2146.0};
	GetClientAbsOrigin(client, origin);
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Bienvenue sur le serveur RolePlay");
		DrawPanelText(panel, " C'est votre première connexion,");
		DrawPanelText(panel, "vous devez donc faire notre tutoriel ");
		DrawPanelText(panel, "afin de vous familiariser avec ce mode");
		DrawPanelText(panel, "de jeu. A la fin de celui-ci vous");
		DrawPanelText(panel, "gagnerez 10.000$: la monnaie du jeu");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Ce mode Roleplay est une sorte de simulation");
		DrawPanelText(panel, "de vie: vous pouvez avoir de l'argent,");
		DrawPanelText(panel, "un emploi etc.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, "→ Rendez-vous devant la statue de la");
		DrawPanelText(panel, "place de l'indépendance afin de commencer");
		DrawPanelText(panel, "votre apprentissage.");
		DrawPanelText(panel, "Le signal lumineux vert vous aidera tout");
		DrawPanelText(panel, "au long de ce tutoriel.");
		
		rp_SendPanelToClient(panel, client, 1.1);
	}

	
	if( GetVectorDistance(target, origin) < 64.0 ) {
		rp_QuestStepComplete(client, objectiveID);
	}
	else {
		rp_Effect_BeamBox(client, 0, target);
	}
}
public void Q2_Frame(int objectiveID, int client) {
	float origin[3], target[3] = {2034.0, 1391.0, -2014.0};
	GetClientAbsOrigin(client, origin);
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Objectif 1: La ville");
		DrawPanelText(panel, " Princeton est la ville dans laquelle");
		DrawPanelText(panel, "vous êtes, c'est la map du serveur. La ");
		DrawPanelText(panel, "justice y fait souvent défaut. De nombreux");
		DrawPanelText(panel, "meurtres y sont commis, et parfois impunis.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Bien que de nombreux cityoyens s'entretuent");
		DrawPanelText(panel, "sachez, avant tout, que vous risquez de rester");
		DrawPanelText(panel, "de longues minutes en prison pour de telles actions.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, "→ Rendez-vous devant le commissariat afin");
		DrawPanelText(panel, "de continuer votre apprentissage.");
	}
	
	if( GetVectorDistance(target, origin) < 64.0 ) {
		rp_QuestStepComplete(client, objectiveID);
	}
	else {
		rp_Effect_BeamBox(client, 0, target);
	}
}
public void Q3_Frame(int objectiveID, int client) {
	float origin[3], target[3] = {2189.0, -12.0, -2134.0};
	GetClientAbsOrigin(client, origin);
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Objectif 2: Le commissariat");
		DrawPanelText(panel, " Selon le règlement de la police, vous");
		DrawPanelText(panel, "pouvez être mis en prison dans ce");
		DrawPanelText(panel, "commissariat pour différentes raisons.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Les principales raisons d’incarcération");
		DrawPanelText(panel, "sont: Le meurtre ou la tentative");
		DrawPanelText(panel, "de meurtre, le tir dans la rue, le vol,");
		DrawPanelText(panel, "les nuisances sonores, le trafic illégal");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Votre futur emploi définira votre");
		DrawPanelText(panel, "camp. Par exemple, un mafieux vole de l'argent,");
		DrawPanelText(panel, "un tueur à gage exécute des contrats, un");
		DrawPanelText(panel, "policier tentera de les en empêcher.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, "→ Rendez-vous devant la banque.");
		
		rp_SendPanelToClient(panel, client, 1.1);
	}

	
	if( GetVectorDistance(target, origin) < 64.0 ) {
		rp_QuestStepComplete(client, objectiveID);
	}
	else {
		rp_Effect_BeamBox(client, 0, target);
	}
	
	if( GetVectorDistance(target, origin) < 64.0 ) {
		CPrintToChat(client, "{lightblue}[TSX-RP]{default} Vous avez reçu 2500$.");
		rp_SetClientInt(client, i_Money, rp_GetClientInt(client, i_Money)+ 2500);
		
		rp_QuestStepComplete(client, objectiveID);
	}
	else {
		rp_Effect_BeamBox(client, 0, target);
	}
}
public void Q4_Frame(int objectiveID, int client) {
	float origin[3], target[3] = {2288.0, 136.0, -2134.0};
	GetClientAbsOrigin(client, origin);
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Objectif 3: Mettre son argent en sécurité");
		DrawPanelText(panel, " Dans un premier temps pour éviter de vous");
		DrawPanelText(panel, "faire voler votre argent, déposez-le");
		DrawPanelText(panel, "en banque.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Pour cela, positionnez-vous devant un");
		DrawPanelText(panel, "distributeur, utiliser votre touche action (E).");
		DrawPanelText(panel, "Selectionnez l'action déposer argent.");
		DrawPanelText(panel, "Déposez-y le montant que vous souhaitez");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Sachez tout de même que les banquiers vendent");
		DrawPanelText(panel, "des cartes et des comptes bancaires qui vous");
		DrawPanelText(panel, "faciliterons la vie plus tard sur le serveur.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, "→ Déposez tout votre argent en banque.");
	}
	
	if( GetVectorDistance(target, origin) < 64.0 && rp_GetClientInt(client, i_Money) <= 0 ) {
		CPrintToChat(client, "{lightblue}[TSX-RP]{default} Vous avez reçu en récompense 1 Deset Eagle.");
		rp_ClientGiveItem(client, 150);
		rp_QuestStepComplete(client, objectiveID);
	}
	else {
		rp_Effect_BeamBox(client, 0, target);
	}
}
public void Q5_Frame(int objectiveID, int client) {
	float origin[3], target[3] = {-1900.0, 604.0, -2134.0};
	GetClientAbsOrigin(client, origin);
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Objectif 4: L'armurerie");
		DrawPanelText(panel, " Le lazer suivant vous indique l'armurerie ou ");
		DrawPanelText(panel, "vous pouvez vous procurer des armes.");
		DrawPanelText(panel, "N'oubliez pas que de vous procurer un permis");
		DrawPanelText(panel, "de port d'arme à un banquier. Dans le cas contraire");
		DrawPanelText(panel, "un policier est en droit de vous arrêter.");
		DrawPanelText(panel, " Restez discret, garez la dans votre dos!");
		DrawPanelText(panel, " Une arme a été ajoutée dans votre inventaire.");
		DrawPanelText(panel, "→ Entrez la commande /item dans le chat général,");
		DrawPanelText(panel, "Appuyez sur la touche 1 afin de l'utiliser");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Notez que votre inventaire disparait en cas");
		DrawPanelText(panel, "de déconnexion.");
	}
	
	if( GetVectorDistance(target, origin) < 64.0 && rp_GetClientItem(client, 150) <= 0) {
		rp_QuestStepComplete(client, objectiveID);
	}
	else {
		rp_Effect_BeamBox(client, 0, target);
	}
}
public void Q6_Frame(int objectiveID, int client) {
	float origin[3], target[3] = {-1192.0, -778.0, -2135.0};
	GetClientAbsOrigin(client, origin);
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Objectif 5: Les appartements");
		DrawPanelItem(panel, "", ITEMDRAW_SPACER);
		DrawPanelText(panel, " Un appartement vous permet d'augmenter");
		DrawPanelText(panel, "votre paye. Lorsque vous aurez décroché");
		DrawPanelText(panel, "votre premier emploi, il est généralement");
		DrawPanelText(panel, "conseillé de louer un appart. Celui-ci");
		DrawPanelText(panel, "augmentera votre paie et vous rend votre vie.");
		DrawPanelText(panel, "Vous pouvez aussi y cacher différents objets");
		DrawPanelText(panel, "du jeu, tel que les machines à faux billet");
		DrawPanelText(panel, "plant de drogue, armes, etc.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, "→ Rendez-vous devant les appartements afin");
		DrawPanelText(panel, "de continuer votre apprentissage.");
	}
	
	if( GetVectorDistance(target, origin) < 64.0 ) {
		
		rp_ClientGiveItem(client, 81);
		rp_ClientGiveItem(client, 103);
		
		CPrintToChat(client, "{lightblue}[TSX-RP]{default} Vous avez reçu en récompense 1 Plant de drogue et 1 Machine à faux-billet.");
		
		rp_QuestStepComplete(client, objectiveID);
	}
	else {
		rp_Effect_BeamBox(client, 0, target);
	}
}
public void Q7_Frame(int objectiveID, int client) {
	float origin[3], target[3] = {-611.0, -1286.0, -2016.0};
	GetClientAbsOrigin(client, origin);
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Objectif 6: Un trafic illégal");
		DrawPanelItem(panel, "", ITEMDRAW_SPACER);
		DrawPanelText(panel, " Une imprimante à faux-billet et un plant");
		DrawPanelText(panel, "de drogue ont été ajoutés dans votre");
		DrawPanelText(panel, "inventaire.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Trouvez-vous une cachette, et utilisez");
		DrawPanelText(panel, "ces objets (/item). Si vous êtes mal");
		DrawPanelText(panel, "caché, un policier est en droit de vous");
		DrawPanelText(panel, "arrêter!");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, "→ Déposez une machine, et un plant de");
		DrawPanelText(panel, "drogue afin de continuer votre");
		DrawPanelText(panel, "apprentissage.");
	}
	
	if( GetVectorDistance(target, origin) < 64.0 && rp_GetClientItem(client, 81) <= 0 && rp_GetClientItem(client, 103) <= 0 ) {
		rp_QuestStepComplete(client, objectiveID);
	}
	else {
		rp_Effect_BeamBox(client, 0, target);
	}
}
public void Q8_Frame(int objectiveID, int client) {
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Objectif 7: Le chat général");
		DrawPanelItem(panel, "", ITEMDRAW_SPACER);
		DrawPanelText(panel, " Le chat est divisé en plusieurs");
		DrawPanelText(panel, "catégories.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Le chat général, celui qui permet");
		DrawPanelText(panel, "de communiquer avec tout citoyen");
		DrawPanelText(panel, "présent en ville, mais aussi d'exécuter");
		DrawPanelText(panel, "diverses commandes.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Le chat équipe, permet de communiquer");
		DrawPanelText(panel, "avec les citoyens autour de vous.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, "→ Faites un coucou dans le chat local");
		DrawPanelText(panel, "(chat équipe) afin de continuer votre");
		DrawPanelText(panel, "apprentissage.");
	}
	
}
public void Q9_Frame(int objectiveID, int client) {
	float origin[3], target[3] = {763.0,-4748.0, -2014.0};
	GetClientAbsOrigin(client, origin);
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Objectif 8: Les commandes utiles");
		DrawPanelItem(panel, "", ITEMDRAW_SPACER);
		DrawPanelText(panel, " Il existe de nombreuses commandes sur le");
		DrawPanelText(panel, "serveur. La plupart liées à votre");
		DrawPanelText(panel, "métier, que vous apprendrez sur le tas.");
		DrawPanelText(panel, " - /give montant permet de donner votre argent");
		DrawPanelText(panel, "ATTENTION certains joueurs tenteront de vous arnaquer!");
		DrawPanelText(panel, " - /job Permet de voir les différents jobs connectés");
		DrawPanelText(panel, " Afin de trouver un emploi, jettez un oeil à cette");
		DrawPanelText(panel, "commande. Elle permet de voir qui est chef, ");
		DrawPanelText(panel, "vous saurez donc à qui vous addresser pour trouver");
		DrawPanelText(panel, "emploi.");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, "→ Rendez-vous maintenant sur la place Station");
	}
	
	if( GetVectorDistance(target, origin) < 64.0 ) {
		rp_QuestStepComplete(client, objectiveID);
	}
	else {
		rp_Effect_BeamBox(client, 0, target);
	}
}
public void Q10_Frame(int objectiveID, int client) {
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Objectif 9: Le site, le forum, le WiKi");
		DrawPanelItem(panel, "", ITEMDRAW_SPACER);
		DrawPanelText(panel, " Le forum et notre site sont deux parties");
		DrawPanelText(panel, "importantes du serveur. Si vous y êtes");
		DrawPanelText(panel, "inscrit, et confirmé comme ayant 16 ans ou");
		DrawPanelText(panel, "plus (le rang no-pyj). Vous augmentez vos");
		DrawPanelText(panel, "chances de trouver un emploi intéressant.");
		DrawPanelText(panel, "Besoin d'aide? Consultez notre wiki");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Site: http://www.ts-x.eu");
		DrawPanelText(panel, " WiKi: http://www.ts-x.eu/wiki/");
		DrawPanelText(panel, " TeamSpeak: ts.ts-x.eu");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, "→ Allez faire un tour sur notre site ( dites /aide ");
		DrawPanelText(panel, " afin d'obtenir davantage d'aide et de");
		DrawPanelText(panel, "continuer votre apprentissage.");
	}
	
}
public void Q11_Frame(int objectiveID, int client) {
	float origin[3], target[3] = {2472.0, -1063.0, -2144.0};
	GetClientAbsOrigin(client, origin);
	
	Handle panel = rp_CreatePanel(client);
	if( panel ) {
		SetPanelTitle(panel, "== Objectif 10: Le mot de la fin");
		DrawPanelItem(panel, "", ITEMDRAW_SPACER);
		DrawPanelText(panel, " Derniers conseils avant de vous laisser");
		DrawPanelText(panel, "partir sur de bonnes bases.");
		DrawPanelText(panel, "- Trouvez vous un job");
		DrawPanelText(panel, "- Attention aux arnaques (/give, reductions forcée)");
		DrawPanelText(panel, "- Ne tuez pas tout les passants");
		DrawPanelText(panel, "- Décrochez le rang no-pyj");
		DrawPanelText(panel, "- Faites un tour sur notre TeamSpeak");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, " Bon jeu!");
		DrawPanelText(panel, " ");
		DrawPanelText(panel, "→ Rendez-vous devant l'hôpital afin de");
		DrawPanelText(panel, "commencer votre aventure RolePlay.");
	}
	
	if( GetVectorDistance(target, origin) < 64.0 ) {
		rp_QuestStepComplete(client, objectiveID);
	}
	else {
		rp_Effect_BeamBox(client, 0, target);
	}
}
public void Q12_Frame(int objectiveID, int client) {
	PrintToChatAll("yay dernière étape");
}


public int MenuSelectParrain(Handle menu, MenuAction action, int client, int param2) {
	if( action == MenuAction_Select ) {
		char options[64];
		GetMenuItem(menu, param2, options, sizeof(options));
		
		
		if( !StrEqual(options, "none") ) {
			char szQuery[1024], szSteamID[64];
			GetClientAuthId(client, AuthId_Engine, szSteamID, sizeof(szSteamID), false);
			
			Format(szQuery, sizeof(szQuery), "INSERT INTO `rp_parrain` (`steamid`, `parent`, `timestamp`) VALUES ('%s', '%s', UNIX_TIMESTAMP());", szSteamID, options);
			SQL_TQuery(rp_GetDatabase(), SQL_QueryCallBack, szQuery);
		}
		
		rp_SetClientInt(client, i_Tutorial, 20);
		rp_GetClientItem(client, 286);
		CPrintToChat(client, "{lightblue}[TSX-RP]{default} Vous avez terminé le tutorial, une voiture vous a été offerte. (Faites /item !)");
	}
	else if( action == MenuAction_End ) {
		CloseHandle(menu);
	}
}