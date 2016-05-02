package {
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.Joints.b2PrismaticJoint;
	import Box2D.Dynamics.Joints.b2RevoluteJoint;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Wheel extends Actor {
		public var body:b2Body;
		private var bodyBuilder:StaticBodyBuilder;
		private var axle:b2Body;
		private var wheelRJ:b2RevoluteJoint;
		private var axlePJ:b2PrismaticJoint;
		
		public function Wheel(x:Number, y:Number, radius:Number, parent:Vehicle) {
			location = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			super(location);
			createCircle(new CircleShape(radius * PhysicalWorld.MIN_SQARE), parent);
		}
		
		public function createCircle(shape:CircleShape, userData:Vehicle):void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0.5;
				bodyBuilder.friction = 1;
				bodyBuilder.restitution = 0.6;
				bodyBuilder.groupIndex = -1;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(userData);
			//var shapeAxle:RectShape = new RectShape(shape.radius*PhysicalWorld.RATIO, shape.radius*PhysicalWorld.RATIO);
			var shapeAxle:CircleShape = new CircleShape(shape.radius*PhysicalWorld.RATIO/2);
			bodyBuilder.x = location.x - shapeAxle.radius / 2;
			/*bodyBuilder.x = location.x - shapeAxle.width / 2;
			bodyBuilder.y = location.y - shapeAxle.height / 2;*/
			axle = bodyBuilder.getBody(new Array(shapeAxle));
			axle.SetUserData(userData);
			wheelRJ = Joints.createRevoluteJoint(body, axle);
			axlePJ = Joints.createPrismaticJoint(userData.body, axle);
			body.AllowSleeping(false);
			axle.AllowSleeping(false);
		}
		
		public function stop():void {
			body.SetAngularVelocity(0);
			axle.SetAngularVelocity(0);
			axlePJ.SetMotorSpeed(0);
			wheelRJ.SetMotorSpeed(0);
		}
		
		public function applySpeed(motorSpeed:Number):void {
			wheelRJ.SetMotorSpeed(motorSpeed);
			axlePJ.SetMaxMotorForce(Math.abs(600 * axlePJ.GetJointTranslation()));
			axlePJ.SetMotorSpeed((axlePJ.GetMotorSpeed() - 2 * axlePJ.GetJointTranslation()));
		}
		
		override protected function removeBodies():void {
			//PhysicalWorld.DestroyJoint(wheelRJ);
			//PhysicalWorld.DestroyJoint(axlePJ);
			PhysicalWorld.safeRemoveBody(body);
			PhysicalWorld.safeRemoveBody(axle);
			super.removeBodies();
		}
	}
}