package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class SimpleCircle extends Actor {
		public var body:b2Body;
		private var bodyBuilder:StaticBodyBuilder;
		
		public function SimpleCircle(x:Number, y:Number, radius:Number, parent:Actor) {
			location = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			super(location);
			createCircle(new CircleShape(radius * PhysicalWorld.MIN_SQARE), parent);
		}
		
		public function createCircle(shape:CircleShape, userData:Actor):void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0.5;
				bodyBuilder.friction = 1;
				bodyBuilder.restitution = 0.2;
				bodyBuilder.groupIndex = -1;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(userData);
			body.AllowSleeping(false);
		}
	}
}