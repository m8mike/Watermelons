package {
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Car2 extends CarBuilder {
		
		public function Car2(x:Number, y:Number) {
			super(x, y, 3, 2);
			spawnOffset.x = width / 2 * PhysicalWorld.MIN_SQARE;
			spawnOffset.y = -height / 2 * PhysicalWorld.MIN_SQARE;
		}
		
		override protected function addWheels():void {
			var x:Number = location.x / PhysicalWorld.MIN_SQARE;
			var y:Number = location.y / PhysicalWorld.MIN_SQARE;
			wheels.push(new Wheel(x, y + 4, 1, this));
			wheels.push(new Wheel(x + 3, y + 4, 1, this));
		}
	}
}