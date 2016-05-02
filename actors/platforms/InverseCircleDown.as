package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * доделать удаление
	 * @author Mad Mike
	 */
	public class InverseCircleDown extends Platform {
		private var shapes:Array = [];
		private var angle:Number;
		private var radius:Number;
		private var costume:MovieClip = new MovieClip();
		
		public function InverseCircleDown(x:Number, y:Number, radius:Number) {
			this.angle = angle;
			this.radius = radius * PhysicalWorld.MIN_SQARE;
			super(x, y, 1, 1);
			CameraManager.gameLayer.addChild(costume);
			/*createBodies();
			init(body);*/
		}
		
		override protected function createShapes():void {
			var center:Point = new Point(location.x, location.y - radius);
			var angle:Number = Math.PI;
			var hillSlice:Array;
			costume.graphics.beginFill(0x008000);
			costume.graphics.moveTo(Math.cos(angle) * radius - 100, Math.sin(angle) * radius);
			hillSlice = [];
			hillSlice.push(new Point(Math.cos(angle) * radius-100, (Math.sin(angle) * radius + 220)));
			hillSlice.push(new Point(Math.cos(angle) * radius-100, (Math.sin(angle) * radius)));
			hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius)));
			hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius + 220)));
			shapes.push(new CustomShape(hillSlice));
			for (var i:int = 0; i < 15; i++) {
				hillSlice = [];
				hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius + 220)));
				hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius)));
				costume.graphics.lineTo(Math.cos(angle) * radius, Math.sin(angle) * radius);
				angle -= Math.PI / 15 / 2;
				hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius)));
				hillSlice.push(new Point(Math.cos(angle) * radius, (Math.sin(angle) * radius + 220)));
				costume.graphics.lineTo(Math.cos(angle) * radius, Math.sin(angle) * radius);
				shapes.push(new CustomShape(hillSlice));
			}
			costume.graphics.lineTo(Math.cos(angle) * radius, Math.sin(Math.PI) * radius + 420);
			costume.graphics.lineTo(Math.cos(Math.PI) * radius-100, Math.sin(Math.PI) * radius + 420);
			costume.graphics.endFill();
			costume.x = location.x;
			costume.y = location.y;
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
		
		/*override public function hide():void {
			//чтобы не удалялось при отдалении
		}*/
	}
}