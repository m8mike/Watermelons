package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Dummy extends Character {
		protected var tempLoc:b2Vec2;
		protected var size:b2Vec2;
		
		public function Dummy(x:int, y:int, w:Number = 1, h:Number = 1) {
			size = new b2Vec2(w * PhysicalWorld.MIN_SQARE, h * PhysicalWorld.MIN_SQARE);
			var shape:RectShape = new RectShape(size.x, size.y);
			bodyManager = new DummyBodyManager(new Point(x * 20, y * 20), this, shape);
			condition = new Condition();
			super(x, y);
		}
		
		public function hit():void {
			
		}
	}
}