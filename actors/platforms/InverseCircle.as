package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * доделать удаление
	 * @author Mad Mike
	 */
	public class InverseCircle extends Platform {
		private var shapes:Array = [];
		private var angle:Number;
		private var radius:Number;
		private var costume:MovieClip = new MovieClip();
		
		public function InverseCircle(x:Number, y:Number, radius:Number) {
			this.angle = angle;
			this.radius = radius * PhysicalWorld.MIN_SQARE;
			super(x, y, 1, 1);
			CameraManager.gameLayer.addChild(costume);
			/*createBodies();
			init(body);*/
		}
		
		override protected function createShapes():void {
			var center:Point = new Point(location.x, location.y - radius);
			var angle:Number = Math.PI/2;
			var hillSlice:Array;
			var costumeShape:Array = [];
			costumeShape.push(new Point(Math.cos(angle) * radius, Math.sin(angle) * radius));
			for (var i:int = 0; i < 15; i++) {
				hillSlice = [];
				hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius + 200)));
				hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius)));
				costumeShape.push(new Point(Math.cos(angle) * radius, Math.sin(angle) * radius));
				angle -= Math.PI / 15/2;
				hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius)));
				hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius + 200)));
				costumeShape.push(new Point(Math.cos(angle) * radius, Math.sin(angle) * radius));
				shapes.push(new CustomShape(hillSlice));
			}
			hillSlice = [];
			hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius + 200)));
			hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius)));
			hillSlice.push(new Point(Math.cos(angle) * radius+40, (Math.sin(angle) * radius)));
			hillSlice.push(new Point(Math.cos(angle) * radius+40, (Math.sin(angle) * radius + 200)));
			shapes.push(new CustomShape(hillSlice));
			costumeShape.push(new Point(Math.cos(0) * radius+40, Math.sin(0) * radius));
			costumeShape.push(new Point(Math.cos(angle) * radius+40, Math.sin(Math.PI/2) * radius + 200));
			costumeShape.push(new Point(Math.cos(Math.PI/2) * radius, Math.sin(Math.PI/2) * radius + 200));
			
			addCostumeFromShape(location.x, location.y, costumeShape);
		}
		
		private function addCostumeFromShape(x:Number, y:Number, shape:Array):void {
			costume.addChild(getCostumeFromShape(x, y, shape));
		}
		
		public static function getCostumeFromShape(x:Number, y:Number, shape:Array):MovieClip {
			var costume:MovieClip = new MovieClip();
			costume.graphics.beginFill(0xAC0B0B);
			costume.graphics.moveTo(shape[0].x, shape[0].y);
			for (var i:int = 1; i < shape.length; i++) {
				costume.graphics.lineTo(shape[i].x, shape[i].y);
			}
			costume.graphics.lineTo(shape[0].x, shape[0].y);
			costume.graphics.endFill();
			costume.graphics.beginFill(0x707070);
			costume.graphics.moveTo(shape[0].x, shape[0].y - 20);
			for (var j:int = 0; j < shape.length-2; j++) {
				costume.graphics.lineTo(shape[j].x, shape[j].y - 20);
			}
			for (var k:int = shape.length-3; k >= 0; k--) {
				costume.graphics.lineTo(shape[k].x, shape[k].y + 10);
			}
			costume.graphics.endFill();
			costume.graphics.beginFill(0x000000);
			costume.graphics.moveTo(shape[0].x, shape[0].y+10);
			for (var j:int = 0; j < shape.length-2; j++) {
				costume.graphics.lineTo(shape[j].x, shape[j].y + 10);
			}
			for (var k:int = shape.length-3; k >= 0; k--) {
				costume.graphics.lineTo(shape[k].x, shape[k].y + 20);
			}
			costume.graphics.endFill();
			costume.graphics.beginFill(0x4B0505);
			costume.graphics.moveTo(shape[0].x, shape[0].y+20);
			for (var j:int = 0; j < shape.length-2; j++) {
				costume.graphics.lineTo(shape[j].x, shape[j].y + 20);
			}
			for (var k:int = shape.length-3; k >= 0; k--) {
				costume.graphics.lineTo(shape[k].x, shape[k].y + 40);
			}
			costume.graphics.endFill();
			costume.x = x;
			costume.y = y;
			return costume;
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				StaticBodyBuilder(bodyBuilder).groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = StaticBodyBuilder(bodyBuilder).getBody(shapes);
		}
		
		//override public function hide():void {
			//чтобы не удалялось при отдалении
		//}
	}
}