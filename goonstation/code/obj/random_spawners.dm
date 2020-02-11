
/obj/random_item_spawner
	name = "random item spawner"
	icon = 'icons/obj/objects.dmi'
	icon_state = "itemspawn"
	density = 0
	anchored = 1.0
	invisibility = 101
	layer = 99
	var/min_amt2spawn = 1
	var/max_amt2spawn = 1
	var/list/items2spawn = list()
	var/list/guaranteed = list() // things that will always spawn from this - set to a number to spawn that many of the thing

	New()
		SPAWN_DBG(1)
			src.spawn_items()
			SPAWN_DBG(100)
				qdel(src)

	proc/spawn_items()
		if (islist(src.guaranteed) && src.guaranteed.len)
			for (var/new_item in src.guaranteed)
				if (!ispath(new_item))
					logTheThing("debug", src, null, "has a non-path item in its guaranteed list, [new_item]")
					DEBUG_MESSAGE("[src] has a non-path item in its guaranteed list, [new_item]")
					continue
				var/amt = 1
				if (isnum(guaranteed[new_item]))
					amt = abs(guaranteed[new_item])
				for (amt, amt>0, amt--)
					new new_item(src.loc)

		if (!islist(src.items2spawn) || !src.items2spawn.len)
			logTheThing("debug", src, null, "has an invalid items2spawn list")
			return

		var/amt2spawn = rand(min_amt2spawn, max_amt2spawn)
		for (amt2spawn, amt2spawn>0, amt2spawn--)
			var/new_item = pick(src.items2spawn)
			if (!ispath(new_item))
				logTheThing("debug", src, null, "has a non-path item in its spawn list, [new_item]")
				DEBUG_MESSAGE("[src] has a non-path item in its spawn list, [new_item]")
				continue
			new new_item(src.loc)

/obj/random_item_spawner/tools
	name = "random tool spawner"
	min_amt2spawn = 3
	max_amt2spawn = 7
	items2spawn = list(/obj/item/crowbar,
	/obj/item/wirecutters,
	/obj/item/wrench,
	/obj/item/screwdriver,
	/obj/item/weldingtool,
	/obj/item/device/multitool,
	/obj/item/cable_coil/cut/small,
	/obj/item/cable_coil,
	/obj/item/sheet/steel/fullstack,
	/obj/item/sheet/steel/reinforced/fullstack,
	/obj/item/sheet/glass/fullstack,
	/obj/item/sheet/glass/reinforced/fullstack,
	/obj/item/rods/steel/fullstack,
	/obj/item/tile/steel/fullstack,
	/obj/item/storage/toolbox/mechanical,
	/obj/item/storage/toolbox/electrical,
	/obj/item/storage/toolbox/emergency,
	/obj/item/storage/box/cablesbox,
	/obj/item/storage/box/lightbox,
	/obj/item/storage/box/lightbox/tubes,
	/obj/item/clothing/gloves/black,
	/obj/item/clothing/head/helmet/hardhat,
	/obj/item/clothing/head/helmet/welding,
	/obj/item/cell,
	/obj/item/cell/supercell,
	/obj/item/device/flashlight,
	/obj/item/device/glowstick,
	/obj/item/device/t_scanner,
	/obj/item/device/analyzer/atmospheric,
	/obj/item/device/analyzer/atmosanalyzer_upgrade,
	/obj/item/extinguisher,
	/obj/item/reagent_containers/glass/oilcan,
	/obj/item/storage/belt/utility)

/obj/random_item_spawner/tools_w_igloves
	name = "random tool spawner (includes insulated gloves)"
	min_amt2spawn = 3
	max_amt2spawn = 7
	items2spawn = list(/obj/item/crowbar,
	/obj/item/wirecutters,
	/obj/item/wrench,
	/obj/item/screwdriver,
	/obj/item/weldingtool,
	/obj/item/device/multitool,
	/obj/item/cable_coil/cut/small,
	/obj/item/cable_coil,
	/obj/item/sheet/steel/fullstack,
	/obj/item/sheet/steel/reinforced/fullstack,
	/obj/item/sheet/glass/fullstack,
	/obj/item/sheet/glass/reinforced/fullstack,
	/obj/item/rods/steel/fullstack,
	/obj/item/tile/steel/fullstack,
	/obj/item/storage/toolbox/mechanical,
	/obj/item/storage/toolbox/electrical,
	/obj/item/storage/toolbox/emergency,
	/obj/item/storage/box/cablesbox,
	/obj/item/storage/box/lightbox,
	/obj/item/storage/box/lightbox/tubes,
	/obj/item/clothing/gloves/black,
	/obj/item/clothing/gloves/yellow,
	/obj/item/clothing/head/helmet/hardhat,
	/obj/item/clothing/head/helmet/welding,
	/obj/item/cell,
	/obj/item/cell/supercell,
	/obj/item/device/flashlight,
	/obj/item/device/glowstick,
	/obj/item/device/t_scanner,
	/obj/item/device/analyzer/atmospheric,
	/obj/item/device/analyzer/atmosanalyzer_upgrade,
	/obj/item/extinguisher,
	/obj/item/reagent_containers/glass/oilcan,
	/obj/item/storage/belt/utility)

