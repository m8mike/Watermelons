package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ExplodingRoad extends Terrain {
		private var explodingPlatforms:Array = [];
		
		public function ExplodingRoad(location:Point, numBoxes:int) {
			super(location, numBoxes);
			for (var i:int = 0; i < numBoxes; i++) {
				explodingPlatforms.push(new ExplodingPlatform(location.x + i * 2, location.y, 2, 2));
			}
			finishPoint = new Point(location.x + numBoxes*2, (location.y - 10)*20);
		}
		
		public function restart():void {
			for each (var platform:ExplodingPlatform in explodingPlatforms) {
				platform.restart();
			}
		}
	}
}