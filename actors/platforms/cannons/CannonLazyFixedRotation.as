package 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CannonLazyFixedRotation extends CannonSuper {
		private var actualAngle:int = 0;
		private var angleLow:int;
		private var angleHigh:int;
		
		public function CannonLazyFixedRotation(x:Number, y:Number, angle:int = 0, angleLow:int = -45, angleHigh:int = 45) {
			super(x, y);
			setAngle(angle);
			this.angleLow = angleLow;
			this.angleHigh = angleHigh;
		}
		
		override public function setAngle(angle:Number):void {
			actualAngle = angle;
			super.setAngle(angle);
		}
		
		override public function update():void {
			var playerLoc:Point = Platformer.player.getSpriteLoc();
			var cannonAngle:int = -90 - Math.atan2(playerLoc.x - location.x,
													playerLoc.y - location.y) * 180 / Math.PI;
			if (cannonAngle < angleLow || cannonAngle > angleHigh) {
				return void;
			}
			if (cannonAngle-1 > actualAngle) {
				setAngle(actualAngle + 2);
			} else if (cannonAngle+1 < actualAngle) {
				setAngle(actualAngle - 2);
			}
			super.update();
		}
	}
}