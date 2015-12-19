package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BulletCloud extends Bullet {
		private var locInc:b2Vec2;
		
		public function BulletCloud(x:Number, y:Number, impulse:b2Vec2, size:int = 7) {
			super(x, y, impulse, 0, size);
		}
		
		override public function hit(body:b2Body):void {
			if (!body) {
				return void;
			}
			trace(body.GetUserData());
			if (body.GetUserData() is Platform) {
				locInc = getBody().GetWorldCenter().Copy();
				locInc.Multiply(3 / 2);
				super.hit(body);
			}
		}
		
		override protected function cleanUpBeforeRemoving():void {
			new Cloud(locInc.x, locInc.y);
			super.cleanUpBeforeRemoving();
		}
	}
}