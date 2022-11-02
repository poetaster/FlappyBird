# FlappyBird

This is FlappyBird re-implementation / continuation of Edward Angeles [Godot Engine Tutorial - Flappy Bird](https://bitbucket.org/EdwardAngeles/godot-engine-tutorial-flappy-bird) in godot 3.2
The Tutorial consists of a series of well made videos showing a consistent methodology for building Godot apps. https://www.youtube.com/playlist?list=PLv3l-oZCXaql20IlPe7gfBEzomnPSLekY

https://bitbucket.org/EdwardAngeles/godot-engine-tutorial-flappy-bird/src/master/
https://www.youtube.com/c/AngegaStudios

You can really learn a lot about proper development practices for Godot from his tutorials. Support him on https://www.patreon.com/angegastudios

Trying to continue in the spirit of the original, this project aims to add things that were missing:
- lots of levels and logic for moving from one to the next.
- some more physics (ballistics, modified gravity)
- feed me your ideas :)

All of this wouldn't be possible without https://openrepos.net/users/sashikknox and his excellent

https://github.com/savegame/godot/releases/tag/v3.2.1-stable-sailfish-2

In the main, it's a great tutorial, but it was 'not quite' complete. So I've added simple things like save state and some stages/stagemanager logic.

This version as of 1.0.3 adds:
- simple high score saving. This is done in the hbox_score_best.gd using simple a simple Resource (in player.gd). 
- stage 2, adversarial stage (simple flying bad bird) 
- stage 3, obstacles and adversaries.

TODO 
- refactor the spawners for bad bird to pull generics out
- Add a stage chooser
- Save current stage for restart


## Notice
All the assets in this game are taken from original tutorials and Author did not mention the license. If the auther or copyright holder would like for the assets to be removed, please open an issue.

## License
Source code is provided under [MIT](https://choosealicense.com/licenses/mit/)
