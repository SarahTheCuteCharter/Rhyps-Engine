<!--titulo br-->
<h1 align="center">
  <br>
  <img src="assets/logo.png" alt="Rhyps Engine" width="150">
  <br>
</h1>
<h3 align="center">
  <b>Rhyps Engine (or Psych4ever) is an modified Friday Night Funkin' Psych Engine Base engine focused on performance, customization and creative freedom.</b>
</h3>
<h2 align="center">
  Languages used:
</h2>
<div align="center">
  <img src="assets/haxe.png" width="48" height="48" alt="Haxe" />
  <img src="assets/lua.png" width="48" height="48" alt="Lua" />
</div>

<p align="center">
  We use Haxe for all engine files, like options mode, loading screen, freeplay, story mode and much more.
  <br>
  And we use .lua to create scripts, events, backgrounds, and much more to make the game look better.
</p>

# Base
We're using the [Psych Engine v0.71h](https://github.com/beihu235/Psych-Engine-0.71h-android) by beihu256 as a base and have improved it even further! We have new mechanics, features, and tools throughout the game. Follow along and see the details below.

## Features/Performances
* **Advanced Chart System** — Support for complex and extremely large charts.
* **Performance Optimization** — Designed to handle demanding gameplay scenarios.
* **Advanced Botplay** — Support for highly complex charts.
* **Custom Content** — Characters, stages, events and HUD elements.
* **Shader Support** — Custom visual effects and stage shaders.
* **Multilanguage Scripting** — Expandable scripting architecture.
* **Debug Tools**  — Development logs and performance diagnostics.
* **Expanded Modding** — More flexibility for mod creators.
* **Android Compatibility** — Support of the first Rhyps Engine.
* **Psych Engine but Better' Feature** - Supported Update
* **Advanced Memory Management** — Improved memory handling for demanding gameplay and resource-intensive mods.
* **Chart Loading Optimization** — Improved loading system for large and complex chart files.
* **Custom Note Types** — Support for custom note behaviors and gameplay mechanics.
* **Extended Event System** — More possibilities for custom events and gameplay interactions.
* **Advanced HUD Customization** — Flexible HUD elements, layouts and visual customization.
* **Mod Folder Accessibility** — Easier access to mods, charts, assets and configuration files through internal storage.
* **Custom Gameplay Settings** — More control over gameplay behavior and engine configurations.
* **Improved Asset Management** — Better organization and handling of mod assets.
* **Developer Console** — Additional debugging information and development utilities.
* **Cross-Mod Compatibility** — Improved support for different mod structures and custom content.
* **Mobile Interface Optimization** — Interface improvements designed for Android devices.
<b> AND, MOREEEEEEE!! </b>

# Credits
* **Shadow Mario** - Programmer
* **RiverOaken** - Artist
* **Yoshubs** - Assistant Programmer

## Special Thanks
* **bbpanzu** - Ex-Programmer
* **Yoshubs** - New Input System
* **SqirraRNG** - Crash Handler and Base code for Chart Editor's Waveform
* **KadeDev** - Fixed some cool stuff on Chart Editor and other PRs
* **iFlicky** - Composer of Psync and Tea Time, also made the Dialogue Sounds
* **PolybiusProxy** - .MP4 Video Loader Library (hxCodec)
* **Keoiki** - Note Splash Animations
* **Smokey** - Sprite Atlas Support
* **Nebula the Zorua** - LUA JIT Fork and some Lua reworks

# Awards/Achievements
The engine comes with 16 example achievements that you can mess with and learn how it works (Check Achievements.hx and search for "checkForAchievement" on PlayState.hx)

## Options menu
You can change Note colors, Delay and Combo Offset, Controls and Preferences there.
On Preferences you can toggle Downscroll, Middlescroll, Anti-Aliasing, Framerate, Low Quality, Note Splashes, Flashing Lights, etc.

## Other gameplay features:
* When the enemy hits a note, their strum note also glows.
* Lag doesn't impact the camera movement and player icon scaling anymore.
* Some stuff based on Week 7's changes has been put in (Background colors on Freeplay, Note splashes)
* You can reset your Score on Freeplay/Story Mode by pressing Reset button.
* You can listen to a song or adjust Scroll Speed/Damage taken/etc. on Freeplay by pressing Space.
* You can enable "Combo Stacking" in Gameplay Options. This causes the combo sprites to just be one sprite with an animation rather than sprites spawning each note hit.

## Supported Languages (Planned)
* **Haxe** — Main engine language.
* **Lua** — Official scripting language.
* **Python, JavaScript, C++ and C#** — Additional scripting support.

## Rhyps Engine Stuff's (PLANNED)
* **RhypsEngine-Bridge**: Planned system for connecting scripting languages with engine functions.
* **Charts-For-Rhyps-Engine**: Repository for custom charts and mods. (PLANNED)
* **Hexgi's Top Charts**: Collection of exaggerated, difficult and humanly impossible charts.
* **Pelicirihu's Top Charts**: Collection of Sanduiche-Plays's Harder and Impossibles Charts.
* **Dave and Dave Charts**: SarahTheCharter's Extreme Dave Charts

## This is a fork repo by beihu235 and them contributors!

## Documentation
* [Installation Guide](docs/installation.md)
* [Chart Editor](docs/chart-editor.md)
* [Modding Guide](docs/modding.md)
* [Android Storage System](docs/android-storage.md)
* [Mods For NKL Engine](docs/chartz-for-engine.md)
* [Engine Settings Documentation](docs/engine-settings.md)
* [Changelog](CHANGELOG.md)

# the Contribution Guys
<a href="https://github.com/SarahTheCuteCharter/Rhyps-Engine/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=SarahTheCuteCharter/Rhyps-Engine" />
</a>

Made with [contrib.rocks](https://contrib.rocks).
