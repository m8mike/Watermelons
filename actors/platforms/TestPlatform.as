package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.Joints.b2PrismaticJoint;
	import Box2D.Dynamics.Joints.b2PrismaticJointDef;
	
	/**
	 * unfinished
	 * @author ...
	 */
	public class TestPlatform extends Platform {
		
		public function TestPlatform(body1:b2Body, x:Number, y:Number, w:Number = 1, h:Number = 1) {
			super(x, y, w, h);
			createJoint(body1);
		}
		
		private function createJoint(body1:b2Body):void {
			var jointDef:b2PrismaticJointDef = new b2PrismaticJointDef();
			jointDef.body1 = body1;
			jointDef.body2 = body;
			//jointDef.enableLimit = true;
			jointDef.localAnchor1 = new b2Vec2(0, -5);
			jointDef.localAnchor2 = new b2Vec2(0, 1);
			jointDef.localAxis1 = new b2Vec2(0, -10);
			PhysicalWorld.createJoint(jointDef);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new DynamicBodyBuilder();
				DynamicBodyBuilder(bodyBuilder).groupIndex = -2;
				bodyBuilder.density = 1;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = DynamicBodyBuilder(bodyBuilder).getBody(new Array(shape));
		}
	}
}