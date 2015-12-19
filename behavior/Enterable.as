package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Enterable {
		public var inside:Boolean = false;
		private var justGotIn:Boolean = false;
		
		public function Enterable() {
			
		}
		
		public function update(onExit:Function):void {
			if (!inside) {
				return void;
			}
			if (justGotIn) {
				if (!Controls.enter) {	
					justGotIn = false;
				}
			} else {
				if (Controls.enter) {
					onExit();
					inside = false;
					justGotIn = true;
				}
			}
		}
		
		public function hit(onEnter:Function):void {
			if (justGotIn) {
				if (!Controls.enter) {
					justGotIn = false;
				}
			} else if (Controls.enter) {
				inside = true;
				justGotIn = true;
				onEnter();
			}
		}
	}
}