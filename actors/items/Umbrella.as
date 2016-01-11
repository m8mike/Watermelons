package {
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Umbrella extends Item {
		public var canUse:Boolean = false;
		public var usingIt:Boolean = false;
		
		public function Umbrella(player:Player) {
			super(player);
		}
		
		override public function update():void {
			var condition:Condition = player.condition;
			var body:b2Body = player.getBody();
			if (!body) return void;
			var canJump:Boolean = condition.canJump;
			if (Controls.useItem && !canJump) {
				body.m_linearDamping = 3;
			} else {
				body.m_linearDamping = 0;
			}
			if (!Controls.useItem) {
				canUse = true;
				usingIt = false;
			}
			if (canUse && body.GetLinearVelocity().y > 0) {
				usingIt = true;
			}
			super.update();
		}
		
		/*//using up arrow
		override public function update():void {
			var condition:Condition = player.condition;
			var body:b2Body = player.getBody();
			var canJump:Boolean = condition.canJump;
			if (Controls.up && !canJump) {
				body.m_linearDamping = 3;
			} else {
				body.m_linearDamping = 0;
			}
			if (!Controls.up) {
				canUse = true;
				usingIt = false;
			}
			if (canUse && body.GetLinearVelocity().y > 0) {
				usingIt = true;
			}
			super.update();
		}*/
	}
}