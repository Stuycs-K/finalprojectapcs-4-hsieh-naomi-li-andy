[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/YxXKqIeT)
# Project Description
Since we couldn't attach the file through git push because it was too big, here is a Google Drive Link for it!
https://drive.google.com/file/d/1DCQD8V_QmsJSqba9y4Ggf81dVcxY8APi/view?usp=sharing

# Project Description

Our project is a revamped version of chess, accessorized by a Pokemon theme. Our pieces and board are all Pokemon-themed, with Ditto being the pawn, Piplup being the bishop, Solosis being the knight, Electrode being the rook, Gulpin being the queen, and Spheal being the king, as well as little Pokeball designs on each square of the board. While regular chess uses white and black pieces to differentiate the sides, we used shiny & regular Pokemon instead, as Pokemon do not really have a monotone color. The shiny pieces represent the black pieces (moving second) while the non-shiny pieces represent the white pieces (moving first). Our project follows all the rules of chess and includes special cases, such as en passant, castling, checkmate, stalemate, and pawn promotion. We also implemented algebraic chess notation, which is printed via the terminal, and designed a guide and end screens that will pop up when the user presses g or when the specific end screen (checkmate/stalemate) is reached respectively. It is intended for two people to play, sharing one computer. 

# Intended usage:

To play the game, users must first select a piece to move by clicking on said piece. Several squares will then be lit up, as shown with a brighter pokeball that has a red center, indicating squares the selected piece can move to. Users must then click on one of the selected squares to successfully move their piece. Clicking on any square not lit up will force the users to repeat the process until a legal move is made. Users can change the piece they want to move simply by clicking on their piece/somewhere not a legal move to deselect the piece and then clicking on another piece to select it.

Users must also be able to use their keyboard to access the guide and pawn promotion. See the table below for further details.
<br></br>
**KeyPressed Guide**
| Key | Function | 
| :--- | :-----------------: | 
| g | Opens up the guide, which details which pokemon is which piece and which keys are used for pawn promotion. |
| b | If a pawn is ready to pawn-promote, it turns into a bishop. |
| q | If a pawn is ready to pawn-promote, it turns into a queen. |
| r | If a pawn is ready to pawn-promote, it turns into a rook. |
| k | If a pawn is ready to pawn-promote, it turns into a knight. |
| c | If checkmate or stalemate has occurred, this key opens or closes the ending screen. |

  
