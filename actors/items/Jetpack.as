package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Jetpack extends Item {
		public var jetpackTime:int = 0;
		
		public function Jetpack(player:Player) {
			super(player);
		}
		
		override public function update():void {
			var condition:Condition = player.condition;
			var body:b2Body = player.getBody();
			var canJump:Boolean = condition.canJump;
			if (canJump && !Controls.useItem && jetpackTime < 100 && !PhysicalWorld.isStopped()) {
				jetpackTime++;
			}
			if (!Controls.useItem) {
				body.m_linearDamping = 0;
				return void;
			}
			if (jetpackTime > 0) {
				body.m_linearDamping = 0;
				jetpackTime--;
				body.ApplyForce(new b2Vec2(0.0, -3.8), body.GetWorldCenter()); ///-1.8
			} else {
				body.m_linearDamping = 3;
			}
			super.update();
		}
		
		override public function pickAnother():void {
			jetpackTime = 100;
			super.pickAnother();
		}
	}
}