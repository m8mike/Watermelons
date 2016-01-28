package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class GrenadeThrowerBonus extends Collectible {
		
		public function GrenadeThrowerBonus(x:Number, y:Number) {
			var loc:Point = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			shape = new CircleShape(10);
			super(loc);
		}
		
		override public function pick(player:Player):void {
			player.itemGet(GrenadeThrower as Class);
			super.pick(player);
		}
	}
}