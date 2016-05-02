package  {
	import Box2D.Dynamics.b2Body;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class EndLevel extends Boost {
		public var hittedEnd:Boolean = false;
		
		public function EndLevel(x:Number, y:Number) {
			super(x, y, 30, 30);
		}
		
		override public function hit(bodyHit:b2Body):void {
			if (!hittedEnd) {
				hittedEnd = true;
				MyTimer.stop();
				PhysicalWorld.pause();
				Platformer.menuManager.pause();
			}
		}
	}
}