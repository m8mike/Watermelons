package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class CannonFixedRotation extends CannonSuper {
		private var rotate:RotateFixed;
		private var move:MoveAB;
		
		public function CannonFixedRotation(x:Number, y:Number, angle:Number = 0) {
			super(x, y);
			setAngle(angle);
		}
		
		override protected function init(myBody:b2Body):void {
			super.init(myBody);
			rotate = new RotateFixed( -45, 45, body, 1, currentAngle);
			move = new MoveAB(location, new Point(location.x + 100, location.y), body);
		}
		
		override public function update():void {
			rotate.update();
			move.update();
			super.update();
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 1;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape, shape2));
			body.SetUserData(this);
		}
	}
}