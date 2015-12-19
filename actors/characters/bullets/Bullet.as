package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends Character {
		protected var removingTimer:RemovingTimer;
		
		public function Bullet(x:Number, y:Number, impulse:b2Vec2, timeToRemove:int = 10, size:int = 7) {
			var shape:CircleShape = new CircleShape(size);
			super(x, y);
			if (!bodyManager) {	
				bodyManager = new DummyBodyManager(location, this, shape);
			}
			condition = new Condition();			
			getBody().ApplyImpulse(impulse.Copy(), getBody().GetWorldCenter().Copy());
			removingTimer =  new RemovingTimer(getBody(), timeToRemove);
		}
		
		public function hit(body:b2Body):void {
			removingTimer.activate();
		}
		
		override public function update():void {
			removingTimer.update();
			super.update();
		}
	}
}