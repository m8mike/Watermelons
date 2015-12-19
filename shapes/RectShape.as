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
	public class RectShape extends MyShape {
		public var _width:Number;
		public var _height:Number;
		
		public function RectShape(width:Number, height:Number) {
			_width = width;
			_height = height;
		}
		
		override public function getShapeDef():b2ShapeDef {
			shapeDef = new b2PolygonDef();
			b2PolygonDef(shapeDef).vertexCount = 4;
			var x:Number = location.x * PhysicalWorld.MIN_SQARE / PhysicalWorld.RATIO;
			var y:Number = location.y * PhysicalWorld.MIN_SQARE / PhysicalWorld.RATIO;
			var w:Number = _width / PhysicalWorld.RATIO;
			var h:Number = _height / PhysicalWorld.RATIO;
			b2Vec2(b2PolygonDef(shapeDef).vertices[0]).Set(x, y);
			b2Vec2(b2PolygonDef(shapeDef).vertices[1]).Set(w + x, y);
			b2Vec2(b2PolygonDef(shapeDef).vertices[2]).Set(w + x, h + y);
			b2Vec2(b2PolygonDef(shapeDef).vertices[3]).Set(x, h + y);
			return shapeDef;
		}
		
		override public function getSimpleSprite(location:Point):Sprite {
			var sprite:Sprite = new Sprite();
			var color:uint = Math.random() * 0x00FF00;
			sprite.graphics.lineStyle(2, color);
			sprite.graphics.beginFill(color + Math.random() * 0x00FF00);
			sprite.graphics.drawRect(0, 0, _width, _height);
			sprite.graphics.endFill();
			return sprite;
		}
	}
}