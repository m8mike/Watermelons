package {
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Zombie extends Dummy {
		
		public function Zombie(x:int, y:int) {
			super(x, y, 1.5, 3);
		}
		
		override public function hit():void {
			tempLoc = bodyManager.body.GetWorldCenter().Copy();
			tempLoc.Multiply(PhysicalWorld.RATIO);
			tempLoc.x -= PhysicalWorld.MIN_SQARE / 2;
			size.y -= 10;
			bodyManager.removeBodies();
			if (size.y >= 20) {	
				PhysicalWorld.actorsWhoNeedBody.push(this);
			}
			super.hit();
		}
		
		override public function initBody():void {
			var shape:RectShape = new RectShape(size.x, size.y);
			bodyManager = new DummyBodyManager(new Point(tempLoc.x, tempLoc.y), this, shape);
			super.initBody();
		}
	}
}