package {
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.Joints.b2RevoluteJoint;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class CirclesRotateTerrain extends Terrain {
		
		public function CirclesRotateTerrain(location:Point, numCircles:int, radius:int = 3) {
			super(location, numCircles);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			for (var i:int = 0; i < numCircles; i++) {
				new RotatingHex(location.x + 10 + 2 * radius * i + radius, location.y, radius);
			}
			new Standard(location.x + 10 + 2 * radius * numCircles, location.y, 10, 10);
			addPlatformCostume(location.x + 10 + 2 * radius * numCircles, location.y, 10, 10);
			finishPoint = new Point(location.x + 20 + 2 * radius * numCircles, (location.y - 10) * 20);
		}
	}
}