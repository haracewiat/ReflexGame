class GameInformation {
  
  String TEXT = "";
  
  public void update(Mode mode) {
   this.setMode(mode);
   this.display();
  }
  
  private void setMode(Mode mode) {
    switch (mode) {
      case BEFORE_GAME:
        this.TEXT = "Press space to start the game";
        break;
      case AFTER_GAME:
        break;
      case RESTART_GAME:
        break;
      case BEFORE_ACTIVE:
        this.TEXT = "Wait..."; 
        break;
      case ON_ACTIVE:
        this.TEXT = "Press space!";
        break;
      case ON_SUCCESS:
        this.TEXT = "Good job!\n Press space to continue\n Press 'a' to finish";
        break;
      case ON_FAILURE:
        this.TEXT = "Too early!\n Press space to try again\n Press 'a' to finish";
        break;
      case RESULTS:
        this.TEXT = "Your average is\n" + nf(scoreboard.average, 0, 2) + " ms\n\nWant to try again? Press space";
        break;
    }
  }
  
  private void display() {
    textSize(22);
    fill(0);
    textAlign(CENTER, CENTER);
    text(this.TEXT, width/2, height/2);
  }
  
}
