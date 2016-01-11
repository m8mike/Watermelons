package {
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Car1 extends CarBuilder {
		
		public function Car1(x:Number, y:Number) {
			super(x, y, 3, 2);
			spawnOffset.x = width / 2 * PhysicalWorld.MIN_SQARE;
			spawnOffset.y = -height / 2 * PhysicalWorld.MIN_SQARE;
		}
		
		override protected function addWheels():void {
			var x:Number = location.x / PhysicalWorld.MIN_SQARE;
			var y:Number = location.y / PhysicalWorld.MIN_SQARE;
			wheels.push(new Wheel(x - 1, y + 1, 2, this));
			wheels.push(new Wheel(x + 4, y + 1, 2, this));
		}
	}
}