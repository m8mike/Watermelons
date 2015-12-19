package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.System;
	import flash.utils.getQualifiedClassName;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CharAnimCached {
		private var cachedShoes1:Array = [];
		private var cachedHands1:Array = [];
		private var cachedRocket1:Bitmap;
		private var cachedHeadsRight:Array = [];
		private var cachedHeadsLeft:Array = [];
		private var cachedHats:Array = [];
		private var cachedStripes:Array = [];
		private var cachedRocket2:Bitmap;
		private var cachedShoes2:Array = [];
		private var cachedHands2:Array = [];
		
		public var mc:MovieClip;
		public var onEnd:Function;
		
		public function CharAnimCached(anim:MovieClip) {
			mc = anim;
			for (var i:int = 1; i <= mc.totalFrames; i++) {
				CharAnimConfig.makeAllChildrenGoToFrame(mc, i);
				var shoes1:Array = [];
				var hands1:Array = [];
				var shoes2:Array = [];
				var hands2:Array = [];
				CharAnimConfig.isolateChildren(getChildFrom(mc, [0, 0]), shoes1, mc); //shoes
				CharAnimConfig.isolateChildren(getChildFrom(mc, [0, 1]), hands1, mc); //hands
				getChildFrom(mc, [0, 2]);
				cachedRocket1 = CharAnimConfig.convertToBitmap(mc); //rocket
				parseHead(getChildFrom(mc, [0, 3, 0])); //heads/hats/stripes
				getChildFrom(mc, [0, 4]);
				cachedRocket2 = CharAnimConfig.convertToBitmap(mc); //rocket
				CharAnimConfig.isolateChildren(getChildFrom(mc, [0, 5]), shoes2, mc); //shoes
				CharAnimConfig.isolateChildren(getChildFrom(mc, [0, 6]), hands2, mc); //hands
				cachedShoes1.push(shoes1);
				cachedHands1.push(hands1);
				cachedShoes2.push(shoes2);
				cachedHands2.push(hands2);
			}
		}
		
		private static function mergeBitmapDatas(destination:BitmapData, source:BitmapData):void {
			var bounds:Rectangle = new Rectangle(0, 0, destination.width, destination.height);
			destination.copyPixels(source, bounds, new Point(), source, new Point(), true);
		}
		
		public function getFrames(config:CharAnimConfig):Array {
			var a:Array = [];
			for (var i:int = 1; i <= mc.totalFrames; i++) {
				a.push(getBitmapData(config, i));
			}
			return a;
		}
		
		private function getBitmapData(config:CharAnimConfig, frame:int):BitmapData {
			var rect:Rectangle = mc.getBounds(mc);
			//var bitmapData:BitmapData = new BitmapData(rect.width, rect.height, true, 0x00000000);
			var bitmapData:BitmapData = new BitmapData(120, 185, true, 0x00000000);
			mergeBitmapDatas(bitmapData, cachedShoes1[frame-1][config.shoes1ID].bitmapData);
			mergeBitmapDatas(bitmapData, cachedHands1[frame-1][config.hands1ID].bitmapData);
			if (config.rockets) {	
				mergeBitmapDatas(bitmapData, cachedRocket1.bitmapData);
			}
			if (config.left) {
				mergeBitmapDatas(bitmapData, cachedHeadsLeft[frame-1][config.headID].bitmapData);
			} else {
				mergeBitmapDatas(bitmapData, cachedHeadsRight[frame-1][config.headID].bitmapData);
			}
			var hat:BitmapData = cachedHats[frame-1][config.hatID].bitmapData;
			if (config.left) {
				hat = flipBitmapDataHorisontal(hat);
			}
			mergeBitmapDatas(bitmapData, hat);
			if (config.stripeID != -1) {
				var stripe:BitmapData = cachedStripes[frame-1][config.stripeID].bitmapData;
				if (config.left) {
					stripe = flipBitmapDataHorisontal(stripe);
				}
				mergeBitmapDatas(bitmapData, stripe);
			}
			if (config.rockets) {
				mergeBitmapDatas(bitmapData, cachedRocket2.bitmapData);
			}
			mergeBitmapDatas(bitmapData, cachedShoes2[frame-1][config.shoes2ID].bitmapData);
			mergeBitmapDatas(bitmapData, cachedHands2[frame-1][config.hands2ID].bitmapData);
			//var bitmap:Bitmap = new Bitmap(bitmapData);
			return bitmapData;
		}
		private function flipBitmapDataHorisontal(original:BitmapData):BitmapData {
			var flipped:BitmapData = new BitmapData(original.width, original.height, true, 0);
			var matrix:Matrix = new Matrix( -1, 0, 0, 1, original.width, 0);
			flipped.draw(original, matrix, null, null, null, true);
			return flipped;
		}
		private function parseHead(doc:DisplayObjectContainer):void {
			var hats:Array = [];
			var stripes:Array = [];
			var headsLeft:Array = [];
			var headsRight:Array = [];
			for (var i:int = 0; i < doc.numChildren; i++) {
				CharAnimConfig.hideNeighbours(doc);
				CharAnimConfig.hideNeighbours(doc.getChildAt(i));
				var child:DisplayObject = doc.getChildAt(i);
				if (getQualifiedClassName(child).search("hat") != -1) {
					hats.push(CharAnimConfig.convertToBitmap(mc));
				} else if (getQualifiedClassName(child).search("stripe") != -1) {
					stripes.push(CharAnimConfig.convertToBitmap(mc));
				} else if (i % 2) {
					headsLeft.push(CharAnimConfig.convertToBitmap(mc));
				} else {
					headsRight.push(CharAnimConfig.convertToBitmap(mc));
				}
			}
			cachedHats.push(hats);
			cachedStripes.push(stripes);
			cachedHeadsLeft.push(headsLeft);
			cachedHeadsRight.push(headsRight);
		}
		
		public static function getChildFrom(doc:DisplayObjectContainer, a:Array):DisplayObjectContainer {
			var child:DisplayObjectContainer = doc;
			for each (var id:int in a) {
				for (var j:int = 0; j < child.numChildren; j++) {
					if (id != j) {
						child.getChildAt(j).visible = false;
					}
				}
				child.getChildAt(id).visible = true;
				if (child.getChildAt(id) is DisplayObjectContainer) {	
					child = DisplayObjectContainer(child.getChildAt(id));
				} else {
					trace(doc + " error");
				}
			}
			return child;
		}
	}
}