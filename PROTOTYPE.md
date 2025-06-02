
# Technical Details:

**Descriptions**
<ul>
	<li> Piece Class (abstract) <ul>
		<li>Methods<ul>
			<li>void move(int[] newPos): pieces will call this function to move to the newPos position, set position to newPos, set all pawns enPassant to false.</li>
			<li>ArrayList<int[]> getLegalMoves: returns an ArrayList of int[] of allowable positions (new)</li> 
			<li>void capture(Piece other): called in move if canCapture, sets other's alive variable to false</li>
			<li>boolean canMove(int[] newPos): checks if newPos is an available square (and player is not in check or is in check but piece can do something) OR canCapture </li>
			<li>boolean canCapture(int[] newPos): checks if there is an opposing piece on newPos (and player is not in check but piece can take the opposing piece giving the check)</li>
			<li>boolean canCapture(Piece other): checks if other's position is reachable by piece in one move</li>
			<li>void applyCheck(King other): checks if piece canCapture other; if so, set inCheck to true for other.</li>
			<li>boolean isAlive(): return alive</li>
			<li>void setAlive(boolean life): sets the alive status of the piece to life (new)</li> 
			<li>int[] getPos(): returns the current position of the piece</li>
			<li>void[] setPos(int[] newPos): sets the position of the piece to newPos (new) </li>
			<li>String getType(): returns the type of the piece</li>
			<li>void[] setType(String type): sets the type of the piece to newPos (new)</li>
			<li>boolean getCheckStatus(): returns if the piece's king is currently in check.</li>
			<li>void setCheckStatus(boolean status): sets inCheck to status (new)</li>
			<li>boolean side(): returns which side the piece is on (i.e. if it's on the shiny side, it will return true, else false)</li>
			<li>void setSide(boolean side): sets the side the piece is on (new)</li>
			<li>boolean getCanBeEnPassanted(): returns false (this is so the pawn method becomes inherited and so Piece x = new Pawn() can use the method) (new)</li>
			<li>void setCanBeEnPassanted(boolean canBe): (this is so the pawn method becomes inherited and so Piece x = new Pawn() can use the method) (new)</li>
		</ul></li>
  		<li>Instance Variables<ul>
			<li>boolean alive</li>
			<li>int[] position (note: coordinates stored here will be one-digit, behaving as if it is 8x8 not 800x800)</li>
			<li>String type</li>
			<li>boolean inCheck</li>
			<li>boolean shinySide</li>
		</ul></li>
	</ul></li>
	<li> King Class (extended from piece) <ul>
		<li>Child-Specific/Overridden Methods<ul>
			<li>void castle(): if canMove & canCastle, updates the king and rook (that canCastle) positions to castle. </li>
			<li>void applyCheck(): if inCheck, set all other pieces that are on the same side of you to have inCheck as true.</li>
			<li>boolean castleStatus(): return canCastle</li>
		</ul></li>
  		<li>Instance Variables<ul>
			<s><li>boolean alive</li>
			<li>int[] position (note: coordinates stored here will be one-digit, behaving as if it is 8x8 not 800x800)</li>
			<li>String type</li>
			<li>boolean inCheck</li>
			<li>boolean shinySide</li></s>
			<li>boolean canCastle</li>
		</ul></li>
	</ul></li>
	<li> Rook Class (extended from piece) <ul>
		<li>Child-Specific/Overridden Methods<ul>
			<li>when move() is run, it will set canCastle to false</li>
			<li>boolean castleStatus(): return canCastle</li>
		</ul></li>
  		<li>Instance Variables<ul>
			<s><li>boolean alive</li>
			<li>int[] position (note: coordinates stored here will be one-digit, behaving as if it is 8x8 not 800x800)</li>
			<li>String type</li>
			<li>boolean inCheck</li>
			<li>boolean shinySide</li></s>
			<li>boolean canCastle</li>
		</ul></li>
	</ul></li>
	<li> Pawn Class (extended from piece) <ul>
		<li>Child-Specific/Overridden Methods<ul>
			<s><li>void setEnPassantStatus(int[] newPos): if newPos is two steps from its original position, then set enPassant and timeFrame to true</li>
			<li>boolean canCapture(int[] newPos): if there is a pawn under the newPos that has enPassant as true and newPos is available, return true</li>
			<li>boolean canBeEnPassanted(): return enPassant (if the piece can be enPassanted)</li></s>
			<li>boolean getCanBeEnPassanted(): returns canBeEnPassanted (new)</li>
			<li>void setCanBeEnPassanted(boolean canBe): sets canBeEnPassanted to canBe (new)</li>
			<li>boolean getFirstMove(): returns firstMove (new)</li>
			<li>void setFirstMove(boolean first): sets firstMove to first (new)</li> 
		</ul></li>
  		<li>Instance Variables<ul>
			<s><li>boolean alive</li>
			<li>int[] position (note: coordinates stored here will be one-digit, behaving as if it is 8x8 not 800x800)</li>
			<li>String type</li>
			<li>boolean inCheck</li>
			<li>boolean shinySide</li>
			<li>boolean enPassant</li></s>
			<li>boolean canBeEnPassanted (new)</li>
		</ul></li>
	</ul></li>
	<li>Queen, Bishop, Knight classes are all extended from Piece and will have the same methods</li>
	<li> Main Class <ul>
		<li>Methods<ul>
			<s><li>void keyPressed(): handles all the movement and draw() to update visuals of board (new)</li></s>
			<li>void setup(): sets up the board, size is 800, 800 with each square being 100x100 [and draws the pieces on the board] (new)</li>
			<li>void draw(): draws a new board and places pieces in respective positions, updates canCastle for each king, rook. Also checks if any pawns can be promoted. If so, calls pawnPromotion() and sets pawnPromoting to true. (pawnPromotion will have drawn the screen before this) If pawnPromoting is true, remove the pawn from the ArrayList pieces and add a new piece of the type the player selected in the position of the pawn. </li>
			<li>boolean gameOver(): checks if any opposing side has been checkmated or if it is a stalemate (i.e. if no pieces canMove() && inCheck -> checkmate, else if no pieces canMove() -> stalemate)</li>
			<s><li>void pawnPromotion(): draws a selection screen for which piece to promote the pawn to</li></s>
			<li>void pawnPromotionChecker(): checks if a pawn needs to be promoted and updates pawnPromoting and pawnBeingPromoted as such. (new)</li>
			<li>void mouseClicked(): checks if a piece is being selected/runs move on selectedPiece (new)</li>
			<li>void keyPressed(): checks if pawnPromoting, if so, checks the key being pressed and updates white/black & pieces as such. (new)</li>
			<li>void pokeball(): draws a pokeball (for the chessboard) (new)</li>
			<li>void chessboard(): draws the board (new)</li>
			<li>void ditto(float x, float y, boolean shiny): draws a ditto icon at (x, y) colored depending on shiny(representing a pawn) (new)</li>
			<li>void piplup(float x, float y, boolean shiny): draws a piplup icon at (x, y) colored depending on shiny(representing a bishop) (new)</li>
			<li>void solosis(float x, float y, boolean shiny): draws a solosis icon at (x, y) colored depending on shiny(representing a knight) (new)</li>
			<li>void electrode(float x, float y, boolean shiny): draws an electrode icon at (x, y) colored depending on shiny(representing a rook) (new)</li>
			<li>void gulpin(float x, float y, boolean shiny): draws a gulpin icon at (x, y) colored depending on shiny(representing a queen) (new)</li>
			<li>void spheal(float x, float y, boolean shiny): draws a spheal icon at (x, y) colored depending on shiny(representing a king) (new)</li>
		</ul></li>
  		<li>Instance Variables<ul>
			<li>ArrayList<Piece> pieces</li>
			<li>ArrayList<Piece> white (new)</li>
			<li>ArrayList<Piece> black (new)</li>
			<li>boolean pawnPromoting</li>
			<li>Piece selectedPiece (new)</li>
			<li>Piece pawnBeingPromoted (new)</li>
			<li>int turnNumber (new)</li>
		</ul></li>
  	</ul></li>
	
 
</ul></li>
	
</ul>

In our project, we will be using the topics of inheritance, abstract classes, private/public, accessor methods, ArrayList, 2D arrays, processing syntax, and more.
     
# Project Design
_**Period 4**_
<br>
**Group Members:** Andy Li and Naomi Hsieh
<br>
**Group Name:** Project AN
<br>
<br>
**Brief Project Summary**: 
Our created project will be Pokemon Chess. The final product will act exactly like standard chess, with proper movement of pieces, proper checkmate and stalemate rules, as well as techniques such as en passant and castling. The players would click their chosen piece and then click on the square they would like to place their piece on, with markers for the valid squares. However, the pieces will be Pokemon-themed, with each piece represented by the face of a pokemon that reflects the piece's name/purpose. The Pokémon included would be Perrserkers as the pawns, Alolan/Hisuian Decidueye as the bishops, Glastrier and Spectrier as the knights, Golurks as the rooks, and Armarouge and Ceruledge respectively as the kings and queens. As Pokémon aren’t monocolor like chess pieces, instead of separating the players using black and white pieces, the players are differentiated using shiny/non-shiny Pokémon as their pieces, with the shiny versions moving first. This game will be turn-based and played by two people on the same device. 
<br>
<br>
**Critical Features (MVP):** For the minimum viable product, we want to have the icons of the pieces designed and completed. We want to be able to set up the board (grid and proper piece placement) upon the start of the program. Once the program is being run, we want to ensure that the standard chess experience can be carried out. We need to ensure that the program can detect illegal movements and prevent them from occurring, and we need to ensure that the program knows when the game ends. We also need to implement proper piece behavior, including their movement and capturing of other pieces. We need to make sure that the grid can reflect changes, such as a piece being removed or promoted.
		<ul>
			<li> Moving pieces <ul>
				<li> Pawns (Perrserkers) can move one or two steps forward on their first move and one step forward on all other moves.</li>
				<li> Bishops (Decidueyes) can move any amount of steps diagonally along either the white/black squares (but cannot jump over pieces).</li>
				<li> Knights (Glastriers/Spectriers) can move in an L shape around the board, jumping over pieces as needed.</li>
				<li> Rooks (Golurks) can move any amount of steps in a vertical/horizontal direction along the board (but cannot jump over pieces).</li>
				<li> Queens (Ceruledges) can move any amount of steps in a  vertical, horizontal, or diagonal direction (but cannot jump over pieces).</li>
				<li> Kings (Armarouges) can move one step vertically, horizontally, or diagonally.</li>
    			</ul></li>
			<li> Taking pieces<ul>
				<li> Pawns (Perrserkers) can take pieces one step in front of them diagonally, with the exception of en passant.</li>
				<li> All other pieces can take pieces where they can move.</li>
				<li> Note that different rules for taking pieces apply when your king is in check.</li>
   			</ul></li>
			<li> Check<ul>
				<li> Check occurs when an opposing piece can take your king (Armarouge) on their next turn (i.e. attacking the king).</li>
				<li> The player will be forced to either move the king out of check (to a space where the king will no longer be in check), take the piece that is attacking the king, or block the check using another piece. </li>
				<li> If none of these options are viable, the player has been checkmated, and the game will end in a loss for the player.</li>
				<li> If the player cannot move any of their pieces without placing their king in check, but their king is not currently in check, they have been stalemated, and the game will end in a draw.</li>
    			</ul></li>
			<li> Setup<ul>
				<li> The icons will be arranged in a normal chess setup, with 8 pawns on their front row for each side and 2 rooks, 2 bishops, 2 knights, 1 queen, and 1 king on their back row.</li>
    			</ul></li>
			<li> En Passant<ul>
			<li> Where once an opposing pawn takes two steps on their first move and ends up next to your pawn, your pawn can take that pawn by moving diagonally behind them.</li>
   			</ul></li>
			<li> Castling <ul>
				<li> Where if a rook and king have not been moved from their original positions and there are no pieces between them, the rook and king will “switch places.”</li>
    			</ul></li>
			<li> Pawn Promotion<ul>
				<li> Where if a pawn reaches the opposing end of the board, it may be instantly promoted to a queen, knight, bishop, or rook by the player’s choice.</li>
    			</ul></li>
       		</ul>


<br>
<b>Nice to Have Features:</b> Once the MVP has been completed, we plan on drastically improving the User Interface. We want the user to see available positions that a clicked-on piece can move by highlighted grids. Furthermore, we want to make the grids more interesting by laying a Pokeball pattern on them, staying true to the whole Pokemon theme. We would polish the designs of the Pokemon icons and change colors (regular vs. shiny) between the pieces of Player 1 and Player 2 to easily differentiate them, rather than doing something more basic like different color outlines. The UI would also be improved in other aspects like the pawn promotion screen. We would include other additional features, such as drawing and forfeiting. If time provides and if feasible enough, we would look into audio and might add a soft Pokemon theme for the background, or the cries of Pokemon as they capture a piece.
		<ul>
		<li>Markers For Valid Moves <ul><li>When the player clicks on one of the pieces, the squares where that piece can move will be marked in some way.</li></ul></li>
		<li>Drawing/Forfeiting<ul><li>A button would be available where a player could offer a draw (with the other player needing to agree) or end the game early by forfeiting.</li></ul></li>
		<li>Sound<ul><li>The game would play an ambient Pokemon theme in the background, perhaps switch to a more exciting one when the king is in check, and a victory theme for checkmate. </li></ul></li> 
		</ul>
  <br>
UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

![Image of UML](Chess.png?raw=true "Chess UML" )


    
# Intended Pacing:

How you are breaking down the project and who is responsible for which parts.
 <ul>
	 <li>End of 5/22: Code piece movement (excluding castling for now).<ul>
		<li>Pawn Movement: Andy</li> 
		<li>Knight Movement: Naomi</li> 
		<li>Bishop Movement: Andy</li> 
		<li>Rook Movement: Naomi</li> 
		<li>Queen Movement: Andy</li> 
		<li>King Movement: Naomi</li> 
	 </ul></li>
  	 <li>End of 5/23: Code basic capturing (excluding en passant for now)<ul>
		<li>Pawn Capturing: Andy</li> 
		<li>Knight Capturing: Naomi</li> 
		<li>Bishop Capturing: Andy</li> 
		<li>Rook Capturing: Naomi</li> 
		<li>Queen Capturing: Andy</li> 
		<li>King Capturing: Naomi</li> 
	 </ul></li>
    	 <li>End of 5/26: Complete setup of board <ul>
		 <li>Icons drawn: Andy and Naomi (split work depending on circumstances)</li>
		 <li>Placement of pieces: Andy</li>
		 <li>Chessboard drawn (& designed): Naomi</li>
	 </ul></li>
	 <li>End of 5/30 <s>5/28</s>: Code check & extra moves (castling, en passant, pawn promotion)<ul>
		 <li>Check: Andy</li>
		 <li>Castling: Andy </li>
		 <li>En Passant: Naomi </li>
		 <li>Pawn Promotion: Naomi</li>
		 <li>If icons need more time: Andy</li>
	 </ul></li>
	 <li>End of 6/1 <s>5/29</s>: Code checkmate/stalemate <ul>
		 <li>Checkmate: Andy</li>
		 <li>Stalemate: Naomi</li>
	 </ul></li>
	 <li>End of 6/8 <s>6/1</s>: Code extras (in order of priority)<ul>
		<li>Markers for valid squares: Naomi</li>
		<li>Gameover screen: Naomi</li>
		<li>Drawing/Forfeiting: Andy</li>
		<li>Sound: Andy</li>
	 </ul></li>
 </ul>

