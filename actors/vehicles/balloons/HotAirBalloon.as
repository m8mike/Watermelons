package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class HotAirBalloon extends Vehicle {
		private var shape2:CircleShape;
		private var control:FlyControl;
		
		public function HotAirBalloon(x:Number, y:Number) {
			super(x, y);
		}
		
		override protected function init(myBody:b2Body):void {
			control = new FlyControl(myBody);
			super.init(myBody);
		}
		
		override public function update():void {
			super.update();
			body.m_sweep.a = 0;
			body.ApplyForce(new b2Vec2(0, -80), body.GetWorldCenter().Copy());
			if (enterable.inside) {
				control.update();
			}
		}
		
		override protected function createShapes():void {
			shape = new RectShape(2 * PhysicalWorld.MIN_SQARE, 2 * PhysicalWorld.MIN_SQARE);
			shape.setLoc(-1, 4);
			shape2 = new CircleShape(3 * PhysicalWorld.MIN_SQARE);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0.7;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0;
				bodyBuilder.groupIndex = 0;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape, shape2));
			body.SetUserData(this);
		}
	}
}