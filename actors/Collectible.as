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
		
		public function Collectible(loc:Point) {
			Updatables.addCollectible(this);
			super(loc);
			createBodies();
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
			body.SetUserData(this);
		}
		
		public function pick(player:Player):void {
			this.destroy();
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Updatables.removeCollectible(this);
			PhysicalWorld.safeRemoveBody(body);
			super.cleanUpBeforeRemoving();
		}
	}
}