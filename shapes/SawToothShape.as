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
	public class SawToothShape extends MyShape {
		public var width:Number;
		public var height:Number;
		public var height2:Number;
		
		public function SawToothShape(width:Number, height:Number, height2:Number) {
			this.width = width;
			this.height = height;
			this.height2 = height2;
		}
		
		override public function getShapeDef():b2ShapeDef {
			shapeDef = new b2PolygonDef();
			b2PolygonDef(shapeDef).vertexCount = 4;
			var x:Number = location.x * PhysicalWorld.MIN_SQARE / PhysicalWorld.RATIO;
			var y:Number = location.y * PhysicalWorld.MIN_SQARE / PhysicalWorld.RATIO;
			var w:Number = width / PhysicalWorld.RATIO;
			var h:Number = height / PhysicalWorld.RATIO;
			var h2:Number = height2 / PhysicalWorld.RATIO;
			b2Vec2(b2PolygonDef(shapeDef).vertices[0]).Set(x, y);
			b2Vec2(b2PolygonDef(shapeDef).vertices[1]).Set(w + x, y-h2);
			b2Vec2(b2PolygonDef(shapeDef).vertices[2]).Set(w + x, h + y);
			b2Vec2(b2PolygonDef(shapeDef).vertices[3]).Set(x, h + y);
			return shapeDef;
		}
		
		override public function getSimpleSprite(location:Point):Sprite {
			var sprite:Sprite = new Sprite();
			var color:uint = Math.random() * 0x00FF00;
			sprite.graphics.lineStyle(2, color);
			sprite.graphics.beginFill(color + Math.random() * 0x00FF00);
			sprite.graphics.drawRect(0, 0, width, height);
			sprite.graphics.endFill();
			return sprite;
		}
	}
}