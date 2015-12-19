package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Springs extends Item {
		
		public function Springs(player:Player) {
			super(player);
		}
		
		override public function update():void {
			var condition:Condition = player.condition;
			var body:b2Body = player.getBody();
			var canJump:Boolean = condition.canJump;
			if (canJump || condition.sleeping) {
				body.ApplyImpulse(new b2Vec2(0, -0.5), body.GetWorldCenter().Copy());
				canJump = false;
			}
		}
	}
}