/obj/random_item_spawner/med_tool
	name = "random medical tool spawner"
	min_amt2spawn = 4
	max_amt2spawn = 8
	items2spawn = list(/obj/item/scalpel,
	/obj/item/circular_saw,
	/obj/item/staple_gun,
	/obj/item/robodefibrillator,
	/obj/item/hemostat,
	/obj/item/suture,
	/obj/item/bandage,
	/obj/item/body_bag,
	/obj/item/device/analyzer/healthanalyzer,
	/obj/item/device/analyzer/healthanalyzer_upgrade,
	/obj/item/reagent_containers/dropper,
	/obj/item/reagent_containers/dropper/mechanical,
	/obj/item/storage/box/syringes,
	/obj/item/storage/box/patchbox,
	/obj/item/storage/box/iv_box,
	/obj/item/reagent_containers/hypospray,
	/obj/item/clothing/glasses/healthgoggles,
	/obj/item/storage/box/lglo_kit/random,
	/obj/item/storage/box/stma_kit,
	/obj/item/clothing/mask/surgical_shield,
	/obj/item/storage/belt/medical)

/obj/random_item_spawner/medicine
	name = "random medicine spawner"
	min_amt2spawn = 4
	max_amt2spawn = 8
	items2spawn = list(/obj/item/storage/pill_bottle/antirad,
	/obj/item/storage/pill_bottle/mutadone,
	/obj/item/storage/pill_bottle/epinephrine,
	/obj/item/storage/pill_bottle/antitox,
	/obj/item/storage/pill_bottle/salbutamol,
	/obj/item/reagent_containers/syringe/epinephrine,
	/obj/item/reagent_containers/syringe/insulin,
	/obj/item/reagent_containers/syringe/haloperidol,
	/obj/item/reagent_containers/syringe/antitoxin,
	/obj/item/reagent_containers/syringe/antiviral,
	/obj/item/reagent_containers/syringe/atropine,
	/obj/item/reagent_containers/syringe/morphine,
	/obj/item/reagent_containers/syringe/calomel,
	/obj/item/reagent_containers/syringe/heparin,
	/obj/item/reagent_containers/syringe/proconvertin,
	/obj/item/reagent_containers/syringe/filgrastim,
	/obj/item/reagent_containers/iv_drip/blood,
	/obj/item/reagent_containers/iv_drip/saline,
	/obj/item/reagent_containers/glass/bottle/epinephrine,
	/obj/item/reagent_containers/glass/bottle/atropine,
	/obj/item/reagent_containers/glass/bottle/saline,
	/obj/item/reagent_containers/glass/bottle/aspirin,
	/obj/item/reagent_containers/glass/bottle/morphine,
	/obj/item/reagent_containers/glass/bottle/antitoxin,
	/obj/item/reagent_containers/glass/bottle/antihistamine,
	/obj/item/reagent_containers/glass/bottle/eyedrops,
	/obj/item/reagent_containers/glass/bottle/antirad,
	/obj/item/reagent_containers/glass/beaker/cryoxadone,
	/obj/item/reagent_containers/glass/beaker/large/epinephrine,
	/obj/item/reagent_containers/glass/beaker/large/antitox,
	/obj/item/reagent_containers/glass/beaker/large/brute,
	/obj/item/reagent_containers/glass/beaker/large/burn,
	/obj/item/reagent_containers/emergency_injector/epinephrine,
	/obj/item/reagent_containers/emergency_injector/atropine,
	/obj/item/reagent_containers/emergency_injector/charcoal,
	/obj/item/reagent_containers/emergency_injector/saline,
	/obj/item/reagent_containers/emergency_injector/anti_rad,
	/obj/item/reagent_containers/emergency_injector/insulin,
	/obj/item/reagent_containers/emergency_injector/calomel,
	/obj/item/reagent_containers/emergency_injector/salicylic_acid,
	/obj/item/reagent_containers/emergency_injector/spaceacillin,
	/obj/item/reagent_containers/emergency_injector/antihistamine,
	/obj/item/reagent_containers/emergency_injector/salbutamol,
	/obj/item/reagent_containers/emergency_injector/mannitol,
	/obj/item/reagent_containers/emergency_injector/mutadone,
	/obj/item/reagent_containers/emergency_injector/heparin,
	/obj/item/reagent_containers/emergency_injector/proconvertin,
	/obj/item/reagent_containers/emergency_injector/filgrastim,
	/obj/item/item_box/medical_patches/styptic,
	/obj/item/item_box/medical_patches/mini_styptic,
	/obj/item/item_box/medical_patches/silver_sulf,
	/obj/item/item_box/medical_patches/mini_silver_sulf,
	/obj/item/item_box/medical_patches/synthflesh,
	/obj/item/item_box/medical_patches/mini_synthflesh)

