package {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class RandomSquareIslands extends Terrain {
		
		public function RandomSquareIslands(location:Point, numIslands:int) {
			super(location, numIslands);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			new Spikes(location.x + 10, location.y+8, 10, 2);
			addPlatformCostume(location.x + 10, location.y + 8, 10, 2);
			var offset:Number = 0;
			for (var i:int = 0; i < numIslands; i++) {
				var platformLength:Number = 8 + Math.random() * 10;
				new Standard(location.x + 20 + offset, location.y, platformLength, 10);
				addPlatformCostume(location.x + 20 + offset, location.y, platformLength, 10);
				offset += platformLength;
				platformLength = 6 + Math.random() * 10;
				new Spikes(location.x + 20 + offset, location.y+8, platformLength, 2);
				addPlatformCostume(location.x + 20 + offset, location.y+8, platformLength, 2);
				offset += platformLength;
			}
			new Standard(location.x + 20 + offset, location.y, 10, 10);
			addPlatformCostume(location.x + 20 + offset, location.y, 10, 10);
			finishPoint = new Point(location.x + 30 + offset, (location.y-10)*20);
		}
	}
}