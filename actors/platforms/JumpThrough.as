package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* платформы, через которые можно пройти снизу
	* логика в b2Island
	* @author Mad Mike
	*/
	public class JumpThrough extends Platform {
		
		public function JumpThrough(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			super(x, y, w, h);
		}
	}
}