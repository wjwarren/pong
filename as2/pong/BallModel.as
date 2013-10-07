import util.Observable;
import pong.*;

/*
 * Represents the data of the ball for pong.
 */
class pong.BallModel extends Observable {
	
	// instance variables:
	private var init_xPos:Number;
	private var init_yPos:Number;
	private var xPos:Number;
	private var yPos:Number;
	private var width:Number;
	private var height:Number;
	
	//private var running:Boolean = true;
	private var xSpeed:Number;
	private var ySpeed:Number;
	private var fps:Number;
	private var speed:Number;
	private var speedMultiplier:Number = 1;
	private var bounceSound:Sound;
	private var missedSound:Sound;
	
	private var missed:String = "";
	
	/*
	 * Constructor
	 */
	public function BallModel(x:Number, y:Number, w:Number, h:Number, speedMultiply:Number) {
		//Debug:
		//var my_date:Date = new Date();
		//trace(my_date.getHours().toString() + ":" + my_date.getMinutes().toString() + ":" + my_date.getSeconds().toString() + ":" + my_date.getMilliseconds().toString() + " pong.BallModel.BallModel()");
		
		init_xPos = x;
		init_yPos = y;
		speedMultiplier += speedMultiply;
		setXPos(x);
		setYPos(y);
		setWidth(w);
		setHeight(h);
		/*bounceSound = new Sound(_level0.ball_mc);
		bounceSound.attachSound("boing");
		bounceSound.setVolume(1);*/
		missedSound = new Sound(_level0.pongField_mc);
		missedSound.attachSound("missed");
		missedSound.setVolume(100);
	}
	
	/*
	 * Returns the X position of this ball
	 */
	public function getXPos():Number{
		//Debug:
		//trace("pong.BallModel.getXPos()");
		
		return xPos;
	}
	
	/*
	 * Returns the Y position of this ball
	 */
	public function getYPos():Number{
		//Debug:
		//trace("pong.BallModel.getYPos()");
		
		return yPos;
	}
	
	/*
	 * Sets the X position of this ball
	 * Notify observers
	 */
	public function setXPos(x:Number):Void{
		//Debug:
		//trace("pong.BallModel.setXPos()");
		
		if (x != null){
			xPos = x;
			setChanged();
			notifyObservers();
		}
	}
	
	/*
	 * Sets the Y position of this ball
	 * Notify observers
	 */
	public function setYPos(y:Number):Void{
		//Debug:
		//trace("pong.BallModel.setYPos()");
		
		if (y != null){
			yPos = y;
			setChanged();
			notifyObservers();
		}
	}
	
	/*
	 * Returns the width of this ball
	 */
	public function getWidth():Number{
		//Debug:
		//trace("pong.BallModel.getWidth()");
		
		return width;
	}
	
	/*
	 * Returns the height of this ball
	 */
	public function getHeight():Number{
		//Debug:
		//trace("pong.BallModel.getHeight()");
		
		return height;
	}
	
	/*
	 * Sets the width of this ball
	 * Notify observers
	 */
	public function setWidth(w:Number):Void{
		//Debug:
		//trace("pong.BallModel.setWidth()");
		
		if (w != null){
			width = w;
			setChanged();
			notifyObservers();
		}
	}
	
	/*
	 * Sets the height of this ball
	 * Notify observers
	 */
	public function setHeight(h:Number):Void{
		//Debug:
		//trace("pong.BallModel.setHeight()");
		
		if (h != null){
			height = h;
			setChanged();
			notifyObservers();
		}
	}
	
	/*
	 * Returns who missed the ball
	 */
	public function getMissed():String {
		return missed;
	}
	
	/*
	 * Returns the X speed
	 */
	public function getXSpeed():Number {
		return xSpeed;
	}
	
	/*
	 * function to set the speed of the ball.
	 * if it's too vertical or horizontal, create an new one.
	 */
	private function setSpeed(){
		//Debug:
		//trace("pong.BallModel.setSpeed()");
		xSpeed = ((Math.random()*8 + 4) / 4)*-1;
		ySpeed = (Math.random()*8 + 4) / 4;
		
		// reverse the number from + to - or - to + so that the actual angle cartesian coordinates are used
		var alpha:Number = Math.atan((ySpeed*-1) / xSpeed)/(Math.PI/180);
		trace("alpha: " + alpha.toString());
		
		if (alpha < 20){
			//speed = setInterval(this, "setSpeed", 10);
			setSpeed();
		}
		if (alpha > 70){
			//speed = setInterval(this, "setSpeed", 10);
			setSpeed();
		}
		
		var sign:Number =  Math.random();
		if (sign < 0.5){
			ySpeed *= -1;
		}
		
		// don't shoot balls under a too steep angle...
		
		
		/*
		
		
		//clearInterval(speed);
		//Debug:
		;*/
	}
	
	/*
	 * Starts the ball moving
	 */
	public function start():Void {
		//Debug:
		//trace("pong.BallModel.start()");
		
		setSpeed();
		fps = setInterval(this, "moveBall", 10);
			
		//setChanged();
		//notifyObservers();
	}
	
	/*
	 * Used to stop teh ball moving.
	 */
	public function stop():Void {
		//Debug:
		//trace("pong.BallModel.stop()");
		clearInterval(fps);
		xPos = init_xPos;
		yPos = init_yPos;
		missed = "";
		this.start();
	}
	
	/*
	 * Function that moves the ball
	 */
	public function moveBall():Void {
		//Debug:
		//var my_date:Date = new Date();
		//trace(my_date.getHours().toString() + ":" + my_date.getMinutes().toString() + ":" + my_date.getSeconds().toString() + ":" + my_date.getMilliseconds().toString() + " pong.BallModel.moveBall()");

		if (xPos < (155 + getWidth()) || xPos > (482 - getWidth()) ) {
			if (_level0.ball_mc.hitTest(_level0.paddle_mc90)){
				trace("AI Hit!!!");
				//bounceSound.start(0,1);
				inverseX();
				xSpeed *= speedMultiplier;
				ySpeed *= speedMultiplier;
			}
			else {
				if (xPos < 155) {
					trace("AI Missed!!!");
					missedSound.start(0,1);
					missed = "AI";
					setChanged();
					notifyObservers();
					this.stop();
					
				}
			}
			if (_level0.ball_mc.hitTest(_level0.paddle_mc95)){
				trace("Human Hit!!!");
				//bounceSound.start(0,1);
				inverseX();
				xSpeed *= 1.1;
				ySpeed *= 1.1;
			}
			else {
				if (xPos > (482 - getWidth()) ){
					trace("Human Missed!!!");
					missedSound.start(0,1);
					missed = "human";
					setChanged();
					notifyObservers();
					this.stop();
					
				}
			}
			
		}
		if (_level0.ball_mc.hitTest(_level0.pongField_mc.top_border) || _level0.ball_mc.hitTest(_level0.pongField_mc.bottom_border) /*yPos < (50 + getHeight()/2) || yPos > (309 - getHeight()/2)*/ ) {
			//bounceSound.start(0,1);
			inverseY();
		}
		setXPos(xPos + xSpeed);
		setYPos(yPos + ySpeed);
		//xPos += xSpeed;
		//yPos += ySpeed;
	}
	
	/*
	 * Inverses the X direction of the ball
	 */
	public function inverseX():Void {
		//Debug:
		//trace("pong.BallModel.inverseX()");
		xSpeed *= -1;
	}
	
	/*
	 * Inverses the Y direction of the ball
	 */
	public function inverseY():Void {
		//Debug:
		//trace("pong.BallModel.inverseY()");
		ySpeed *= -1;
	}
}