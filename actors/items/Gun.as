package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Gun extends Item {
		private var aiming:Boolean = false;
		
		public function Gun(player:Player) {
			super(player);
		}
		
		override public function update():void {
			var condition:Condition = player.condition;
			var body:b2Body = player.getBody();
			var canJump:Boolean = condition.canJump;
			if (canJump && Controls.useItem) {
				body.SetLinearVelocity(new b2Vec2(0, 0));
			}
			if (aiming && !Controls.useItem) {
				shoot();
				aiming = false;
			}
			if (Controls.useItem && !aiming) {
				aiming = true;
			}
			super.update();
		}
		
		private function shoot():void {
			trace("bloaw");
		}
	}
}