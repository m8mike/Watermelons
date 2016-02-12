package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ExplodingRoad extends Terrain {
		private var explodingPlatforms:Array = [];
		
		public function ExplodingRoad(location:Point, numBoxes:int) {
			for (var i:int = 0; i < numBoxes; i++) {
				explodingPlatforms.push(new ExplodingPlatform(location.x + i * 2, location.y, 2, 2));
			}
			finishPoint = new Point(location.x + numBoxes*2, (location.y - 10)*20);
			super(location, numBoxes);
		}
		
		public function restart():void {
			for each (var platform:ExplodingPlatform in explodingPlatforms) {
				platform.restart();
			}
		}
	}
}