package {
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Cannon extends CannonSuper {
		
		public function Cannon(x:Number, y:Number, angle:Number = 0) {
			super(x, y);
			setAngle(angle);
		}
		
		override public function update():void {
			var playerLoc:Point = Platformer.player.getSpriteLoc();
			var cannonAngle:Number = -90 - Math.atan2(playerLoc.x - location.x,
													playerLoc.y - location.y) * 180 / Math.PI;
			setAngle(cannonAngle);
			super.update();
		}
	}
}