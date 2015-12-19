package 
{
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CannonMovingFollowing extends CannonSuper {
		private var move:MoveABX;
		
		public function CannonMovingFollowing(x:Number, y:Number, loc1:Point) {
			super(x, y);
			loc1.x *= PhysicalWorld.MIN_SQARE;
			loc1.y *= PhysicalWorld.MIN_SQARE;
			move = new MoveABX(location, loc1, body, 0.1, 0);
		}
		
		override public function update():void {
			var playerLoc:Point = Platformer.player.getSpriteLoc();
			var loc:b2Vec2 = body.GetWorldCenter().Copy();
			loc.Multiply(PhysicalWorld.RATIO);
			var cannonAngle:Number = -90 - Math.atan2(playerLoc.x - loc.x,
													playerLoc.y - loc.y) * 180 / Math.PI;
			setAngle(cannonAngle);
			move.update();
			super.update();
		}
	}
}