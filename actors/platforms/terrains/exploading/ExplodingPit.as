package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ExplodingPit extends Terrain {
		private var explodingPlatforms:Array = [];
		
		public function ExplodingPit(location:Point) {
			super(location, 1);
			new Standard(location.x + 10, location.y - 50, 5, 40);
			addPlatformCostume(location.x + 10, location.y - 50, 5, 40);
			new Standard(location.x - 2, location.y - 20, 2, 24);
			addPlatformCostume(location.x - 2, location.y - 20, 2, 24);
			new Spikes(location.x, location.y + 2, 10, 2);
			addSpikesCostume(location.x, location.y + 2, 10, 2);
			new Standard(location.x+10, location.y + 2, 10, 2);
			addPlatformCostume(location.x+10, location.y + 2, 10, 2);
			finishPoint = new Point(location.x + 20, (location.y - 9) * 20 + 20);
		}
	}
}