package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class JumpForwardTerrain extends Terrain {
		
		public function JumpForwardTerrain(location:Point, numPatterns:int) {
			super(location, numPatterns);
			for (var j:int = 0; j < numPatterns; j++) {
				new Standard(j * 40 + location.x, location.y, 40, 2);
				addPlatformCostume(j * 40 + location.x, location.y, 40, 2);
				new Standard(j * 40 + 15 + location.x, location.y - 15, 3, 15);
				addPlatformCostume(j * 40 + 15 + location.x, location.y - 15, 3, 15);
				new JumpBoost(j * 40 + 5 + location.x, location.y - 3);
				new Standard(j * 40 + location.x, location.y - 30, 3, 15);
				addPlatformCostume(j * 40 + location.x, location.y - 30, 3, 15);
				var jumpBoost:JumpBoost = new JumpBoost(j * 40 + 6 + location.x, location.y - 20);
				jumpBoost.setAngle(90);
			}
			finishPoint = new Point(location.x + numPatterns * 40, (location.y - 10) * 20);
		}
	}
}