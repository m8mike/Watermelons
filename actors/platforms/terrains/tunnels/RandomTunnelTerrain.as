package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class RandomTunnelTerrain extends Terrain {
		
		public static const EASY:int = 0;
		public static const NORMAL:int = 1;
		public static const HARD:int = 2;
		
		public function RandomTunnelTerrain(location:Point, numPatterns:int, difficulty:int = 2) {
			super(location, numPatterns);
			var length:Number;
			var angle:Number;
			var offset:Point = new Point();
			new Standard(location.x, location.y, 25, 2);
			addPlatformCostume(location.x, location.y, 25, 2);
			offset.x += 25;
			for (var j:int = 0; j < numPatterns; j++) {
				length = Math.random() * 7 + 3;
				angle = -getRandomAngle(difficulty);
				var platform:Standard = new Standard(offset.x + location.x, offset.y + location.y, length, 2);
				platform.setAngle(angle);
				addPlatformCostume(offset.x + location.x, offset.y + location.y, length, 2, angle);
				platform = new Standard(offset.x + location.x, offset.y + location.y - 15, length, 2);
				platform.setAngle(angle);
				addPlatformCostume(offset.x + location.x, offset.y + location.y - 15, length, 2, angle);
				angle = angle / 180 * Math.PI;
				offset.x += length * Math.cos(angle);
				offset.y += length * Math.sin(angle);
				length = Math.random() * 15 + 5;
				new Standard(offset.x + location.x, offset.y + location.y, length, 2);
				addPlatformCostume(offset.x + location.x, offset.y + location.y, length, 2);
				new Standard(offset.x + location.x, offset.y + location.y - 15, length, 2);
				addPlatformCostume(offset.x + location.x, offset.y + location.y - 15, length, 2);
				offset.x += length;
				length = Math.random() * 7 + 3;
				angle = getRandomAngle(difficulty);
				platform = new Standard(offset.x + location.x, offset.y + location.y, length, 2);
				platform.setAngle(angle);
				addPlatformCostume(offset.x + location.x, offset.y + location.y, length, 2, angle);
				platform = new Standard(offset.x + location.x, offset.y + location.y - 15, length, 2);
				platform.setAngle(angle);
				addPlatformCostume(offset.x + location.x, offset.y + location.y - 15, length, 2, angle);
				angle = angle / 180 * Math.PI;
				offset.x += length * Math.cos(angle);
				offset.y += length * Math.sin(angle);
				length = Math.random() * 15 + 5;
				new Standard(offset.x + location.x, offset.y + location.y, length, 2);
				addPlatformCostume(offset.x + location.x, offset.y + location.y, length, 2);
				new Standard(offset.x + location.x, offset.y + location.y-15, length, 2);
				addPlatformCostume(offset.x + location.x, offset.y + location.y-15, length, 2);
				offset.x += length;
			}
			new Standard(offset.x + location.x, offset.y + location.y, 25, 2);
			addPlatformCostume(offset.x + location.x, offset.y + location.y, 25, 2);
			offset.x += 25;
			finishPoint = new Point(location.x + offset.x, (location.y - 10)*20 + offset.y*20);
		}
		
		private function getRandomAngle(difficulty:int):Number {
			switch (difficulty) {
				case EASY:
					return 3 + Math.random() * 10;
				break;
				case NORMAL:
					return 10 + Math.random() * 30;
				break;
				case HARD:
					return 10 + Math.random() * 60;
				break;
				default:
			}
			return 10 + Math.random() * 30;
		}
	}
}