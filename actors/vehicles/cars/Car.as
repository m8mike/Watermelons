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
		private var shapeFrontWheel:CircleShape;
		private var shapeRearWheel:CircleShape;
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
			spawnOffset.x = width / 2 * PhysicalWorld.MIN_SQARE;
			spawnOffset.y = -height / 2 * PhysicalWorld.MIN_SQARE;
		}
		
		override public function update():void {
			super.update();
			if (enterable.inside) {
				control();
			}
		}
		
		override protected function createShapes():void {
			shape = new RectShape(width * PhysicalWorld.MIN_SQARE, height * PhysicalWorld.MIN_SQARE);
			shapeFrontWheel = new CircleShape(PhysicalWorld.MIN_SQARE);
			shapeRearWheel = new CircleShape(PhysicalWorld.MIN_SQARE);
			shapeAxle = new RectShape(PhysicalWorld.MIN_SQARE, PhysicalWorld.MIN_SQARE);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 1;
				bodyBuilder.friction = 1;
				bodyBuilder.restitution = 0.2;
				bodyBuilder.groupIndex = -1;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y + 3 * PhysicalWorld.MIN_SQARE;
			wheel1 = bodyBuilder.getBody(new Array(shapeRearWheel));
			wheel1.SetUserData(this);
			bodyBuilder.x = location.x + 3 * PhysicalWorld.MIN_SQARE;
			bodyBuilder.y = location.y + 3 * PhysicalWorld.MIN_SQARE;
			wheel2 = bodyBuilder.getBody(new Array(shapeFrontWheel));
			wheel2.SetUserData(this);
			bodyBuilder.x = location.x - 10;
			bodyBuilder.y = location.y + 3 * PhysicalWorld.MIN_SQARE - 10;
			axle1 = bodyBuilder.getBody(new Array(shapeAxle));
			axle1.SetUserData(this);
			bodyBuilder.x = location.x + 3 * PhysicalWorld.MIN_SQARE - 10;
			bodyBuilder.y = location.y + 3 * PhysicalWorld.MIN_SQARE - 10;
			axle2 = bodyBuilder.getBody(new Array(shapeAxle));
			axle2.SetUserData(this);
			wheel1RJ = Joints.createRevoluteJoint(wheel1, axle1);
			wheel2RJ = Joints.createRevoluteJoint(wheel2, axle2);
			axle1PJ = Joints.createPrismaticJoint(body, axle1);
			axle2PJ = Joints.createPrismaticJoint(body, axle2);
			body.AllowSleeping(false);
			wheel1.AllowSleeping(false);
			wheel2.AllowSleeping(false);
			axle1.AllowSleeping(false);
			axle2.AllowSleeping(false);
		}
		
		public function control():void {
			if (Controls.left) {
				body.SetAngularVelocity(-2);
			}
			if (Controls.right) {
				body.SetAngularVelocity(2);
			}
			if (!Controls.up && !Controls.down) {
				motorSpeed = 0;
				wheel1.SetAngularVelocity(0);
				wheel2.SetAngularVelocity(0);
				axle1.SetAngularVelocity(0);
				axle2.SetAngularVelocity(0);
				axle1PJ.SetMotorSpeed(0);
				axle2PJ.SetMotorSpeed(0);
				wheel1RJ.SetMotorSpeed(0);
				wheel2RJ.SetMotorSpeed(0);
			}
			if (!Controls.right && !Controls.left) {
				body.SetAngularVelocity(0);
			}
			if (Math.abs(motorSpeed) > 20) {
				return void;
			}
			if (Controls.up) {
				motorSpeed -= 0.5;
			}
			if (Controls.down) {
				motorSpeed += 0.5;
			}
			if (Controls.up || Controls.down) {
				applySpeed();
			}
		}
		
		private function applySpeed():void {
			wheelRJ.SetMotorSpeed(motorSpeed);
			axlePJ.SetMaxMotorForce(Math.abs(600 * axle1PJ.GetJointTranslation()));
			axlePJ.SetMotorSpeed((axle1PJ.GetMotorSpeed() - 2 * axle1PJ.GetJointTranslation()));
		}
	}
}