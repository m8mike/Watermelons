package 
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CannonMovingFollowing extends CannonSuper {
		private var move:MoveABX;
		private var location1:Point;
		
		public function CannonMovingFollowing(x:Number, y:Number, loc1:Point) {
			super(x, y);
			location1 = loc1.clone();
			location1.x *= PhysicalWorld.MIN_SQARE;
			location1.y *= PhysicalWorld.MIN_SQARE;
		}
		
		override protected function init(myBody:b2Body):void {
			super.init(myBody);
			move = new MoveABX(location, location1, body, 0.1, 0);
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