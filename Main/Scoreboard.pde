class Scoreboard {
  int roundsCount = 0;
  FloatList results = new FloatList();
  float average = 0;

  void draw() {
    
    // Set text properties
    textSize(24);
    fill(0);
    
    // Display the rounds' count
    textAlign(LEFT, TOP);
    text("Rounds: " + this.roundsCount, 0, 0);
    
    // Display the average result
    textAlign(RIGHT, TOP);
    text("Average: " + int(this.average) + " ms", width, 0);
    
  }
  
  void addResult(float result) {
    this.roundsCount++;
    this.results.append(result);
    this.average = (this.results.sum() / this.results.size());
  }
  
}
