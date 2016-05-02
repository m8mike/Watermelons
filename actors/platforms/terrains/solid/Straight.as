package {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Straight extends Terrain {
		private var standardPlatforms:Array = [];
		
		public function Straight(location:Point, numPlatforms:int) {
			super(location, numPlatforms);
			for (var j:int = 0; j < numPlatforms; j++) {
				standardPlatforms.push(new Standard(j * 500 / 20 + location.x, location.y, 500/20,2));
			}
		}
	}
}