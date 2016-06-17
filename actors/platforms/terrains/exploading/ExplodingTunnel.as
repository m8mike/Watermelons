package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ExplodingTunnel extends Terrain {
		private var explodingPlatforms:Array = [];
		
		public function ExplodingTunnel(location:Point, numPatterns:int) {
			super(location, numPatterns);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			for (var i:int = 0; i < numPatterns; i++) {
				new Standard(location.x + 10 + i*10, location.y - 16 + 2*i, 10, 10);
				addPlatformCostume(location.x + 10 + i*10, location.y - 16 + 2*i, 10, 10);
				new Spikes(location.x + 10 + i*10, location.y + 10 + 2*i, 10, 2);
				addSpikesCostume(location.x + 10 + i*10, location.y + 10 + 2*i, 10, 2);
			}
			new Standard(location.x + 10 + i*10, location.y + 2 + 2*i, 10, 10);
			addPlatformCostume(location.x + 10 + i*10, location.y + 2 + 2*i, 10, 10);
			finishPoint = new Point(location.x + 20 + i*10, location.y * 20 + 9*20 + i*20);
		}
	}
}