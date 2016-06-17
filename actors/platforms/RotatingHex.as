package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class RotatingHex extends Platform {
		private var rotate:RotateX;
		private var speed:Number;
		private var radius:Number = 1;
		
		public function RotatingHex(x:Number, y:Number, r:Number = 1, rotateSpeed:Number = 10) {
			radius = r;
			speed = rotateSpeed;
			super(x, y, 1, 1);
		}
		
		override protected function init(myBody:b2Body):void {
			super.init(myBody);
			rotate = new RotateX(speed, body);
		}
		
		override public function update():void {
			rotate.update();
			super.update();
		}
		
		override protected function createShapes():void {
			shape = new HexShape(PhysicalWorld.MIN_SQARE * radius);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.8;
				bodyBuilder.restitution = 0;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}