package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletSplitter extends Bullet {
		private var locInc:b2Vec2;
		
		public function BulletSplitter(x:Number, y:Number, impulse:b2Vec2) {
			super(x, y, impulse, 0);
		}
		
		override public function hit(body:b2Body):void {
			super.hit(body);
			locInc = getBody().GetWorldCenter().Copy();
			locInc.Multiply(3 / 2);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			new Bullet(locInc.x-1, locInc.y, new b2Vec2(-0.1, -0.1), 0, 4);
			new Bullet(locInc.x+1, locInc.y, new b2Vec2(0.1, 0.1), 0, 4);
			new Bullet(locInc.x, locInc.y-1, new b2Vec2(0, -0.1), 0, 4);
			super.cleanUpBeforeRemoving();
		}
	}
}