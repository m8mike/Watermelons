package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class HatBonus extends Collectible {
		public var index:int;
		
		public function HatBonus(x:Number, y:Number, id:int) {
			index = id;
			var loc:Point = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			shape = new CircleShape(10);
			super(loc);
		}
		
		override public function pick(player:Player):void {
			player.changeHat(index);
			super.pick(player);
		}
	}
}