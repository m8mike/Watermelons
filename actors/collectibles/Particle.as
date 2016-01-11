package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Particle extends Collectible {
		private var impulse:b2Vec2 = new b2Vec2();
		
		public function Particle(x:Number, y:Number) {
			var loc:Point = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			shape = new CircleShape(2);
			super(loc);
		}
		
		override public function createBodies():void {
			var bodyBuilder:StaticBodyBuilder = new StaticBodyBuilder();
			bodyBuilder.density = 1;
			bodyBuilder.friction = 0.2;
			bodyBuilder.restitution = 0.3;
			bodyBuilder.groupIndex = -1;
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
			body.ApplyImpulse(impulse, body.GetWorldCenter());
		}
		
		public function applyImpulse(x:Number, y:Number):void {
			impulse.x = x;
			impulse.y = y;
		}
	}
}