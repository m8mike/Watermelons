package {
	import Box2D.Common.Math.b2Vec2;
	
	/**
	 * ...
	 * @author ...
	 */
	public class CannonSuper extends Platform {
		private var shape2:CircleShape;
		private var shootTimer:int = 0;
		
		public function CannonSuper(x:Number, y:Number) {
			super(x, y);
		}
		
		override public function update():void {
			if (shootTimer <= 0) {
				shootTimer = 10;
				shoot();
			}
			shootTimer--;
			super.update();
		}
		
		private function shoot():void {
			var bulletLoc:b2Vec2 = body.GetWorldCenter().Copy();
			bulletLoc.Multiply(3 / 2);
			var angle:Number = body.GetAngle() + Math.PI;
			var offsetBulletFromCannon:int = 2;
			bulletLoc.x += offsetBulletFromCannon * Math.cos(angle);
			bulletLoc.y += offsetBulletFromCannon * Math.sin(angle);
			var impulse:b2Vec2 = new b2Vec2();
			impulse.x = 0.8 * Math.cos(angle);
			impulse.y = 0.8 * Math.sin(angle);
			new BulletSkipper(bulletLoc.x, bulletLoc.y, impulse);
		}
		
		override protected function createShapes():void {
			shape = new RectShape(PhysicalWorld.MIN_SQARE, PhysicalWorld.MIN_SQARE);
			shape.setLoc(-1.5, -0.5);
			shape2 = new CircleShape(PhysicalWorld.MIN_SQARE);
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
			body = bodyBuilder.getBody(new Array(shape, shape2));
			body.SetUserData(this);
		}
	}
}