package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BulletBodyManager extends BodyManager {
		
		public function BulletBodyManager(location:Point, size:Number, velocity:b2Vec2, bullet:Bullet) {
			shape = new CircleShape(size);
			var bodyBuilder:DynamicBodyBuilder = new DynamicBodyBuilder();
			bodyBuilder.density = 0.5;
			bodyBuilder.friction = 0.3;
			bodyBuilder.restitution = 0.3;
			//ballBodyBuilder.groupIndex = -3;
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.linearDamping = 0;
			bodyBuilder.angularDamping = 1;
		
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(bullet);
			body.SetLinearVelocity(velocity);
		}
	
	}

}