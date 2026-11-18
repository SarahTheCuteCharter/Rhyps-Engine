	// FlxG.log.add(ChartParser.parse());
    songSpeedType = ClientPrefs.getGameplaySetting('scrolltype');

    randomizedScrollSpeed = ClientPrefs.getGameplaySetting('scrollspeed');
		
    if (ClientPrefs.getGameplaySetting('randomscrollspeed', false))
        randomizedScrollSpeed = FlxG.random.float(1.0, 5.6);

    switch(songSpeedType)
    {
        case "multiplicative":
            songSpeed = SONG.speed * randomizedScrollSpeed;

        case "constant":
            songSpeed = randomizedScrollSpeed;
    }
	var songData = SONG;
