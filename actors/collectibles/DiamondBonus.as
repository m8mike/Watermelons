package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class DiamondBonus extends Collectible {
		public static var diamondsCollected = 0;
		
		public function DiamondBonus(x:Number, y:Number) {
			var loc:Point = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			shape = new CircleShape(10);
			super(loc);
		}
		
		override public function pick(player:Player):void {
			diamondsCollected++;
			trace(diamondsCollected);
			super.pick(player);
		}
	}
}