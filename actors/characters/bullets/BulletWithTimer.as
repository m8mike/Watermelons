package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletWithTimer extends Bullet {
		
		public function BulletWithTimer(x:Number, y:Number) {
			super(x, y, 10);
			removingTimer.activate();
		}
	}
}