/obj/random_item_spawner/med_kit
	name = "random medical kit spawner"
	min_amt2spawn = 2
	max_amt2spawn = 4
	items2spawn = list(/obj/item/storage/firstaid/regular,
	/obj/item/storage/firstaid/brute,
	/obj/item/storage/firstaid/fire,
	/obj/item/storage/firstaid/toxin,
	/obj/item/storage/firstaid/oxygen,
	/obj/item/storage/firstaid/brain)

/obj/random_item_spawner/desk_stuff
	name = "random desk item spawner"
	min_amt2spawn = 2
	max_amt2spawn = 5
	items2spawn = list(/obj/item/pen,
	/obj/item/pen/fancy,
	/obj/item/pen/red,
	/obj/item/pen/pencil,
	/obj/item/pen/marker,
	/obj/item/pen/marker/red,
	/obj/item/pen/marker/blue,
	/obj/item/storage/box/crayon,
	/obj/item/storage/box/crayon/basic,
	/obj/item/storage/box/marker,
	/obj/item/storage/box/marker/basic,
	/obj/item/hand_labeler,
	/obj/item/clipboard,
	/obj/item/stamp,
	/obj/item/paper,
	/obj/item/paper_bin,
	/obj/decal/cleanable/generic,
	/obj/item/reagent_containers/food/drinks/mug/random_color,
	/obj/item/postit_stack,
	/obj/item/staple_gun/red)

/obj/random_item_spawner/desk_stuff/g_clip_bin_pen
	name = "random desk item spawner (guaranteed basic)"
	guaranteed = list(/obj/item/clipboard,
	/obj/item/paper_bin,
	/obj/item/pen)
	items2spawn = list(/obj/item/pen/fancy,
	/obj/item/pen/red,
	/obj/item/pen/pencil,
	/obj/item/pen/marker,
	/obj/item/pen/marker/red,
	/obj/item/pen/marker/blue,
	/obj/item/pen/marker/random,
	/obj/item/storage/box/crayon,
	/obj/item/storage/box/crayon/basic,
	/obj/item/storage/box/marker,
	/obj/item/storage/box/marker/basic,
	/obj/item/hand_labeler,
	/obj/item/stamp,
	/obj/item/paper,
	/obj/decal/cleanable/generic,
	/obj/item/reagent_containers/food/drinks/mug/random_color,
	/obj/item/postit_stack,
	/obj/item/staple_gun/red)

/obj/random_item_spawner/desk_stuff/g_clip_bin_fpen
	name = "random desk item spawner (guaranteed fancy)"
	guaranteed = list(/obj/item/clipboard,
	/obj/item/paper_bin,
	/obj/item/stamp,
	/obj/item/pen/fancy)
	items2spawn = list(/obj/item/pen,
	/obj/item/pen/red,
	/obj/item/pen/pencil,
	/obj/item/pen/marker,
	/obj/item/pen/marker/red,
	/obj/item/pen/marker/blue,
	/obj/item/pen/marker/random,
	/obj/item/storage/box/crayon,
	/obj/item/storage/box/crayon/basic,
	/obj/item/storage/box/marker,
	/obj/item/storage/box/marker/basic,
	/obj/item/hand_labeler,
	/obj/item/paper,
	/obj/decal/cleanable/generic,
	/obj/item/reagent_containers/food/drinks/mug/random_color,
	/obj/item/postit_stack,
	/obj/item/staple_gun/red)

