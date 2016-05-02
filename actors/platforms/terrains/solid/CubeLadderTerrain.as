package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class CubeLadderTerrain extends Terrain {
		
		public function CubeLadderTerrain(location:Point, numPatterns:int) {
			super(location, numPatterns);
			var length:Number;
			var offset:Point = new Point();
			for (var j:int = 0; j < numPatterns; j++) {
				length = Math.random() * 2 + 1;
				offset.y += (Math.random() > 0.5)?1: -1;
				new Standard(offset.x + location.x, offset.y + location.y, length, length);
				var color:uint = parseInt("0x" + ((1 << 24) * Math.random() | 0).toString(16));
				costume.graphics.beginFill(color);
				costume.graphics.drawRect(offset.x*20, offset.y*20, length*20, length*20);
				costume.graphics.endFill();
				offset.x += length;
			}
			costume.x = location.x*20;
			costume.y = location.y*20;
			finishPoint = new Point(location.x + offset.x, (location.y - 10) * 20 + offset.y * 20);
		}
	}
}