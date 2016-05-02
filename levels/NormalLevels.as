package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class NormalLevels extends GameLevel {
		
		public function NormalLevels(gameMode:GameMode = null) {
			super(gameMode);
		}
		
		public static function createLevel4():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new NormalHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new RandomLadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), 3, RandomLadderTerrain.NORMAL);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				terrain = new NormalHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new DownHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				terrain = new NormalHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				terrain = new HighHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
		
		public static function createLevel5():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new NormalHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			for (i = 0; i < 2; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				terrain = new RandomTunnelTerrain(new Point(startPoint.x, 10+startPoint.y/20), 10, RandomTunnelTerrain.NORMAL);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			terrain = new LadderTunnelTerrain(new Point(startPoint.x, 10 + startPoint.y / 20), 5);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomTunnelTerrain(new Point(startPoint.x, 10+startPoint.y/20), 10, RandomTunnelTerrain.NORMAL);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			for (i = 0; i < 2; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new DownHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				terrain = new RandomTunnelTerrain(new Point(startPoint.x, 10+startPoint.y/20), 10, RandomTunnelTerrain.NORMAL);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
		
		public static function createLevel6():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				terrain = new DownHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new NormalHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			for (i = 0; i < 2; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new DownHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				terrain = new NormalHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomTunnelTerrain(new Point(startPoint.x, 10+startPoint.y/20), 10, RandomTunnelTerrain.NORMAL);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			for (i = 0; i < 5; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new DownHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new NormalHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
	}
}