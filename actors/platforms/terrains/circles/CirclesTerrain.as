package {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class CirclesTerrain extends Terrain {
		
		public function CirclesTerrain(location:Point, numCircles:int) {
			super(location, numCircles);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			for (var i:int = 0; i < numCircles; i++) {
				new SpringBall(location.x + 13 + 6 * i, location.y, 3);
			}
			new Standard(location.x + 10 + 6 * numCircles, location.y, 10, 10);
			addPlatformCostume(location.x + 10 + 6 * numCircles, location.y, 10, 10);
			finishPoint = new Point(location.x + 20 + 6 * numCircles, (location.y-10)*20);
		}
	}
}