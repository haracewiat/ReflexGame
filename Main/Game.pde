class Game {
   float roundStartTime; 
   float duration;
   float roundFinishTime;
 
   void watch() {
     
     switch (MODE) {
       
       // Start the game if user pressed space
       case BEFORE_GAME:                
          if (CLICKED_SPACE) { game.start(); }
          break;
       
       // Start the game
       case RESTART_GAME:               
         game.start();
       
       // If space is pressed, it's a false start
       case BEFORE_ACTIVE:              
          this.watchTimeElapse();        
          if (CLICKED_SPACE) { MODE = Mode.ON_FAILURE; }
          break;
       
       // If space is pressed, it's a success
       case ON_ACTIVE:                  
          if (CLICKED_SPACE) { MODE = Mode.ON_SUCCESS; }
          break;
       
       // User can restart the game or see results (result appended)
       case ON_SUCCESS:                 
          game.finish();
          break;
       
       // Game is resumed
       case AFTER_GAME:
          if (CLICKED_SPACE) { MODE = Mode.RESTART_GAME; }
          break;
       
       // In case of failure result not appended
       case ON_FAILURE:                 
          if (CLICKED_SPACE) { MODE = Mode.BEFORE_GAME; }
          break;
        
       // Results are displayed
       case RESULTS:                    
          if (CLICKED_SPACE) {
               MODE = Mode.RESTART_GAME;
               scoreboard.clean();
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
