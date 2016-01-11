package 
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CannonMoving extends CannonSuper {
		private var move:MoveABX;
		private var location1:Point;
		
		public function CannonMoving(x:Number, y:Number, loc1:Point, angle:Number) {
			super(x, y);
			setAngle(angle);
			location1 = loc1.clone();
			location1.x *= PhysicalWorld.MIN_SQARE;
			location1.y *= PhysicalWorld.MIN_SQARE;
		}
		
		override protected function init(myBody:b2Body):void {
			super.init(myBody);
			move = new MoveABX(location, location1, body, 0.1, currentAngle);
		}
		
		override public function update():void {
			move.update();
			super.update();
		}
	}
}