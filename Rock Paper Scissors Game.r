print("Welcome to Rock Paper Scissors")
print("What's your name?")
name <- readLines("stdin", n=1)
print(paste("Hi!", (name)))
print("How to play the game")
print("type 'r' for Rock")
print("type 'p' for Paper")
print("type 's' for Scissors")
print("type 'Q' for End Game")

print("Rule Game")
print("Rock vs. Paper -- Paper win")
print("Rock vs. Scissors -- Rock win")
print("Scissors vs. Paper -- Scissors win")

print("Are you ready")
print("Go Go !!!")

player_Win <-0
player_Loss <-0
draw <-0
times <-0

while (TRUE) {
choices <- c("r", "s", "p")
print("you pick")
player_pick <-readLines("stdin",n=1)
print(paste("bot pick :", bot_choice <- sample(choices,1)))
if (player_pick == "Q") {
  print("-------------------------------------------------")
  print("END GAME")
    break
  }
 if (player_pick == bot_choice) {
      print("You DRAW")
      draw <- draw+1
      times <- times + 1
    } else if ((player_pick == "p" & bot_choice =="r")|
              (player_pick == "r" & bot_choice =="s")|
              (player_pick == "s" & bot_choice =="p")) {
      print("You WIN")
      player_Win <- player_Win +1
      times <- times + 1          
    } else if ((player_pick == "r" & bot_choice =="p")|
              (player_pick == "p" & bot_choice =="s")|
              (player_pick == "s" & bot_choice =="r")){
      print("You LOSS")
      player_Loss <- player_Loss +1
      times <- times + 1
    }            
}   

print(paste("Player name:", (name)))
print(paste("Total game:", times))
print(paste("You WIN", player_Win))
print(paste("You LOSS", player_Loss))
print(paste("You DRAW", draw))
print("See you next time")
print("Have a nice day")
print("-------------------------------------------------")
  
