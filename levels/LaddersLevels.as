package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class LaddersLevels extends GameLevel {
		
		public function LaddersLevels() {
			
		}
		
		public static function createLaddersLevel():void {
			Tank.setSymbol(tank_hot_body);
			YellowWheel.setSymbol(tank_hot_wheel);
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 100; i++) {
				startPoint = terrain.finishPoint.clone();
				switch (int(Math.random() * 7)) {
					case 0:
						terrain = new PyramidLadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
					break;
					case 1:
						terrain = new CubeLadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 60+1));
					break;
					case 2:
						terrain = new RandomLadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
					break;
					case 3:
						terrain = new LadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
					break;
					case 4:
						terrain = new JumpLadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
					break;
					case 5:
						terrain = new JumpWallTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
					break;
					case 6:
						terrain = new JumpForwardTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
					break;
					default:
				}
				new Checkpoint(startPoint.x - 3, startPoint.y / 20 - 2);
			}
			startPoint = terrain.finishPoint.clone();
			new EndLevel(startPoint.x - 3, startPoint.y / 20 - 10);
		}
	}
}