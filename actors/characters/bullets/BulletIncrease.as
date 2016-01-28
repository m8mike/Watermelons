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
		
		public function BulletIncrease(x:Number, y:Number, size:int = 7) {
			super(x, y, 0, size);
		}
		
		override public function hit(hitBody:b2Body):void {
			body.SetLinearVelocity(new b2Vec2(0, 0));
			locInc = body.GetWorldCenter().Copy();
			locInc.Multiply(3 / 2);
			super.hit(hitBody);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			new Bullet(locInc.x, locInc.y, 10, 12);
			super.cleanUpBeforeRemoving();
		}
	}
}