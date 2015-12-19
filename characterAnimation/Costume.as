package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Costume {
		public var animation:Animation;
		public var id:String;
		public var startFrame:int = 1;
		public var stopFrame:int;
		
		public function Costume(id:String, parent:DisplayObjectContainer) {
			this.id = id;
			parent.addChild(animation.bitmap);
		}
		
		public static function bitmapFromMC(mc:MovieClip, scaleRate:Number = 12):Bitmap {
			var m:Matrix = new Matrix();
			m.scale(scaleRate, scaleRate);
			var bitmapData:BitmapData = new BitmapData(mc.width * scaleRate, mc.height * scaleRate, true, 0x00000000);
			bitmapData.draw(mc, m);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmap.scaleX = 1 / scaleRate;
			bitmap.scaleY = 1 / scaleRate;
			return bitmap;
		}
		
		public function setLocation(x:Number, y:Number):void {
			animation.bitmap.x = x;
			animation.bitmap.y = y;
		}
		
		public function setAngle(angle:Number):void {
			animation.bitmap.rotation = angle;
		}
		
		public function setScale(scale:Number):void {
			animation.bitmap.scaleX = scale;
			animation.bitmap.scaleY = scale;
		}
		
		public function flipRight(right:Boolean = true):void {
			if (right) {
				animation.bitmap.scaleX = Math.abs(animation.bitmap.scaleX);
			} else {
				animation.bitmap.scaleX = -1 * Math.abs(animation.bitmap.scaleX);
			}
		}
		
		public function play():void {
			animation.gotoAndPlay(startFrame);
			animation.bitmap.visible = true;
		}
		
		public function stop():void {
			animation.stop();
		}
		
		public function hide():void {
			animation.bitmap.visible = false;
		}
		
		public function show():void {
			animation.bitmap.visible = true;
		}
		
		public function remove():void {
			animation.destroy();
		}
	}
}