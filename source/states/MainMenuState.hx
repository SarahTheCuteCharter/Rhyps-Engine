package states;

import backend.WeekData;
import backend.Achievements;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxTimer;
import lime.app.Application;

import objects.AchievementPopup;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.7.1h';
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;

	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		#if MODS_ALLOWED 'mods', #end
		#if ACHIEVEMENTS_ALLOWED 'awards', #end
		'credits',
		#if !switch 'donate', #end
		'options'
	];

	var magenta:FlxSprite;
	var camFollow:FlxObject;

	// NKL-4ever FunnyTips System
	var tipTextMargin:Float = 10;
	var tipTextScrolling:Bool = false;
	var tipBackground:FlxSprite;
	var tipText:FlxText;
	var tipTimer:FlxTimer = new FlxTimer();
	var isTweening:Bool = false;
	var lastString:String = '';

	var tipsArray:Array<String> = [];
	var canDoTips:Bool = true;

	override function create()
	{
		#if MODS_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		#if desktop
		DiscordClient.changePresence("In the Menus", null);
		#end

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement, false);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.antialiasing = ClientPrefs.data.antialiasing;
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.color = 0xFFfd719b;
		add(magenta);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140) + offset);
			menuItem.antialiasing = ClientPrefs.data.antialiasing;
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if (optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.updateHitbox();
		}

		FlxG.camera.follow(camFollow, null, 0);

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych NKL-4ever Engine", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		var fnfVersion:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		fnfVersion.scrollFactor.set();
		fnfVersion.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(fnfVersion);

		// FunnyTips like JS Engine, the code is not from JS Engine
		tipsArray = CoolUtil.coolTextFile(Paths.txt('funnyTips'));
		canDoTips = tipsArray != null && tipsArray.length > 0;

		if (!canDoTips)
			trace('FunnyTips: no tips found!');

		tipBackground = new FlxSprite();
		tipBackground.scrollFactor.set();
		tipBackground.makeGraphic(FlxG.width, 54, FlxColor.BLACK);
		tipBackground.alpha = 0.65;
		tipBackground.visible = canDoTips;
		add(tipBackground);

		tipText = new FlxText(0, 0, FlxG.width - tipTextMargin * 2, "");
		tipText.scrollFactor.set();
		tipText.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT);
		tipText.visible = canDoTips;
		add(tipText);

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18)
		{
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if (!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2]))
			{
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		#if android
		addVirtualPad(UP_DOWN, A_B_E);
		#end

		super.create();

		if (canDoTips)
		{
			changeTipText();
			tipTextStartScrolling();
		}
	}

	#if ACHIEVEMENTS_ALLOWED
	function giveAchievement()
	{
		add(new AchievementPopup('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	// FunnyTips: choose a tip and prepare its text.
	function changeTipText()
	{
		if (!canDoTips || tipsArray == null || tipsArray.length == 0)
			return;

		var selectedText:String = tipsArray[FlxG.random.int(0, tipsArray.length - 1)].replace('--', '\n');

		if (tipsArray.length > 1)
		{
			var attempts:Int = 0;
			while (selectedText == lastString && attempts < 20)
			{
				selectedText = tipsArray[FlxG.random.int(0, tipsArray.length - 1)].replace('--', '\n');
				attempts++;
			}
		}

		lastString = selectedText;
		tipText.text = selectedText;
		tipText.updateHitbox();
		tipText.x = FlxG.width + tipTextMargin;
		tipText.y = FlxG.height - tipText.height - tipTextMargin - 8;
		tipText.alpha = 0;
		tipTextScrolling = false;

		FlxTween.cancelTweensOf(tipText);
		FlxTween.tween(tipText, {alpha: 1}, 0.5, {
			ease: FlxEase.linear,
			onComplete: function(twn:FlxTween)
			{
				isTweening = false;
			}
		});
	}

	// FunnyTips: wait, then scroll the tip across the screen.
	function tipTextStartScrolling()
	{
		if (!canDoTips)
			return;

		tipTimer.cancel();
		tipTextScrolling = false;

		tipTimer.start(1.0, function(timer:FlxTimer)
		{
			tipTimer.start(2.25, function(timer:FlxTimer)
			{
				tipTextScrolling = true;
			});
		});
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			if (FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		FlxG.camera.followLerp = FlxMath.bound(elapsed * 9 / (FlxG.updateFramerate / 60), 0, 1);

		// FunnyTips scrolling
		if (canDoTips && tipTextScrolling && tipText != null)
		{
			tipText.x -= elapsed * 130;

			if (tipText.x + tipText.width < -tipTextMargin)
			{
				changeTipText();
				tipTextStartScrolling();
			}
		}

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					if (ClientPrefs.data.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new OptionsState());
										OptionsState.onPlayState = false;
										if (PlayState.SONG != null)
										{
											PlayState.SONG.arrowSkin = null;
											PlayState.SONG.splashSkin = null;
										}
								}
							});
						}
					});
				}
			}

			#if (desktop || android)
			else if (controls.justPressed('debug_1') #if android || MusicBeatState._virtualpad.buttonE.justPressed #end)
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.screenCenter(X);
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if (menuItems.length > 4)
					add = menuItems.length * 8;

				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}
}
