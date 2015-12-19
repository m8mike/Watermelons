package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	
	public class Animation {
		public var bitmap:Bitmap;
		public var frames:Array = [];
		private var currentFrame:int = 1;
		public var onEnd:Function;
		
		public var clip:MovieClip;
		public var scale:Number;
		
		private static var animations:Array = [];
		
		public function Animation() {
			bitmap = new Bitmap();
			bitmap.smoothing = false;
		}
		
		public function buildCacheFromLibrary(identifier:String, scaleRate:Number = 1):void {
			clip = new (getDefinitionByName(identifier))();
			buildCacheFromClip(clip, scaleRate);
			scale = scaleRate;
		}
		
		public function buildCacheFromClip(mc:MovieClip, scaleRate:Number = 1):void {
			var maxWidth:Number = mc.width;
			var maxHeight:Number = mc.height;
			var clipBounds:Rectangle;
			for (var j:int = 0; j < mc.totalFrames; j++) {
				clipBounds = mc.getBounds(mc);
				if (maxWidth < clipBounds.width) {
					maxWidth = clipBounds.width;
				}
				if (maxHeight < clipBounds.height) {
					maxHeight = clipBounds.height;
				}
			}
			var matrix:Matrix = new Matrix();
			matrix.translate(-clipBounds.x, -clipBounds.y);
			matrix.scale(scaleRate, scaleRate);
			for (var i = 1; i <= mc.totalFrames; i++) {
				CharAnimConfig.makeAllChildrenGoToFrame(mc, i);
				var bitmapData:BitmapData = new BitmapData(maxWidth, maxHeight, true, 0x00000000);
				bitmapData.draw(mc, matrix);
				frames.push(bitmapData);
			}
		}
		
		public static function updateAll():void {
			for each (var animation:Animation in animations) {
				animation.update();
			}
		}
		
		private function play():void {
			if (animations.indexOf(this) == -1) {
				animations.push(this);
			}
		}
		
		public function stop():void {
			var id:int = animations.indexOf(this);
			if (id != -1) {
				animations.splice(id, 1);
			}
		}
		
		public function gotoAndStop(frame:Number):void {
			currentFrame = frame;
			goto();
			stop();
		}
		
		public function gotoAndPlay(frame:Number):void {
			currentFrame = frame;
			goto();
			play();
		}
		
		public function nextFrame():void {
			if (!clip) {
				stop();
				return void;
			}
			currentFrame++;
			if (currentFrame > clip.totalFrames) {
				currentFrame = 1;
			}
			goto();
		}
		
		private function goto():void {
			bitmap.bitmapData = frames[currentFrame - 1];
		}
		
		public function update():void {
			if (!clip) {
				stop();
				return void;
			}
			nextFrame();
			if (currentFrame >= clip.totalFrames) {
				if (onEnd != null) {
					onEnd();
				}
			}
		}
		
		public function destroy():void {
			stop();
			if (bitmap.parent) {	
				bitmap.parent.removeChild(bitmap);
			}
		}
	}
}