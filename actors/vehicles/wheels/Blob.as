package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.Joints.b2DistanceJoint;
	import flash.geom.Point;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Blob extends Wheel {
		private var spheres:Array = [];
		private var numSpheres:int = 32;
		private var particleDistance:int = 40;
		private var centerRadius:Number = 15/20;
		private var sphereRadius:Number = 0.4;
		private var centralJoints:Array = [];
		
		public function Blob(x:Number, y:Number, radius:Number, parent:Vehicle) {
			centerRadius = radius;
			for (var i:int = 0; i < numSpheres; i++) {
				var angle:Number = (2 * Math.PI) / numSpheres * i;
				var posX:Number = particleDistance * Math.cos(angle) / PhysicalWorld.RATIO + x;
				var posY:Number = particleDistance * Math.sin(angle) / PhysicalWorld.RATIO + y;
				spheres.push(new SimpleCircle(posX, posY, sphereRadius, parent));
			}
			super(x, y, centerRadius, parent);
			for (i = 1; i < spheres.length; i++) {
				Joints.createDistanceJoint(spheres[i].body, spheres[i-1].body);
				centralJoints.push(Joints.createDistanceJoint(spheres[i].body, body));
			}
			Joints.createDistanceJoint(spheres[0].body, spheres[spheres.length - 1].body);
			centralJoints.push(Joints.createDistanceJoint(spheres[0].body, body));
		}
		
		override public function applySpeed(motorSpeed:Number):void {
			var bodyCenter:b2Vec2 = body.GetWorldCenter().Copy();
			var bodyCenterPoint:Point = new Point(bodyCenter.x, bodyCenter.y);
			for each (var sphere:SimpleCircle in spheres) {
				var sphereCenter:b2Vec2 = sphere.body.GetWorldCenter().Copy(); 
				var sphereCenterPoint:Point = new Point(sphereCenter.x, sphereCenter.y);
				var dist:Number = Point.distance(bodyCenterPoint, sphereCenterPoint);
				sphere.body.ApplyTorque(motorSpeed*30);
			}
			super.applySpeed(motorSpeed);
		}
		/*
		private var blobX:Number=320;
		private var blobY:Number=240;
		private var particleNumber:Number=16;
		private var particleDistance:Number=50;
		public function Main() {
			sphereVector=new Vector.<b2Body>();
			sphereVector.push(sphere(blobX,blobY,15));
			for (var i:Number=0; i<particleNumber; i++) {
				var angle:Number=(2*Math.PI)/particleNumber*i;
				var posX:Number=blobX+particleDistance*Math.cos(angle);
				var posY:Number=blobY+particleDistance*Math.sin(angle);
				sphereVector.push(sphere(posX,posY,2));
				var dJoint:b2DistanceJointDef=new b2DistanceJointDef();
				dJoint.bodyA=sphereVector[0];
				dJoint.bodyB=sphereVector[sphereVector.length-1];
				dJoint.localAnchorA=new b2Vec2(0,0);
				dJoint.localAnchorB=new b2Vec2(0,0);
				dJoint.length=particleDistance/worldScale;
				dJoint.dampingRatio=0.5;
				dJoint.frequencyHz=5;
				var distanceJoint:b2DistanceJoint;
				distanceJoint=world.CreateJoint(dJoint) as b2DistanceJoint;
				if (i>0) {
					var distanceX:Number=posX/worldScale-sphereVector[sphereVector.length-2].GetPosition().x;
					var distanceY:Number=posY/worldScale-sphereVector[sphereVector.length-2].GetPosition().y;
					var distance:Number=Math.sqrt(distanceX*distanceX+distanceY*distanceY);
					dJoint.bodyA=sphereVector[sphereVector.length-2];
					dJoint.bodyB=sphereVector[sphereVector.length-1];
					dJoint.localAnchorA=new b2Vec2(0,0);
					dJoint.localAnchorB=new b2Vec2(0,0);
					dJoint.length=distance;
					distanceJoint=world.CreateJoint(dJoint) as b2DistanceJoint;
				}
				if (i==particleNumber-1) {
					distanceX=posX/worldScale-sphereVector[1].GetPosition().x;
					distanceY=posY/worldScale-sphereVector[1].GetPosition().y;
					distance=Math.sqrt(distanceX*distanceX+distanceY*distanceY);
					dJoint.bodyA=sphereVector[1];
					dJoint.bodyB=sphereVector[sphereVector.length-1];
					dJoint.localAnchorA=new b2Vec2(0,0);
					dJoint.localAnchorB=new b2Vec2(0,0);
					dJoint.length=distance;
					distanceJoint=world.CreateJoint(dJoint) as b2DistanceJoint;
				}
			}
		}
		private function createSphere(pX:int,pY:int,r:Number):b2Body {
			var bodyDef:b2BodyDef=new b2BodyDef();
			bodyDef.position.Set(pX/worldScale,pY/worldScale);
			bodyDef.type=b2Body.b2_dynamicBody;
			var circleShape:b2CircleShape;
			circleShape=new b2CircleShape(r/worldScale);
			var fixtureDef:b2FixtureDef=new b2FixtureDef();
			var theSphere:b2Body=world.CreateBody(bodyDef);
			theSphere.CreateFixture(fixtureDef);
			return theSphere;
		}*/
	}
}