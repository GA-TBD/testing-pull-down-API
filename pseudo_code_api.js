	Get all towed cars via API / AJAX
	declare tier-1 match array
	declare tier-2 match array
	declare tier-3 match array
	Loop though all cars
		if plate & state match
			create instance of match object
			fill it match object
			add object to tier 1 match array
			exit Loop
		if 4 match (make model style color)
			add to tier 2
	End Loop

	Sort by tier
	normalize data

	return array of matches
