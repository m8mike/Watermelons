package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class RemovingTimer extends Behavior {
		private var timeToRemove:int;
		private var maxTime:int;
		private var started:Boolean = false;
		private var actor:Actor;
		
		public function RemovingTimer(actor:Actor, time:int = 0) {
			this.actor = actor;
			timeToRemove = time;
			maxTime = time;
			super(null);
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
				actor.destroy();
			}
			super.update();
		}
		
		public function deactivate():void {
			started = false;
			timeToRemove = maxTime;
		}
	}
}