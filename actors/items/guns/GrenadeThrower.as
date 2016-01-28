package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class GrenadeThrower extends Item {
		private var shot:Boolean = false;
		
		public function GrenadeThrower(player:Player) {
			super(player);
		}
		
		override public function update():void {
			var condition:Condition = player.condition;
			var body:b2Body = player.getBody();
			if (!body) return void;
			var canJump:Boolean = condition.canJump;
			if (!Controls.useItem) {
				shot = false;
			} else if (Controls.useItem && !shot) {
				shot = true;
				var direction:int =  condition.directionRight?1: -1;
				if (Controls.left && !Controls.right) {
					direction = -1;
				} else if (Controls.right && !Controls.left) {
					direction = 1;
				}
				var loc2Spawn:b2Vec2 = body.GetWorldCenter().Copy();
				loc2Spawn.x += 0.7 * direction;
				loc2Spawn.Multiply(3 / 2);
				var p:Particle = new Particle(loc2Spawn.x, loc2Spawn.y, 5);
				p.applyImpulse(0.3*direction , -0.3);
			}
			super.update();
		}
	}
}