package {
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	* Класс для управления камерами
	* @author Mad Mike
	*/
	public class CameraManager {
		public static var camera:Camera;
		public static var cameraBackground:Camera;
		public static var menuLayer:MovieClip;
		public static var controlsLayer:MovieClip;
		public static var gameLayer:MovieClip;
		public static var frontLayer:MovieClip;
		public static var freePoint:Point = new Point(0, 0);
		public static var zoomRatio:Number = 0.5;//1
		
		public static function zoomCameras(section:Point):void {
			if (!camera) {
				throw new Error("can't zoom because there is no _camera");
				return void;
			}
			if (Platformer.player) {
				freePoint = section;
			}
			camera.zoomTo(section, 5*0.3 * zoomRatio);
			//cameraBackground.zoomTo(section, 5*0.3 * zoomRatio);
		}
		
		public static function init():void {
			camera = new Camera(1);
			cameraBackground = new Camera(0.5);
			var mc:MovieClip = new MovieClip();
			mc.graphics.beginFill(0xE7FAF9);
			mc.graphics.drawRect(0, 0, 2000, 2000);
			mc.graphics.endFill();
			Platformer.instance.stage.addChild(mc);
			PhysicalWorld.setupDebugDraw();
			gameLayer = new MovieClip();
			camera.addChild(gameLayer);
			frontLayer = new MovieClip();
			camera.addChild(frontLayer);
			//Platformer.instance.stage.addChild(cameraBackground);
			Platformer.instance.stage.addChild(camera);
		}
		
		public static function update():void {
			zoomCameras(CameraUpdater.getCameraSection());
		}
	}
}