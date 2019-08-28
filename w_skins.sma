#include <amxmodx>
#include <engine>
#include <hamsandwich>
#include <colorchat>
#include <nvault>
#include <fun>

new weapons[500] = {300, ...};
// ---
new s_AK47[33];
new m_AK47[4][3][] = {
	{"models/ak47/pride/v_ak47.mdl",            "models/ak47/pride/w_ak47.mdl",            "models/ak47/pride/p_ak47.mdl"}, // Duma
	{"models/ak47/the-eye-of-horus/v_ak47.mdl", "models/ak47/the-eye-of-horus/w_ak47.mdl", "models/ak47/the-eye-of-horus/p_ak47.mdl"}, // Oko Horusa
	{"models/ak47/the-empress/v_ak47.mdl",      "models/ak47/the-empress/w_ak47.mdl",      "models/ak47/the-empress/p_ak47.mdl"}, // Cesarzowa
	{"models/ak47/wasteland-rebel/v_ak47.mdl",  "models/ak47/wasteland-rebel/w_ak47.mdl",  "models/ak47/wasteland-rebel/p_ak47.mdl"}, // Pustynny buntownik
};
new n_AK47[4][] = {
	{"Duma"}, 
	{"Oko Horusa"}, 
	{"Cesarzowa"}, 
	{"Pustynny buntownik"},
}
// ---
new s_M4A1[33];
new m_M4A1[7][3][] = {
	{"models/m4a1/toxic-blue/v_m4a1.mdl",          "models/m4a1/toxic-blue/w_m4a1.mdl",          "models/m4a1/toxic-blue/p_m4a1.mdl"}, // Toksykator
	{"models/m4a1/toxic-error/v_m4a1.mdl",         "models/m4a1/toxic-error/w_m4a1.mdl",         "models/m4a1/toxic-error/p_m4a1.mdl"},
	{"models/m4a1/toxic-green/v_m4a1.mdl",         "models/m4a1/toxic-green/w_m4a1.mdl",         "models/m4a1/toxic-green/p_m4a1.mdl"},
	{"models/m4a1/toxic-intense-green/v_m4a1.mdl", "models/m4a1/toxic-intense-green/w_m4a1.mdl", "models/m4a1/toxic-intense-green/p_m4a1.mdl"},
	{"models/m4a1/toxic-light-green/v_m4a1.mdl",   "models/m4a1/toxic-light-green/w_m4a1.mdl",   "models/m4a1/toxic-light-green/p_m4a1.mdl"},
	{"models/m4a1/toxic-pink/v_m4a1.mdl",          "models/m4a1/toxic-pink/w_m4a1.mdl",          "models/m4a1/toxic-pink/p_m4a1.mdl"},
	{"models/m4a1/toxic-purple/v_m4a1.mdl",        "models/m4a1/toxic-purple/w_m4a1.mdl",        "models/m4a1/toxic-purple/p_m4a1.mdl"},
};
new n_M4A1[7][] = {
	{"Toksykator / blekit"},
	{"Toksykator / ?"},
	{"Toksykator / zielen"},
	{"Toksykator / intensywna zielen"},
	{"Toksykator / jasna zielen"},
	{"Toksykator / roz"},
	{"Toksykator / fiolet"},
}
// ---
new s_AWP[33];
new m_AWP[1][3][] = {
	{"models/awp/oni-taiji/v_awp.mdl", "models/awp/oni-taiji/w_awp.mdl", "models/awp/oni-taiji/p_awp.mdl"}, // Demoniczna eksterminacja
};
new n_AWP[1][] = {
	{"Demoniczna eksterminacja"},
}
// ---
new s_Knife[33];
new m_Knife[2][3][] = {
	{"models/knife/bowie-armageddon/v_knife.mdl", "", "models/knife/bowie-armageddon/p_knife.mdl"}, // Zniszczenie
	{"models/knife/gut-neon-impulse/v_knife.mdl", "", "models/knife/gut-neon-impulse/p_knife.mdl"}, // Impuls neonowy
};
new n_Knife[2][] = {
	{"Zniszczenie (bowie)"},
	{"Impuls neonowy (gut)"},
}
// ---
new s_Deagle[33];
new m_Deagle[8][3][] = {
	{"models/deagle/toxicator/v_deagle.mdl",      "models/deagle/toxicator/w_deagle.mdl",      "models/deagle/toxicator/p_deagle.mdl"}, // Toksykator
	{"models/deagle/kumicho-dragon/v_deagle.mdl", "models/deagle/kumicho-dragon/w_deagle.mdl", "models/deagle/kumicho-dragon/p_deagle.mdl"}, // Smocza glowa
	{"models/deagle/blaze/v_deagle.mdl",          "models/deagle/blaze/w_deagle.mdl",          "models/deagle/blaze/p_deagle.mdl"}, // Żar
	{"models/deagle/doomsday/v_deagle.mdl",       "models/deagle/doomsday/w_deagle.mdl",       "models/deagle/doomsday/p_deagle.mdl"}, // Sad ostateczny
	{"models/deagle/dragon-lore/v_deagle.mdl",    "models/deagle/dragon-lore/w_deagle.mdl",    "models/deagle/dragon-lore/p_deagle.mdl"}, // Smocza wiedza
	{"models/deagle/hypnotic/v_deagle.mdl",       "models/deagle/hypnotic/w_deagle.mdl",       "models/deagle/hypnotic/p_deagle.mdl"}, // Hipnoza
	{"models/deagle/point-disarray/v_deagle.mdl", "models/deagle/point-disarray/w_deagle.mdl", "models/deagle/point-disarray/p_deagle.mdl"}, // Sedno zamieszania
	{"models/deagle/salient/v_deagle.mdl",        "models/deagle/salient/w_deagle.mdl",        "models/deagle/salient/p_deagle.mdl"}, // Uderzenie
};
new n_Deagle[8][] = {
	{"Toksykator"},
	{"Glowa smoka"},
	{"Zar"},
	{"Sad ostateczny"},
	{"Smocza wiedza"},
	{"Hipnoza"},
	{"Sedno zamieszania"},
	{"Uderzenie"},
}

