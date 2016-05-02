package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class VehicleBombTimer extends Behavior {
		private var timeToRespawn:int;
		private var maxTime:int;
		private var started:Boolean = false;
		
		public function VehicleBombTimer(time:int = 0) {
			timeToRespawn = time;
			maxTime = time;
			super(null);
		}
		
		public function restart():void {
			timeToRespawn = maxTime;
		}
		
		public function activate():void {
			started = true;
		}
		
		override public function update():void {
			if (!started) {
				return void;
			}
			if (timeToRespawn > 0) {
				timeToRespawn--;
			} else {
				LevelDirector.currentLevel.respawn();
				restart();
			}
			MyTimer.setText(int((timeToRespawn-(timeToRespawn%30))/30 + 1) + "");
			super.update();
		}
		
		public function charge():void {
			timeToRespawn += 60;
		}
		
		public function deactivate():void {
			started = false;
			timeToRespawn = maxTime;
		}
	}
}