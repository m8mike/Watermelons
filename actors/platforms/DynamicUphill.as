package {
	import Box2D.Common.Math.b2Vec2;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class DynamicUphill extends DynamicTerrain {
		private var costume:TerrainCostume;
		
		public function DynamicUphill(x:Number, y:Number, next:Number = 0) {
			super(x, y, next);
			location.y += next;
		}
		
		override protected function drawHill(pixelStep:int, xOffset:Number, yOffset:Number):Number {
			var hillStartY:Number = yOffset;
			var hillWidth:Number = 640;
			var hillSliceWidth:Number = hillWidth / pixelStep;
			var hillSlice:Array;
			var randomHeight:Number = 40+Math.random() * 100;
			if (xOffset != 0) {
				hillStartY -= randomHeight;
			}
			shapes = [];
			var gain:Number = 0;
			var lastGain:Number = 0;
			//var gainGain:Number = 0;
			var costumeShape:Array = [];
			costumeShape.push(new Point(xOffset, hillStartY - randomHeight + randomHeight * Math.cos(0) - yOffset));
			for (var j:int = 0; j < hillSliceWidth; j++) {
				hillSlice = [];
				gain += 15;
				var offsetY:Point = new Point( -randomHeight + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * j), 
												-randomHeight + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * (j + 1)));
				costumeShape.push(new Point((j + 1) * pixelStep + xOffset, hillStartY + offsetY.y - gain - yOffset));
				hillSlice.push(new Point((j * pixelStep + xOffset), yOffset + 480 - yOffset));
				hillSlice.push(new Point((j * pixelStep + xOffset), hillStartY + offsetY.x - lastGain - yOffset));
				hillSlice.push(new Point(((j + 1) * pixelStep + xOffset), hillStartY + offsetY.y - gain - yOffset));
				hillSlice.push(new Point(((j + 1) * pixelStep + xOffset), yOffset + 480 - yOffset));
				shapes.push(new CustomShape(hillSlice));
				lastGain = gain;
			}
			costumeShape.push(new Point(j * pixelStep + xOffset, 480 + 480));
			costumeShape.push(new Point(xOffset, 480 + 480));
			costume = new TerrainCostume(costumeShape, new Point(location.x, location.y + yOffset));
			return hillStartY - gain;
		}
		
		override protected function cleanUpBeforeRemoving():void {
			super.cleanUpBeforeRemoving();
			if (costume) {	
				costume.remove();
			}
		}
	}
}