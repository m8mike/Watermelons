package  {
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class GameMode {
		public var respawnAtCheckpoints:Boolean = true;
		
		public function GameMode() {
			Updatables.modeUpdate = null;
		}
		
		public function onStunt(numStunts:int = 1):void {
			
		}
		
		public function onRespawn():void {
			MyTimer.reset();
			MyTimer.start();
		}
		
		public function onCheckpoint():void {
			
		}
	}
}