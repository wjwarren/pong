import util.*;
import mvc.*;
import pong.*;

/*
 * Class to display the pong ball.
 */
class pong.BallView extends AbstractView {
	
	// Movie clip references
	private var target_mc:MovieClip;
	private var ball_mc:MovieClip;
			
	private var color = 0x00FF00;
	
	/*
	 * Constructor
	 */
	public function BallView(m:Observable, c:Controller, target:MovieClip, depth:Number) {
		// invoke superconstructor, which sets up mvc relationships.
		// This view has no user input, so no controller is required.
		super(m, c);
		
		// Debug:
		//trace ("pong.BallView.BallView()");
		
		target_mc = target;
		
		// create the ball
		makeBall(target, depth);
	}
	
	/*
	 * Creates the movie clip instance that will display the Pong ball.
	 */
	private function makeBall(target:MovieClip, depth:Number):Void {
		// Debug:
		//trace ("pong.BallView.makeBall()");
		
		// create an empty movieClip
		ball_mc = target_mc.createEmptyMovieClip("ball_mc", depth);
		
		// draw the ball.
		ball_mc.moveTo(0, 0);
		ball_mc.beginFill(color);
		ball_mc.lineTo(BallModel(getModel()).getWidth(), 0);
		ball_mc.lineTo(BallModel(getModel()).getWidth(), BallModel(getModel()).getHeight());
		ball_mc.lineTo(0, BallModel(getModel()).getHeight());
		ball_mc.lineTo(0, 0);
		ball_mc.endFill();
		
		// position it.
		ball_mc._x = BallModel(getModel()).getXPos();
		ball_mc._y = BallModel(getModel()).getYPos();
		
		//setInterval(BallModel(getModel()).run, 40)
	}
	
	/*
	 * returns the ball movieclip of this paddle view
	 */
	public function getBallMC():MovieClip{
		return ball_mc;
	}
	
	/*
	 * updates this ball view.
	 */
	public function update():Void {
		// Debug:
		//trace ("pong.BallView.update()");
		
		ball_mc._x = BallModel(getModel()).getXPos();
		ball_mc._y = BallModel(getModel()).getYPos();
	}
	
	/*
	 * destroys this ball view
	 */
	public function destroy():Void {
		ball_mc.removeMovieClip();
	}
}