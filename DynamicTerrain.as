package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class DynamicTerrain extends Platform {
		// random hill's height
		private var nextHill:Number = 140 + Math.random() * 200;
		// build another hill when stage's x position is lower than this value
		private var buildNextHillAt:Number = 0;
		private var shapes:Array = [];
		
		public function DynamicTerrain(x:Number, y:Number) {
			nextHill = drawHill(20, 0, nextHill);
			nextHill = drawHill(20, 640, nextHill);
			super(x, y);
		}
		
		private function drawHill(pixelStep:int, xOffset:Number, yOffset:Number):Number {
			var hillStartY:Number = yOffset;
			var hillWidth:Number = 640;
			var hillSliceWidth = hillWidth / pixelStep;
			var hillSlice:Array;
			var randomHeight:Number = Math.random() * 100;
			if (xOffset != 0) {
				hillStartY -= randomHeight;
			}
			for (var j:int = 0; j < hillSliceWidth; j++) {
				hillSlice = [];
				hillSlice.push(new Point((j * pixelStep + xOffset), 480));
				hillSlice.push(new Point((j * pixelStep + xOffset), 
					(hillStartY + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * j))));
				hillSlice.push(new Point(((j + 1) * pixelStep + xOffset), 
					(hillStartY + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * (j + 1)))));
				hillSlice.push(new Point(((j + 1) * pixelStep + xOffset), 480));
				var shape:CustomShape = new CustomShape(hillSlice);
				shapes.push(shape);
			}
			hillStartY = hillStartY + randomHeight;
			return (hillStartY);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0;
				bodyBuilder.groupIndex = 0;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(shapes);
			body.SetUserData(this);
		}
		
		/*private function updateWorld():void {
			// getting cart x position
			if (currentBody.GetUserData() != null) {
				// adjusting stage position to keep cart in the vertical middle of the stage
				x = 320 - currentBody.GetPosition().x * worldScale;
				// checking if it's time to add a new hill
				if (x <= buildNextHillAt) {
					buildNextHillAt -= 640;
					nextHill = drawHill(10, -buildNextHillAt + 640, nextHill);
				}
			}
			if (currentBody.GetPosition().x * worldScale < (x * -1) - 640) {
				world.DestroyBody(currentBody);
			}
		}*/
	}
}