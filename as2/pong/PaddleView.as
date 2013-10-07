import util.*;
import mvc.*;
import pong.*;

/*
 * Class to display the pong paddle.
 */
class pong.PaddleView extends AbstractView {
	
	// Movie clip references
	private var target_mc:MovieClip;
	private var paddle_mc:MovieClip;
	
	private var color = 0x00FF00;
	
	/*
	 * Constructor
	 */
	public function PaddleView(m:Observable, c:Controller, target:MovieClip, depth:Number) {
		// invoke superconstructor, which sets up mvc relationships.
		// This view has no user input, so no controller is required.
		super(m, c);
		
		// Debug:
		//trace ("pong.PaddleView.PaddleView()");
		
		target_mc = target;
		
		// create the field
		makePaddle(target, depth);
	}
	
	/*
	 * Creates the movie clip instance that will display the Pong paddle.
	 */
	private function makePaddle(target:MovieClip, depth:Number):Void {
		// Debug:
		//trace ("pong.PaddleView.makePaddle()");
		
		// create an empty movieClip
		paddle_mc = target_mc.createEmptyMovieClip("paddle_mc"+depth, depth);
		
		// draw the paddle
		paddle_mc.lineStyle(PaddleModel(getModel()).getWidth(), color);
		paddle_mc.moveTo(0, 0);
		paddle_mc.lineTo(0, PaddleModel(getModel()).getHeight());
						
		// position the paddle
		paddle_mc._x = PaddleModel(getModel()).getXPos();
		paddle_mc._y = PaddleModel(getModel()).getYPos();
	}
	
	/*
	 * returns the paddle movieclip of this paddle view
	 */
	public function getPaddleMC():MovieClip{
		return paddle_mc;
	}
	
	/*
	 * updates this paddle
	 */
	public function update():Void {
		// Debug:
		//trace ("pong.PaddleView.update()");
		if (PaddleModel(getModel()).getType() == "AI"){
			AIPaddleModel(getModel()).movePaddle();
		}
		this.paddle_mc._y = PaddleModel(getModel()).getYPos() - PaddleModel(getModel()).getHeight()/2;
	}
	
	/*
	 * destroys this paddle view
	 */
	public function destroy():Void {
		paddle_mc.removeMovieClip();
	}
}