/obj/random_item_spawner/tableware
	name = "random tableware spawner"
	min_amt2spawn = 2
	max_amt2spawn = 7
	items2spawn = list(/obj/item/kitchen/utensil/fork,
	/obj/item/kitchen/utensil/knife,
	/obj/item/kitchen/utensil/spoon,
	/obj/item/plate,
	/obj/item/reagent_containers/food/drinks/bowl,
	/obj/item/reagent_containers/food/drinks/drinkingglass,
	/obj/item/reagent_containers/food/drinks/drinkingglass/shot,
	/obj/item/reagent_containers/food/drinks/drinkingglass/wine,
	/obj/item/reagent_containers/food/drinks/drinkingglass/cocktail,
	/obj/item/reagent_containers/food/drinks/drinkingglass/flute,
	/obj/item/reagent_containers/food/drinks/mug/random_color)

/obj/random_item_spawner/landmine
	name = "random land mine spawner"
	min_amt2spawn = 1
	max_amt2spawn = 1
	items2spawn = list(/obj/item/mine/radiation/armed,
	/obj/item/mine/incendiary/armed,
	/obj/item/mine/stun/armed,
	/obj/item/mine/blast/armed)

// Surplus crate picker.
/obj/random_item_spawner/landmine/surplus
	name = "random land mine spawner (surplus crate)"
	min_amt2spawn = 1
	max_amt2spawn = 1
	items2spawn = list(/obj/item/mine/radiation,
	/obj/item/mine/incendiary,
	/obj/item/mine/stun,
	/obj/item/mine/blast)

// Loot Crate picker.
/obj/random_item_spawner/loot_crate/surplus
	name = "Loot Crate Spawner"
	guaranteed = list(/obj/item/material_piece/mauxite=10,
	/obj/item/material_piece/molitz=10,
	/obj/item/material_piece/pharosium=10)
	min_amt2spawn = 24
	max_amt2spawn = 42
	items2spawn = list(/obj/item/material_piece/mauxite,
		/obj/item/material_piece/molitz,
		/obj/item/material_piece/pharosium,
		/obj/item/material_piece/cobryl,
		/obj/item/material_piece/claretine,
		/obj/item/material_piece/bohrum,
		/obj/item/material_piece/syreline,
		/obj/item/material_piece/plasmastone,
		/obj/item/material_piece/uqill,
		/obj/item/material_piece/koshmarite,
		/obj/item/material_piece/gold,
		/obj/item/raw_material/cotton,
		/obj/item/raw_material/miracle,
		/obj/item/raw_material/uqill,
		/obj/item/raw_material/cerenkite,
		/obj/item/raw_material/erebite,
		/obj/item/spacecash/buttcoin,
		/obj/item/spacecash/random/tourist,
		/obj/item/a_gift/easter)

