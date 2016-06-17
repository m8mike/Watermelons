package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class TunnelLevels extends GameLevel {
		
		public function TunnelLevels() {
			
		}
		
		public static function createTunnelLevel():void {
			Tank.setSymbol(tank_juicy_body);
			YellowWheel.setSymbol(tank_yellow_wheel);
			var startPoint:Point = new Point(-20, 10);
			var terrain:Terrain = new DownHillTerrain(startPoint, 1);
			for (var i:int = 0; i < 100; i++) {
				startPoint = terrain.finishPoint.clone();
				switch (int(Math.random() * 7)) {
					case 0:
						terrain = new LadderTunnelTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
					break;
					case 1:
						terrain = new LadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
					break;
					case 2:
						//terrain = new RandomLadderTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
						terrain = new LadderDownTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
					break;
					case 3:
						terrain = new HexagonsTerrain2(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 50+10));
					break;
					case 4:
						terrain = new ExploadingHexTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 50+10));
					break;
					case 5:
						terrain = new LadderTunnelTerrain2(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 3+1));
					break;
					case 6:
						terrain = new RandomTunnelTerrain(new Point(startPoint.x, 10+startPoint.y/20), int(Math.random() * 10+1));
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