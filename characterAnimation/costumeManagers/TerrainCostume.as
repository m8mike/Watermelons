package  {
	import flash.display.Bitmap;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class TerrainCostume {
		private var costume:MovieClip;
		private static var lastColor:uint = parseInt("0x" + ((1 << 24) * Math.random() | 0).toString(16));
		private var bmp:Bitmap;
		
		public function TerrainCostume(shape:Array, location:Point = null) {
			costume = new MovieClip();
			if (location) {
				costume.x = location.x;
				costume.y = location.y;
			}
			costume.graphics.beginFill(0x804040);
			costume.graphics.moveTo(shape[0].x, shape[0].y);
			for (var i:int = 1; i < shape.length; i++) {
				costume.graphics.lineTo(shape[i].x, shape[i].y);
			}
			costume.graphics.lineTo(shape[0].x, shape[0].y);
			costume.graphics.endFill();
			for (i = 3; i < shape.length - 3; i++) {
				if (Math.random() > 0.9) {
					addTree(new Point(shape[i].x, shape[i].y-15), Math.atan2(shape[i+1].y - shape[i-1].y, shape[i+1].x - shape[i-1].x));
				}
			}
			makeCircles(shape, true);
			makeCircles(shape);
			makeCircles(shape);
			costume.graphics.beginFill(0xB0FF3C);
			costume.graphics.moveTo(shape[0].x, shape[0].y-20);
			for (i = 1; i < shape.length-2; i++) {
				costume.graphics.lineTo(shape[i].x, shape[i].y-20);
			}
			for (i = shape.length-3; i >= 0; i--) {
				costume.graphics.lineTo(shape[i].x, shape[i].y+10);
			}
			costume.graphics.lineTo(shape[0].x, shape[0].y-20);
			costume.graphics.endFill();
			costume.graphics.beginFill(0x008000);
			costume.graphics.moveTo(shape[0].x, shape[0].y+10);
			for (i = 1; i < shape.length-2; i++) {
				costume.graphics.lineTo(shape[i].x, shape[i].y+10);
			}
			for (i = shape.length-3; i >= 0; i--) {
				costume.graphics.lineTo(shape[i].x, shape[i].y+20);
			}
			costume.graphics.lineTo(shape[0].x, shape[0].y+10);
			costume.graphics.endFill();
			costume.graphics.beginFill(0xB0FF3C);
			for (i = 3; i < shape.length - 3; i++) {
				if (Math.random() > 0.5) {
					costume.graphics.drawCircle(shape[i].x - 5 + Math.random() * 10, 
												shape[i].y + 5 + Math.random() * 10, 
												3 + Math.random() * 5);
				}
			}
			costume.graphics.beginFill(0x432121);
			costume.graphics.moveTo(shape[0].x, shape[0].y+20);
			for (i = 1; i < shape.length-2; i++) {
				costume.graphics.lineTo(shape[i].x, shape[i].y+20);
			}
			for (i = shape.length-3; i >= 0; i--) {
				costume.graphics.lineTo(shape[i].x, shape[i].y+40);
			}
			costume.graphics.lineTo(shape[0].x, shape[0].y+10);
			costume.graphics.endFill();
			/*var anim:Animation = new Animation();
			anim.buildCacheFromClip(costume);
			bmp = new Bitmap(anim.frames[0]);
			bmp.x = location.x;
			bmp.y = location.y;*/
			CameraManager.gameLayer.addChild(costume);
			/*var background:MovieClip = new MovieClip();
			background.graphics.beginFill(0x00CE00);
			background.graphics.moveTo(shape[0].x, shape[0].y);
			for (i = 1; i < shape.length; i++) {
				background.graphics.lineTo(shape[i].x, shape[i].y);
			}
			background.graphics.lineTo(shape[0].x, shape[0].y);
			background.graphics.endFill();
			if (location) {
				background.x = location.x;
				background.y = location.y;
			}
			CameraManager.cameraBackground.addChild(background);*/
		}
		
		private function addTree(loc:Point, angle:Number):void {
			var scaleRatio:Number = 0.2 + 3/(Math.abs(angle)+0.3);
			var tree:MovieClip = new MovieClip();
			tree.graphics.beginFill(0x804000);
			tree.graphics.moveTo(- 3*scaleRatio, 0);
			tree.graphics.lineTo(0,  - 39*scaleRatio);
			tree.graphics.lineTo(3*scaleRatio, 0);
			tree.graphics.endFill();
			tree.graphics.beginFill(getRandomColor());
			tree.graphics.drawCircle(0, - 30*scaleRatio, 10*scaleRatio + 15);
			tree.graphics.endFill();
			tree.graphics.beginFill(getRandomColor());
			tree.graphics.drawCircle(0, - 30*scaleRatio, 10*scaleRatio);
			tree.graphics.endFill();
			tree.graphics.beginFill(getRandomColor());
			tree.graphics.drawCircle(0, - 30*scaleRatio, 10*scaleRatio-15);
			tree.graphics.endFill();
			tree.graphics.beginFill(0xFFFFFF);
			tree.graphics.drawCircle(Math.cos(-angle+Math.PI*2 / 6+Math.PI) * 4 * scaleRatio, 
									-30*scaleRatio+Math.sin(-angle+Math.PI*2/6+Math.PI)*4*scaleRatio, 3*scaleRatio);
			tree.graphics.endFill();
			tree.graphics.beginFill(0xFFFFFF);
			tree.graphics.drawCircle(Math.cos(-angle+Math.PI / 6+Math.PI) * 3 * scaleRatio, 
									-30*scaleRatio+Math.sin(-angle+Math.PI/6+Math.PI)*3*scaleRatio, 2*scaleRatio);
			tree.graphics.endFill();
			tree.x = loc.x;
			tree.y = loc.y;
			tree.rotation = angle / Math.PI * 180;
			if (Math.random() > 0.5) {
				tree.x += costume.x;
				tree.y += 20 + costume.y;
				CameraManager.frontLayer.addChild(tree);
			} else {
				costume.addChild(tree);
			}
		}
		
		private function getRandomColor():uint {
			var colors:Array = [0xFF0000, 0xFFFF00, 0x00FF00, 0x008000, 0xFF8000, 0x8000FF, 0x00FF80, 0xFF0040, 0x48009F, 0xFF4F40];
			return colors[int(Math.random()*(colors.length-1))];
		}
		
		private function getRandomChar(string:String):String {
			return string.charAt(int(Math.random() * (string.length - 1)));
		}
		
		private function makeCircles(shape:Array, useLastColor:Boolean = false):void {
			var color:uint = lastColor;
			if (!useLastColor) {
				color = parseInt("0x" + ((1 << 24) * Math.random() | 0).toString(16));
				lastColor = color;
			}
			costume.graphics.beginFill(color);
			for (var i:int = 3; i < shape.length - 3; i++) {
				if (Math.random() > 0.5) {
					var r:Number = 3 + Math.random() * 50;
					if ((i < 6) || (i > shape.length -6)) {
						r = 3 + Math.random() * 20;
					}
					costume.graphics.drawCircle(shape[i].x - 5 + Math.random() * 10, 
												shape[i].y + 100 + Math.random() * 200, 
												r);
				}
			}
			costume.graphics.endFill();
		}
		
		public function remove():void {
			costume.parent.removeChild(costume);
			while (CameraManager.frontLayer.numChildren) {
				CameraManager.frontLayer.removeChildAt(0);
			}
		}
	}
}