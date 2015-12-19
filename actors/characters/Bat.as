package {
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Bat extends Dummy {
		private var move:MoveAB;
		//private var costumeManager:BatCostumeManager;
		
		public function Bat(x:int, y:int) {
			super(x, y, 2, 2);
			var loc1:Point = location.clone();
			loc1.x += 200;
			move = new MoveAB(location, loc1, bodyManager.body);
			//costumeManager = new BatCostumeManager(this);
		}
		
		override public function update():void {
			move.update();
			//costumeManager.update();
			super.update();
		}
	}
}