/obj/random_pod_spawner
	name = "random pod spawner"
	icon = 'icons/obj/objects.dmi'
	icon_state = "podspawn"
	density = 0
	anchored = 1.0
	invisibility = 101
	layer = 99
	var/obj/machinery/vehicle/pod2spawn = null

	New()
		SPAWN_DBG(1)
			src.set_up()
			SPAWN_DBG(10)
				qdel(src)

	proc/set_up()
		// choose pod to spawn and spawn it
		src.spawn_pod()
		// everyone gets a lock
		src.spawn_lock()

		// add the pod to the list of available random pods
		if (islist(random_pod_codes))
			random_pod_codes += pod2spawn

		// small chance for a paintjob
		if (prob(2))
			src.paint_pod()
		// weapons are common enough
		if (prob(33))
			src.spawn_weapon()
		// maybe a nicer engine
		if (prob(10))
			src.spawn_engine()
		// maybe a nicer sensor
		if (prob(8))
			src.spawn_sensor()
		// maybe let's have been treated a bit rough
		if (prob(5))
			pod2spawn.keyed = rand(1,66)

		// update our hud
		pod2spawn.myhud.update_systems()
		pod2spawn.myhud.update_states()

	proc/spawn_pod()
		var/turf/T = get_turf(src)
		if (prob(1))
			pod2spawn = new /obj/machinery/vehicle/pod_smooth/iridium(T)
		else if (prob(2))
			pod2spawn = new /obj/machinery/vehicle/pod_smooth/black(T)
		else if (prob(3))
			pod2spawn = new /obj/machinery/vehicle/pod_smooth/gold(T)
		else if (prob(5))
			pod2spawn = new /obj/machinery/vehicle/pod_smooth/heavy(T)
		else if (prob(15))
			pod2spawn = new /obj/machinery/vehicle/pod_smooth/industrial(T)
		else
			pod2spawn = new /obj/machinery/vehicle/pod_smooth/light(T)

	proc/spawn_lock()
		pod2spawn.lock = new /obj/item/shipcomponent/secondary_system/lock(pod2spawn)
		pod2spawn.lock.ship = pod2spawn
		pod2spawn.components += pod2spawn.lock
		pod2spawn.lock.code = random_hex(4)
		pod2spawn.locked = 1

	proc/paint_pod()
		var/paintjob
		if (prob(5))
			paintjob = pick(/obj/item/pod/paintjob/tronthing, /obj/item/pod/paintjob/rainbow)
		else
			paintjob = pick(/obj/item/pod/paintjob/flames, /obj/item/pod/paintjob/flames_p, /obj/item/pod/paintjob/flames_b, /obj/item/pod/paintjob/stripe_r, /obj/item/pod/paintjob/stripe_b, /obj/item/pod/paintjob/stripe_g)
		var/obj/item/pod/paintjob/P = new paintjob(pod2spawn)
		pod2spawn.paint_pod(P)

	proc/spawn_weapon()
		var/obj/item/shipcomponent/mainweapon/new_weapon
		if (prob(1))
			new_weapon = pick(/obj/item/shipcomponent/mainweapon/artillery, /obj/item/shipcomponent/mainweapon/precursor)
		else if (prob(3))
			new_weapon = pick(/obj/item/shipcomponent/mainweapon/disruptor, /obj/item/shipcomponent/mainweapon/laser_ass, /obj/item/shipcomponent/mainweapon/gun)
		else if (prob(5))
			new_weapon = pick(/obj/item/shipcomponent/mainweapon/rockdrills, /obj/item/shipcomponent/mainweapon/disruptor_light, /obj/item/shipcomponent/mainweapon/russian, /obj/item/shipcomponent/mainweapon/mining)
		else if (prob(10))
			new_weapon = pick(/obj/item/shipcomponent/mainweapon/phaser, /obj/item/shipcomponent/mainweapon/laser, /obj/item/shipcomponent/mainweapon/taser)
		else
			new_weapon = /obj/item/shipcomponent/mainweapon

		pod2spawn.m_w_system = new new_weapon(pod2spawn)
		pod2spawn.m_w_system.ship = pod2spawn
		pod2spawn.components += pod2spawn.m_w_system
		if (pod2spawn.uses_weapon_overlays)
			pod2spawn.overlays += image(pod2spawn.icon, "[pod2spawn.m_w_system.appearanceString]")

	proc/spawn_engine()
		if (prob(5))
			pod2spawn.engine.deactivate()
			pod2spawn.components -= pod2spawn.engine
			qdel(pod2spawn.engine)

			pod2spawn.engine = new /obj/item/shipcomponent/engine/hermes(pod2spawn)
			pod2spawn.engine.ship = pod2spawn
			pod2spawn.components += pod2spawn.engine
			pod2spawn.engine.activate()

		else
			pod2spawn.engine.deactivate()
			pod2spawn.components -= pod2spawn.engine
			qdel(pod2spawn.engine)

			pod2spawn.engine = new /obj/item/shipcomponent/engine/helios(pod2spawn)
			pod2spawn.engine.ship = pod2spawn
			pod2spawn.components += pod2spawn.engine
			pod2spawn.engine.activate()

	proc/spawn_sensor()
		pod2spawn.sensors.deactivate()
		pod2spawn.components -= pod2spawn.sensors
		qdel(pod2spawn.sensors)

		pod2spawn.sensors = new /obj/item/shipcomponent/sensor/mining(pod2spawn)
		pod2spawn.sensors.ship = pod2spawn
		pod2spawn.components += pod2spawn.sensors
		pod2spawn.sensors.activate()

