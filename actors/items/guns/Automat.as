package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Automat extends Item {
		private var shotTimeOffset:int = 2;
		private var angleOffset:Number = 0;
		
		public var bulletRadius:int = 5;
		public var bulletSpeed:int = 10;
		public var bulletSpread:Number = 3;
		public var magazineCapacity:int = 30;
		public var reloadingTime:int = 50;
		
		private var bulletsInMagazine:int = 30;
		private var timeToReloadLeft:int = 0;
		
		public function Automat(player:Player) {
			super(player);
		}
		
		override public function update():void {
			if (!player.getBody()) return void;
			if (Controls.useItem && shotTimeOffset <= 0 && bulletsInMagazine > 0) {
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
			if (shotTimeOffset > 0) {
				shotTimeOffset--;
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
			shotTimeOffset = 2;
		}
		
		private function shotSingle(loc:b2Vec2, direction:int, numBullets:int = 25):void {
			var loc2Spawn:b2Vec2 = loc.Copy();
			loc2Spawn.x -= direction / 20;
			var p:BulletImmediate = new BulletImmediate(loc2Spawn.x, loc2Spawn.y, bulletRadius);
			var impulse:Number = (Math.random() * 0.1 + 0.15) * direction;
			impulse *= bulletSpeed * bulletRadius * bulletRadius / 49;
			var spread:Number = bulletSpread * bulletRadius * bulletRadius / 49;
			p.applyImpulse(impulse, Math.random() * spread - spread / 2);
		}
	}
}