new fHandle;

public plugin_init() {
	register_clcmd("say", "super_say");
	register_clcmd("say_team", "super_say");
	register_event("CurWeapon", "e_CurWeapon", "be", "1=1");
	RegisterHam(Ham_Touch, "weapon_ak47", "weapon_ak47_touch", false);
	RegisterHam(Ham_Touch, "weapon_m4a1", "weapon_m4a1_touch", false);
	RegisterHam(Ham_Touch, "weapon_deagle", "weapon_deagle_touch", false);
	RegisterHam(Ham_Touch, "weapon_awp", "weapon_awp_touch", false);
	RegisterHam(Ham_Touch, "weapon_knife", "weapon_knife_touch", false);
	RegisterHam(Ham_Touch, "weaponbox", "weaponbox_touch", false);
	
	RegisterHam(Ham_TakeDamage, "player", "hook_TakeDamage");
	
	register_clcmd("shield", "block");
	register_clcmd("g3sg1", "block");
	register_clcmd("d3au1", "block");
	register_clcmd("sg550", "block");
	register_clcmd("krieg550", "block");
	
	fHandle = nvault_open("skins");
	if(fHandle == INVALID_HANDLE)
		set_fail_state("Problem z otworzeniem pliku.");
}

public block(id)
	return PLUGIN_HANDLED;

public plugin_end()
	nvault_close(fHandle);
	
public load_skins(id) {
	new name[48];
	get_user_name(id, name, 47);
	new vaultkey[64], vaultdata[128];
	formatex(vaultkey, 63, "%s-skins", name);
	if(nvault_get(fHandle, vaultkey, vaultdata, 127)) {
		new string_AK47[16], string_M4A1[16], string_AWP[16], string_Deagle[16], string_Knife[16], nametemp[48];
		parse(vaultdata, string_AK47, 15, string_M4A1, 15, string_AWP, 15, string_Deagle, 15, string_Knife, 15, nametemp, 47);
		
		s_AK47[id] = str_to_num(string_AK47);
		s_M4A1[id] = str_to_num(string_M4A1);
		s_AWP[id] = str_to_num(string_AWP);
		s_Deagle[id] = str_to_num(string_Deagle);
		s_Knife[id] = str_to_num(string_Knife);
		
		return 1;
	}
	else
		return 0;
}  

