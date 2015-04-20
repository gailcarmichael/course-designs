int[] parrotsAtStations = {7, 5, 3, 10, 2};

void setup()
{
  println("Result from head recursion: " +
          countParrotsHead(0));
          
  println("Result from tail recursion: " +
          countParrotsTail(0, 0));
}



// Use head recursion to count the parrots at each station
int countParrotsHead(int stationNum)
{
  // When we reach the last station, stop
  if (stationNum == parrotsAtStations.length)
  {
    // This will just add zero parrots to the calling
    // function's number, since this is just beyond the
    // last station
    return 0;
  }
  
  // Call the next station and ask them how many
  // parents they and everyone after them have
  int totalSoFar = countParrotsHead(stationNum + 1);
  
  // Return our total plus the total so far to
  // the calling station 
  return totalSoFar + parrotsAtStations[stationNum];
}



// Use tail recursion to count the parrots at each station
int countParrotsTail(int stationNum, int parrotsSoFar)
{
  // When we reach the last station, stop
  if (stationNum == parrotsAtStations.length)
  {
    // This will return the total number of parrots
    // back through all the stations
    return parrotsSoFar;
  }
  
  // Add our number of parrots to the total so far
  int totalSoFar = parrotsSoFar + parrotsAtStations[stationNum];
  
  // Call the next station, and just return what answer
  // it gives us back to the calling station
  return countParrotsTail(stationNum + 1, totalSoFar);
}
