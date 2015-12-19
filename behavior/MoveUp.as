package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class MoveUp extends Behavior {
		
		public function MoveUp(body:b2Body) {
			super(body);
		}
		
		override public function update():void {
			body.ApplyForce(new b2Vec2(0.0, -10.5 * body.GetMass()), body.GetWorldCenter());
			super.update();
		}
	}
}