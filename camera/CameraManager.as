package {
	import flash.geom.Point;
	
	/**
	* Класс для управления камерами
	* @author Mad Mike
	*/
	public class CameraManager {
		public static var camera:Camera;
		public static var freePoint:Point = new Point(0, 0);
		public static var zoomRatio:Number = 1;
		
		public static function zoomCameras(section:Point):void {
			if (!camera) {
				throw new Error("can't zoom because there is no _camera");
				return void;
			}
			if (Platformer.player) {
				freePoint = section;
			}
			camera.zoomTo(section, 5*0.3 * zoomRatio);
		}
		
		public static function init():void {
			camera = new Camera(1);
			Platformer.instance.addChild(camera);
		}
		
		public static function update():void {
			zoomCameras(CameraUpdater.getCameraSection());
		}
	}
}