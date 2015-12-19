package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletSticky extends Bullet {
		
		public function BulletSticky(x:Number, y:Number, impulse:b2Vec2) {
			super(x, y, impulse, 10);
		}
		
		override public function hit(body:b2Body):void {
			getBody().SetLinearVelocity(new b2Vec2(0, 0));
		}
	}
}