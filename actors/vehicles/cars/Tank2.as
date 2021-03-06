package {
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Tank2 extends CarBuilder {
		
		public function Tank2(x:Number, y:Number) {
			super(x, y, 3, 2);
			spawnOffset.x = width / 2 * PhysicalWorld.MIN_SQARE;
			spawnOffset.y = -height / 2 * PhysicalWorld.MIN_SQARE;
		}
		
		override protected function addWheels():void {
			var x:Number = location.x / PhysicalWorld.MIN_SQARE;
			var y:Number = location.y / PhysicalWorld.MIN_SQARE;
			wheels.push(new Wheel(x - 1, y + 2, 0.5, this));
			wheels.push(new Wheel(x - 0.5, y + 2.5, 0.5, this));
			wheels.push(new Wheel(x, y + 3, 0.7, this));
			wheels.push(new Wheel(x + 0.5, y + 3, 0.7, this));
			wheels.push(new Wheel(x + 1, y + 3, 0.7, this));
			wheels.push(new Wheel(x + 1.5, y + 3, 0.7, this));
			wheels.push(new Wheel(x + 2, y + 3, 0.7, this));
			wheels.push(new Wheel(x + 2.5, y + 3, 0.7, this));
			wheels.push(new Wheel(x + 3, y + 3, 0.7, this));
			wheels.push(new Wheel(x + 3.5, y + 2.5, 0.5, this));
			wheels.push(new Wheel(x + 4, y + 2, 0.5, this));
		}
	}
}