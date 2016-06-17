package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ExplodingLadder extends Terrain {
		private var explodingPlatforms:Array = [];
		
		public function ExplodingLadder(location:Point, numPatterns:int) {
			super(location, 1);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			for (var i:int = 0; i < numPatterns; i++) {
				new Spikes(location.x + 10 + i*10, location.y + 2 + 2*i, 10, 2);
				addSpikesCostume(location.x + 10 + i*10, location.y + 2 + 2*i, 10, 2);
			}
			finishPoint = new Point(location.x + 10 + i*10, location.y * 20 + i*20);
		}
	}
}