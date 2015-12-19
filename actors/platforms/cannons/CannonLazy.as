package 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CannonLazy extends CannonSuper {
		private var actualAngle:Number = 0;
		
		public function CannonLazy(x:Number, y:Number, angle:Number = 0) {
			super(x, y);
			setAngle(angle);
		}
		
		override public function setAngle(angle:Number):void {
			actualAngle = angle;
			super.setAngle(angle);
		}
		
		override public function update():void {
			var playerLoc:Point = Platformer.player.getSpriteLoc();
			var cannonAngle:Number = -90 - Math.atan2(playerLoc.x - location.x,
													playerLoc.y - location.y) * 180 / Math.PI;
			if (cannonAngle-1 > actualAngle) {
				setAngle(actualAngle + 2);
			} else if (cannonAngle+1 < actualAngle) {
				setAngle(actualAngle - 2);
			}
			super.update();
		}
	}
}