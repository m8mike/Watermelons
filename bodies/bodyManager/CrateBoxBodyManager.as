package {
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CrateBoxBodyManager extends BodyManager {
		
		public function CrateBoxBodyManager(location:Point, parent:CrateBox) {
			shape = new RectShape(20, 20);
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
			body.SetUserData(parent);
		}
	
	}

}