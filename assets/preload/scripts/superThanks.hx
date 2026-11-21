var superThanksOpen:Bool = false;
var superThanksSequence:Array<String> = [];
var superThanksTimeout:Float = 0;
var superThanksElements:Array<Dynamic> = [];

function superThanksAdd(obj:Dynamic):Void
{
	var game = PlayState.instance;
	obj.cameras = [game.camOther];
	game.add(obj);
	superThanksElements.push(obj);
}

function superThanksClose():Void
{
	var game = PlayState.instance;

	for (obj in superThanksElements)
	{
		game.remove(obj, true);
		obj.destroy();
	}

	superThanksElements = [];
	superThanksOpen = false;
	superThanksSequence = [];
	superThanksTimeout = 0;
}

function superThanksShow():Void
{
	if (superThanksOpen) return;

	superThanksOpen = true;
	superThanksSequence = [];

	var screenW:Int = FlxG.width;
	var screenH:Int = FlxG.height;
	var panelW:Float = 820;
	var panelH:Float = 500;
	var panelX:Float = (screenW - panelW) / 2;
	var panelY:Float = (screenH - panelH) / 2;

	// black background!!
	var overlay = new FlxSprite(0, 0);
	overlay.makeGraphic(screenW, screenH, FlxColor.fromRGB(0, 0, 0));
	overlay.alpha = 0.78;
	superThanksAdd(overlay);

	// panel that organize the dev and contributors
	var panel = new FlxSprite(panelX, panelY);
	panel.makeGraphic(Std.int(panelW), Std.int(panelH), FlxColor.fromRGB(24, 21, 40));
	panel.alpha = 0.98;
	superThanksAdd(panel);

	var title = new FlxText(panelX, panelY + 28, panelW, "SUPER THANKS", 42);
	title.setFormat(Paths.font("vcr.ttf"), 42, FlxColor.WHITE, CENTER);
	superThanksAdd(title);

	var subtitle = new FlxText(panelX, panelY + 82, panelW, "THE PEOPLE BEHIND RHYPS ENGINE", 20);
	subtitle.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.fromRGB(190, 170, 255), CENTER);
	superThanksAdd(subtitle);

	// the dev and contributors
	var cardW:Float = 330;
	var cardH:Float = 300;
	var gap:Float = 36;
	var leftX:Float = panelX + (panelW - (cardW * 2 + gap)) / 2;
	var rightX:Float = leftX + cardW + gap;
	var cardY:Float = panelY + 145;

	var leftCard = new FlxSprite(leftX, cardY);
	leftCard.makeGraphic(Std.int(cardW), Std.int(cardH), FlxColor.fromRGB(39, 34, 62));
	superThanksAdd(leftCard);

	var rightCard = new FlxSprite(rightX, cardY);
	rightCard.makeGraphic(Std.int(cardW), Std.int(cardH), FlxColor.fromRGB(39, 34, 62));
	superThanksAdd(rightCard);

	// no icon
	var leftIcon = new FlxSprite(leftX + (cardW - 160) / 2, cardY + 24);
	leftIcon.loadGraphic(Paths.image("credits/no-icon"));
	leftIcon.setGraphicSize(160, 160);
	leftIcon.updateHitbox();
	superThanksAdd(leftIcon);

	var rightIcon = new FlxSprite(rightX + (cardW - 160) / 2, cardY + 24);
	rightIcon.loadGraphic(Paths.image("credits/no-icon"));
	rightIcon.setGraphicSize(160, 160);
	rightIcon.updateHitbox();
	superThanksAdd(rightIcon);

	var leftName = new FlxText(leftX + 10, cardY + 205, cardW - 20, "SarahTheCuteCharter", 24);
	leftName.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, CENTER);
	superThanksAdd(leftName);

	var rightName = new FlxText(rightX + 10, cardY + 205, cardW - 20, "Sanduiche-Plays", 24);
	rightName.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, CENTER);
	superThanksAdd(rightName);

	var leftRole = new FlxText(leftX + 10, cardY + 245, cardW - 20, "CREATOR / DEVELOPER", 18);
	leftRole.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.fromRGB(190, 170, 255), CENTER);
	superThanksAdd(leftRole);

	var rightRole = new FlxText(rightX + 10, cardY + 245, cardW - 20, "DEVELOPER", 18);
	rightRole.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.fromRGB(190, 170, 255), CENTER);
	superThanksAdd(rightRole);

	var closeHint = new FlxText(panelX, panelY + panelH - 38, panelW, "PRESS ESC TO CLOSE", 18);
	closeHint.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.fromRGB(210, 210, 210), CENTER);
	superThanksAdd(closeHint);
}

function superThanksPushKey(key:String):Void
{
	superThanksSequence.push(key);

	while (superThanksSequence.length > 5)
		superThanksSequence.shift();

	if (superThanksSequence.join("") == "RHYPS")
		superThanksShow();
}

function onUpdate(elapsed:Float):Void
{
	if (superThanksOpen)
	{
		if (FlxG.keys.justPressed.ESCAPE)
			superThanksClose();

		return;
	}

	if (superThanksTimeout > 0)
	{
		superThanksTimeout -= elapsed;
		if (superThanksTimeout <= 0)
			superThanksSequence = [];
	}

	if (FlxG.keys.justPressed.R) { superThanksPushKey("R"); superThanksTimeout = 1.5; }
	if (FlxG.keys.justPressed.H) { superThanksPushKey("H"); superThanksTimeout = 1.5; }
	if (FlxG.keys.justPressed.Y) { superThanksPushKey("Y"); superThanksTimeout = 1.5; }
	if (FlxG.keys.justPressed.P) { superThanksPushKey("P"); superThanksTimeout = 1.5; }
	if (FlxG.keys.justPressed.S) { superThanksPushKey("S"); superThanksTimeout = 1.5; }
}
