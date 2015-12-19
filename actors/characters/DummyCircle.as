package {
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class DummyCircle extends Character {
		
		public function DummyCircle(x:int, y:int) {
			bodyManager = new DummyBodyManager(new Point(x * 20, y * 20), this, new CircleShape(15));
			condition = new Condition();
			super(x, y);
		}
	}
}