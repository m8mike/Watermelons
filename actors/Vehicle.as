package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Vehicle extends Actor {
		public var body:b2Body;
		public var shape:MyShape;
		public var bodyBuilder:BodyBuilder;
		public var width:Number;
		public var height:Number;
		public var enterable:Enterable = new Enterable();
		protected var player:Player;
		protected var spawnOffset:Point = new Point();
		public var condition:Condition = new Condition();
		public var jump:Jump;
		public var lastAngle:Number = 0;
		
		public function Vehicle(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			var loc:Point = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			width = w;
			height = h;
			super(loc);
			Updatables.addVehicle(this);
			createShapes();
			createBodies();
			init(body);
			jump = new Jump(condition, body);
			jump.setImpulse(new b2Vec2(0, -30));
		}
		
		protected function init(myBody:b2Body):void {
			body = myBody;
			body.SetUserData(this);
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
			Platformer.player.vehicle = this;
		}
		
		protected function onExit():void {
			var loc:Point = getLoc().clone();
			loc.x += spawnOffset.x;
			loc.y += spawnOffset.y;
			player.spawn(loc);
			player.vehicle = null;
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
		
		public function getBody():b2Body {
			return body;
		}
		
		public function getLoc():Point {
			if (!getBody()) {
				return null;
			}
			var loc:Point = new Point();
			loc.x = getBody().GetWorldCenter().x * 30 + spawnOffset.x;
			loc.y = getBody().GetWorldCenter().y * 30 + spawnOffset.y;
			return loc;
		}
		
		public function respawn():void {
			hide();
			location = Platformer.locToSpawn.clone();
		}
		
		public function show():void {
			if (!body) {
				createBodies();
				init(body);
				jump.changeBody(body);
			}
		}
		
		public function hitPlatform():void {
			if (!body) {
				return void;
			}
			var currentAngle:Number = body.GetAngle() / Math.PI * 180;
			if (Math.abs(currentAngle-lastAngle) % 360 > 150 || Math.abs(currentAngle - lastAngle) / 360 >= 1) {
				trace(int(Math.abs(currentAngle - lastAngle) / 360));
			}
			lastAngle = currentAngle;
		}
		
		protected function createShapes():void {
			shape = new RectShape(width * PhysicalWorld.MIN_SQARE, height * PhysicalWorld.MIN_SQARE);
		}
		
		protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.isSensor = true;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
		
		override protected function removeBodies():void {
			PhysicalWorld.safeRemoveBody(body);
			body = null;
			super.removeBodies();
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Updatables.removeVehicle(this);
			super.cleanUpBeforeRemoving();
		}
	}
}