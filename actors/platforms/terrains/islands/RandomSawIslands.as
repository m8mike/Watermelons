package {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class RandomSawIslands extends Terrain {
		
		public function RandomSawIslands(location:Point, numIslands:int) {
			super(location, numIslands);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			new Spikes(location.x + 10, location.y + 8, 10, 2);
			addSpikesCostume(location.x + 10, location.y + 8, 10, 2);
			var offset:Point = new Point();
			for (var i:int = 0; i < numIslands; i++) {
				var platformLength:Number = 10 + Math.random() * 5;
				var platformHeight:Number = Math.random() * 10 - 5;
				new SawTooth(location.x + 20 + offset.x, location.y + offset.y, platformLength, 10, platformHeight);
				addIslandCostume(location.x + 20 + offset.x, location.y + offset.y, platformLength, 10, platformHeight);
				offset.x += platformLength;
				offset.y -= platformHeight;
				platformLength = 5 + Math.random() * 10;
				new Spikes(location.x + 20 + offset.x, location.y + platformHeight + 8 + offset.y, platformLength, 2);
				addSpikesCostume(location.x + 20 + offset.x, location.y + platformHeight + 8 + offset.y, platformLength, 2);
				offset.x += platformLength;
			}
			new Standard(location.x + 20 + offset.x, location.y + offset.y, 10, 10);
			addPlatformCostume(location.x + 20 + offset.x, location.y + offset.y, 10, 10);
			finishPoint = new Point(location.x + 30 + offset.x, (location.y - 10 + offset.y) * 20);
		}
		
		private function addIslandCostume(x:Number, y:Number, w:Number, h:Number, h2:Number):void {
			costume.addChild(SawIslands.getIslandCostume(x, y, w, h, h2));
		}
	}
}