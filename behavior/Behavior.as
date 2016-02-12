package {
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Behavior {
		protected var body:b2Body;
		
		public function Behavior(body:b2Body) {
			this.body = body;
		}
		
		public function update():void {
			
		}
		
		public function changeBody(newBody:b2Body):void {
			body = newBody;
		}
		
		public function remove():void {
			body = null;
		}
	}
}