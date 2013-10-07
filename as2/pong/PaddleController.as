import pong.PaddleModel;
import util.*;
import mvc.*;

/*
 * Makes changes to the position of the paddle and launches a ball, based on
 * user input.
 */
class pong.PaddleController extends AbstractController {
	
	/*
	 * Constructor
	 */
	public function PaddleController(pm:Observable) {
		super(pm);
		
		Mouse.addListener(this);
		
		//Debug:
		//trace("pong.PaddleController.PaddleController()");
	}
	
	/*
	 * Handles mouse click events of the PaddleView.
	 */
	public function onMouseDown ():Void {
		//Debug:
		//trace("pong.PaddleController.onMouseDown()");
	}
	
	/*
	 * Handles mouse movement events of the PaddleView.
	 */
	public function onMouseMove ():Void {
		//Debug:
		//trace("pong.PaddleController.onMouseMove()");
		PaddleModel(getModel()).setYPos(_root._ymouse);
	}
	
}