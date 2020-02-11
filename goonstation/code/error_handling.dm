/*
* Stuff that overrides the default byond error handler, so we can print to the error.log in a prettier format
* And also build data for an in-game runtime viewer
*
* It catches all normal runtimes and uncaught exceptions
* It does NOT catch reference bugs
*/

var/global/list/runtimeDetails = new()

/world/Error(exception/E)
	var/timestamp = time2text(world.timeofday,"hh:mm:ss")
	var/invalid = !istype(E) //what the fuck is this byond

	//Save the runtime into our persistent, uh, "storage"
	runtimeDetails["[runtimeDetails.len + 1]"] = list(
		"name" = !invalid ? E.name : E,
		"file" = !invalid ? E.file : "",
		"line" = !invalid ? E.line : "",
		"desc" = E.desc ? E.desc : "",
		"seen" = timestamp,
		"invalid" = invalid
	)

	//Output formatted runtime to the usual error.log
	if (invalid)
		world.log << "\[[timestamp]\] Invalid exception in error handler: [E]"
	else
		world.log << "\[[timestamp]\] [E.file],[E.line]: [E.name]"
		if (E.desc)
			world.log << "[E.desc]"


/client/proc/cmd_view_runtimes()
	set category = "Debug"
	set name = "View Runtimes"
	set desc = "View a detailed list of the runtimes during this round"
	set popup_menu = 0

	admin_only

	if (!cdn)
		var/list/viewerResources = list(
			"browserassets/js/runtimeViewer.js",
			"browserassets/css/runtimeViewer.css"
		)
		src.loadResourcesFromList(viewerResources)

	src.Browse(grabResource("html/runtimeViewer.html"), "window=runtimeviewer;size=500x600;title=Runtime+Viewer;", 1)


/client/Topic(href, href_list)

	if (href_list["action"] == "getRuntimeData")
		usr_admin_only
		src << output(url_encode(json_encode(runtimeDetails)), "runtimeviewer.browser:refreshRuntimes")

	..()