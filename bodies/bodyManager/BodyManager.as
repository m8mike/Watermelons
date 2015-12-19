package {
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BodyManager {
		public var body:b2Body;
		protected var shape:MyShape;
		public var removed:Boolean = false;
		
		public function BodyManager() {
			
		}
		
		public function update():void {
			
		}
		
		public function removeBodies():void {
			PhysicalWorld.safeRemoveBody(body);
			removed = true;
		}
	}
}