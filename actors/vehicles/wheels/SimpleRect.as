package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class SimpleRect extends Actor {
		public var body:b2Body;
		private var bodyBuilder:StaticBodyBuilder;
		public var currentAnglePos:Number;
		
		public function SimpleRect(x:Number, y:Number, width:Number, height:Number, parent:Actor, angle:Number) {
			currentAnglePos = angle;
			location = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			super(location);
			createRect(new RectShape(width*PhysicalWorld.MIN_SQARE, height*PhysicalWorld.MIN_SQARE), parent);
		}
		
		public function createRect(shape:RectShape, userData:Actor):void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 1;
				bodyBuilder.restitution = 0.2;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(userData);
			body.AllowSleeping(false);
		}
	}
}