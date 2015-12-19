package {
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Rotate extends Behavior {
		public var rotationSpeed:Number;
		
		public function Rotate(speed:Number, body:b2Body) {
			rotationSpeed = speed;
			super(body);
		}
		
		override public function update():void {
			body.SetAngularVelocity(rotationSpeed);
			super.update();
		}
	}
}