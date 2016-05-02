package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ExplodingPitLeft extends Terrain {
		private var explodingPlatforms:Array = [];
		
		public function ExplodingPitLeft(location:Point) {
			super(location, 1);
			new Standard(location.x, location.y -12, 10, 10);
			addPlatformCostume(location.x, location.y -12, 10, 10);
			new Standard(location.x-2, location.y-2, 2, 20);
			addPlatformCostume(location.x-2, location.y, 2, 20);
			new Standard(location.x + 20, location.y - 40, 5, 52);
			addPlatformCostume(location.x + 20, location.y - 40, 5, 52);
			new Standard(location.x, location.y +18, 40, 2);
			addPlatformCostume(location.x, location.y +18, 40, 2);
			new Spikes(location.x+10, location.y + 10, 10, 2);
			addPlatformCostume(location.x+10, location.y + 10, 10, 2);
			finishPoint = new Point(location.x + 40, (location.y - 10) * 20 + 18*20);
		}
	}
}