package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class UpHillTerrain extends Terrain {
		
		public function UpHillTerrain(location:Point, numHills:int) {
			super(location, numHills);
			var nextHeight:Number =  140 + Math.random() * 200;
			var terrain:DynamicUphill;
			for (var j:int = 0; j < numHills; j++) {
				terrain = new DynamicUphill(j * 640 / 20 + location.x, 10, location.y);
				nextHeight = terrain.nextHill;
			}
			finishPoint = new Point(location.x + numHills * 640 / 20, nextHeight);
		}
	}
}