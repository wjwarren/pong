import util.Observable;
import pong.*;

/*
 * Represents the data of the player for pong.
 */
class pong.PlayerModel extends Observable {
	
	// instance variables:
	//private var player:PlayerModel;
	private var xPos:Number;
	private var yPos:Number;
	private var playerName:String;
	//private var playerDifficulty:Level;
	private var playerScore:Number;
	private var playerLifes:Number;
	private var playerType:String;
	
	/*
	 * Constructor
	 */
	public function PlayerModel(x:Number, y:Number, pName:String, type:String, lifes:Number) {
		//Debug:
		//trace("pong.PlayerModel.PlayerModel()");
		
		xPos = x;
		yPos = y;
		playerName = pName;
		//playerDifficulty = level;
		setScore(0);
		setLifes(lifes);
		playerType = type;
	}
	
	/*
	 * Function to get the name of this player
	 */
	public function getName():String {
		//Debug:
		//trace("pong.PlayerModel.getName()");
		
		return playerName;
	}
	
	/*
	 * Function to get the level of this player
	 
	public function getDifficulty():Level {
		//Debug:
		//trace("pong.PlayerModel.getLevel()");
		
		return playerDifficulty;
	}*/
	
	/*
	 * Function to get the score of this player
	 */
	public function getScore():Number {
		//Debug:
		//trace("pong.PlayerModel.getScore()");
		
		return playerScore;
	}
	
	/*
	 * Function to get the X position of this player
	 */
	public function getXPos():Number {
		//Debug:
		//trace("pong.PlayerModel.getXpos()");
		
		return xPos;
	}
	
	/*
	 * Function to get the Y position of this player
	 */
	public function getYPos():Number {
		//Debug:
		//trace("pong.PlayerModel.getYpos()");
		
		return yPos;
	}
		
	/*
	 * Function to set the score of this player
	 */
	public function setScore(score:Number):Void {
		//Debug:
		//trace("pong.PlayerModel.setScore()");
		
		playerScore = score;
		setChanged();
		notifyObservers();
	}
	
	/*
	 * Function to get the number of lifes of this player
	 */
	public function getLifes():Number {
		//Debug:
		//trace("pong.PlayerModel.getLifes()");
		
		return playerLifes;
	}
	
	/*
	 * Function to set the the number of lifes of this player
	 */
	public function setLifes(l:Number):Void {
		//Debug:
		//trace("pong.PlayerModel.setLifes()");
		
		playerLifes = l;
		setChanged();
		notifyObservers();
	}
	
	/*
	 * Function to get the type of this player
	 */
	public function getType():String {
		//Debug:
		//trace("pong.PlayerModel.getType()");
		
		return playerType;
	}
}