/obj/random_pod_spawner/random_putt_spawner
	name = "random miniputt spawner"
	icon_state = "puttspawn"

	spawn_pod()
		var/turf/T = get_turf(src)
		if (prob(1))
			pod2spawn = new /obj/machinery/vehicle/miniputt/iridium(T)
		else if (prob(1))
			pod2spawn = new /obj/machinery/vehicle/miniputt/soviputt(T)
		else if (prob(2))
			pod2spawn = new /obj/machinery/vehicle/miniputt/black(T)
		else if (prob(3))
			pod2spawn = new /obj/machinery/vehicle/miniputt/gold(T)
		else if (prob(5))
			pod2spawn = new /obj/machinery/vehicle/miniputt/nanoputt(T)
		else if (prob(15))
			pod2spawn = new /obj/machinery/vehicle/miniputt/indyputt(T)
		else
			pod2spawn = new /obj/machinery/vehicle/miniputt(T)

// Random spawners for cargo crates. (Gannets)

/obj/random_item_spawner/prosthetics
	name = "random prosthesis spawner"
	min_amt2spawn = 6
	max_amt2spawn = 8
	items2spawn = list(/obj/item/parts/robot_parts/arm/left/sturdy,
	/obj/item/parts/robot_parts/arm/right/sturdy,
	/obj/item/parts/robot_parts/arm/left/heavy,
	/obj/item/parts/robot_parts/arm/right/heavy,
	/obj/item/parts/robot_parts/arm/left/light,
	/obj/item/parts/robot_parts/arm/right/light,
	/obj/item/parts/robot_parts/leg/right/treads,
	/obj/item/parts/robot_parts/leg/left/treads,
	/obj/item/organ/eye/cyber/prodoc,
	/obj/item/organ/eye/cyber/nightvision,
	/obj/item/organ/eye/cyber/sechud)

/obj/random_item_spawner/critter
	name = "random critter spawner"
	min_amt2spawn = 4
	max_amt2spawn = 6
	items2spawn = list(/obj/critter/domestic_bee,
	/obj/critter/bat,
	/obj/critter/mouse,
	/obj/critter/opossum,
	/obj/critter/dog/george/blair,
	/obj/critter/dog/george/orwell,
	/obj/critter/dog/george/shiba,
	/obj/critter/pig,
	/obj/critter/seagull/gannet,
	/obj/critter/crow,
	/obj/critter/seagull,
	/obj/critter/nicespider,
	/obj/critter/goose,
	/obj/critter/goose/swan)

/obj/random_item_spawner/peripherals
	name = "random peripheral spawner"
	min_amt2spawn = 5
	max_amt2spawn = 8
	items2spawn = list(/obj/item/motherboard,
					/obj/item/peripheral/network/radio/locked,
					/obj/item/peripheral/network/powernet_card,
					/obj/item/peripheral/printer,
					/obj/item/peripheral/prize_vendor,
					/obj/item/peripheral/card_scanner,
					/obj/item/peripheral/sound_card,
					/obj/item/peripheral/drive/cart_reader,
					/obj/item/peripheral/drive/tape_reader,
					/obj/item/peripheral/cell_monitor,
					/obj/item/peripheral/videocard)

/obj/random_item_spawner/circuitboards
	name = "random circuitboard spawner"
	min_amt2spawn = 2
	max_amt2spawn = 4
	items2spawn = list(/obj/item/circuitboard/security,
					/obj/item/circuitboard/atmospherealerts,
					/obj/item/circuitboard/air_management,
					/obj/item/circuitboard/general_alert,
					/obj/item/circuitboard/atm,
					/obj/item/circuitboard/solar_control,
					/obj/item/circuitboard/arcade,
					/obj/item/circuitboard/powermonitor,
					/obj/item/circuitboard/barcode,
					/obj/item/circuitboard/operating)

/obj/random_item_spawner/buddytool
	name = "random buddy tool spawner"
	min_amt2spawn = 1
	max_amt2spawn = 2
	items2spawn = list (/obj/item/device/guardbot_tool/medicator,
						/obj/item/device/guardbot_tool/smoker,
						/obj/item/device/guardbot_tool/taser,
						/obj/item/device/guardbot_tool/flash)

