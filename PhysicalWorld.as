package {
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;
	import Box2D.Dynamics.Joints.b2Joint;
	import Box2D.Dynamics.Joints.b2JointDef;
	import flash.display.Sprite;
	
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
		private static var bodiesToRemove:Array = [];
		private static var jointsToRemove:Array = [];
		public static var actorsWhoNeedBody:Array = [];
		
		public static function setupDebugDraw():void {
			var boxSprite:Sprite = new Sprite();
			var artistForHire:b2DebugDraw = new b2DebugDraw();
			artistForHire.m_sprite = boxSprite;
			artistForHire.m_drawScale = RATIO;
			artistForHire.SetFlags(b2DebugDraw.e_shapeBit + b2DebugDraw.e_jointBit);
			artistForHire.m_lineThickness = 2.0;
			artistForHire.m_fillAlpha = 0.8;
			world.SetDebugDraw(artistForHire);
			CameraManager.camera.addChild(boxSprite);
		}
		
		public static function setupPhysicsWorld():void {
			var worldBounds:b2AABB = new b2AABB();
			worldBounds.lowerBound.Set(-5000 / RATIO, -50000 / RATIO);
			worldBounds.upperBound.Set(100000 / RATIO, 50000 / RATIO);
			
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
			if (world.GetBodyCount() > 500) {
				return null;
			}
			return world.CreateBody(bodyDef);
		}
		
		public static function DestroyJoint(joint:b2Joint):void {
			if (jointsToRemove.indexOf(joint) < 0) {
				jointsToRemove.push(joint);
			}
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
			for each (var joint:b2Joint in jointsToRemove) {
				world.DestroyJoint(joint);
			}
			jointsToRemove = [];
			for each (var removeMe:b2Body in bodiesToRemove) {
				if (removeMe) {	
					world.DestroyBody(removeMe);
				}
			}
			bodiesToRemove = [];
		}
	}
}