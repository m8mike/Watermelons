package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class CarBuilder extends Vehicle {
		private var motorSpeed:Number = 0;
		public var wheels:Array = [];
		
		public var maxSpeed:Number = 30//min 10 max 30
		public var acceleration:Number = 1;// min 0.1 max 1.0
		public var rotationSpeed:Number = 7;//min 2 max 7
		//protected var jumpForce:Number = 10;// max 100.0, -250.0
		protected var nitroSpeed:Number = 30;
		protected var nitro:int = 100;
		protected var maxNitro:int = 100;
		protected var maxJumps:int = 10;
		
		public function CarBuilder(x:Number, y:Number, w:Number = 3, h:Number = 2) {
			super(x, y, w, h);
			spawnOffset.x = width / 2 * PhysicalWorld.MIN_SQARE;
			spawnOffset.y = -height / 2 * PhysicalWorld.MIN_SQARE;
			//addWheels();
		}
		
		override protected function init(myBody:b2Body):void {
			super.init(myBody);
			addWheels();
		}
		
		protected function addWheels():void {
			var x:Number = location.x / PhysicalWorld.MIN_SQARE;
			var y:Number = location.y / PhysicalWorld.MIN_SQARE;
			wheels.push(new Blob(x - 2, y + 4, 1, this));
			wheels.push(new Blob(x, y + 4, 1, this));
			wheels.push(new Blob(x + 2, y + 4, 1, this));
			wheels.push(new Blob(x + 4, y + 4, 1, this));
		}
		
		override public function update():void {
			if (!body) {
				return void;
			}
			super.update();
			if (enterable.inside) {
				//autoPilot();
				control();
			}
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0.5;
				bodyBuilder.friction = 1;
				bodyBuilder.restitution = 0.2;
				bodyBuilder.groupIndex = -1;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
			body.AllowSleeping(false);
		}
		
		public function autoPilot():void {
			if (body.GetAngle() > 0) {
				body.SetAngularVelocity(-2);
			} else if (body.GetAngle() < 0) {
				body.SetAngularVelocity(2);
			}
			if (Math.abs(motorSpeed) < maxSpeed) {
				motorSpeed -= acceleration;
			}
			/*if (Controls.up && onGround) {
				body.ApplyImpulse(new b2Vec2(0, -20), body.GetWorldCenter().Copy());
			}*/
			if (Controls.up) {
				jump.jump();
			}
			if (Controls.right && nitro > 0) {
				var angle:Number = body.GetAngle();
				body.ApplyForce(new b2Vec2(nitroSpeed * Math.cos(angle), 
										   nitroSpeed * Math.sin(angle)), 
										  body.GetWorldCenter().Copy());
				nitro--;
			}
			if (!Controls.right && nitro<100) {
				nitro++;
			}
			jump.update();
			applySpeed();
		}
		
		override protected function removeBodies():void {
			for each (var wheel:Wheel in wheels) {
				wheel.destroy();
			}
			wheels = [];
			super.removeBodies();
		}
		
		public function control():void {
			if (Controls.left) {
				body.SetAngularVelocity(-rotationSpeed);
			}
			if (Controls.right) {
				body.SetAngularVelocity(rotationSpeed);
			}
			if (!Controls.up && !Controls.down) {
				motorSpeed = 0;
				for each (var wheel:Wheel in wheels) {
					wheel.stop();
				}
			}
			if (!Controls.right && !Controls.left) {
				body.SetAngularVelocity(0);
			}
			if (Controls.vehicleJump) {
				jump.jump();
			}
			/*if (Controls.vehicleJump) {
				jump.jump();
			} else {
				jump.dontJump();
			}*/
			if (Math.abs(motorSpeed) > maxSpeed) {
				return void;
			}
			if (Controls.up) {
				motorSpeed -= acceleration;
			}
			if (Controls.down) {
				motorSpeed += acceleration;
			}
			if (Controls.up || Controls.down) {
				applySpeed();
			}
		}
		
		private function applySpeed():void {
			for each (var wheel:Wheel in wheels) {
				wheel.applySpeed(motorSpeed);
			}
		}
	}
}