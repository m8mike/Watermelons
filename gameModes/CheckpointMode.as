package  {
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class CheckpointMode extends LimitedTime {
		
		public function CheckpointMode(gold:int, silver:int, bronze:int) {
			MyTimer.reset();
			super(gold, silver, bronze);
			respawnAtCheckpoints = true;
		}
		
		override public function onCheckpoint():void {
			MyTimer.saveTime();
			trace("onCheckpoint");
		}
		
		override public function onRespawn():void {
			trace("onRespawn");
			MyTimer.setTimeToCheckpointTime();
		}
	}
}