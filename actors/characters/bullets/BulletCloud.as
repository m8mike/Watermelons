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
		
		public function BulletCloud(x:Number, y:Number, size:int = 7) {
			super(x, y, 0, size);
		}
		
		override public function hit(hitBody:b2Body):void {
			if (!hitBody) {
				return void;
			}
			if (hitBody.GetUserData() is Platform) {
				locInc = body.GetWorldCenter().Copy();
				locInc.Multiply(3 / 2);
				super.hit(hitBody);
			}
		}
		
		override protected function cleanUpBeforeRemoving():void {
			new Cloud(locInc.x, locInc.y);
			super.cleanUpBeforeRemoving();
		}
	}
}