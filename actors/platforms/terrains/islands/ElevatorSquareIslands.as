package {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ElevatorSquareIslands extends Terrain {
		
		public function ElevatorSquareIslands(location:Point, numIslands:int) {
			var height:int = Math.random() * 30 + 10;
			super(location, numIslands);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			new Standard(location.x + 10, location.y+8, 10, 10);
			addPlatformCostume(location.x + 10, location.y + 8, 10, 10);
			new Standard(location.x + 20, location.y-height, 10, height+10);
			addPlatformCostume(location.x + 20, location.y-height, 10, height+10);
			new StandardMoving(location.x + 10, location.y + 2, new Point(location.x + 10, location.y - height), 10, 2);
			finishPoint = new Point(location.x + 30, (location.y-10-height)*20);
		}
	}
}