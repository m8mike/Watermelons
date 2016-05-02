package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class FullyRandomLevels extends GameLevel {
		
		public function FullyRandomLevels() {
			
		}
		
		public static function createFullRandomLevel():void {
			Tank.setSymbol(tank_fantom_body);
			YellowWheel.setSymbol(tank_green_wheel);
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			//terrain = new NormalHills(startPoint, 1000);
			for (var i:int = 0; i < 100; i++) {
				startPoint = terrain.finishPoint.clone();
				//terrain = new LowHills(startPoint, 1);
				switch (int(Math.random() * 10)) {
					case 0:
						terrain = new DownHillTerrain(startPoint, 1);
					break;
					case 1:
						terrain = new LowHills(startPoint, 1);
					break;
					case 2:
						terrain = new NormalHills(startPoint, 1);
					break;
					case 3:
						terrain = new HighHills(startPoint, 1);
					break;
					case 4:
						terrain = new UpHillTerrain(startPoint, 1);
					break;
					case 5:
						var numBoxes:int = int(Math.random() * 10);
						new StraightSpikes(new Point(startPoint.x, 10 + startPoint.y / 20 + 3), numBoxes);
						explodingRoads.push(terrain = new ExplodingRoad(new Point(startPoint.x, 10+startPoint.y/20), 5*numBoxes));
					break;
					case 6:
						terrain = new PyramidLadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10));
					break;
					case 7:
						terrain = new CubeLadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 60));
					break;
					case 8:
						terrain = new RandomLadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10));
					break;
					case 9:
						terrain = new LadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10));
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