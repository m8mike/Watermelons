package { 
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class StandardUnfixedMoving extends StandardMoving {
		
		public function StandardUnfixedMoving(x:Number, y:Number, loc1:Point, w:Number = 1, h:Number = 1, rotate:Boolean = false) {
			super(x, y, loc1, w, h, rotate);
		}
		
		override public function update():void {
			move.update();
			if (!rotate) {
				body.SetAngularVelocity(0);
			}
			super.update();
		}
	}
}