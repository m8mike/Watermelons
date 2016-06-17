package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class JumpLadderTerrain extends Terrain {
		
		public function JumpLadderTerrain(location:Point, numPatterns:int) {
			super(location, numPatterns);
			for (var j:int = 0; j < numPatterns; j++) {
				var platform:Standard = new Standard(j * 500 / 20 + location.x, location.y, Math.sqrt(8), 2);
				platform.setAngle( -45);
				addPlatformCostume(j * 500 / 20 + location.x, location.y, Math.sqrt(8), 2, -45);
				new Standard(j * 500 / 20 + 2 + location.x, location.y - 2, 210 / 20, 2);
				addPlatformCostume(j * 500 / 20 + 2 + location.x, location.y - 2, 210 / 20, 2);
				platform = new Standard(j * 500 / 20 + 250 / 20 + location.x, location.y - 2, Math.sqrt(8), 2);
				platform.setAngle(45);
				addPlatformCostume(j * 500 / 20 + 250 / 20 + location.x, location.y - 2, Math.sqrt(8), 2, 45);
				new Standard(j * 500 / 20 + 250 / 20 + 2 + location.x, location.y, 210 / 20, 2);
				addPlatformCostume(j * 500 / 20 + 250 / 20 + 2 + location.x, location.y, 210 / 20, 2);
				if (Math.random() > 0.5) {
					new JumpBoost(j * 500 / 20 + 5 + location.x, location.y - 5);
				}
				if (Math.random() > 0.5) {
					new JumpBoost(j * 500 / 20 + 250 / 20 + 5 + location.x, location.y-3);
				}
			}
			finishPoint = new Point(location.x + numPatterns * 25, (location.y - 10)*20);
		}
	}
}