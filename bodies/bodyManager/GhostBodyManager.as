package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class GhostBodyManager extends BodyManager {
		
		public function GhostBodyManager(location:Point, ghost:Ghost) {
			shape = new RectShape(1.8 * 20, 2.4 * 20);
			var bodyBuilder:DynamicBodyBuilder = new DynamicBodyBuilder();
			bodyBuilder.density = 0.5;
			bodyBuilder.friction = 0.3;
			bodyBuilder.restitution = 0.3;
			bodyBuilder.isSensor = true;
			//ballBodyBuilder.groupIndex = -3;
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.linearDamping = 0;
			bodyBuilder.angularDamping = 0;
			
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(ghost);
		}
		
		override public function update():void {
			if (body) {
				body.m_sweep.a = 0;
			}
			super.update();
		}
	}
}