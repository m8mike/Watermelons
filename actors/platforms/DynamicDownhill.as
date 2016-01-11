package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class DynamicDownhill extends DynamicTerrain {
		
		public function DynamicDownhill(x:Number, y:Number, next:Number = 0) {
			super(x, y, next);
			location.y += next;
		}
		
		override protected function drawHill(pixelStep:int, xOffset:Number, yOffset:Number):Number {
			var hillStartY:Number = yOffset;
			var hillWidth:Number = 640;
			var hillSliceWidth = hillWidth / pixelStep;
			var hillSlice:Array;
			var randomHeight:Number = 40+Math.random() * 100;
			if (xOffset != 0) {
				hillStartY -= randomHeight;
			}
			shapes = [];
			var gain:Number = 465;
			var lastGain:Number = 480;
			//var gainGain:Number = 0;
			for (var j:int = 0; j < hillSliceWidth; j++) {
				hillSlice = [];
				var offsetY:Point = new Point( -randomHeight + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * j), 
												-randomHeight + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * (j + 1)));
				hillSlice.push(new Point((j * pixelStep + xOffset), yOffset + 480 - yOffset + 480));
				hillSlice.push(new Point((j * pixelStep + xOffset), hillStartY + offsetY.x - lastGain - yOffset + 480));
				hillSlice.push(new Point(((j + 1) * pixelStep + xOffset), hillStartY + offsetY.y - gain - yOffset + 480));
				hillSlice.push(new Point(((j + 1) * pixelStep + xOffset), yOffset + 480 - yOffset + 480));
				shapes.push(new CustomShape(hillSlice));
				lastGain = gain;
				gain -= 15;
			}
			return hillStartY + 480;
		}
	}
}