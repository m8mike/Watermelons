package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class JumpWallTerrain extends Terrain {
		
		public function JumpWallTerrain(location:Point, numPatterns:int) {
			super(location, numPatterns);
			for (var j:int = 0; j < numPatterns; j++) {
				new Standard(j * 40 + location.x, location.y, 40, 2);
				addPlatformCostume(j * 40 + location.x, location.y, 40, 2);
				new Standard(j * 40 + 15 + location.x, location.y - 15, 3, 15);
				addPlatformCostume(j * 40 + 15 + location.x, location.y - 15, 3, 15);
				new JumpBoost(j * 40 + 5 + location.x, location.y - 3);
				addPlatformCostume(j * 40 + 5 + location.x, location.y - 3, 3, 3);
			}
			finishPoint = new Point(location.x + numPatterns * 40, (location.y - 10)*20);
		}
	}
}