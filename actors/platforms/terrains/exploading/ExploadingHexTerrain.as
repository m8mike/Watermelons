package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ExploadingHexTerrain extends Terrain {
		
		public function ExploadingHexTerrain(location:Point, numPatterns:int) {
			super(location, numPatterns);
			var offset:Point = new Point();
			var goUp:Boolean = false;
			for (var j:int = 0; j < numPatterns; j++) {
				goUp = Math.random() > 0.5;
				offset.y += goUp ? Math.sqrt(3) : -Math.sqrt(3);
				var hex:StickyHexagon = new StickyHexagon(offset.x + location.x, offset.y + location.y, 2);
				addExploadingHexLine(offset.x + location.x, offset.y + location.y);
				hex.setAngle(30);
				var color:uint = parseInt("0x" + ((1 << 24) * Math.random() | 0).toString(16));
				costume.graphics.beginFill(color);
				costume.graphics.moveTo(20*offset.x + Math.cos(0) * 40, 20*offset.y + Math.sin(0) * 40);
				for (var i:int = 1; i <= 6; i++) {
					costume.graphics.lineTo(20*offset.x + Math.cos(((i * 60) % 360) / 180 * Math.PI) * 40, 
											20*offset.y + Math.sin(((i * 60) % 360) / 180 * Math.PI) * 40);
				}
				costume.graphics.endFill();
				offset.x += 3;
			}
			costume.x = 20*location.x;
			costume.y = 20*location.y;
			finishPoint = new Point(location.x + offset.x, (location.y - 10) * 20 + offset.y * 20);
		}
		
		private function addExploadingHexLine(x:Number, y:Number):void {
			
		}
	}
}