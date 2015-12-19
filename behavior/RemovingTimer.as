package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class RemovingTimer extends Behavior {
		private var timeToRemove:int;
		private var started:Boolean = false;
		
		public function RemovingTimer(body:b2Body, time:int = 0) {
			timeToRemove = time;
			super(body);
		}
		
		public function activate():void {
			started = true;
		}
		
		override public function update():void {
			if (!started) {
				return void;
			}
			if (timeToRemove > 0) {
				timeToRemove--;
			} else {
				Actor(body.GetUserData()).destroy();
			}
			super.update();
		}
	}
}