/obj/random_item_spawner/dressup
	name = "random gimmick clothing spawner"
	min_amt2spawn = 15
	max_amt2spawn = 20
	items2spawn = list(
		/obj/item/clothing/under/gimmick/macho,
		/obj/item/clothing/under/gimmick/bowling,
		/obj/item/clothing/under/gimmick/hunter,
		/obj/item/clothing/under/gimmick/owl,
		/obj/item/clothing/under/gimmick/waldo,
		/obj/item/clothing/under/gimmick/odlaw,
		/obj/item/clothing/under/gimmick/fake_waldo,
		/obj/item/clothing/under/gimmick/johnny,
		/obj/item/clothing/under/gimmick/police,
		/obj/item/clothing/under/gimmick/blackstronaut,
		/obj/item/clothing/under/gimmick/duke,
		/obj/item/clothing/under/gimmick/mj_clothes,
		/obj/item/clothing/under/gimmick/viking,
		/obj/item/clothing/under/gimmick/merchant,
		/obj/item/clothing/under/gimmick/spiderman,
		/obj/item/clothing/under/gimmick/birdman,
		/obj/item/clothing/under/gimmick/dawson,
		/obj/item/clothing/under/gimmick/chav,
		/obj/item/clothing/under/gimmick/safari,
		/obj/item/clothing/under/gimmick/utena,
		/obj/item/clothing/under/gimmick/anthy,
		/obj/item/clothing/under/gimmick/butler,
		/obj/item/clothing/under/gimmick/maid,
		/obj/item/clothing/under/gimmick/kilt,
		/obj/item/clothing/under/gimmick/wedding_dress,
		/obj/item/clothing/under/gimmick/psyche,
		/obj/item/clothing/under/gimmick/dolan,
		/obj/item/clothing/under/gimmick/jetson,
		/obj/item/clothing/under/gimmick/princess,
		/obj/item/clothing/under/gimmick/cosby,
		/obj/item/clothing/under/gimmick/chaps,
		/obj/item/clothing/under/gimmick/vault13,
		/obj/item/clothing/under/gimmick/murph,
		/obj/item/clothing/under/gimmick/sealab,
		/obj/item/clothing/under/gimmick/rainbow,
		/obj/item/clothing/under/gimmick/yay,
		/obj/item/clothing/under/gimmick/cloud,
		/obj/item/clothing/under/gimmick/mario/luigi,
		/obj/item/clothing/under/gimmick/mario/wario,
		/obj/item/clothing/under/gimmick/mario/waluigi,
		/obj/item/clothing/under/gimmick/mario,
		/obj/item/clothing/under/gimmick/shirtnjeans,
		/obj/item/clothing/under/gimmick/hakama/random
	)

/obj/random_item_spawner/mask
	name = "random mask spawner"
	min_amt2spawn = 5
	max_amt2spawn = 10
	items2spawn = list(/obj/item/clothing/mask/hunter,
						/obj/item/clothing/mask/owl_mask,
						/obj/item/clothing/mask/smile,
						/obj/item/clothing/mask/batman,
						/obj/item/clothing/mask/clown_hat,
						/obj/item/clothing/mask/clown_hat/blue,
						/obj/item/clothing/mask/balaclava,
						/obj/item/clothing/mask/spiderman,
						/obj/item/clothing/mask/horse_mask,
						/obj/item/clothing/mask/gas/inquis,
						/obj/item/clothing/mask/gas/plague,
						/obj/item/clothing/mask/skull,
						/obj/item/clothing/mask/niccage,
						/obj/item/clothing/mask/waltwhite,
						/obj/item/clothing/mask/mmyers,
						/obj/item/clothing/mask/mime,
						/obj/item/clothing/mask/moustache,
						/obj/item/clothing/mask/melons,
						/obj/item/clothing/mask/wrestling,
						/obj/item/clothing/mask/wrestling/black,
						/obj/item/clothing/mask/wrestling/green,
						/obj/item/clothing/mask/wrestling/blue,
						/obj/item/clothing/mask/anime,
						/obj/item/paper_mask)

