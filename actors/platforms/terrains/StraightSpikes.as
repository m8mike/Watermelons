package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class StraightSpikes extends Terrain {
		private var spikedPlatforms:Array = [];
		
		public function StraightSpikes(location:Point, numSpikedPlatforms:int) {
			for (var j:int = 0; j < numSpikedPlatforms; j++) {
				spikedPlatforms.push(new Spikes(j * 10 + location.x, location.y, 10, 2));
			}
			finishPoint = new Point(location.x + numSpikedPlatforms*10, location.y);
			super(location, numSpikedPlatforms);
		}
	}
}