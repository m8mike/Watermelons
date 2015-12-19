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
	public class HexShape extends MyShape {
		public var radius:Number;
		
		public function HexShape(radius:Number) {
			this.radius = radius;
		}
		
		override public function getShapeDef():b2ShapeDef {
			shapeDef = new b2PolygonDef();
			b2PolygonDef(shapeDef).vertexCount = 6;
			var x:Number = location.x * PhysicalWorld.MIN_SQARE / PhysicalWorld.RATIO;
			var y:Number = location.y * PhysicalWorld.MIN_SQARE / PhysicalWorld.RATIO;
			var r:Number = radius / PhysicalWorld.RATIO;
			/*b2Vec2(b2PolygonDef(shapeDef).vertices[0]).Set(x+0.5*r, y-r*Math.sqrt(3)/2);
			b2Vec2(b2PolygonDef(shapeDef).vertices[1]).Set(x+r, y);
			b2Vec2(b2PolygonDef(shapeDef).vertices[2]).Set(x+0.5*r, y+r*Math.sqrt(3)/2);
			b2Vec2(b2PolygonDef(shapeDef).vertices[3]).Set(x-0.5*r, y+r*Math.sqrt(3)/2);
			b2Vec2(b2PolygonDef(shapeDef).vertices[4]).Set(x-r, y);
			b2Vec2(b2PolygonDef(shapeDef).vertices[5]).Set(x-0.5*r, y-r*Math.sqrt(3)/2);*/
			b2Vec2(b2PolygonDef(shapeDef).vertices[0]).Set(x-r*Math.sqrt(3)/2, y-0.5*r);
			b2Vec2(b2PolygonDef(shapeDef).vertices[1]).Set(x, y-r);
			b2Vec2(b2PolygonDef(shapeDef).vertices[2]).Set(x+r*Math.sqrt(3)/2, y-0.5*r);
			b2Vec2(b2PolygonDef(shapeDef).vertices[3]).Set(x+r*Math.sqrt(3)/2, y+0.5*r);
			b2Vec2(b2PolygonDef(shapeDef).vertices[4]).Set(x, y+r);
			b2Vec2(b2PolygonDef(shapeDef).vertices[5]).Set(x-r*Math.sqrt(3)/2, y+0.5*r);
			return shapeDef;
		}
	}
}