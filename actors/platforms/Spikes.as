package {
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Spikes extends Platform {
		
		public function Spikes(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			super(x, y, w, h);
		}
		
		override public function hit(bodyHit:b2Body):void {
			Platformer.vehicleManager.respawn();
		}
	}
}