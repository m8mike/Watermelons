package {
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Car4 extends CarBuilder {
		
		public function Car4(x:Number, y:Number) {
			super(x, y, 2, 2);
			spawnOffset.x = width / 2 * PhysicalWorld.MIN_SQARE;
			spawnOffset.y = -height / 2 * PhysicalWorld.MIN_SQARE;
		}
		
		override protected function addWheels():void {
			var x:Number = location.x / PhysicalWorld.MIN_SQARE;
			var y:Number = location.y / PhysicalWorld.MIN_SQARE;
			wheels.push(new Wheel(x, y + 3, 1, this));
			wheels.push(new Wheel(x + 2, y + 3, 1, this));
			wheels.push(new Wheel(x, y - 1, 1, this));
			wheels.push(new Wheel(x + 2, y - 1, 1, this));
		}
	}
}