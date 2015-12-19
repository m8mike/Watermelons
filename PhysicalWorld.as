package {
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;
	import Box2D.Dynamics.Joints.b2DistanceJointDef;
	import Box2D.Dynamics.Joints.b2Joint;
	import Box2D.Dynamics.Joints.b2JointDef;
	import Box2D.Dynamics.Joints.b2PrismaticJoint;
	import Box2D.Dynamics.Joints.b2PrismaticJointDef;
	import Box2D.Dynamics.Joints.b2RevoluteJoint;
	import Box2D.Dynamics.Joints.b2RevoluteJointDef;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	/**
	* класс предназначен для управления физическим миром
	* @author Mad Mike
	*/
	public class PhysicalWorld {
		private static var world:b2World;
		private static const gravity:b2Vec2 = new b2Vec2(0.0, 10);
		
		public static const RATIO:Number = 30;
		public static const MIN_SQARE:int = 20;
		
		private static var fps:Number = 20.0;
		private static var boxSprite:Sprite;
		private static var bodiesToRemove:Array = [];
		public static var actorsWhoNeedBody:Array = [];
		
		public static function setupDebugDraw():void {
			boxSprite = new Sprite();
			var artistForHire:b2DebugDraw = new b2DebugDraw();
			artistForHire.m_sprite = boxSprite;
			artistForHire.m_drawScale = RATIO;
			artistForHire.SetFlags(b2DebugDraw.e_shapeBit);
			artistForHire.m_lineThickness = 2.0;
			artistForHire.m_fillAlpha = 0.8;
			world.SetDebugDraw(artistForHire);
			CameraManager.camera.addChild(boxSprite);
		}
		
		public static function setupPhysicsWorld():void {
			var worldBounds:b2AABB = new b2AABB();
			worldBounds.lowerBound.Set(-50000 / RATIO, -50000 / RATIO);
			worldBounds.upperBound.Set(50000 / RATIO, 50000 / RATIO);
			
			var allowSleep:Boolean = true;
			
			world = new b2World(worldBounds, gravity, allowSleep);
			world.SetContactListener(new MyContactListener());
		}
		
		public static function isStopped():Boolean {
			return (fps == Infinity);
		}
		
		public static function update():void {
			var iterations:int = 10;
			world.Step(1 / fps, iterations);
			reallyRemoveActors();
			giveActorsBodies();
		}
		
		private static function giveActorsBodies():void {
			for each (var actor:Character in actorsWhoNeedBody) {
				actor.initBody();
			}
			actorsWhoNeedBody = [];
		}
		
		public static function createBody(bodyDef:b2BodyDef):b2Body {
			return world.CreateBody(bodyDef);
		}
		
		public static function createPrismaticJoint(body1:b2Body, body2:b2Body):b2PrismaticJoint {
			var axlePrismaticJointDef:b2PrismaticJointDef = new b2PrismaticJointDef();
			axlePrismaticJointDef.lowerTranslation = -1;
			axlePrismaticJointDef.upperTranslation = 1;
			axlePrismaticJointDef.enableLimit = true;
			axlePrismaticJointDef.enableMotor = true;
			/*var axis:b2Vec2 =  new b2Vec2();
			axis.x = body1.GetWorldCenter().x - body2.GetWorldCenter().x;
			axis.y = body1.GetWorldCenter().y - body2.GetWorldCenter().y;*/
			axlePrismaticJointDef.Initialize(body1, body2, body2.GetWorldCenter(), new b2Vec2(0, -1));
			return b2PrismaticJoint(createJoint(axlePrismaticJointDef));
		}
		
		public static function createRevoluteJoint(body1:b2Body, body2:b2Body):b2RevoluteJoint {
			var jointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			jointDef.Initialize(body1, body2, body1.GetWorldCenter());
			jointDef.enableMotor = true;
			jointDef.maxMotorTorque = 10000;
			return b2RevoluteJoint(createJoint(jointDef));
		}
		
		public static function createDistanceJoint(body1:b2Body, body2:b2Body, length:Number = 20):b2Joint {
			var dJoint:b2DistanceJointDef = new b2DistanceJointDef();
			dJoint.Initialize(body1, body2, new b2Vec2(0, 0), new b2Vec2(0, 0));
			dJoint.length = length;
			//dJoint.dampingRatio = 0.5;
			dJoint.frequencyHz = 5;
			return createJoint(dJoint);
		}
		
		public static function createJoint(def:b2JointDef):b2Joint {
			return world.CreateJoint(def);
		}
		
		public static function safeRemoveBody(bodyToRemove:b2Body):void {
			if (bodiesToRemove.indexOf(bodyToRemove) < 0) {
				bodiesToRemove.push(bodyToRemove);
			}
		}
		
		private static function reallyRemoveActors():void {
			for each (var removeMe:b2Body in bodiesToRemove) {
				world.DestroyBody(removeMe);
			}
			bodiesToRemove = [];
		}
	}
}