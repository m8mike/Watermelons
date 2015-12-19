package {
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Bomb extends Dummy {
		//private var costumeManager:BombCostumeManager;
		public var started:Boolean = false;
		private var timeToBlow:int = 60;
		
		public function Bomb(x:int, y:int) {
			super(x, y, 2, 1.8);
			//costumeManager = new BombCostumeManager(this);
		}
		
		public function startTimer():void {
			if (!started) {
				started = true;
			}
		}
		
		private function explode():void {
			trace("boom");
			destroy();
		}
		
		override public function update():void {
			updateTimer();
			//costumeManager.update();
			super.update();
		}
		
		private function updateTimer():void {
			if (started) {
				if (timeToBlow > 0) {
					timeToBlow--;
					if (!(timeToBlow % 20)) {	
						trace(timeToBlow / 20 + 1);
					}
				} else {
					started = false;
					timeToBlow = 0;
					explode();
				}
			}
		}
		
		override protected function removeCostumes():void {
			//costumeManager.destroy();
			super.removeCostumes();
		}
	}
}