package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* move from angle1 to angle2 and backwards
	* @author Mad Mike
	*/
	public class RotateControl extends Behavior {
		public var rotationSpeed:Number;
		private var currentAngle:Number;
		
		public function RotateControl(speed:Number, body:b2Body, currentAngle:Number = 0) {
			rotationSpeed = speed;
			this.currentAngle = currentAngle;
			super(body);
		}
		
		private function setAngle(angle:Number):void {
			body.SetXForm(body.GetPosition(), angle / 180 * Math.PI);
		}
		
		override public function update():void {
			if (Controls.left) {
				currentAngle -= rotationSpeed;
			} else if (Controls.right) {
				currentAngle += rotationSpeed;
			}
			setAngle(currentAngle);
			super.update();
		}
	}
}