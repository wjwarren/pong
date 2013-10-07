import pong.*;

/*
 * Represents the data of the paddle for pong, used by a human.
 */
class pong.HumanPaddleModel extends PaddleModel {
	
	/*
	 * Constructor
	 */
	public function HumanPaddleModel(x:Number, y:Number, w:Number, h:Number) {
		
		super(x, y, w, h);
		
		//Debug:
		//trace("pong.HumanPaddleModel.HumanPaddleModel()");
	}
	
}