public save_skins(id) {
	new name[48];
	get_user_name(id, name, 47);
	new vaultkey[64], vaultdata[128];
	formatex(vaultkey, 63, "%s-skins", name);
	formatex(vaultdata, 127, "%d %d %d %d %d ^"%s^"", s_AK47[id], s_M4A1[id], s_AWP[id], s_Deagle[id], s_Knife[id], name);
	nvault_set(fHandle, vaultkey, vaultdata);
	
	return PLUGIN_CONTINUE;
}

public plugin_precache() {
	server_print("Knife models: %d", sizeof m_Knife);
	for(new i = 0; i < sizeof m_Knife; i++) {
		precache_model(m_Knife[i][0]);
		precache_model(m_Knife[i][2]);
		server_print("%s^n%s", m_Knife[i][0], m_Knife[i][2]);
	}
	server_print("AK-47 models: %d", sizeof m_AK47);
	for(new i = 0; i < sizeof m_AK47; i++) {
		precache_model(m_AK47[i][0]);
		precache_model(m_AK47[i][1]);
		precache_model(m_AK47[i][2]);
		server_print("%s^n%s^n%s", m_AK47[i][0], m_AK47[i][1], m_AK47[i][2]);
	}
	server_print("M4A1 models: %d", sizeof m_M4A1);
	for(new i = 0; i < sizeof m_M4A1; i++) {
		precache_model(m_M4A1[i][0]);
		precache_model(m_M4A1[i][1]);
		precache_model(m_M4A1[i][2]);
		server_print("%s^n%s^n%s", m_M4A1[i][0], m_M4A1[i][1], m_M4A1[i][2]);
	}
	server_print("AWP models: %d", sizeof m_AWP);
	for(new i = 0; i < sizeof m_AWP; i++) {
		precache_model(m_AWP[i][0]);
		precache_model(m_AWP[i][1]);
		precache_model(m_AWP[i][2]);
		server_print("%s^n%s^n%s", m_AWP[i][0], m_AWP[i][1], m_AWP[i][2]);
	}
	server_print("Deagle models: %d", sizeof m_Deagle);
	for(new i = 0; i < sizeof m_Deagle; i++) {
		precache_model(m_Deagle[i][0]);
		precache_model(m_Deagle[i][1]);
		precache_model(m_Deagle[i][2]);
		server_print("%s^n%s^n%s", m_Deagle[i][0], m_Deagle[i][1], m_Deagle[i][2]);
	}
}

public client_connect(id) {
	if(!load_skins(id)) {
		s_AWP[id] = 300;
		s_M4A1[id] = 300;
		s_AK47[id] = 300;
		s_Knife[id] = 300;
		s_Deagle[id] = 300;
	}
}

public client_disconnected(id) {
	save_skins(id);
}

