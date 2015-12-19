package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Deltaplan extends Item {
		public var opened:Boolean = false;
		private var opening:Boolean = false;
		
		private var openTime:int = 0;
		
		public function Deltaplan(player:Player) {
			super(player);
		}
		
		override public function update():void {
			var condition:Condition = player.condition;
			var body:b2Body = player.getBody();
			var canJump:Boolean = condition.canJump;
			if (opened) {
				if (!canJump) {
					body.SetLinearVelocity(new b2Vec2(body.GetLinearVelocity().x, 0));
				}
			}
			if (opening) {	
				if (openTime > 0) {
					openTime--;
				} else {
					opening = false;
					opened = !opened;
					trace(opened);
				}
			}
			if (Controls.useItem) {
				if (!opening) {
					opening = true;
					openTime = 10;
				}
			}
			super.update();
		}
	}
}