package {
	import Box2D.Dynamics.b2Body;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Addable extends Platform {
		private var body:b2Body;
		private var costume:DisplayObject;
		
		public function Addable(location:Point, costume:DisplayObject) {
			super();
			super.location = location;
			super.reload();
			super.init(body, costume);
		}
		
		override public function reload():void {
			super.reload();
			super.init(body, costume);
		}
		
		override public function updateCostumes():void {
			super.updateCostumes();
			var angle:Number = body.GetAngle() / Math.PI * 180;
			if (costume) {
				costume.rotation = angle;
			}
		}
		
		override protected function removeCostumes():void {
			if (costume.parent) {
				costume.parent.removeChild(costume);
			}
			/*if (costume is Bitmap) {
				trace("disposing Addable");
				Bitmap(costume).bitmapData.dispose();
			}*/
			super.removeCostumes();
		}
		
		override protected function createShapes():void {
			shape = new RectShape(PhysicalWorld.MIN_SQARE, PhysicalWorld.MIN_SQARE);
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
			}
			StaticBodyBuilder(bodyBuilder).x = location.x;
			StaticBodyBuilder(bodyBuilder).y = location.y;
			StaticBodyBuilder(bodyBuilder).isSensor = true;
			body = bodyBuilder.getBody(new Array(shape));
		}
	}
}