package {
	
	/**
	 * ...
	 * @author ...
	 */
	public class TopHatEnd extends Platform {
		private var shape2:RectShape;
		private var shape3:RectShape;
		
		public function TopHatEnd(x:Number, y:Number) {
			super(x, y, 1, 1);
		}
		
		override protected function createShapes():void {
			shape = new RectShape(0.5 * PhysicalWorld.MIN_SQARE, 3.4 * PhysicalWorld.MIN_SQARE);
			shape.setLoc(-2, -3.4);
			shape2 = new RectShape(0.7 * PhysicalWorld.MIN_SQARE, 3.4 * PhysicalWorld.MIN_SQARE);
			shape2.setLoc(1.3, -3.4);
			shape3 = new RectShape(2.8 * PhysicalWorld.MIN_SQARE, 0.5 * PhysicalWorld.MIN_SQARE);
			shape3.setLoc(-1.5, -0.5);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0.3;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape, shape2, shape3));
			body.SetUserData(this);
		}
	}
}