public super_say(id, level, cid) {
	new command[24];
	read_argv(1, command, sizeof command - 1);
	if(
		equal(command, "/skins")
		|| equal(command, "!skins")
		|| equal(command, "/skiny")
		|| equal(command, "!skiny")
		|| equal(command, "/skin")
		|| equal(command, "!skin")
		|| equal(command, "/skorki")
		|| equal(command, "!skorki")
		|| equal(command, "/skorka")
		|| equal(command, "!skorka")
		|| equal(command, "/nakladki")
		|| equal(command, "!nakladki")
		|| equal(command, "/nakladka")
		|| equal(command, "!nakladka")
		|| equal(command, "/ws")
		|| equal(command, "!ws")
		|| equal(command, "/models")
		|| equal(command, "!models")
		|| equal(command, "/model")
		|| equal(command, "!model")
		|| equal(command, "/modele")
		|| equal(command, "!modele")
	) {
		m_skins(id);
		return PLUGIN_HANDLED;
	}
	else if(
		equal(command, "/knives")
		|| equal(command, "!knives")
		|| equal(command, "/noze")
		|| equal(command, "!noze")
		|| equal(command, "/knife")
		|| equal(command, "!knife")
		|| equal(command, "/noz")
		|| equal(command, "!noz")
		|| equal(command, "/kosy")
		|| equal(command, "!kosy")
		|| equal(command, "/kosa")
		|| equal(command, "!kosa")
	) {
		m_skins_knife(id);
		return PLUGIN_HANDLED;
	}
	else if(
		equal(command, "/ak") 
		|| equal(command, "!ak") 
		|| equal(command, "/ak47")
		|| equal(command, "!ak47")
		|| equal(command, "/kalach")
		|| equal(command, "!kalach")
		|| equal(command, "!kalaszek")
		|| equal(command, "!kalaszek")
	) {
		m_skins_ak47(id);
		return PLUGIN_HANDLED;
	}
	else if(
		equal(command, "/awp") 
		|| equal(command, "!awp")
	) {
		m_skins_awp(id);
		return PLUGIN_HANDLED;
	}
	else if(
		equal(command, "/deagle")
		|| equal(command, "!deagle")
	) {
		m_skins_deagle(id);
		return PLUGIN_HANDLED;
	}
	else if(
		equal(command, "/m4") 
		|| equal(command, "!m4") 
		|| equal(command, "/m4a1") 
		|| equal(command, "!m4a1")
	) {
		m_skins_m4a1(id);
		return PLUGIN_HANDLED;
	}
	return PLUGIN_CONTINUE;
}

public m_skins(id) {
	new menu = menu_create( "\rAMXX \ySkiny \r", "m_skins_handler");
	menu_additem(menu, "\wKnife", "", 0);
	menu_additem(menu, "\wAK-47", "", 0);
	menu_additem(menu, "\wM4A1", "", 0);
	menu_additem(menu, "\wAWP", "", 0);
	menu_additem(menu, "\wDeagle", "", 0);
	
	menu_setprop(menu, MPROP_NUMBER_COLOR, "\r");
	menu_setprop(menu, MPROP_NEXTNAME, "Dalej");
	menu_setprop(menu, MPROP_BACKNAME, "Wstecz");
	menu_setprop(menu, MPROP_EXITNAME, "Anuluj");
	
	menu_display(id, menu, 0);
	
	return PLUGIN_HANDLED;
}

public m_skins_handler(id, menu, item) {
	switch(item) {
		case 0: {
			m_skins_knife(id);
		}
		case 1: {
			m_skins_ak47(id);
		}
		case 2: {
			m_skins_m4a1(id);
		}
		case 3: {
			m_skins_awp(id);
		}
		case 4: {
			m_skins_deagle(id);
		}
	}
	menu_destroy(menu);
	return PLUGIN_HANDLED;
}

// ------------------------------------------------------

public m_skins_knife(id) {
	new menu = menu_create( "\rAMXX \yKnife\r", "m_skins_knife_handler");
	
	menu_additem(menu, "Podstawowy", "", 0);
	for(new i = 0; i < sizeof m_Knife; i++)
		menu_additem(menu, n_Knife[i], "", 0);
	
	menu_setprop(menu, MPROP_NUMBER_COLOR, "\r");
	menu_setprop(menu, MPROP_NEXTNAME, "Dalej");
	menu_setprop(menu, MPROP_BACKNAME, "Wstecz");
	menu_setprop(menu, MPROP_EXITNAME, "Wstecz do kategorii");
	
	menu_display(id, menu, 0);
	
	return PLUGIN_HANDLED;
}

public m_skins_knife_handler(id, menu, item) {
	if(item == 0) {
		s_Knife[id] = 300;
		ColorChat(id, GREEN, "AMXX^x03 Knife | Podstawowy");
	}
	else if(item == MENU_EXIT) {
		m_skins(id);
	}
	else {
		s_Knife[id] = item-1;
		ColorChat(id, GREEN, "AMXX^x03 Knife | %s", n_Knife[item-1]);
	}
	menu_destroy(menu);
	return PLUGIN_HANDLED;
}

