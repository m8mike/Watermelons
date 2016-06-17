package  {
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class MainMenu extends Menu {
		private var levelSelect:LevelSelect;
		private var levelSelectChallenge:LevelSelect;
		
		public function MainMenu(layer:DisplayObjectContainer) {
			super(layer);
			graphics.beginFill(0x8000FF);
			graphics.drawRect(0, 140, 2000, 2000);
			graphics.endFill();
			y -= 140;
			items.push(new MenuItem("", this, null));
			items.push(new MenuItem("", this, null));
			items.push(new MenuItem("Story Mode", this, openStory));
			//items.push(new MenuItem("Duel", this, null));
			//items.push(new MenuItem("Challenge", this, openChallenge));
			//items.push(new MenuItem("Tournament", this, null));
			items.push(new MenuItem("Random Map", this, createRandomMap));
			//items.push(new MenuItem("Achievements", this, null));
			items.push(new MenuItem("Settings", this, null));
			items.push(new MenuItem("Credits", this, null));
			setCurrent(0);
		}
		
		private function openStory(e:Event):void {
			visible = false;
			if (!levelSelect) {
				levelSelect = new LevelSelect(parent);
				levelSelect.initAsStory();
			} else {
				levelSelect.visible = true;
			}
		}
		
		private function openChallenge(e:Event):void {
			visible = false;
			if (!levelSelectChallenge) {
				levelSelectChallenge = new LevelSelect(parent);
				levelSelectChallenge.initAsChallenge();
			} else {
				levelSelectChallenge.visible = true;
			}
			/*Platformer.initPlayer();
			LevelDirector.init();*/
		}
		
		private function createRandomMap(e:Event):void {
			visible = false;
			FullyRandomLevels.createFullRandomLevel();
			LevelDirector.currentLevel = new FullyRandomLevels();
			Platformer.initPlayer();
		}
	}
}