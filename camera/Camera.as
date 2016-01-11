package {
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* Определяет сущность камеры
	* @author Mad Mike
	*/
	public class Camera extends Sprite {
		public var zoom:Number;
		
		public function Camera(zoomRatio:Number) {
			zoom = zoomRatio;
		}
		
		public function zoomTo(whatPoint:Point, zoomRatio:Number = 1):void {
			scaleX = zoom * zoomRatio;
			scaleY = zoom * zoomRatio;
			x = 320 - (whatPoint.x * zoomRatio);
			y = 240 - (whatPoint.y * zoomRatio);
		}
	}
}