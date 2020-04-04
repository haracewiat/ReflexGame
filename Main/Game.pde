class Game {
   float roundStartTime; 
   float duration;
   float roundFinishTime;
 
   void watch() {
     
     switch (MODE) {
       
       case BEFORE_GAME:                // Start the game if user pressed space
          if (CLICKED_SPACE) { 
             game.start(); 
             CLICKED_SPACE = false;
          }
          break;
          
       case RESTART_GAME:               // Start the game
         game.start();
          
       case BEFORE_ACTIVE:              // If space is pressed, it's a false start
        
          this.watchTimeElapse();        
           
          if (CLICKED_SPACE) {
            MODE = Mode.ON_FAILURE;
          }
          break;
          
       case ON_ACTIVE:                  // If space is pressed, it's a success
          if (CLICKED_SPACE) {
             MODE = Mode.ON_SUCCESS;   
          }
          break;
          
       case ON_SUCCESS:                 // User can restart the game or see results (result appended)
          game.finish();
          break;
          
       case AFTER_GAME:                 // User can restart the game or see results 
       case ON_FAILURE:                 // In case of failure result not appended
           if (CLICKED_SPACE) {
               MODE = Mode.RESTART_GAME; 
            }
          break;
       
       case RESULTS:                    // Display the results
          if (CLICKED_SPACE) {
               MODE = Mode.RESTART_GAME;
            }
          break;
     }
     
     // Watch the 'a' button
     if (CLICKED_A) { this.showResults(); }
     
     // Reset the buttons
     CLICKED_SPACE = false;
     CLICKED_A = false;
       
   }
 
   void start() {
     
      // Set background to default
      BACKGROUND = COLOR_DEFAULT;
     
      // Change mode to before active
      MODE = Mode.BEFORE_ACTIVE;
      
      // Save round's start point
      this.roundStartTime = millis();
      
      // Set up random duration
      this.duration = random(MIN_SECONDS, MAX_SECONDS)*1000;
    
   }
 
   void watchTimeElapse() {
     
      if (this.roundStartTime + this.duration < millis()) { 
        // Set mode to active
        MODE = Mode.ON_ACTIVE; 
        BACKGROUND = COLOR_ACTIVE;    
      } 
      
   }
 
  void finish() {
    
    // Add resulting reaction time to scoreboard
    this.roundFinishTime = millis();
    float result = this.roundFinishTime - (this.roundStartTime + duration);
    scoreboard.addResult(result);
    
    // Set background to success
    BACKGROUND = COLOR_SUCCESS;
    
    // Clear variables
    this.clear(); 
    
    // Set mode to after game
    MODE = Mode.AFTER_GAME;
   
  }
 
  void clear() {
    this.roundStartTime = 0;
    this.roundFinishTime = 0;
    this.duration = 0;
  }

  void showResults() {
    
    // Set background to default
    BACKGROUND = COLOR_DEFAULT;
    
    // Set mode to results
    MODE = Mode.RESULTS;
    
    // Clear variables
    this.clear();
     
  }
}
