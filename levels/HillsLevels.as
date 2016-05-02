package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class HillsLevels extends GameLevel {
		
		public function HillsLevels(gameMode:GameMode = null) {
			super(gameMode);
		}
		
		public static function createAllHillsLevel():void {
			Tank.setSymbol(tank_exploit_body);
			YellowWheel.setSymbol(tank_exploit_wheel);
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 100; i++) {
				startPoint = terrain.finishPoint.clone();
				switch (int(Math.random()*5)) {
					case 0:
						terrain = new DownHillTerrain(startPoint, 1);
					break;
					case 1:
						terrain = new LowHills(startPoint, 1);
					break;
					case 2:
						terrain = new NormalHills(startPoint, 1);
					break;
					case 3:
						terrain = new HighHills(startPoint, 1);
					break;
					case 4:
						if (terrain is DownHillTerrain || terrain is HighHills) {
							terrain = new LowHills(startPoint, 1);
							new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
							startPoint = terrain.finishPoint.clone();
						}
						terrain = new UpHillTerrain(startPoint, 1);
					break;
					default:
				}
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
		
		public static function createUpHillLevel():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new UpHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 100; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new UpHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
		
		public static function createDownHillLevel():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 100; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new DownHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
		
		public static function createLowHillsLevel():void {
			Tank.setSymbol(tank_red_body);
			YellowWheel.setSymbol(tank_hot_wheel);
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new LowHills(startPoint, 1);
			for (var i:int = 0; i < 100; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
	}
}