package  {
	import Box2D.Dynamics.b2Body;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Checkpoint extends Boost {
		
		public function Checkpoint(x:Number, y:Number) {
			super(x, y, 3, 12);
		}
		
		override public function hit(bodyHit:b2Body):void {
			
		}
	}
}