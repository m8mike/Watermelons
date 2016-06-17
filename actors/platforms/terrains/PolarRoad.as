package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class PolarRoad extends Terrain {
		
		public function PolarRoad(location:Point, numPatterns:int, length:int = 4) {
			super(location, numPatterns);
			var angle:Number = Math.random() * 90 - 30;
			var angleChange:Number = (Math.random() * 8 + 2) * (2 * int(angle < 0) - 1);
			var minAngle:int = -60 + Math.random() * 60;
			var maxAngle:int = minAngle + 1 + Math.random() * 110;
			var offset:Point = new Point();
			for (var j:int = 0; j < numPatterns; j++) {
				var platform:Standard = new Standard(offset.x + location.x, offset.y + location.y, length, 2);
				platform.setAngle(angle);
				addPlatformCostume(offset.x + location.x, offset.y + location.y, length, 2, angle);
				offset.x += length * Math.cos(angle / 180 * Math.PI);
				offset.y += length * Math.sin(angle / 180 * Math.PI);
				if (Math.random() > 0.95) {
					angleChange = -angleChange;
				}
				angleChange *= 0.9 + Math.random() * 0.2;
				if (angle > maxAngle) {//60
					angleChange = -Math.abs(angleChange);
				} else if (angle < minAngle) {//-30
					angleChange = Math.abs(angleChange);
				}
				angle += angleChange;
			}
			finishPoint = new Point(location.x + offset.x, (location.y - 10)*20 + offset.y*20);
		}
	}
}