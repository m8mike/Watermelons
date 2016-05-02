package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class StaticBodyBuilder extends BodyBuilder {
		
		public function StaticBodyBuilder() {
			density = 0;
			groupIndex = -2;
			friction = 1;//0.2
			restitution = 0.3;
		}
	
	}

}