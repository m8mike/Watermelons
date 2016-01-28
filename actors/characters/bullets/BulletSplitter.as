package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletSplitter extends Bullet {
		private var locInc:b2Vec2;
		
		public function BulletSplitter(x:Number, y:Number, radius:Number) {
			super(x, y, 0, radius);
		}
		
		override public function hit(hitBody:b2Body):void {
			super.hit(hitBody);
			locInc = body.GetWorldCenter().Copy();
			locInc.Multiply(3 / 2);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			var bulletLeft:Bullet = new Bullet(locInc.x - 1, locInc.y, 0, 4);
			var bulletRight:Bullet = new Bullet(locInc.x + 1, locInc.y, 0, 4);
			var bulletUp:Bullet = new Bullet(locInc.x, locInc.y - 1, 0, 4);
			bulletLeft.applyImpulse( -0.1, -0.1);
			bulletRight.applyImpulse(0.1, 0.1);
			bulletUp.applyImpulse(0, -0.1);
			super.cleanUpBeforeRemoving();
		}
	}
}