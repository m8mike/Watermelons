package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class CannonFly extends CannonSuper {
		
		public function CannonFly(x:Number, y:Number) {
			super(x, y);
		}
		
		override public function update():void {
			var playerLoc:Point = Platformer.player.getSpriteLoc().clone();
			playerLoc.y -= 200;
			var goal:b2Vec2 = new b2Vec2(playerLoc.x, playerLoc.y);
			goal.Multiply(1 / PhysicalWorld.RATIO);
			var current:b2Vec2 = body.GetWorldCenter().Copy();
			var vecPoint:Point = new Point(goal.x - current.x, goal.y - current.y);
			var angle:Number = Math.atan2(vecPoint.y, vecPoint.x);
			var distance:Number = Point.distance(new Point(goal.x, goal.y), new Point(current.x, current.y));
			var nextLoc:b2Vec2 = current.Copy();
			if (distance < 15 && distance > 2) {
				nextLoc.x += Math.cos(angle) * 0.2;
				nextLoc.y += Math.sin(angle) * 0.2;
			}
			body.SetXForm(nextLoc, Math.atan2(vecPoint.y - 6, -vecPoint.x));
			super.update();
		}
		
		override public function hide():void {
			//чтобы не удалялось при отдалении
		}
	}
}