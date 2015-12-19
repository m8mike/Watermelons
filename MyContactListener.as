package {
	import Box2D.Collision.b2ContactPoint;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2ContactListener;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MyContactListener extends b2ContactListener {
		
		private function playerHitsCharacter(player:Player, character:Character, point:b2ContactPoint):void {
			var jumpToKill:Boolean;
			/*if (character is DummyCircle) {
				jumpToKill = point.normal.y > 0.7;
			} else {*/
				jumpToKill = point.normal.y < -0.7;
			//}
			if (jumpToKill) {
				player.jumpOnHead();
				if (character is Dummy) {
					Dummy(character).hit();
				}
			}
			if (character is Bomb) {
				Bomb(character).startTimer();
			}
			if (character is Bullet) {
				Bullet(character).hit(player.getBody());
			}
		}
		
		private function characterHitsPlatform(character:Character, platform:Platform, point:b2ContactPoint):void {
			var condition:Condition = character.condition;
			if (!condition.canJump) {
				condition.allowJumps(point.normal.x, point.normal.y);
			}
			if (platform is Gummy) {
				character.getBody().SetLinearVelocity(new b2Vec2(0, 0));
			}
		}
		
		private function playerHitsPlatform(player:Player, platform:Platform, point:b2ContactPoint):void {
			var condition:Condition = player.condition;
			if (platform is SpringBall) {
				SpringBall(platform).hit(player.getBody());
			} else if (platform is SpringBush) {
				SpringBush(platform).hit(player.getBody());
				return void;
			}
			if (!condition.canJump) {
				condition.allowJumps(point.normal.x, point.normal.y);
			}
			if (platform is Cloud) {
				if (player.getBody().GetLinearVelocity().y >= 0 && player.condition.canJump) {	
					player.getBody().m_linearDamping = 20;
				} else {
					player.getBody().m_linearDamping = 0;
				}
				player.condition.inCloud = true;
			} else if (platform is Spikes) {
				player.hit();
			} else if (platform is Sticky) {
				if (!Controls.up) {	
					player.getBody().SetLinearVelocity(new b2Vec2(0, player.getBody().GetLinearVelocity().y));
				}
				player.condition.onSticky = true;
			} else if (platform is Gummy) {
				if (!Controls.up) {
					player.getBody().SetLinearVelocity(new b2Vec2(0, 0));
				}
				player.condition.onSticky = true;
			}
		}
		
		private function collect(player:Player, collectible:Collectible):void {
			collectible.pick(player);
		}
		
		private function bulletHitSomething(bullet:Bullet, something:Actor):void {
			if (something is Character) {
				bullet.hit(Character(something).getBody());
			} else if (something is Platform) {
				bullet.hit(Platform(something).getBody());
			} else {
				bullet.hit(null);
			}
		}
		
		override public function Add(point:b2ContactPoint):void {
			addAndPersist(point);
			super.Add(point);
		}
		
		private function addAndPersist(point:b2ContactPoint):void {
			var actor1:Actor = point.shape1.GetBody().GetUserData();
			var actor2:Actor = point.shape2.GetBody().GetUserData();
			if (actor1 is Vehicle || actor2 is Vehicle) {
				return void;
			}
			if (actor1 is Bullet) {
				bulletHitSomething(Bullet(actor1), actor2);
			} else if (actor2 is Bullet) {
				bulletHitSomething(Bullet(actor2), actor1);
			} else if (actor1 is Player && actor2 is Platform) {
				playerHitsPlatform(Player(actor1), Platform(actor2), point);
			} else if (actor2 is Player && actor1 is Platform) {
				playerHitsPlatform(Player(actor2), Platform(actor1), point);
			} else if (actor1 is Player && actor2 is Character) {
				playerHitsCharacter(Player(actor1), Character(actor2), point);
			} else if (actor2 is Player && actor1 is Character) {
				playerHitsCharacter(Player(actor2), Character(actor1), point);
			} else if (actor1 is Player && actor2 is Collectible) {
				collect(Player(actor1), Collectible(actor2));
			} else if (actor2 is Player && actor1 is Collectible) {
				collect(Player(actor2), Collectible(actor1));
			} else if (actor1 is Character && actor2 is Platform) {
				characterHitsPlatform(Character(actor1), Platform(actor2), point);
			} else if (actor2 is Character && actor1 is Platform) {
				characterHitsPlatform(Character(actor2), Platform(actor1), point);
			}
		}
		
		override public function Persist(point:b2ContactPoint):void {
			addAndPersist(point);
			super.Persist(point);
		}
		
		private function playerRemovePlatform(player:Character, platform:Platform, point:b2ContactPoint):void {
			player.condition.disallowJumps();
			if (platform is Cloud) {
				player.condition.inCloud = false;
			} else if (platform is Sticky || platform is Gummy) {
				player.condition.onSticky = false;
			}
		}
		
		override public function Remove(point:b2ContactPoint):void {
			var actor1:Actor = point.shape1.GetBody().GetUserData();
			var actor2:Actor = point.shape2.GetBody().GetUserData();
			if (actor1 is Character && actor2 is Platform) {
				playerRemovePlatform(Character(actor1), Platform(actor2), point);
			} else if (actor2 is Character && actor1 is Platform) {
				playerRemovePlatform(Character(actor2), Platform(actor1), point);
			}
			super.Remove(point);
		}
	}
}