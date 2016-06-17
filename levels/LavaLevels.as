package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class LavaLevels extends GameLevel {
		
		public function LavaLevels(gameMode:GameMode = null) {
			super(gameMode);
		}
		
		public static function createLavaLevel():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			startPoint = terrain.finishPoint.clone();
			for (var i:int = 0; i < 20; i++) {
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new PolarRoad(new Point(startPoint.x, startPoint.y / 20 + 10), 
										int(Math.random()*20+30), int(Math.random()*5 + 1));
				startPoint = terrain.finishPoint.clone();
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new RandomStuntIslands(new Point(startPoint.x, startPoint.y / 20 + 10), 1);
				//new Coin(startPoint.x, startPoint.y / 20 + 10);
				startPoint = terrain.finishPoint.clone();
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new JumpSquareIslands(new Point(startPoint.x, startPoint.y / 20 + 10), Math.random()*3);
				startPoint = terrain.finishPoint.clone();
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new JumpRockTerrain(new Point(startPoint.x, startPoint.y / 20 + 10));
				startPoint = terrain.finishPoint.clone();
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new JumpRockTunnelTerrain(new Point(startPoint.x, startPoint.y / 20 + 10));
				startPoint = terrain.finishPoint.clone();
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new RandomSawIslands(new Point(startPoint.x, startPoint.y / 20 + 10), Math.random()*3);
				startPoint = terrain.finishPoint.clone();
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new RandomSaws(new Point(startPoint.x, startPoint.y / 20 + 10), Math.random()*3);
				startPoint = terrain.finishPoint.clone();
			}
		}
		
		public static function createLevel10():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			startPoint = terrain.finishPoint.clone();
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			terrain = new SquareIslands(new Point(startPoint.x, startPoint.y/20 + 10), 5);
			startPoint = terrain.finishPoint.clone();
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			terrain = new SawIslands(new Point(startPoint.x, startPoint.y / 20 + 10), 5);
			startPoint = terrain.finishPoint.clone();
			for (var i:int = 0; i < 10; i++) {
				explodingRoads.push(new ExplodingRoad(new Point(startPoint.x+10 + i*10, 10+startPoint.y/20 + i*2), 5));
			}
			terrain = new ExplodingLadder(new Point(startPoint.x, 10+startPoint.y/20), 10);
			startPoint = terrain.finishPoint.clone();
			terrain = new LowHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			for (i = 0; i < 10; i++) {
				for (var j:int = 0; j < 5; j++) {
					explodingRoads.push(new ExplodingRoad(new Point(startPoint.x+10 + i*10, 10+startPoint.y/20 + i*2 + j*2), 5));
				}
			}
			terrain = new ExplodingTunnel(new Point(startPoint.x, 10+startPoint.y/20), 10);
			startPoint = terrain.finishPoint.clone();
			terrain = new LowHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			for (i = 0; i < 6; i++) {
				explodingRoads.push(new ExplodingRoad(new Point(startPoint.x + 10, 10+startPoint.y/20 + i*2 + 10), 5));
			}
			terrain = new ExplodingPitLeft(new Point(startPoint.x, 10+startPoint.y/20 + i*2));
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new LowHills(startPoint, 1);
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			for (i = 0; i < 10; i++) {
				explodingRoads.push(new ExplodingRoad(new Point(startPoint.x, 10+startPoint.y/20 + i*2), 5));
			}
			terrain = new ExplodingPit(new Point(startPoint.x, 10+startPoint.y/20 + i*2));
			new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			startPoint = terrain.finishPoint.clone();
			terrain = new LowHills(startPoint, 1);
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
	}
}