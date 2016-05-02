package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class PyramidLadderTerrain extends Terrain {
		
		public function PyramidLadderTerrain(location:Point, numPatterns:int) {
			super(location, numPatterns);
			var length:Number;
			var angle:Number;
			var offset:Point = new Point();
			for (var j:int = 0; j < numPatterns; j++) {
				length = Math.random() * 10 + 1;
				var platform:Standard = new Standard(offset.x + location.x, offset.y + location.y, length, 2);
				angle = 45;
				addPlatformCostume(offset.x + location.x, offset.y + location.y, length, 2, 45);
				platform.setAngle(angle);
				angle = angle / 180 * Math.PI;
				offset.x += length * Math.cos(angle);
				offset.y += length * Math.sin(angle);
				length = Math.random() * 10 + 1;
				platform = new Standard(offset.x + location.x, offset.y + location.y, length, 2);
				angle = -45;
				addPlatformCostume(offset.x + location.x, offset.y + location.y, length, 2, -45);
				platform.setAngle(angle);
				angle = angle / 180 * Math.PI;
				offset.x += length * Math.cos(angle);
				offset.y += length * Math.sin(angle);
			}
			finishPoint = new Point(location.x + offset.x, (location.y - 10)*20 + offset.y*20);
		}
	}
}