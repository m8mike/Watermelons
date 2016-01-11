package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class GravityCircle extends Platform {
		private var radius:Number;
		
		public function GravityCircle(x:Number, y:Number, radius:Number) {
			this.radius = radius;
			super(x, y, 1, 1);
		}
		
		override protected function createShapes():void {
			shape = new CircleShape(radius*PhysicalWorld.MIN_SQARE);
		}
		
		public function hit(somebody:b2Body):void {
			var center:b2Vec2 = body.GetWorldCenter().Copy();
			var bodyCenter:b2Vec2 = somebody.GetWorldCenter().Copy();
			var vec:b2Vec2 = new b2Vec2(bodyCenter.x - center.x, bodyCenter.y - center.y);
			var angle:Number = Math.atan2(vec.y, vec.x);
			/*var loc:Point = new Point(center.x, center.y);
			var bodyLoc:Point = new Point(bodyCenter.x, bodyCenter.y);
			var distance = Point.distance(loc, bodyLoc);*/
			var force:b2Vec2 = new b2Vec2(3 *body.GetMass() * Math.cos(angle+Math.PI), 3 *body.GetMass() * Math.sin(angle+Math.PI));
			somebody.ApplyForce(force, bodyCenter);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.isSensor = true;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
		
		override public function hide():void {
			//чтобы не удалялось при отдалении
		}
	}
}