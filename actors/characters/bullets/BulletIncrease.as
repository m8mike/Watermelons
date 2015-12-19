package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletIncrease extends Bullet {
		private var locInc:b2Vec2;
		
		public function BulletIncrease(x:Number, y:Number, impulse:b2Vec2, size:int = 7) {
			super(x, y, impulse, 0, size);
		}
		
		override public function hit(body:b2Body):void {
			getBody().SetLinearVelocity(new b2Vec2(0, 0));
			locInc = getBody().GetWorldCenter().Copy();
			locInc.Multiply(3 / 2);
			super.hit(body);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			new Bullet(locInc.x, locInc.y, new b2Vec2(), 10, 12);
			super.cleanUpBeforeRemoving();
		}
	}
}