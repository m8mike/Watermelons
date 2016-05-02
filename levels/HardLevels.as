package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class HardLevels extends GameLevel {
		
		public function HardLevels(gameMode:GameMode = null) {
			super(gameMode);
		}
		
		public static function createLevel7():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomTunnelTerrain(new Point(startPoint.x, 10+startPoint.y/20), 10, RandomTunnelTerrain.NORMAL);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new LowHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new NormalHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new HighHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new UpHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new LowHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new DownHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new LowHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			for (var i:int = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new UpHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomTunnelTerrain(new Point(startPoint.x, 10+startPoint.y/20), 10, RandomTunnelTerrain.NORMAL);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
		
		public static function createLevel8():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 5; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new LadderTunnelTerrain(new Point(startPoint.x, 10 + startPoint.y / 20), 6-i);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				terrain = new HighHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			terrain = new DownHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomLadderTerrain(new Point(startPoint.x, 10 + startPoint.y / 20), 10, RandomLadderTerrain.EASY);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new UpHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomLadderTerrain(new Point(startPoint.x, 10 + startPoint.y / 20), 10, RandomLadderTerrain.HARD);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new HighHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new UpHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new HighHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new DownHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new LowHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new UpHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomTunnelTerrain(new Point(startPoint.x, 10+startPoint.y/20), 10, RandomTunnelTerrain.NORMAL);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new DownHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
		
		public static function createLevel9():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new HighHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				var numBoxes:int = i;
				new StraightSpikes(new Point(startPoint.x, 10 + startPoint.y / 20 + 3), numBoxes);
				explodingRoads.push(terrain = new ExplodingRoad(new Point(startPoint.x, 10+startPoint.y/20), 5*numBoxes));
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new DownHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				var numBoxes:int = i;
				new StraightSpikes(new Point(startPoint.x, 10 + startPoint.y / 20 + 3), numBoxes);
				explodingRoads.push(terrain = new ExplodingRoad(new Point(startPoint.x, 10+startPoint.y/20), 5*numBoxes));
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomLadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), 10, RandomLadderTerrain.HARD);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			var numBoxes:int = i;
			new StraightSpikes(new Point(startPoint.x, 10 + startPoint.y / 20 + 3), numBoxes);
			explodingRoads.push(terrain = new ExplodingRoad(new Point(startPoint.x, 10+startPoint.y/20), 5*numBoxes));
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomTunnelTerrain(new Point(startPoint.x, 10+startPoint.y/20), 10, RandomTunnelTerrain.HARD);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			var numBoxes:int = i;
			new StraightSpikes(new Point(startPoint.x, 10 + startPoint.y / 20 + 3), numBoxes);
			explodingRoads.push(terrain = new ExplodingRoad(new Point(startPoint.x, 10+startPoint.y/20), 5*numBoxes));
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new UpHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
	}
}