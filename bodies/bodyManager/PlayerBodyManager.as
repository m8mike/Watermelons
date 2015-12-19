package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class PlayerBodyManager extends BodyManager {
		private var parent:Player;
		private var bodyBuilder:DynamicBodyBuilder;
		public var jump:Jump;
		
		public var jumpThrough:JumpThrough;
		
		public static const BALL_DIAMETER:int = 20;
		
		public function PlayerBodyManager(location:Point, player:Player) {
			parent = player;
			shape = new CircleShape(BALL_DIAMETER / 2);
			bodyBuilder = new DynamicBodyBuilder();
			bodyBuilder.density = 0.5;
			bodyBuilder.friction = 0.3;
			bodyBuilder.restitution = 0.3;
			bodyBuilder.groupIndex = -3;
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.linearDamping = 0;
			bodyBuilder.angularDamping = 1;
			initBody(location);
			jump = new Jump(parent.condition, body);
		}
		
		public function initBody(spawnPoint:Point, vel:b2Vec2 = null):void {
			bodyBuilder.x = spawnPoint.x;
			bodyBuilder.y = spawnPoint.y;
			body = bodyBuilder.getBody(new Array(shape));
			if (!body) {
				trace("can't create body");
			}
			body.SetUserData(parent);
			if (vel) {
				body.ApplyImpulse(vel, body.GetWorldCenter());
			}
		}
		
		override public function update():void {
			handleControls();
			parent.condition.update(body);
			jump.update();
			super.update();
		}
		
		private function handleControls():void {
			if (removed) {
				return void;
			}
			var canJump:Boolean = parent.condition.canJump;
			if (Controls.left) {
				if (body.GetLinearVelocity().x > -7.0) {
					body.ApplyForce(new b2Vec2(-2.0, 0.0), body.GetWorldCenter());
				}
			}
			if (Controls.right) {
				if (body.GetLinearVelocity().x < 7.0) {
					body.ApplyForce(new b2Vec2(2.0, 0.0), body.GetWorldCenter());
				}
			}
			if (Controls.down) {
				if (!canJump) {
					if (parent.currentItem is Deltaplan) {
						if (Deltaplan(parent.currentItem).opened) {
							var bombLoc:Point = new Point();
							bombLoc.x = parent.getSpriteLoc().x / PhysicalWorld.MIN_SQARE + 0.5;
							bombLoc.y = parent.getSpriteLoc().y / PhysicalWorld.MIN_SQARE;
							new Bomb(bombLoc.x, bombLoc.y);
						}
					} else {
						body.ApplyImpulse(new b2Vec2(0.0, 0.15), body.GetWorldCenter());
					}
				}
			} else if (Controls.up) {
				jump.jump();
			} else {
				jump.dontJump();
				if (!parent.condition.onSticky) {
					jump.wallJumps();
				}
			}
			var notPressedAnyButton:Boolean = !Controls.up && !Controls.left && !Controls.right && !Controls.down;
			var speedIsSmall:Boolean = (body.GetLinearVelocity().x < 4) && (body.GetLinearVelocity().x > -4);
			var speedIsAverage:Boolean = (body.GetLinearVelocity().x < 9) && (body.GetLinearVelocity().x > -9);
			if (notPressedAnyButton && canJump) {
				if (speedIsSmall) {
					body.PutToSleep();
				}
			}
		}
	}
}