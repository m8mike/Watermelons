package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * platform that lets player slide on its side
	 * @author Mad Mike
	 */
	public class StickyHexagon extends Gummy {
		private var radius:Number;
		
		public function StickyHexagon(x:Number, y:Number, r:Number = 1) {
			radius = r;
			super(x, y, r, r);
		}
		
		override protected function createShapes():void {
			shape = new HexShape(radius * PhysicalWorld.MIN_SQARE);
		}
	}
}