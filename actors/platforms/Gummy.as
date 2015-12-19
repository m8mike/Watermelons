package {
	import flash.geom.Point;
	
	/**
	 * player stucks when contacts platform
	 * @author Mad Mike
	 */
	public class Gummy extends Platform {
		
		public function Gummy(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			super(x, y, w, h);
		}
	}
}