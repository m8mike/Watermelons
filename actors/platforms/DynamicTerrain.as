package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class DynamicTerrain extends Platform {
		// random hill's height
		public var nextHill:Number = 140 + Math.random() * 200;
		protected var shapes:Array = [];
		
		public function DynamicTerrain(x:Number, y:Number, next:Number = 0) {
			super(x, y);
			nextHill = drawHill(20, 0, next);
		}
		
		protected function drawHill(pixelStep:int, xOffset:Number, yOffset:Number):Number {
			var hillStartY:Number = yOffset;
			var hillWidth:Number = 640;
			var hillSliceWidth = hillWidth / pixelStep;
			var hillSlice:Array;
			var randomHeight:Number = Math.random() * 100;
			if (xOffset != 0) {
				hillStartY -= randomHeight;
			}
			shapes = [];
			for (var j:int = 0; j < hillSliceWidth; j++) {
				hillSlice = [];
				hillSlice.push(new Point((j * pixelStep + xOffset), 480));
				hillSlice.push(new Point((j * pixelStep + xOffset), 
					hillStartY - randomHeight + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * j)));
				hillSlice.push(new Point(((j + 1) * pixelStep + xOffset), 
					hillStartY - randomHeight + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * (j + 1))));
				hillSlice.push(new Point(((j + 1) * pixelStep + xOffset), 480));
				shapes.push(new CustomShape(hillSlice));
			}
			return hillStartY;
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 1;
				bodyBuilder.restitution = 0;
				bodyBuilder.groupIndex = 0;
			}
			createBody(location);
		}
		
		private function createBody(loc:Point):void {
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(shapes);
			body.SetUserData(this);
		}
	}
}