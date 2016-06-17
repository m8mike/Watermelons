package {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class RandomStuntIslands extends Terrain {
		
		public function RandomStuntIslands(location:Point, numIslands:int) {
			super(location, numIslands);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			new Spikes(location.x + 10, location.y+8, 10, 2);
			addSpikesCostume(location.x + 10, location.y + 8, 10, 2);
			var offset:Number = 0;
			for (var i:int = 0; i < numIslands; i++) {
				var platformLength:Number = 8 + Math.random() * 10;
				new Standard(location.x + 20 + offset, location.y, platformLength, 10);
				addPlatformCostume(location.x + 20 + offset, location.y, platformLength, 10);
				offset += platformLength;
				var platformRadius:Number = 6 + Math.random() * 10;
				new InverseCircle(location.x + 20 + offset, location.y-platformRadius, platformRadius);
				new LavaBallMoving(location.x+20 + offset+platformRadius+7/2, location.y, 
									new Point(location.x+20 + offset+platformRadius+7/2, location.y - platformRadius * 2), 
									platformRadius/5);
				offset += platformRadius*2+7;
				new InverseCircleDown(location.x + 20 + offset, location.y - platformRadius, platformRadius);
			}
			new Standard(location.x + 20 + offset, location.y, 10, 10);
			addPlatformCostume(location.x + 20 + offset, location.y, 10, 10);
			finishPoint = new Point(location.x + 30 + offset, (location.y-10)*20);
		}
	}
}