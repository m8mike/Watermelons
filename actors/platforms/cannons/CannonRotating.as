package 
{
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CannonRotating extends CannonSuper {
		private var rotate:RotateX;
		public var control:RotateControl;
		
		public function CannonRotating(x:Number, y:Number, angle:Number, speed:Number) {
			super(x, y);
			setAngle(angle);
			rotate = new RotateX(speed, body, angle);
		}
		
		override public function update():void {
			if (control) {
				control.update();
			} else {
				rotate.update();
			}
			super.update();
		}
	}
}