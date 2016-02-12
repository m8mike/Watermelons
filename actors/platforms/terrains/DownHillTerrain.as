package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class DownHillTerrain extends Terrain {
		
		public function DownHillTerrain(location:Point, numHills:int) {
			var nextHeight:Number =  140 + Math.random() * 200;
			var terrain:DynamicDownhill;
			terrain = new DynamicDownhill(j * 640 / 20 + location.x, 10, location.y);
			nextHeight = terrain.nextHill;
			for (var j:int = 1; j < numHills; j++) {
				terrain = new DynamicDownhill(j * 640 / 20 + location.x, nextHeight, location.y);
				nextHeight = terrain.nextHill;
			}
			finishPoint = new Point(location.x + numHills * 640 / 20, nextHeight);
			super(location, numHills);
		}
	}
}