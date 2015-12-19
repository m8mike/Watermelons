package {
	import Box2D.Collision.Shapes.b2ShapeDef;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MyShape {
		protected var shapeDef:b2ShapeDef;
		protected var location:Point = new Point(0, 0);
		
		public function MyShape() {
		
		}
		
		public function getShapeDef():b2ShapeDef {
			return null;
		}
		
		public function getSimpleSprite(location:Point):Sprite {
			return null;
		}
		
		public function setLoc(x:Number, y:Number):void {
			location.setTo(x, y);
		}
	}
}