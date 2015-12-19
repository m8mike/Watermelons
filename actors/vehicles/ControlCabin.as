package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ControlCabin extends Vehicle {
		private var cannon:CannonRotating;
		private var control:RotateControl;
		
		public function ControlCabin(cannon:CannonRotating, x:Number, y:Number) {
			this.cannon = cannon;
			super(x, y, 1, 1);
			control = new RotateControl(2, cannon.getBody());
		}
		
		override public function update():void {
			if (enterable.inside) {
				control.update();
			}
			super.update();
		}
		
		override protected function onEnter():void {
			super.onEnter();
			cannon.control = control;
		}
		
		override protected function onExit():void {
			super.onExit();
			cannon.control = null;
		}
	}
}