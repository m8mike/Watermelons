package {
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class JumpBoost extends Boost {
		
		public function JumpBoost(x:Number, y:Number) {
			super(x, y);
		}
		
		override public function hit(bodyHit:b2Body):void {
			var vehicle:Vehicle = bodyHit.GetUserData();
			vehicle.jump.jump();
		}
	}
}