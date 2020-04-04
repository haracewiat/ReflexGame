class Scoreboard {
  public int roundsCount = 0;
  public FloatList results = new FloatList();
  public float average = 0;

  public void draw() {
    
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
  
  public void addResult(float result) {
    this.roundsCount++;
    this.results.append(result);
    this.average = (this.results.sum() / this.results.size());
  }
  
  public void clean() {
    this.roundsCount = 0;
    this.results.clear();
    this.average = 0;
  }
}
