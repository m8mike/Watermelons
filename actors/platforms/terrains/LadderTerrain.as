package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class LadderTerrain extends Terrain {
		
		public function LadderTerrain(location:Point, numPatterns:int) {
			for (var j:int = 0; j < numPatterns; j++) {
				var platform:Standard = new Standard(j * 500 / 20 + location.x, location.y, Math.sqrt(8), 2);
				platform.setAngle( -45);
				new Standard(j * 500 / 20 + 2 + location.x, location.y - 2, 210 / 20, 2);
				platform = new Standard(j * 500 / 20 + 250 / 20 + location.x, location.y - 2, Math.sqrt(8), 2);
				platform.setAngle(45);
				new Standard(j * 500 / 20 + 250 / 20 + 2 + location.x, location.y, 210 / 20, 2);
			}
			finishPoint = new Point(location.x + numPatterns * 25, (location.y - 10)*20);
			super(location, numPatterns);
		}
	}
}