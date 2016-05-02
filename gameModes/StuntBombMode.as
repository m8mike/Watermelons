package  {
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class StuntBombMode extends GameMode {
		private var bombTimer:VehicleBombTimer;
		
		public function StuntBombMode() {
			bombTimer = new VehicleBombTimer(300);
			MyTimer.checkTimerColor = null;
			MyTimer.stop();
			MyTimer.setColor(0xFF0000);
			Updatables.modeUpdate = bombTimer.update;
			bombTimer.activate();
			respawnAtCheckpoints = false;
			MyTimer.show();
		}
		
		override public function onStunt(numStunts:int = 1):void {
			for (var i:int = 0; i <= numStunts*numStunts; i++) {
				bombTimer.charge();
			}
		}
		
		override public function onRespawn():void {
			bombTimer.restart();
		}
	}
}