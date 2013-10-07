import pong.*;

/*
 * Represents the data of the paddle for pong, used by the PC.
 */
class pong.AIPaddleModel extends PaddleModel {
	
	private var type:String = "AI";
	private var maxSpeed:Number;
	private var ball:BallModel;
	
	/*
	 * Constructor
	 */
	public function AIPaddleModel(x:Number, y:Number, w:Number, h:Number, speed:Number, b:BallModel) {
		
		super(x, y, w, h);
		
		//Debug:
		//trace("pong.AIPaddleModel.AIPaddleModel()");
		ball = b;
		movePaddle();
		maxSpeed = speed / 2;
	}
	
	/*
	 * Get some life in this AI paddle.
	 */
	public function movePaddle():Void {
		//Debug:
		//trace("pong.AIPaddleModel.movePaddle()");
		var target:Number;
		
		if (ball.getXSpeed() > 0){
			// move to the middle
			target = 177;
		}
		else {
			// follow the ball
			target = _level0.ball_mc._y;
		}
		if (Math.abs( target - this.getYPos() ) <= maxSpeed){
			//setYPos(target);	
			// do nothing...
		}
		if (target - this.getYPos() > maxSpeed){
			//setYPos(this.getYPos() + maxSpeed);
			target = this.getYPos() + maxSpeed;
		}
		if (target - this.getYPos() < maxSpeed*-1){
			//setYPos(this.getYPos() - maxSpeed);
			target = this.getYPos() - maxSpeed;
		}
		setYPos(target);
	}
	
}