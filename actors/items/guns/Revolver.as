package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Revolver extends Item {
		private var shot:Boolean = false;
		private var secondShot:Boolean = false;
		
		public var bulletRadius:int = 5;
		public var bulletSpeed:int = 10;
		public var bulletSpread:Number = 3;
		public var magazineCapacity:int = 6;
		public var reloadingTime:int = 10;
		public var numPistols:int = 2;
		
		private var bulletsInMagazine:int = 30;
		private var timeToReloadLeft:int = 0;
		private var lastImpulse:b2Vec2;
		
		public function Revolver(player:Player) {
			super(player);
		}
		
		override public function update():void {
			if (!player.getBody()) return void;
			if (shot && !secondShot) {
				secondShot = true;
				shoot();
			}
			if (!Controls.useItem) {
				shot = false;
			} else if (Controls.useItem && !shot && bulletsInMagazine > 0) {
				shot = true;
				secondShot = false;
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
			var loc2Spawn:b2Vec2 = loc.Copy();
			loc2Spawn.x -= direction / 20;
			var p:BulletSplitter = new BulletSplitter(loc2Spawn.x, loc2Spawn.y, bulletRadius);
			if (!secondShot) {
				var impulse:Number = (Math.random() * 0.1 + 0.15) * direction;
				impulse *= bulletSpeed * bulletRadius * bulletRadius / 49;
				var spread:Number = bulletSpread * bulletRadius * bulletRadius / 49;
				lastImpulse = new b2Vec2(impulse, Math.random() * spread - spread / 2);
			}
			p.applyImpulse(lastImpulse.x, lastImpulse.y);
		}
	}
}