// ---

public m_skins_ak47(id) {
	new menu = menu_create("\rAMXX \yAK-47\r", "m_skins_ak47_handler");
	
	menu_additem(menu, "Podstawowy", "", 0);
	for(new i = 0; i < sizeof m_AK47; i++)
		menu_additem(menu, n_AK47[i], "", 0);
	
	menu_setprop(menu, MPROP_NUMBER_COLOR, "\r");
	menu_setprop(menu, MPROP_NEXTNAME, "Dalej");
	menu_setprop(menu, MPROP_BACKNAME, "Wstecz");
	menu_setprop(menu, MPROP_EXITNAME, "Wstecz do kategorii");
	
	menu_display(id, menu, 0);
	
	return PLUGIN_HANDLED;
}

public m_skins_ak47_handler(id, menu, item) {
	if(item == 0) {
		s_AK47[id] = 300;
		ColorChat(id, GREEN, "AMXX^x03 AK47 | Podstawowy");
	}
	else if(item == MENU_EXIT) {
		m_skins(id);
	}
	else {
		s_AK47[id] = item-1;
		ColorChat(id, GREEN, "AMXX^x03 AK47 | %s", n_AK47[item-1]);
	}
	menu_destroy(menu);
	return PLUGIN_HANDLED;
}

// ----

public m_skins_m4a1(id) {
	new menu = menu_create( "\rAMXX \yM4A1\r", "m_skins_m4a1_handler");
	
	menu_additem(menu, "Podstawowy", "", 0);
	for(new i = 0; i < sizeof m_M4A1; i++)
		menu_additem(menu, n_M4A1[i], "", 0);
	
	menu_setprop(menu, MPROP_NUMBER_COLOR, "\r");
	menu_setprop(menu, MPROP_NEXTNAME, "Dalej");
	menu_setprop(menu, MPROP_BACKNAME, "Wstecz");
	menu_setprop(menu, MPROP_EXITNAME, "Wstecz do kategorii");
	
	menu_display(id, menu, 0);
	
	return PLUGIN_HANDLED;
}

public m_skins_m4a1_handler(id, menu, item) {
	if(item == 0) {
		s_M4A1[id] = 300;
		ColorChat(id, GREEN, "AMXX^x03 M4A1 | Podstawowy");
	}
	else if(item == MENU_EXIT) {
		m_skins(id);
	}
	else {
		s_M4A1[id] = item-1;
		ColorChat(id, GREEN, "AMXX^x03 M4A1 | %s", n_M4A1[item-1]);
	}
	menu_destroy(menu);
	return PLUGIN_HANDLED;
}

// ----

public m_skins_awp(id) {
	new menu = menu_create( "\rAMXX \yAWP\r", "m_skins_awp_handler");
	
	menu_additem(menu, "Podstawowy", "", 0);
	for(new i = 0; i < sizeof m_AWP; i++)
		menu_additem(menu, n_AWP[i], "", 0);
	
	menu_setprop(menu, MPROP_NUMBER_COLOR, "\r");
	menu_setprop(menu, MPROP_NEXTNAME, "Dalej");
	menu_setprop(menu, MPROP_BACKNAME, "Wstecz");
	menu_setprop(menu, MPROP_EXITNAME, "Wstecz do kategorii");
	
	menu_display(id, menu, 0);
	
	return PLUGIN_HANDLED;
}

public m_skins_awp_handler(id, menu, item) {
	if(item == 0) {
		s_AWP[id] = 300;
		ColorChat(id, GREEN, "AMXX^x03 AWP | Podstawowy");
	}
	else if(item == MENU_EXIT) {
		m_skins(id);
	}
	else {
		s_AWP[id] = item-1;
		ColorChat(id, GREEN, "AMXX^x03 AWP | %s", n_AWP[item-1]);
	}
	menu_destroy(menu);
	return PLUGIN_HANDLED;
}

