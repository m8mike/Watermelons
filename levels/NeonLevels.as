package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class NeonLevels extends GameLevel {
		
		public function NeonLevels(gameMode:GameMode = null) {
			super(gameMode);
		}
		
		public static function createNeonLevel():void {
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			startPoint = terrain.finishPoint.clone();
			for (var i:int = 0; i < 100; i++) {
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new ElevatorSquareIslands(new Point(startPoint.x, startPoint.y / 20 + 10), 1);
				startPoint = terrain.finishPoint.clone();
/*				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new CirclesRotateTerrain(new Point(startPoint.x, startPoint.y / 20 + 10), 
													int(Math.random()*10), int(Math.random()*5)+1);
				startPoint = terrain.finishPoint.clone();*/
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new DownHillTerrain(startPoint, 1);
				startPoint = terrain.finishPoint.clone();
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
				terrain = new ForwardUnfixedElevators(new Point(startPoint.x, startPoint.y / 20 + 10), int(Math.random()*10+2));
				startPoint = terrain.finishPoint.clone();
			}
		}
	}
}