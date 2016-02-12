package {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class NormalHills extends Terrain {
		
		public function NormalHills(location:Point, numHills:int) {
			var nextHeight:Number =  140 + Math.random() * 200;
			var terrain:DynamicTerrain;
			for (var j:int = 0; j < numHills; j++) {
				terrain = new DynamicTerrain(j * 640 / 20 + location.x, 10, location.y, DynamicTerrain.NORMAL);
				nextHeight = terrain.nextHill;
			}
			finishPoint = new Point(location.x + numHills * 640 / 20, nextHeight);
			super(location, numHills);
		}
	}
}