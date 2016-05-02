package {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class SquareIslands extends Terrain {
		
		public function SquareIslands(location:Point, numIslands:int) {
			super(location, numIslands);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			new Spikes(location.x + 10, location.y+8, 10, 2);
			addPlatformCostume(location.x + 10, location.y+8, 10, 2);
			for (var i:int = 0; i < numIslands; i++) {
				new Standard(location.x + 20 + 20 * i, location.y, 10, 10);
				addPlatformCostume(location.x + 20 + 20 * i, location.y, 10, 10);
				new Spikes(location.x + 30 + 20 * i, location.y+8, 10, 2);
				addPlatformCostume(location.x + 30 + 20 * i, location.y+8, 10, 2);
			}
			new Standard(location.x + 20 + 20 * numIslands, location.y, 10, 10);
			addPlatformCostume(location.x + 20 + 20 * numIslands, location.y, 10, 10);
			finishPoint = new Point(location.x + 30 + 20 * numIslands, (location.y-10)*20);
		}
	}
}