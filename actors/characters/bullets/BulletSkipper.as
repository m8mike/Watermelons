package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * 
	 * @author ...
	 */
	public class BulletSkipper extends Bullet {
		private var skipsLeft:int = 5;
		
		public function BulletSkipper(x:Number, y:Number) {
			super(x, y, 0);
		}
		
		override public function hit(hitBody:b2Body):void {
			if (skipsLeft <= 0) {
				super.hit(hitBody);
			} else {
				skipsLeft--;
			}
		}
	}
}