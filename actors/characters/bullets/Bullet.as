package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends Particle {
		protected var removingTimer:RemovingTimer;
		
		public function Bullet(x:Number, y:Number, timeToRemove:int = 10, radius:int = 7) {
			super(x, y, radius);
			removingTimer = new RemovingTimer(this, timeToRemove);
		}
		
		public function hit(hitBody:b2Body):void {
			removingTimer.activate();
		}
		
		override public function update():void {
			removingTimer.update();
			super.update();
		}
	}
}