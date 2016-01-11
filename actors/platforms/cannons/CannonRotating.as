package 
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CannonRotating extends CannonSuper {
		private var rotate:RotateX;
		public var control:RotateControl;
		private var speed:Number;
		
		public function CannonRotating(x:Number, y:Number, angle:Number, speed:Number) {
			super(x, y);
			setAngle(angle);
			this.speed = speed;
		}
		
		override protected function init(myBody:b2Body):void {
			super.init(myBody);
			rotate = new RotateX(speed, body, currentAngle);
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