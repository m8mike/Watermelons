package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Shotgun extends Item {
		private var shot:Boolean = false;
		
		public var numBullets:int = 5;
		public var bulletRadius:int = 2;
		public var bulletSpeed:int = 20;
		public var bulletSpread:Number = 3;
		public var magazineCapacity:int = 7;
		public var reloadingTime:int = 20;
		
		private var bulletsInMagazine:int = 7;
		private var timeToReloadLeft:int = 0;
		
		public function Shotgun(player:Player) {
			super(player);
		}
		
		override public function update():void {
			if (!player.getBody()) return void;
			if (!Controls.useItem) {
				shot = false;
			} else if (Controls.useItem && !shot && bulletsInMagazine > 0) {
				shot = true;
				shoot();
				bulletsInMagazine--;
				if (bulletsInMagazine <= 0) {
					timeToReloadLeft = reloadingTime;
				}
			} else if (timeToReloadLeft > 0) {
				timeToReloadLeft--;
				if (timeToReloadLeft <= 0) {	
					bulletsInMagazine = magazineCapacity;
				}
			}
			super.update();
		}
		
		private function shoot():void {
			var condition:Condition = player.condition;
			var direction:int =  condition.directionRight?1: -1;
			if (Controls.left && !Controls.right) {
				direction = -1;
			} else if (Controls.right && !Controls.left) {
				direction = 1;
			}
			var loc2Spawn:b2Vec2 = player.getBody().GetWorldCenter().Copy();
			loc2Spawn.x += 1 * direction;
			loc2Spawn.Multiply(3 / 2);
			shotSingle(loc2Spawn, direction);
		}
		
		private function shotSingle(loc:b2Vec2, direction:int):void {
			for (var i:int = 0; i < numBullets; i++) {
				var loc2Spawn:b2Vec2 = loc.Copy();
				loc2Spawn.x += (4 * (i % 5) - 5) / 20 * direction;
				loc2Spawn.y += Math.random();
				var p:BulletImmediate = new BulletImmediate(loc2Spawn.x, loc2Spawn.y, bulletRadius);
				var impulse:Number = Math.random() * 0.1 * direction + 0.15 * direction;
				impulse *= bulletSpeed * bulletRadius * bulletRadius / 49;
				var spread:Number = bulletSpread * bulletRadius * bulletRadius / 49;
				p.applyImpulse(impulse, Math.random() * spread - spread / 2);
			}
		}
		
		private function shotMulti(loc:b2Vec2, direction:int, numBullets:int = 25):void {
			for (var i:int = 0; i < numBullets; i++) {
				var p:BulletImmediate = new BulletImmediate(loc.x + (4 - 5) / 20 * direction, loc.y, i % 2 + 2);
				p.applyImpulse(Math.random() * 0.1 * direction + 0.1 * direction + direction * 0.2 * (i % 2), (i % 5 - 3) * 0.02);
			}
		}
	}
}