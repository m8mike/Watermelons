package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletSticky extends Bullet {
		
		public function BulletSticky(x:Number, y:Number) {
			super(x, y, 10);
		}
		
		override public function hit(hitBody:b2Body):void {
			body.SetLinearVelocity(new b2Vec2(0, 0));
		}
	}
}