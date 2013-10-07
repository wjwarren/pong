import util.*;
//import mvc.*;
import pong.*;

/*
 * class that manages player scores
 */
class PongFieldModel implements Observer {
	
	// reverences to players
	private var AI_player:PlayerModel;
	private var human_player:PlayerModel;
	
	// the ball
	private var ball:BallModel;
	
	/*
	 * constructor
	 */
	public function PongFieldModel(ai:PlayerModel, human:PlayerModel, ball:BallModel){
		AI_player = ai;
		human_player = human;
		this.ball = ball;
	}
	
	/*
	 * updates player scores
	 */
	public function update(o:Observable, infoObj:Object):Void{
		// Debug:
		//trace ("pong.PongFieldModel.update()");
		if (ball.getMissed() == "AI"){
			human_player.setScore(human_player.getScore() + 1);
			human_player.setLifes(human_player.getLifes() - 1);
		}
		if (ball.getMissed() == "human"){
			AI_player.setScore(AI_player.getScore() + 1);
			human_player.setLifes(human_player.getLifes() - 1);
		}
		if (human_player.getLifes() <= 0){
			//clean up
			_level0.gotoAndStop(20);
			//loadMovie("gameover.swf", _level0.game_over);
		}
	}
	
}