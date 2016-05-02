package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class LadderTunnelTerrain extends Terrain {
		
		public function LadderTunnelTerrain(location:Point, numPatterns:int) {
			super(location, numPatterns);
			new Standard(location.x, location.y, 25, 2);
			addPlatformCostume(location.x, location.y, 25, 2);
			for (var j:int = 1; j < numPatterns; j++) {
				var platform:Standard = new Standard(j * 500 / 20 + location.x, location.y, Math.sqrt(8), 2);
				platform.setAngle( -45);
				addPlatformCostume(j * 500 / 20 + location.x, location.y, Math.sqrt(8), 2, -45);
				platform = new Standard(j * 500 / 20 + location.x, location.y-10, Math.sqrt(8), 2);
				platform.setAngle( -45);
				addPlatformCostume(j * 500 / 20 + location.x, location.y - 10, Math.sqrt(8), 2, -45);
				new Standard(j * 500 / 20 + 2 + location.x, location.y - 2, 210 / 20, 2);
				addPlatformCostume(j * 500 / 20 + 2 + location.x, location.y - 2, 210 / 20, 2);
				new Standard(j * 500 / 20 + 2 + location.x, location.y - 12, 210 / 20, 2);
				addPlatformCostume(j * 500 / 20 + 2 + location.x, location.y - 12, 210 / 20, 2);
				platform = new Standard(j * 500 / 20 + 250 / 20 + location.x, location.y - 2, Math.sqrt(8), 2);
				platform.setAngle(45);
				addPlatformCostume(j * 500 / 20 + 250 / 20 + location.x, location.y - 2, Math.sqrt(8), 2, 45);
				platform = new Standard(j * 500 / 20 + 250 / 20 + location.x, location.y - 12, Math.sqrt(8), 2);
				platform.setAngle(45);
				addPlatformCostume(j * 500 / 20 + 250 / 20 + location.x, location.y - 12, Math.sqrt(8), 2, 45);
				new Standard(j * 500 / 20 + 250 / 20 + 2 + location.x, location.y, 210 / 20, 2);
				addPlatformCostume(j * 500 / 20 + 250 / 20 + 2 + location.x, location.y, 210 / 20, 2);
				new Standard(j * 500 / 20 + 250 / 20 + 2 + location.x, location.y-10, 210 / 20, 2);
				addPlatformCostume(j * 500 / 20 + 250 / 20 + 2 + location.x, location.y-10, 210 / 20, 2);
			}
			new Standard(numPatterns * 25 + location.x, location.y, 10, 2);
			addPlatformCostume(numPatterns * 25 + location.x, location.y, 10, 2);
			finishPoint = new Point(location.x + numPatterns * 25 + 10, (location.y - 10) * 20);
		}
	}
}