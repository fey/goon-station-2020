var/global/list/teleareas

proc/get_teleareas()
	if (isnull(teleareas))
		generate_teleareas()
	return teleareas

proc/get_telearea(var/name)
	var/list/areas = get_teleareas()
	return areas[name]

proc/generate_teleareas()
	var/area/a
	LAGCHECK(LAG_HIGH)
	teleareas = list()
	for (var/turf/T in bounds(1, 1, world.maxx * world.icon_size, world.maxy * world.icon_size, 1))
		a = T.loc
		if (!a || !isarea(a) || teleareas.Find(a.name) || istype(a, /area/cordon))
			continue
		if (istype(a, /area/wizard_station))
			var/entry = text("* []", a.name)
			teleareas[entry] = a
			continue
		teleareas[a.name] = a
	teleareas = sortList(teleareas)