package {
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Collision.Shapes.b2ShapeDef;
	import Box2D.Common.Math.b2Vec2;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CustomShape extends MyShape {
		private var _coords:Array;
		
		public function CustomShape(coords:Array) {
			_coords = coords;
		}
		
		public function add(num:Number):void {
			for each (var newPoint:Point in _coords) {
				newPoint.y += num;
			}
		}
		
		override public function getShapeDef():b2ShapeDef {
			shapeDef = new b2PolygonDef();
			b2PolygonDef(shapeDef).vertexCount = _coords.length;
			for (var i:int = 0; i < _coords.length; i++) {
				var nextPoint:Point = _coords[i];
				b2Vec2(b2PolygonDef(shapeDef).vertices[i]).Set(nextPoint.x / PhysicalWorld.RATIO, nextPoint.y / PhysicalWorld.RATIO);
			}
			return shapeDef;
		}
		
		override public function getSimpleSprite(location:Point):Sprite {
			var sprite:Sprite = new Sprite();
			sprite.graphics.lineStyle(2, Math.random() * 0x1000000);
			for each (var listOfPoints:Array in _coords) {
				var firstPoint:Point = listOfPoints[0];
				sprite.graphics.moveTo(firstPoint.x, firstPoint.y);
				sprite.graphics.beginFill(Math.random() * 0x1000000);
				for each (var newPoint:Point in listOfPoints) {
					sprite.graphics.lineTo(newPoint.x, newPoint.y);
				}
				sprite.graphics.lineTo(firstPoint.x, firstPoint.y);
				sprite.graphics.endFill();
			}
			sprite.x = location.x;
			sprite.y = location.y;
			return sprite;
		}
	}
}