/datum/hud/ai
	var/mob/living/silicon/ai/master

	New(M)
		master = M


	clear_master()
		master = null
		..()