// ----

public m_skins_deagle(id) {
	new menu = menu_create( "\rAMXX \yDeagle\r", "m_skins_deagle_handler");
	
	menu_additem(menu, "Podstawowy", "", 0);
	for(new i = 0; i < sizeof m_Deagle; i++)
		menu_additem(menu, n_Deagle[i], "", 0);
	
	menu_setprop(menu, MPROP_NUMBER_COLOR, "\r");
	menu_setprop(menu, MPROP_NEXTNAME, "Dalej");
	menu_setprop(menu, MPROP_BACKNAME, "Wstecz");
	menu_setprop(menu, MPROP_EXITNAME, "Wstecz do kategorii");
	
	menu_display(id, menu, 0);
	
	return PLUGIN_HANDLED;
}

public m_skins_deagle_handler(id, menu, item) {
	if(item == 0) {
		s_Deagle[id] = 300;
		ColorChat(id, GREEN, "AMXX^x03 Deagle | Podstawowy");
	}
	else if(item == MENU_EXIT) {
		m_skins(id);
	}
	else {
		s_Deagle[id] = item-1;
		ColorChat(id, GREEN, "AMXX^x03 Deagle | %s", n_Deagle[item-1]);
	}
	menu_destroy(menu);
	return PLUGIN_HANDLED;
}

// ------------------------------------------------------

public weapon_knife_touch(entityID, id) {
	if(!is_user_alive(id))
		return HAM_IGNORED;
	if(!is_valid_ent(entityID))
		return HAM_IGNORED;
	
	weapons[entityID] = s_Knife[id];
	
	return HAM_IGNORED;
}

public weapon_ak47_touch(entityID, id) {
	if(!is_user_alive(id))
		return HAM_IGNORED;
	if(!is_valid_ent(entityID))
		return HAM_IGNORED;
	
	weapons[entityID] = s_AK47[id];
	
	return HAM_IGNORED;
}

public weapon_m4a1_touch(entityID, id) {
	if(!is_user_alive(id))
		return HAM_IGNORED;
	if(!is_valid_ent(entityID))
		return HAM_IGNORED;
	
	weapons[entityID] = s_M4A1[id];
	
	return HAM_IGNORED;
}

public weapon_awp_touch(entityID, id) {
	if(!is_user_alive(id))
		return HAM_IGNORED;
	if(!is_valid_ent(entityID))
		return HAM_IGNORED;
	
	weapons[entityID] = s_AWP[id];
	
	return HAM_IGNORED;
}

public weapon_deagle_touch(entityID, id) {
	if(!is_user_alive(id))
		return HAM_IGNORED;
	if(!is_valid_ent(entityID))
		return HAM_IGNORED;
	
	weapons[entityID] = s_Deagle[id];
	
	return HAM_IGNORED;
}

public weaponbox_touch(weaponbox, id) {
	new entityID = cs_get_weaponbox_type(weaponbox);
	if(!is_valid_ent(entityID))
		return HAM_IGNORED;
	new name[64];
	entity_get_string(weaponbox, EV_SZ_model, name, sizeof name - 1);
	if(equal(name, "models/w_ak47.mdl")) {
		if(weapons[entityID] == 300)
			return HAM_IGNORED;
		entity_set_model(weaponbox, m_AK47[weapons[entityID]][1]);
	}
	else if(equal(name, "models/w_m4a1.mdl")) {
		if(weapons[entityID] == 300)
			return HAM_IGNORED;
		entity_set_model(weaponbox, m_M4A1[weapons[entityID]][1]);
	}
	else if(equal(name, "models/w_awp.mdl")) {
		if(weapons[entityID] == 300)
			return HAM_IGNORED;
		entity_set_model(weaponbox, m_AWP[weapons[entityID]][1]);
	}
	else if(equal(name, "models/w_deagle.mdl")) {
		if(weapons[entityID] == 300)
			return HAM_IGNORED;
		entity_set_model(weaponbox, m_Deagle[weapons[entityID]][1]);
	}
	return HAM_IGNORED;
}

