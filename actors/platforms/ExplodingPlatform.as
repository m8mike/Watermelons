package  {
	import Box2D.Dynamics.b2Body;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ExplodingPlatform extends Platform {
		private var removingTimer:RemovingTimer;
		
		public function ExplodingPlatform(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			super(x, y, w, h);
			removingTimer = new RemovingTimer(this, 5);
		}
		
		public function restart():void {
			if (!body) {
				Updatables.addPlatform(this);
				removingTimer.deactivate();
			}
		}
		
		override public function hit(bodyHit:b2Body):void {
			removingTimer.activate();
		}
		
		override public function update():void {
			removingTimer.update();
			super.update();
		}
	}
}