package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* move from angle1 to angle2 and backwards
	* @author Mad Mike
	*/
	public class RotateFixed extends Behavior {
		public var rotationSpeed:Number;
		public var angle1:Number;
		public var angle2:Number;
		private var currentAngle:Number = 0;
		private var direction:Boolean = true;
		
		public function RotateFixed(angle1:Number, angle2:Number, body:b2Body, speed:Number = 1, currentAngle:Number = 0) {
			rotationSpeed = speed;
			this.angle1 = angle1;
			this.angle2 = angle2;
			this.currentAngle = currentAngle;
			super(body);
		}
		
		private function setAngle(angle:Number):void {
			body.SetXForm(body.GetPosition(), angle / 180 * Math.PI);
		}
		
		override public function update():void {
			if (direction) {
				currentAngle += rotationSpeed;
			} else {
				currentAngle-= rotationSpeed;
			}
			if (currentAngle > angle2) {
				direction = false;
			} else if (currentAngle < angle1) {
				direction = true;
			}
			setAngle(currentAngle);
			super.update();
		}
	}
}