import pong.*;

/*
 * Pong.
 */
class pong.Pong {
	
	//models:
	private var human_paddle_model:HumanPaddleModel;
	private var ai_paddle_model:AIPaddleModel;
	
	private var human_player_model:PlayerModel;
	private var ai_player_model:PlayerModel;
	
	private var ball_model:BallModel;
	
	private var pong_field_model:PongFieldModel;
	
	//views:
	private var pong_field_view:PongFieldView;
	
	private var human_paddle_view:PaddleView;
	private var ai_paddle_view:PaddleView;
	
	private var human_player_view:PlayerView;
	private var ai_player_view:PlayerView;
	
	private var ball_view:BallView;
	
	
	//controllers:
	private var paddle_controller:PaddleController;
	
	/*
	 * Constructor
	 */
	public function Pong(target:MovieClip) {
		// Debug:
		//trace ("pong.Pong.Pong()");
		
		// create the Pong models:
		ball_model = new BallModel(450, 150, 10, 10, _level0.paddleSpeed/10);
				
		human_paddle_model = new HumanPaddleModel(486, 200, 8, 60);
		ai_paddle_model = new AIPaddleModel(159, 150, 8, 60, _level0.paddleSpeed, ball_model);
		
		human_player_model = new PlayerModel(505, 35, _level0.playerName, "human", 5);
		ai_player_model = new PlayerModel(10, 35, _level0.aiName, "AI", 0);
		
		pong_field_model = new PongFieldModel(ai_player_model, human_player_model, ball_model);
		
		
		// create the Pong controllers:
		paddle_controller = new PaddleController(human_paddle_model);
		
		
		// create the Pong views:
		pong_field_view = new pong.PongFieldView (undefined, undefined, target, 100, 0, 0);
		
		human_paddle_view = new PaddleView(human_paddle_model, paddle_controller, target, 95);
		ai_paddle_view = new PaddleView(ai_paddle_model, undefined, target, 90);
		
		human_player_view = new PlayerView(human_player_model, undefined, target, 85);
		ai_player_view = new PlayerView(ai_player_model, undefined, target, 80);
		
		ball_view = new BallView(ball_model, undefined, target, 70);
		
		
		// add observers:
		human_paddle_model.addObserver(human_paddle_view);
		//ai_paddle_model.addObserver(ai_paddle_view);
		
		human_player_model.addObserver(human_player_view);
		ai_player_model.addObserver(ai_player_view);
		
		ball_model.addObserver(ball_view);
		ball_model.addObserver(ai_paddle_view);
		ball_model.addObserver(pong_field_model);
				
		
		// start the ball.
		ball_model.start();
				
	}
	
	/*
	 * returns the score of the human player
	 */
	public function getHumanScore():Number{
		return human_player_model.getScore();
	}
	
	/*
	 * returns the score of the AI player
	 */
	public function getAIScore():Number{
		return ai_player_model.getScore();
	}
	
	/*
	 * returns the name of the human player
	 */
	public function getHumanName():String{
		return human_player_model.getName();
	}
	
	/*
	 * Delete all movieclips from the stage
	 */
	public function destroy():Void {
		// Debug:
		//trace ("pong.Pong.destroy()");
		
		// remove observers
		human_paddle_model.clearObservers();
		human_player_model.clearObservers();
		ai_player_model.clearObservers();
		ball_model.clearObservers();
		
		pong_field_view.destroy();
		human_paddle_view.destroy();
		ai_paddle_view.destroy();
		human_player_view.destroy();
		ai_player_view.destroy();
		ball_view.destroy();
		
		// delete all instances
		delete human_paddle_model;
		delete ai_paddle_model;
		delete ball_model;
		delete pong_field_model;
		delete paddle_controller;
		delete pong_field_view;
		delete human_paddle_view;
		delete ai_paddle_view;
		delete human_player_view;
		delete ai_player_view;
		delete ball_view;
	}
	
	/*
	 * System entry point. Starts the Pong application running.
	 */
	public static function main(target:MovieClip):Pong {
		// Debug:
		//trace ("pong.Pong.main()");
		
		var pong = new pong.Pong (target);
		return pong;
	}
}