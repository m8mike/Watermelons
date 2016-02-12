package {
	import Box2D.Common.Math.b2Vec2;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Tank extends CarBuilder {
		
		public function Tank(x:Number, y:Number) {
			super(x, y, 3, 2);
			spawnOffset.x = width / 2 * PhysicalWorld.MIN_SQARE;
			spawnOffset.y = -height / 2 * PhysicalWorld.MIN_SQARE;
			jump.setForce(new b2Vec2(100.0, -250.0));
		}
		
		override protected function addWheels():void {
			var x:Number = location.x / PhysicalWorld.MIN_SQARE;
			var y:Number = location.y / PhysicalWorld.MIN_SQARE;
			wheels.push(new Wheel(x - 1, y + 2, 1, this));
			wheels.push(new Wheel(x, y + 3, 1, this));
			wheels.push(new Wheel(x + 1, y + 3, 1, this));
			wheels.push(new Wheel(x + 2, y + 3, 1, this));
			wheels.push(new Wheel(x + 3, y + 3, 1, this));
			wheels.push(new Wheel(x + 4, y + 2, 1, this));
		}
	}
}