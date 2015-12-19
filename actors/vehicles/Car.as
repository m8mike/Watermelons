package {
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.Joints.b2DistanceJointDef;
	import Box2D.Dynamics.Joints.b2PrismaticJoint;
	import Box2D.Dynamics.Joints.b2RevoluteJoint;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Car extends Vehicle {
		private var wheel1:b2Body;
		private var wheel2:b2Body;
		private var shapeWheel:CircleShape;
		private var axle1:b2Body;
		private var axle2:b2Body;
		private var shapeAxle:RectShape;
		private var motorSpeed:Number = 0;
		private var wheel1RJ:b2RevoluteJoint;
		private var wheel2RJ:b2RevoluteJoint;
		private var axle1PJ:b2PrismaticJoint;
		private var axle2PJ:b2PrismaticJoint;
		
		
		public function Car(x:Number, y:Number) {
			super(x, y, 3, 2);
		}
		
		override public function update():void {
			super.update();
			if (enterable.inside) {
				control();
			}
		}
		
		override protected function createShapes():void {
			shape = new RectShape(width * PhysicalWorld.MIN_SQARE, height * PhysicalWorld.MIN_SQARE);
			shapeWheel = new CircleShape(PhysicalWorld.MIN_SQARE);
			shapeAxle = new RectShape(PhysicalWorld.MIN_SQARE, PhysicalWorld.MIN_SQARE);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0.7;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0;
				bodyBuilder.groupIndex = -1;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y + 3 * PhysicalWorld.MIN_SQARE;
			wheel1 = bodyBuilder.getBody(new Array(shapeWheel));
			wheel1.SetUserData(this);
			bodyBuilder.x = location.x + 3 * PhysicalWorld.MIN_SQARE;
			bodyBuilder.y = location.y + 3 * PhysicalWorld.MIN_SQARE;
			wheel2 = bodyBuilder.getBody(new Array(shapeWheel));
			wheel2.SetUserData(this);
			bodyBuilder.x = location.x - 10;
			bodyBuilder.y = location.y + 3 * PhysicalWorld.MIN_SQARE - 10;
			axle1 = bodyBuilder.getBody(new Array(shapeAxle));
			axle1.SetUserData(this);
			bodyBuilder.x = location.x + 3 * PhysicalWorld.MIN_SQARE - 10;
			bodyBuilder.y = location.y + 3 * PhysicalWorld.MIN_SQARE - 10;
			axle2 = bodyBuilder.getBody(new Array(shapeAxle));
			axle2.SetUserData(this);
			wheel1RJ = PhysicalWorld.createRevoluteJoint(wheel1, axle1);
			wheel2RJ = PhysicalWorld.createRevoluteJoint(wheel2, axle2);
			axle1PJ = PhysicalWorld.createPrismaticJoint(body, axle1);
			axle2PJ = PhysicalWorld.createPrismaticJoint(body, axle2);
		}
		
		private function control():void {
			if (Math.abs(motorSpeed) > 20) {
				return void;
			}
			if (Controls.left) {
				motorSpeed += 0.3;
			}
			if (Controls.right) {
				motorSpeed -= 0.3;
			}
			if (!Controls.right && !Controls.left) {
				motorSpeed *= 0.999;
			}
			wheel1RJ.SetMotorSpeed(motorSpeed);
			wheel2RJ.SetMotorSpeed(motorSpeed);
			axle1PJ.SetMaxMotorForce(Math.abs(600 * axle1PJ.GetJointTranslation()));
			axle1PJ.SetMotorSpeed((axle1PJ.GetMotorSpeed() - 2 * axle1PJ.GetJointTranslation()));
			axle2PJ.SetMaxMotorForce(Math.abs(600 * axle2PJ.GetJointTranslation()));
			axle2PJ.SetMotorSpeed((axle2PJ.GetMotorSpeed() - 2 * axle2PJ.GetJointTranslation()));
		}
	}
}