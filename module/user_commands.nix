{
  userCommands = let mkCmd = command: { inherit command; };
  in {
    Q = mkCmd "q";
    W = mkCmd "w";
    WQ = mkCmd "wq";
    Wq = mkCmd "wq";
  };
}
