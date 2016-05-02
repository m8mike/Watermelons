package {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class HighHills extends Terrain {
		
		public function HighHills(location:Point, numHills:int) {
			super(location, numHills);
			var nextHeight:Number =  140 + Math.random() * 200;
			var terrain:DynamicTerrain;
			for (var j:int = 0; j < numHills; j++) {
				terrain = new DynamicTerrain(j * 640 / 20 + location.x, 10, location.y, DynamicTerrain.HIGH);
				nextHeight = terrain.nextHill;
			}
			finishPoint = new Point(location.x + numHills * 640 / 20, nextHeight);
		}
	}
}