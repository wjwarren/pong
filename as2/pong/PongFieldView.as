import util.*;
import mvc.*;

/*
 * Class to display the pong field.
 */
class pong.PongFieldView extends AbstractView {
	
	// Movie clip references
	private var target_mc:MovieClip;
	private var pongField_mc:MovieClip;
	private var top_border_mc:MovieClip;
	private var bottom_border_mc:MovieClip;
	
	private var color:Number = 0x00FF00;
	private var width:Number = 6;
	
	/*
	 * Constructor
	 */
	public function PongFieldView(m:Observable, c:Controller, target:MovieClip, depth:Number, x:Number, y:Number) {
		// invoke superconstructor, which sets up mvc relationships.
		// This view has no user input, so no controller is required.
		super(m, c);
		
		// Debug:
		//trace ("pong.PongFieldView.PongFieldView()");
		
		target_mc = target;
		
		// create the field
		makePongField(depth, x, y);
	}
	
	/*
	 * Creates the movie clip instance that will display the Pong field.
	 */
	private function makePongField(depth:Number, x:Number, y:Number):Void {
		// Debug:
		//trace ("pong.PongFieldView.makeField()");
		
		// create an empty movieClip
		pongField_mc = target_mc.createEmptyMovieClip("pongField_mc", depth);
		
		/*
		// draw the field
		target_mc.pongField_mc.lineStyle(6, color);
		target_mc.pongField_mc.moveTo(150, 47);
		target_mc.pongField_mc.lineTo(490, 47);
		target_mc.pongField_mc.moveTo(150, 306);
		target_mc.pongField_mc.lineTo(490, 306);
		*/
		// top border:
		top_border_mc = pongField_mc.createEmptyMovieClip("top_border", depth+1);
		top_border_mc.lineStyle(6, color);
		top_border_mc.lineTo(340, 0);
		top_border_mc._x = 150;
		top_border_mc._y = 47;
		// bottom border:
		bottom_border_mc = pongField_mc.createEmptyMovieClip("bottom_border", depth+2);
		bottom_border_mc.lineStyle(6, color);
		bottom_border_mc.lineTo(340, 0);
		bottom_border_mc._x = 150;
		bottom_border_mc._y = 306;
		
		// releasedate:
		pongField_mc.createTextField("releasedate_txt", 1, 150, 350, 0, 0);
		pongField_mc.releasedate_txt.text = "Release: 2005.09.15.11.01";
		pongField_mc.releasedate_txt.autoSize = "left";
		pongField_mc.releasedate_txt.textColor = color;
		pongField_mc.releasedate_txt.background = false;
		
		// position the field
		pongField_mc._x = x;
		pongField_mc._y = y;
	}
	
	/*
	 * destroys this player view
	 */
	public function destroy():Void {
		top_border_mc.removeMovieClip();
		bottom_border_mc.removeMovieClip();
		pongField_mc.removeMovieClip();
	}
}