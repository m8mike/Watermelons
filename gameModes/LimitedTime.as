package  {
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class LimitedTime extends GameMode {
		private var goldTime:int;
		private var silverTime:int;
		private var bronzeTime:int;
		
		public function LimitedTime(gold:int, silver:int, bronze:int) {
			MyTimer.start();
			setTime(gold, silver, bronze);
			MyTimer.checkTimerColor = checkTime;
			respawnAtCheckpoints = false;
			MyTimer.show();
		}
		
		public function setTime(gold:int, silver:int, bronze:int):void {
			goldTime = gold;
			silverTime = silver;
			bronzeTime = bronze;
		}
		
		public function checkTime(time:int):String {
			if (time < goldTime) {
				return "gold";
			} else if (time < goldTime + silverTime) {
				return "silver";
			} else if (time < goldTime + silverTime + bronzeTime) {
				return "bronze";
			}
			return "no award";
		}
	}
}