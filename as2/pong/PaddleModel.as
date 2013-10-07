import util.Observable;
import pong.*;

/*
 * Represents the data of the paddle for pong.
 */
class pong.PaddleModel extends Observable {
	
	// instance variables:
	//private var player:PlayerModel;
	private var xPos:Number;
	private var yPos:Number;
	private var width:Number;
	private var height:Number;
	private var type:String;
	
	/*
	 * Constructor
	 */
	public function PaddleModel(x:Number, y:Number, w:Number, h:Number) {
		//Debug:
		//trace("pong.PaddleModel.PaddleModel()");
		
		setXPos(x);
		setYPos(y);
		setWidth(w);
		setHeight(h);
	}
	
	/*
	 * Returns the X position of this paddle
	 */
	public function getXPos():Number{
		//Debug:
		//trace("pong.PaddleModel.getXPos()");
		
		return xPos;
	}
	
	/*
	 * Returns the Y position of this paddle
	 */
	public function getYPos():Number{
		//Debug:
		//trace("pong.PaddleModel.getYPos()");
		
		return yPos;
	}
	
	/*
	 * Sets the X position of this paddle
	 * Notify observers
	 */
	public function setXPos(x:Number):Void{
		//Debug:
		//trace("pong.PaddleModel.setXPos()");
		
		if (x != null){
			xPos = x;
			setChanged();
			notifyObservers();
		}
	}
	
	/*
	 * Sets the Y position of this paddle
	 * Notify observers
	 */
	public function setYPos(y:Number):Void{
		//Debug:
		//trace("pong.PaddleModel.setYPos()");
		
		if (y != null){
			if(y > 51 + getHeight()/2 && y < 303 - getHeight()/2){
				yPos = y;
				setChanged();
				notifyObservers();
			}
			else {
			}
		}
	}
	
	/*
	 * Returns the width of this paddle
	 */
	public function getWidth():Number{
		//Debug:
		//trace("pong.PaddleModel.getWidth()");
		
		return width;
	}
	
	/*
	 * Returns the height of this paddle
	 */
	public function getHeight():Number{
		//Debug:
		//trace("pong.PaddleModel.getHeight()");
		
		return height;
	}
	
	/*
	 * Sets the width of this paddle
	 * Notify observers
	 */
	public function setWidth(w:Number):Void{
		//Debug:
		//trace("pong.PaddleModel.setWidth()");
		
		if (w != null){
			width = w;
			setChanged();
			notifyObservers();
		}
	}
	
	/*
	 * Sets the height of this paddle
	 * Notify observers
	 */
	public function setHeight(h:Number):Void{
		//Debug:
		//trace("pong.PaddleModel.setHeight()");
		
		if (h != null){
			height = h;
			setChanged();
			notifyObservers();
		}
	}
	
	/*
	 * Returns the type of this paddle
	 */
	public function getType():String{
		//Debug:
		//trace("pong.PaddleModel.getType()");
		
		return type;
	}
	
}