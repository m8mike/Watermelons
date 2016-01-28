package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletMine extends Bullet {
		
		public function BulletMine(x:Number, y:Number) {
			super(x, y, 10);
		}
		
		override public function hit(hitBody:b2Body):void {
			body.SetLinearVelocity(new b2Vec2(0, 0));
			if (!hitBody) {
				return void;
			}
			if (hitBody.GetUserData() is Player) {
				super.hit(hitBody);
			}
		}
	}
}