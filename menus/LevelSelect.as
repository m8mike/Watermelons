package  {
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class LevelSelect extends Menu {
		
		public function LevelSelect(layer:DisplayObjectContainer) {
			super(layer);
		}
		
		public function initAsChallenge():void {
			graphics.beginFill(0xFF8000);
			graphics.drawRect(0, 140, 2000, 2000);
			graphics.endFill();
			y -= 140;
			items.push(new MenuItem("Low Hills", this, createLowHillsLevel));
			items.push(new MenuItem("Neon", this, createNeonLevel));
			items.push(new MenuItem("Lava", this, createLavaLevel));
			items.push(new MenuItem("Downhill", this, createDownHillLevel));
			items.push(new MenuItem("All Hills", this, createAllHillsLevel));
			//items.push(new MenuItem("Uphill", this, createUpHillLevel));
			items.push(new MenuItem("Bridge", this, createLaddersLevel));
			items.push(new MenuItem("Tunnel", this, createTunnelLevel));
			items.push(new MenuItem("Exploding Platforms", this, null));
			items.push(new MenuItem("All Platforms", this, createFullRandomLevel));
			setCurrent(0);
		}
		
		public function initAsStory():void {
			graphics.beginFill(0xFF0059);
			graphics.drawRect(0, 140, 2000, 2000);
			graphics.endFill();
			y -= 140;
			items.push(new MenuItem("Easy 1", this, createLevel1));
			items.push(new MenuItem("Easy 2", this, createLevel2));
			items.push(new MenuItem("Easy 3", this, createLevel3));
			items.push(new MenuItem("Normal 1", this, createLevel4));
			items.push(new MenuItem("Normal 2", this, createLevel5));
			items.push(new MenuItem("Normal 3", this, createLevel6));
			items.push(new MenuItem("Hard 1", this, createLevel7));
			items.push(new MenuItem("Hard 2", this, createLevel8));
			items.push(new MenuItem("Hard 3", this, createLevel9));
			items.push(new MenuItem("Easy 10", this, createLevel10));
			items.push(new MenuItem("Low Hills", this, createLowHillsLevel));
			items.push(new MenuItem("Neon", this, createNeonLevel));
			items.push(new MenuItem("Lava", this, createLavaLevel));
			items.push(new MenuItem("Downhill", this, createDownHillLevel));
			items.push(new MenuItem("All Hills", this, createAllHillsLevel));
			items.push(new MenuItem("Bridge", this, createLaddersLevel));
			items.push(new MenuItem("Tunnel", this, createTunnelLevel));
			items.push(new MenuItem("Exploding Platforms", this, null));
			items.push(new MenuItem("All Platforms", this, createFullRandomLevel));
			setCurrent(0);
		}
		
		private function createLevel1(e:Event):void {
			visible = false;
			EasyLevels.createLevel1();
			LevelDirector.currentLevel = new EasyLevels(new LimitedTime(130, 50, 50));
			Platformer.initPlayer();
		}
		
		private function createLevel2(e:Event):void {
			visible = false;
			EasyLevels.createLevel2();
			LevelDirector.currentLevel = new EasyLevels(new LimitedTime(130, 50, 50));
			Platformer.initPlayer();
		}
		
		private function createLevel3(e:Event):void {
			visible = false;
			EasyLevels.createLevel3();
			LevelDirector.currentLevel = new EasyLevels(new LimitedTime(100, 50, 50));
			Platformer.initPlayer();
		}
		
		private function createLevel4(e:Event):void {
			visible = false;
			NormalLevels.createLevel4();
			LevelDirector.currentLevel = new NormalLevels(new LimitedTime(100, 50, 50));
			Platformer.initPlayer();
		}
		
		private function createLevel5(e:Event):void {
			visible = false;
			NormalLevels.createLevel5();
			LevelDirector.currentLevel = new NormalLevels(new StuntBombMode());
			Platformer.initPlayer();
		}
		
		private function createLevel6(e:Event):void {
			visible = false;
			NormalLevels.createLevel6();
			LevelDirector.currentLevel = new NormalLevels(new CheckpointMode(100,50,50));
			Platformer.initPlayer();
		}
		
		private function createLevel7(e:Event):void {
			visible = false;
			HardLevels.createLevel7();
			LevelDirector.currentLevel = new HardLevels(new CheckpointMode(100,50,50));
			Platformer.initPlayer();
		}
		
		private function createLevel8(e:Event):void {
			visible = false;
			HardLevels.createLevel8();
			LevelDirector.currentLevel = new HardLevels(new CheckpointMode(100,50,50));
			Platformer.initPlayer();
		}
		
		private function createLevel9(e:Event):void {
			visible = false;
			HardLevels.createLevel9();
			LevelDirector.currentLevel = new HardLevels(new CheckpointMode(100,50,50));
			Platformer.initPlayer();
		}
		
		private function createLevel10(e:Event):void {
			visible = false;
			LavaLevels.createLevel10();
			LevelDirector.currentLevel = new LavaLevels(new CheckpointMode(100,50,50));
			Platformer.initPlayer();
		}
		
		private function createAllHillsLevel(e:Event):void {
			visible = false;
			HillsLevels.createAllHillsLevel();
			LevelDirector.currentLevel = new HillsLevels(new StuntBombMode());
			Platformer.initPlayer();
		}
		
		private function createNeonLevel(e:Event):void {
			visible = false;
			NeonLevels.createNeonLevel();
			LevelDirector.currentLevel = new NeonLevels();
			Platformer.initPlayer();
		}
		
		private function createLavaLevel(e:Event):void {
			visible = false;
			LavaLevels.createLavaLevel();
			LevelDirector.currentLevel = new LavaLevels();
			Platformer.initPlayer();
		}
		
		private function createTunnelLevel(e:Event):void {
			visible = false;
			TunnelLevels.createTunnelLevel();
			LevelDirector.currentLevel = new TunnelLevels();
			Platformer.initPlayer();
		}
		
		private function createLaddersLevel(e:Event):void {
			visible = false;
			LaddersLevels.createLaddersLevel();
			LevelDirector.currentLevel = new LaddersLevels();
			Platformer.initPlayer();
		}
		
		private function createLowHillsLevel(e:Event):void {
			visible = false;
			HillsLevels.createLowHillsLevel();
			LevelDirector.currentLevel = new HillsLevels();
			Platformer.initPlayer();
		}
		
		private function createDownHillLevel(e:Event):void {
			visible = false;
			HillsLevels.createDownHillLevel();
			LevelDirector.currentLevel = new HillsLevels();
			Platformer.initPlayer();
		}
		
		private function createUpHillLevel(e:Event):void {
			visible = false;
			HillsLevels.createUpHillLevel();
			LevelDirector.currentLevel = new HillsLevels();
			Platformer.initPlayer();
		}
		
		private function createFullRandomLevel(e:Event):void {
			visible = false;
			FullyRandomLevels.createFullRandomLevel();
			LevelDirector.currentLevel = new FullyRandomLevels();
			Platformer.initPlayer();
		}
	}
}