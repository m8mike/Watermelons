package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BubbleUpBonus extends Collectible {
		private var behavior:Behavior;
		
		public function BubbleUpBonus(x:Number, y:Number) {
			var loc:Point = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			shape = new CircleShape(10);
			super(loc);
			behavior = new MoveUp(body);
		}
		
		override public function createBodies():void {
			var bodyBuilder:StaticBodyBuilder = new StaticBodyBuilder();
			bodyBuilder.density = 1;
			bodyBuilder.friction = 0.2;
			bodyBuilder.restitution = 0.3;
			bodyBuilder.groupIndex = -2;
			bodyBuilder.isSensor = true;
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
		
		override public function update():void {
			if (behavior) {
				behavior.update();
			}
			super.update();
		}
		
		override protected function cleanUpBeforeRemoving():void {
			if (behavior) {
				behavior.remove();
			}
			super.cleanUpBeforeRemoving();
		}
	}
}