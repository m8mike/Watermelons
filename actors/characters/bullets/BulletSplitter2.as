package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletSplitter2 extends Bullet {
		private var locInc:b2Vec2;
		
		public function BulletSplitter2(x:Number, y:Number, radius:Number) {
			super(x, y, 0, radius);
		}
		
		override public function hit(hitBody:b2Body):void {
			super.hit(hitBody);
			locInc = body.GetWorldCenter().Copy();
			locInc.Multiply(3 / 2);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			for (var i:int = 0; i < 25; i++) {
				var p:Particle = new Particle(locInc.x + (8 * (i % 5) - 20) / 20, locInc.y + (int(i / 5) * 8 - 20) / 20);
				p.applyImpulse(Math.random()*0.1 - 0.05, -Math.random()*0.1);
			}
			super.cleanUpBeforeRemoving();
		}
	}
}