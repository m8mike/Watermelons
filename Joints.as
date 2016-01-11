package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.Joints.b2DistanceJointDef;
	import Box2D.Dynamics.Joints.b2Joint;
	import Box2D.Dynamics.Joints.b2PrismaticJoint;
	import Box2D.Dynamics.Joints.b2PrismaticJointDef;
	import Box2D.Dynamics.Joints.b2RevoluteJoint;
	import Box2D.Dynamics.Joints.b2RevoluteJointDef;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Joints {
		
		public static function createPrismaticJoint(body1:b2Body, body2:b2Body):b2PrismaticJoint {
			var axlePrismaticJointDef:b2PrismaticJointDef = new b2PrismaticJointDef();
			axlePrismaticJointDef.lowerTranslation = -0.05;
			axlePrismaticJointDef.upperTranslation = 0.05;
			axlePrismaticJointDef.enableLimit = true;
			axlePrismaticJointDef.enableMotor = true;
			axlePrismaticJointDef.collideConnected = false;
			//axlePrismaticJointDef.
			/*var axis:b2Vec2 =  new b2Vec2();
			axis.x = body1.GetWorldCenter().x - body2.GetWorldCenter().x;
			axis.y = body1.GetWorldCenter().y - body2.GetWorldCenter().y;*/
			var anchor:b2Vec2 = body2.GetWorldCenter().Copy();
			axlePrismaticJointDef.Initialize(body1, body2, anchor, new b2Vec2(0, -0.5));
			return b2PrismaticJoint(PhysicalWorld.createJoint(axlePrismaticJointDef));
		}
		
		public static function createRevoluteJoint(body1:b2Body, body2:b2Body):b2RevoluteJoint {
			var jointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			jointDef.Initialize(body1, body2, body1.GetWorldCenter());
			jointDef.enableMotor = true;
			jointDef.maxMotorTorque = 10000;
			jointDef.collideConnected = false;
			return b2RevoluteJoint(PhysicalWorld.createJoint(jointDef));
		}
		
		public static function createDistanceJoint(body1:b2Body, body2:b2Body, length:Number = 3):b2Joint {
			var dJoint:b2DistanceJointDef = new b2DistanceJointDef();
			dJoint.Initialize(body1, body2, body1.GetWorldCenter(), body2.GetWorldCenter());
			var v1:b2Vec2 = body1.GetWorldCenter().Copy();
			var v2:b2Vec2 = body2.GetWorldCenter().Copy();
			var p1:Point = new Point(v1.x, v1.y);
			var p2:Point = new Point(v2.x, v2.y);
			var distance:Number = Point.distance(p1, p2);
			dJoint.length = distance * 2;
			dJoint.dampingRatio = 1;
			dJoint.frequencyHz = 5;
			dJoint.collideConnected = false;
			return PhysicalWorld.createJoint(dJoint);
		}
	}
}