public hook_TakeDamage(victim, inflictior, attacker, Float:damage, damagebits) {
	if(!is_user_alive(attacker))
		return PLUGIN_CONTINUE;
	new weaponID = get_user_weapon(attacker);
	new entityID = find_ent_by_owner(-1, "weapon_knife", attacker, 0);
	if(entityID > 0) {
		//client_print(attacker, print_chat, "weaponID: %d entityID: %d damage: %f", weaponID, entityID, damage);
		if(weaponID == CSW_KNIFE && weapons[entityID] == 0)
			SetHamParamFloat(4, damage*1.5);
	}
	return PLUGIN_CONTINUE;
}

public e_CurWeapon(id) {
	if(!is_user_alive(id))
		return PLUGIN_CONTINUE;

	new name[64];
	
	new weaponid = read_data(2);
	get_weaponname(weaponid, name, sizeof name - 1);
	new entityID = find_ent_by_owner(-1, name, id);
	
	entity_get_string(id, EV_SZ_viewmodel, name, 31);
	
	if(weaponid == CSW_KNIFE && weapons[entityID] == 1) {
		entity_set_float(id, EV_FL_gravity, 0.5);
	}
	else {
		entity_set_float(id, EV_FL_gravity, 1.0);
	}
	
	// if(weaponid == CSW_KNIFE && weapons[entityID] == 0) {
		// if(get_freezetime() <= 0) {
			// entity_set_float(id, EV_FL_maxspeed, 180.0);
		// }
		// set_user_footsteps(id, 1);
	// }
	// else {
		// set_user_footsteps(id, 0);
	// }
	
	if(weapons[entityID] == 300)
		return PLUGIN_CONTINUE;
	
	if(equal(name, "models/v_knife.mdl"))
		entity_set_string(id, EV_SZ_viewmodel, m_Knife[weapons[entityID]][0]);
	else if(equal(name, "models/v_m4a1.mdl"))
		entity_set_string(id, EV_SZ_viewmodel, m_M4A1[weapons[entityID]][0]);
	else if(equal(name, "models/v_ak47.mdl"))
		entity_set_string(id, EV_SZ_viewmodel, m_AK47[weapons[entityID]][0]);
	else if(equal(name, "models/v_awp.mdl"))
		entity_set_string(id, EV_SZ_viewmodel, m_AWP[weapons[entityID]][0]);
	else if(equal(name, "models/v_deagle.mdl"))
		entity_set_string(id, EV_SZ_viewmodel, m_Deagle[weapons[entityID]][0]);
	
	entity_get_string(id, EV_SZ_weaponmodel, name, 31);
	if(equal(name, "models/p_knife.mdl")) {
		entity_set_string(id, EV_SZ_weaponmodel, m_Knife[weapons[entityID]][2]);
	}
	else if(equal(name, "models/p_m4a1.mdl"))
		entity_set_string(id, EV_SZ_weaponmodel, m_M4A1[weapons[entityID]][2]);
	else if(equal(name, "models/p_ak47.mdl"))
		entity_set_string(id, EV_SZ_weaponmodel, m_AK47[weapons[entityID]][2]);
	else if(equal(name, "models/p_awp.mdl"))
		entity_set_string(id, EV_SZ_weaponmodel, m_AWP[weapons[entityID]][2]);
	else if(equal(name, "models/p_deagle.mdl"))
		entity_set_string(id, EV_SZ_weaponmodel, m_Deagle[weapons[entityID]][2]);
	
	return PLUGIN_CONTINUE;
}

const XO_CWEAPONBOX = 4
stock const m_rgpPlayerItems_CWeaponBox[ 6 ] = { 34 , 35 , ... };

cs_get_weaponbox_type(iWeaponBox) {
	new iWeapon
	for(new i = 1; i <= 5; i++) {
		iWeapon = get_pdata_cbase(iWeaponBox, m_rgpPlayerItems_CWeaponBox[i], XO_CWEAPONBOX)
		if(iWeapon > 0)
			return iWeapon;
	}
	return 0;
}