/obj/random_item_spawner/hat
	name = "random hat spawner"
	min_amt2spawn = 5
	max_amt2spawn = 10
	items2spawn = list(/obj/item/clothing/head/helmet/bobby,
						/obj/item/clothing/head/helmet/batman,
						/obj/item/clothing/head/helmet/viking,
						/obj/item/clothing/head/helmet/turd,
						/obj/item/clothing/head/helmet/thunderdome,
						/obj/item/clothing/head/helmet/hardhat,
						/obj/item/clothing/head/helmet/jetson,
						/obj/item/clothing/head/helmet/siren,
						/obj/item/clothing/head/helmet/bucket,
						/obj/item/clothing/head/helmet/bucket/red,
						/obj/item/clothing/head/tinfoil_hat,
						/obj/item/clothing/head/raccoon,
						/obj/item/clothing/head/fruithat,
						/obj/item/clothing/head/waldohat,
						/obj/item/clothing/head/odlawhat,
						/obj/item/clothing/head/fake_waldohat,
						/obj/item/clothing/head/flatcap,
						/obj/item/clothing/head/devil,
						/obj/item/clothing/head/biker_cap,
						/obj/item/clothing/head/mj_hat,
						/obj/item/clothing/head/genki,
						/obj/item/clothing/head/birdman,
						/obj/item/clothing/head/chav,
						/obj/item/clothing/head/maid,
						/obj/item/clothing/head/veil,
						/obj/item/clothing/head/rando,
						/obj/item/clothing/head/psyche,
						/obj/item/clothing/head/serpico,
						/obj/item/clothing/head/cakehat,
						/obj/item/clothing/head/powdered_wig,
						/obj/item/clothing/head/that,
						/obj/item/clothing/head/that/purple,
						/obj/item/clothing/head/that/gold,
						/obj/item/clothing/head/mailcap,
						/obj/item/clothing/head/plunger,
						/obj/item/clothing/head/XComHair,
						/obj/item/clothing/head/apprentice,
						/obj/item/clothing/head/snake,
						/obj/item/clothing/head/rabbihat,
						/obj/item/clothing/head/formal_turban,
						/obj/item/clothing/head/turban,
						/obj/item/clothing/head/rastacap,
						/obj/item/clothing/head/fedora,
						/obj/item/clothing/head/cowboy,
						/obj/item/clothing/head/paper_hat,
						/obj/item/clothing/head/towel_hat,
						/obj/item/clothing/head/crown,
						/obj/item/clothing/head/oddjob,
						/obj/item/clothing/head/mario/luigi,
						/obj/item/clothing/head/mario/wario,
						/obj/item/clothing/head/mario/waluigi,
						/obj/item/clothing/head/mario,
						/obj/item/clothing/head/pumpkin,
						/obj/item/clothing/head/wig)


/obj/random_item_spawner/furniture_parts
	name = "furniture parts spawner"
	min_amt2spawn = 8
	max_amt2spawn = 10
	items2spawn = list(/obj/item/furniture_parts/IVstand,
						/obj/item/furniture_parts/surgery_tray,
						/obj/item/furniture_parts/table/desk,
						/obj/item/furniture_parts/table/wood/round,
						/obj/item/furniture_parts/table/wood/desk,
						/obj/item/furniture_parts/table/wood,
						/obj/item/furniture_parts/table/round,
						/obj/item/furniture_parts/table/glass/frame,
						/obj/item/furniture_parts/table/glass/reinforced,
						/obj/item/furniture_parts/table/glass,
						/obj/item/furniture_parts/table/reinforced/bar,
						/obj/item/furniture_parts/table/reinforced/chemistry,
						/obj/item/furniture_parts/table/reinforced,
						/obj/item/furniture_parts/table,
						/obj/item/furniture_parts/rack,
						/obj/item/furniture_parts/stool/bar,
						/obj/item/furniture_parts/stool,
						/obj/item/furniture_parts/bench/red,
						/obj/item/furniture_parts/bench/blue,
						/obj/item/furniture_parts/bench/green,
						/obj/item/furniture_parts/bench/yellow,
						/obj/item/furniture_parts/bench,
						/obj/item/furniture_parts/wood_chair,
						/obj/item/furniture_parts/office_chair,
						/obj/item/furniture_parts/office_chair/red,
						/obj/item/furniture_parts/office_chair/green,
						/obj/item/furniture_parts/office_chair/blue,
						/obj/item/furniture_parts/office_chair/yellow,
						/obj/item/furniture_parts/office_chair/purple,
						/obj/item/furniture_parts/bed/roller,
						/obj/item/furniture_parts/bed)

/obj/random_item_spawner/kineticgun // used in the 4th of july admin button.
	name = "firearm spawner"
	min_amt2spawn = 1
	max_amt2spawn = 1
	items2spawn = list(/obj/item/gun/kinetic/minigun,
						/obj/item/gun/kinetic/revolver,
						/obj/item/gun/kinetic/derringer,
						/obj/item/gun/kinetic/detectiverevolver,
						/obj/item/gun/kinetic/spacker,
						/obj/item/gun/kinetic/riotgun,
						/obj/item/gun/kinetic/ak47,
						/obj/item/gun/kinetic/hunting_rifle,
						/obj/item/gun/kinetic/silenced_22,
						/obj/item/gun/kinetic/pistol,
						/obj/item/gun/kinetic/assault_rifle,
						/obj/item/gun/kinetic/light_machine_gun)
