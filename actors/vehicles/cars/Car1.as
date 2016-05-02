package {
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Car1 extends CarBuilder {
		private var shape1:RectShape;
		private var shape2:RectShape;
		
		public function Car1(x:Number, y:Number) {
			super(x, y, 3, 0.2);
			spawnOffset.x = width / 2 * PhysicalWorld.MIN_SQARE;
			spawnOffset.y = -height / 2 * PhysicalWorld.MIN_SQARE;
		}
		
		override protected function createShapes():void {
			shape = new RectShape(width * PhysicalWorld.MIN_SQARE, height * PhysicalWorld.MIN_SQARE);
			shape1 = new RectShape(0.2 * PhysicalWorld.MIN_SQARE, 2 * PhysicalWorld.MIN_SQARE);
			shape1.setLoc(0, -2);
			shape2 = new RectShape(0.2 * PhysicalWorld.MIN_SQARE, 2 * PhysicalWorld.MIN_SQARE);
			shape2.setLoc(3, -2);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 1;
				bodyBuilder.friction = 1;
				bodyBuilder.restitution = 0.2;
				bodyBuilder.groupIndex = -1;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape, shape1, shape2));
			body.SetUserData(this);
			body.AllowSleeping(false);
		}
		
		override protected function addWheels():void {
			var x:Number = location.x / PhysicalWorld.MIN_SQARE;
			var y:Number = location.y / PhysicalWorld.MIN_SQARE;
			wheels.push(new Wheel(x, y + 1, 1, this));
			wheels.push(new Wheel(x + 4, y + 1, 1, this));
		}
	}
}