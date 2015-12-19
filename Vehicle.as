package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Vehicle extends Platform {
		protected var enterable:Enterable;
		protected var player:Player;
		
		public function Vehicle(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			super(x, y, w, h);
			enterable = new Enterable();
		}
		
		override public function update():void {
			if (!player) {
				return void;
			}
			enterable.update(onExit);
			super.update();
		}
		
		protected function onEnter():void {
			Platformer.player.hide();
		}
		
		protected function onExit():void {
			var loc:Point = location.clone();
			loc.x += PhysicalWorld.MIN_SQARE / 2;
			loc.y += PhysicalWorld.MIN_SQARE / 2;
			player.spawn(loc);
			player = null;
		}
		
		public function hit(playerBody:b2Body):void {
			if (!playerBody) {
				return void;
			}
			if (playerBody.GetUserData() is Player) {
				enterable.hit(onEnter);
				player = playerBody.GetUserData();
			}
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.isSensor = true;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}