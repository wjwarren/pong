import util.*;
import mvc.*;
import pong.*;

/*
 * Class to display the pong player.
 */
class pong.PlayerView extends AbstractView {
	
	// Movie clip references
	private var target_mc:MovieClip;
	private var player_mc:MovieClip;
	private var player_name_txt:TextField;
	private var player_score_txt:TextField;
	private var lifes:Array = new Array();
	private var scoreFormat:TextFormat;
	private var playerFormat:TextFormat;
			
	private var color = 0x00FF00;
	
	/*
	 * Constructor
	 */
	public function PlayerView(m:Observable, c:Controller, target:MovieClip, depth:Number) {
		// invoke superconstructor, which sets up mvc relationships.
		// This view has no user input, so no controller is required.
		super(m, c);
		
		// Debug:
		//trace ("pong.PlayerView.PlayerView()");
		
		target_mc = target;
		
		// create the player
		makePlayer(target, depth);
	}
	
	/*
	 * Creates the movie clip instance that will display the Pong player.
	 */
	private function makePlayer(target:MovieClip, depth:Number):Void {
		// Debug:
		//trace ("pong.PlayerView.makePlayer()");
		
		// create an empty movieClip
		player_mc = target_mc.createEmptyMovieClip("player_mc"+depth, depth);
		
		// player name
		player_mc.createTextField("player_txt", 1, 0, 0, 0, 0);
		player_name_txt = player_mc.player_txt;
		player_name_txt.text = PlayerModel(getModel()).getName();
		
		playerFormat = new TextFormat ();
		playerFormat.size = 18;
		playerFormat.font = "Arial";
		playerFormat.color = color;
		
		player_name_txt.setTextFormat(playerFormat);
		player_name_txt.autoSize = "left";
		player_name_txt.textColor = color;
		player_name_txt.background = false;
		
		// player score
		player_mc.createTextField("score_txt", 2, 0, 50, 0, 0);
		player_score_txt = player_mc.score_txt;
		player_score_txt.text = PlayerModel(getModel()).getScore().toString();
		player_score_txt.autoSize = "left";
		player_score_txt.background = false;
		
		scoreFormat = new TextFormat ();
		scoreFormat.size = 72;
		scoreFormat.font = "Arial";
		scoreFormat.color = color;
		player_score_txt.setTextFormat(scoreFormat);
		
		
		
		// player lifes, depends on AI or human
		if(PlayerModel(getModel()).getType() == "human"){
			var life:Number = PlayerModel(getModel()).getLifes();
			//trace ("Lifes: " + life.toString() );
			for (var i = 0; i < life; i++){
				lifes[i] = player_mc.createEmptyMovieClip("life"+i, i*123 + 123);
				lifes[i].moveTo(0+20*i, 266);
				lifes[i].beginFill(color);
				lifes[i].lineTo(10+20*i, 266);
				lifes[i].lineTo(10+20*i, 276);
				lifes[i].lineTo(0+20*i, 276);
				lifes[i].lineTo(0+20*i, 266);
				lifes[i].endFill();
				if (i == life - 1){
					lifes[i]._alpha = 50;
				}
			}
		}
		
		// position this player
		player_mc._x = PlayerModel(getModel()).getXPos();
		player_mc._y = PlayerModel(getModel()).getYPos();
	}
	
	/*
	 * updates this player view.
	 */
	public function update():Void {
		// Debug:
		//trace ("pong.PlayerView.update()");
		
		player_score_txt.text = PlayerModel(getModel()).getScore().toString();
		player_score_txt.setTextFormat(scoreFormat);
		lifes[PlayerModel(getModel()).getLifes()-1]._alpha = 50;
	}
	
	/*
	 * destroys this player view
	 */
	public function destroy():Void {
		for (var i = 0; i < lifes.length; i++){
			lifes[i].removeMovieClip();
		}
		player_mc.removeMovieClip();
	}
}