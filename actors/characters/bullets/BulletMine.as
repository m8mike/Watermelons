package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletMine extends Bullet {
		
		public function BulletMine(x:Number, y:Number, impulse:b2Vec2) {
			super(x, y, impulse, 10);
		}
		
		override public function hit(body:b2Body):void {
			getBody().SetLinearVelocity(new b2Vec2(0, 0));
			if (!body) {
				return void;
			}
			if (body.GetUserData() is Player) {
				super.hit(body);
			}
		}
	}
}