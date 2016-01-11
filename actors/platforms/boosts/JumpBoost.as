package {
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class JumpBoost extends Boost {
		
		public function JumpBoost(x:Number, y:Number) {
			super(x, y);
		}
		
		override public function hit(vehicle:Vehicle):void {
			vehicle.jump.jump();
		}
	}
}