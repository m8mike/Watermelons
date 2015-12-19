package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class CannonFollowing extends CannonSuper {
		private var destination:Point;
		private var movingAngle:Number;
		
		public function CannonFollowing(x:Number, y:Number, dest:Point, angle:Number = 0) {
			var loc1:Point = dest.clone();
			loc1.x *= PhysicalWorld.MIN_SQARE;
			loc1.y *= PhysicalWorld.MIN_SQARE;
			loc1.x -= x*PhysicalWorld.MIN_SQARE;
			loc1.y -= y*PhysicalWorld.MIN_SQARE;
			movingAngle = -Math.atan2(loc1.y, loc1.x);
			var dLoc:Point = new Point();
			dLoc.x = loc1.x * Math.cos(movingAngle) - loc1.y * Math.sin(movingAngle);
			dLoc.y = loc1.x * Math.sin(movingAngle) + loc1.y * Math.cos(movingAngle);
			var superLoc:Point;
			if (dLoc.x >= 0) {
				superLoc = new Point(dest.x, dest.y);
			} else {
				superLoc = new Point(x, y);
			}
			super(superLoc.x, superLoc.y);
			if (dLoc.x >= 0) {
				destination = new Point(x, y);
			} else {
				destination = dest.clone();
			}
			destination.x *= PhysicalWorld.MIN_SQARE;
			destination.y *= PhysicalWorld.MIN_SQARE;
			
			loc1 = destination.clone();
			loc1.x -= location.x;
			loc1.y -= location.y;
			movingAngle = -Math.atan2(loc1.y, loc1.x);
			setAngle(movingAngle*180/Math.PI);
		}
		
		override public function update():void {
			var playerLoc:Point = Platformer.player.getSpriteLoc();
			playerLoc.x -= location.x;
			playerLoc.y -= location.y;
			var loc1:Point = destination.clone();
			loc1.x -= location.x;
			loc1.y -= location.y;
			var pLoc:Point = new Point();
			pLoc.x = playerLoc.x * Math.cos(movingAngle) - playerLoc.y * Math.sin(movingAngle);
			pLoc.y = playerLoc.x * Math.sin(movingAngle) + playerLoc.y * Math.cos(movingAngle);
			var dLoc:Point = new Point();
			dLoc.x = loc1.x * Math.cos(movingAngle) - loc1.y * Math.sin(movingAngle);
			dLoc.y = loc1.x * Math.sin(movingAngle) + loc1.y * Math.cos(movingAngle);
			var vec:b2Vec2 = new b2Vec2();
			if (pLoc.x <= 0) {
				vec.x = location.x;
				vec.y = location.y;
			} else if (pLoc.x >= dLoc.x) {
				vec.x = destination.x;
				vec.y = destination.y;
			} else {
				vec.x = location.x + pLoc.x * Math.cos(movingAngle);
				vec.y = location.y - pLoc.x * Math.sin(movingAngle);
			}
			vec.Multiply(1 / 30);
			body.SetXForm(vec, body.GetAngle());
			super.update();
		}
	}
}