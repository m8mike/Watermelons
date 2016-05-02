package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class EasyLevels extends GameLevel {
		
		public function EasyLevels(gameMode:GameMode = null) {
			super(gameMode);
		}
		
		public static function createLevel1():void {//min
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new LowHills(startPoint, 1);
			for (var i:int = 0; i < 10; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomLadderTerrain(new Point(startPoint.x, 10 + startPoint.y / 20), 10, RandomLadderTerrain.EASY);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			terrain = new LadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), 3);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
		
		public static function createLevel2():void {//acc 0.5
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new LowHills(startPoint, 1);
			for (var i:int = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			terrain = new DownHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new RandomLadderTerrain(new Point(startPoint.x, 10 + startPoint.y / 20), 10, RandomLadderTerrain.EASY);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				var numBoxes:int = i*2;
				new StraightSpikes(new Point(startPoint.x, 10 + startPoint.y / 20 + 3), numBoxes);
				explodingRoads.push(terrain = new ExplodingRoad(new Point(startPoint.x, 10+startPoint.y/20), 5*numBoxes));
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			terrain = new LadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), 3);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
		
		public static function createLevel3():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new DownHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			for (i = 0; i < 3; i++) {
				startPoint = terrain.finishPoint.clone();
				terrain = new DownHillTerrain(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				startPoint = terrain.finishPoint.clone();
				terrain = new LowHills(startPoint, 1);
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			terrain = new DownHillTerrain(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			var numBoxes:int = 10;
			new StraightSpikes(new Point(startPoint.x, 10 + startPoint.y / 20 + 3), numBoxes);
			explodingRoads.push(terrain = new ExplodingRoad(new Point(startPoint.x, 10+startPoint.y/20), 5*numBoxes));
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
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
			terrain = new LowHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
	}
}