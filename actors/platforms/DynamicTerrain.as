package {
	import Box2D.Common.Math.b2Vec2;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class DynamicTerrain extends Platform {
		// random hill's height
		public var randomHeight:Number;
		public var nextHill:Number = 140 + Math.random() * 200;
		protected var shapes:Array = [];
		
		public static const LOW:int = 50;
		public static const NORMAL:int = 100;
		public static const HIGH:int = 150;
		
		private var center:Point;
		private var costume:TerrainCostume;
		
		public function DynamicTerrain(x:Number, y:Number, next:Number = 0, maxHeight:int = 100) {
			super(x, y);
			randomHeight = Math.random() * maxHeight;
			nextHill = drawHill(20, 0, next);
			center = new Point(x * 20, y * 20 + nextHill);
		}
		
		protected function drawHill(pixelStep:int, xOffset:Number, yOffset:Number):Number {
			var hillStartY:Number = yOffset;
			var hillWidth:Number = 640;
			var hillSliceWidth:Number = hillWidth / pixelStep;
			var hillSlice:Array;
			if (xOffset != 0) {
				hillStartY -= randomHeight;
			}
			shapes = [];
			var costumeShape:Array = [];
			costumeShape.push(new Point(xOffset, hillStartY - randomHeight + randomHeight * Math.cos(0)));
			for (var j:int = 0; j < hillSliceWidth; j++) {
				costumeShape.push(new Point((j + 1) * pixelStep + xOffset, 
					hillStartY - randomHeight + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * (j + 1))));
				hillSlice = [];
				hillSlice.push(new Point((j * pixelStep + xOffset), 480 + yOffset));
				hillSlice.push(new Point((j * pixelStep + xOffset), 
					hillStartY - randomHeight + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * j)));
				hillSlice.push(new Point(((j + 1) * pixelStep + xOffset), 
					hillStartY - randomHeight + randomHeight * Math.cos(2 * Math.PI / hillSliceWidth * (j + 1))));
				hillSlice.push(new Point(((j + 1) * pixelStep + xOffset), 480 + yOffset));
				shapes.push(new CustomShape(hillSlice));
			}
			costumeShape.push(new Point(j * pixelStep + xOffset, 480 + yOffset));
			costumeShape.push(new Point(xOffset, 480 + yOffset));
			costume = new TerrainCostume(costumeShape, location.clone());
			return hillStartY;
		}
		
		override protected function cleanUpBeforeRemoving():void {
			super.cleanUpBeforeRemoving();
			if (costume) {	
				costume.remove();
			}
		}
		
		override public function getCenter():Point {
			return center.clone();
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