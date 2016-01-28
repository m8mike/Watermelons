package {
	import Box2D.Common.Math.b2Vec2;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletImmediate extends Bullet {
		
		public function BulletImmediate(x:Number, y:Number, size:int = 7) {
			const timeToBlow:int = 0;
			super(x, y, timeToBlow, size);
		}
	}
}