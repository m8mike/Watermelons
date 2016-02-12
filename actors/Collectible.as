package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Collectible extends Actor {
		protected var body:b2Body;
		protected var shape:CircleShape;
		public var deleted:Boolean = false;
		
		public function Collectible(loc:Point) {
			Updatables.addCollectible(this);
			super(loc);
		}
		
		override public function update():void {
			if (!body && !deleted) {	
				createBodies();
			}
		}
		
		protected function init(myBody:b2Body):void {
			body = myBody;
			body.SetUserData(this);
		}
		
		public function createBodies():void {
			var bodyBuilder:StaticBodyBuilder = new StaticBodyBuilder();
			bodyBuilder.density = 0;
			bodyBuilder.friction = 0.2;
			bodyBuilder.restitution = 0.3;
			bodyBuilder.groupIndex = -2;
			bodyBuilder.isSensor = true;
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
		}
		
		public function show():void {
			if (!body) {
				createBodies();
				init(body);
			}
		}
		
		public function pick(player:Player):void {
			this.destroy();
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Updatables.removeCollectible(this);
			PhysicalWorld.safeRemoveBody(body);
			deleted = true;
			super.cleanUpBeforeRemoving();
		}
	}
}