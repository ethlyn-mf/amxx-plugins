#include <amxmodx>
#include <engine>
#include <hamsandwich>

public client_PreThink(id) {
	if(!is_user_alive(id))
		return PLUGIN_CONTINUE;
	
	static oldbuttons;
	oldbuttons = get_user_oldbutton(id);
	if(oldbuttons & IN_USE)
		return PLUGIN_CONTINUE;
	
	static buttons;
	buttons = get_user_button(id);
	if((buttons & IN_USE)) {
		new aimOrigin[3];
		get_user_origin(id, aimOrigin, 3);
		
		new weaponbox = -1;
		while((weaponbox = find_ent_by_class(weaponbox, "weaponbox"))) {
			new Float:min_weaponboxOrigin[3];
			entity_get_vector(weaponbox, EV_VEC_absmin, min_weaponboxOrigin);
			
			new Float:max_weaponboxOrigin[3];
			entity_get_vector(weaponbox, EV_VEC_absmax, max_weaponboxOrigin);
			
			new Float:playerOrigin[3];
			entity_get_vector(id, EV_VEC_origin, playerOrigin);
			
			new Float:weaponboxOrigin[3];
			entity_get_vector(weaponbox, EV_VEC_origin, weaponboxOrigin);
			
			new Float:distance = get_distance_f(playerOrigin, weaponboxOrigin);
			if(distance < 150.0) {
				if(aimOrigin[0] < max_weaponboxOrigin[0] && aimOrigin[0] > min_weaponboxOrigin[0] 
				&& aimOrigin[1] < max_weaponboxOrigin[1] && aimOrigin[1] > min_weaponboxOrigin[1]) {
					switch(cs_get_weapon_by(weaponbox, EV_ENT_owner)) {
						case 3, 5, 7, 8, 12, 13, 14, 15, 18, 19, 20, 21, 22, 23, 24, 27, 28, 30: {
							new primary = cs_get_weapon_by(get_pdata_cbase(id, 368), EV_ENT_pContainingEntity);
							if(primary)
								drop(id, primary);
							pick_up(id, weaponbox);
							return PLUGIN_CONTINUE;
						}
						case 1, 10, 11, 16, 17, 26: {
							new secondary = cs_get_weapon_by(get_pdata_cbase(id, 369), EV_ENT_pContainingEntity);
							if(secondary)
								drop(id, secondary);
							pick_up(id, weaponbox);
							return PLUGIN_CONTINUE;
						}
					}
				}
			}
		}
		entity_set_int(id, EV_INT_button, get_user_oldbutton(id) & ~IN_USE);
		entity_set_int(id, EV_INT_button, get_user_button(id) & ~IN_USE);
	}
	return PLUGIN_CONTINUE;
}

pick_up(id, weaponbox) {
	new Float:origin[3];
	entity_get_vector(id, EV_VEC_origin, origin);
	if(get_user_button(id) & IN_DUCK)
		origin[2] -= 16.0;
	else
		origin[2] -= 36.0;
	entity_set_origin(weaponbox, origin);
}

drop(id, weapon) {
	if(weapon > 0) {
		new name[32];
		get_weaponname(weapon, name, 31);
		engclient_cmd(id, "drop", name);
	}
}

cs_get_weapon_by(weaponbox, by) {
	for(new i = 33; i < 512; ++i) {
		if(is_valid_ent(i) && weaponbox == entity_get_edict(i, by)) {
			new name[32];
			entity_get_string(i, EV_SZ_classname, name, sizeof name - 1)
			return get_weaponid(name);
		}
	}
	return 0;
}
