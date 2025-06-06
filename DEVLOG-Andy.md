# Dev Log:

This document must be updated daily every time you finish a work session.

## Andy Li 

### 2025-05-19 - Updated Proposal and Prototype
Both of us worked on updating the proposal to be more specific regarding the Pokemon chess idea, and we sent the email regarding the revision to the proposal. We spent 25 minutes on this, and we will spend the rest of the class period beginning to build the prototype. At home, I completed the project design portion of the PROTOTYPE.md file

### 2025-05-20 - UML for Prototype
In Class: Naomi and I worked out the timeline/breakdown of who's doing what of the project (~10 minutes) and I started working on the UML afterwards.

At home, I completed Part 2 of the necessary tasks to be completed for Stage 1 of this project and made sure everything was set. Completed the UML diagram that showcases our Chess class hierarchy as well as instance variables/methods (~15 minutes).

### 2025-05-22 - Queen, Bishop, Pawn
In class, Naomi and I worked on laying out the methods for each class in their respective files and branching as well as thinking out how to approach the methods (~40 minutes).

At home, I completed finished the movement behavior for the aforementioned chess pieces (queen, bishop, and pawn) and merged everything into the main while trying to resolve merge conflicts (~50 minutes).

### 2025-05-23 - getLegalMoves
In class, I worked on polishing my three subclasses, specifically implementing a new method (getLegalMoves()) that would make future endeavors such as highlighting all possible moves much easier. I also added missing code like constructors and fixed move booleans (~35 minutes).

### 2025-05-26 - Setup and Debugging
At home, I began by testing out a setup after Naomi finished the foundational chessboard. I initialized the white and black side as well as displayed the initial positions of all the pieces. In doing this, I noticed various exceptions being thrown so I fixed all of those by manually testing and subsequently implementing methods in each of the subclasss. I also added my code for a Rowlet piece, which still needs to be cleaned up to fit with the rest of the icons (total: ~75 minutes).

### 2025-05-27 - Reworking Movement and getLegalMoves() Fixing
In class, I was planning how to make movement more efficient and began the process by using a new positions ArrayList and adding existing positions at setup to that ArrayList. I also began to change getLegalMoves() implementation to use this positions ArrayList of int[] (~35 min).

At home, I finished getLegalMoves() for every subclass, whether it be correcting my previous ones to consider pieces in the way or adding it to Naomi's subclasses (~50 minutes).

### 2025-05-28 - Pawn Movement/Capturing and Checks
In class, I began writing code that considered the pawn's first turn moves with a new instance variable and updates to getLegalMove(). I also updated the prototype and began to modify the UML to include new methods/variables (~25 min).

At home, Naomi finished fixing the pawn first turn issues. I debugged the Pawn subclass because there was an error in which pawns could take other pieces directly in front of it. I fixed this by updating reachable() and also implemented diagonal piece taking for the Pawn subclass. I coded the capture() method, which removes a taken piece from the game in the Pawn subclass. I also coded a preliminary setCheck() for all subclasses. (~70 min).

### 2025-05-29 - Capturing and getLegalMoves Rewriting
In class, I contemplated how capture() should be implemented and what to do with the old capture(Piece old, Piece new) method before deciding to implement this as an inherited method. I also worked with Naomi to debug a null error in getPos(), which was resolved by deleting new declarations of the abstract class's instance variables (~25 min).

At home, I discovered that pieces could still jump over each other because I used a faulty implementation of for looping through white/black ArrayLists. I resolved this for each of the subclasses (besides King, which Naomi is currently working on) by creating a combined pieces ArrayList and looping through that object instead. I tested my new implementation and pieces seem to be moving and capturing according to the laws of chess. I also adjusted the pieces ArrayList when a piece was taken accordingly in the capture() method (~100 min).

### 2025-05-30 - 2025-06-01 - Illegal Moves, Check, Checkmate, Stalemate
In class on Friday, I started castling code (~15 minute), but then I spent the rest of the period trying to debug the infinite recursion still in the King class.

Over the weekend, I used Naomi's code, which was now fixed for King's infinite recursion, and implemented check. I then used this check code to make sure that a player couldn't play an illegal move that would leave their king threatened. Afterwards, I designed checkmate code to lock the screen after the game ended and spent a long time trying to figure out how to implement checkmate/stalemate. I eventually accomplished this while noticeably reducing the runtime by using while loops and local conditions rather than for loops (would be around n^4 to n^5 behavior). Throughout all of this, I extensively debugged (print messages, fixing merge conflicts, fixing differences in implementation between my and Naomi's methods, etc.) I spent a total of about eight hours (~480 min) on the aforementioned tasks.

### 2025-06-02 - Beginning Steps to Algebraic Notation
In class, I started creating instance variables and coding the algebraic notation for the movement of pieces (~20 min).

At home, I implemented algebraic notation for capturing, check, and checkmate (~25 min).

### 2025-06-03 - More Algebraic Notation!
In class, I worked on fixing checkmate algebraic notation and worked on castling algebraic notation (~20 min).

At home, I worked on en passant algebraic notation, checkmate/stalemate messages to the terminal, and fixed castling algebraic notation format (~20 min).

### 2025-06-04 to 2025-06-05 - More Algebraic Notation Pt. 2!
Over Wednesday in-class and the break, I finished pawn promotion and started working on the exception code, which needs to be fixed, as the correct notation is not being outputted. Only committed the pawn promotion code for now (total ~30 min).
