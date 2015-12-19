package {
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BombingBat extends Dummy {
		private var move:MoveAB;
		private var timeToSpawnBomb:int = 100;
		//private var costumeManager:BatCostumeManager;
		
		public function BombingBat(x:int, y:int) {
			super(x, y, 2, 2);
			var loc1:Point = location.clone();
			loc1.x += 200;
			move = new MoveAB(location, loc1, bodyManager.body);
			//costumeManager = new BatCostumeManager(this);
		}
		
		override public function update():void {
			move.update();
			//costumeManager.update();
			if (timeToSpawnBomb <= 0) {
				timeToSpawnBomb = 200;
				var bombLoc:Point = new Point();
				bombLoc.x = getBody().GetWorldCenter().x * PhysicalWorld.RATIO / PhysicalWorld.MIN_SQARE + 1;
				bombLoc.y = getBody().GetWorldCenter().y * PhysicalWorld.RATIO / PhysicalWorld.MIN_SQARE;
				new Bomb(bombLoc.x, bombLoc.y);
			} else {
				timeToSpawnBomb--;
			}
			super.update();
		}
	}
}