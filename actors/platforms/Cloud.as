package {
	
	/**
	 * ...
	 * @author ...
	 */
	public class Cloud extends Platform {
		
		public function Cloud(x:Number, y:Number) {
			super(x, y, 5, 1);
		}
		
		override protected function createShapes():void {
			shape = new RectShape(5 * PhysicalWorld.MIN_SQARE, 1 * PhysicalWorld.MIN_SQARE);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {	
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0.7;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.isSensor = true;
			body = bodyBuilder.getBody(new Array(shape));
		}
	}
}