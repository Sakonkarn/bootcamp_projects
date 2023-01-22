#Pizza
pizza_id <-c(0,1,2,3,4)
pizza_name <-c("NO" ,"cheese", "hawaiian", "mushroom", "seafood")
pizza_price <-c(0,300, 250,200, 350)
df_pizza <-data.frame(pizza_id,pizza_name,pizza_price)

#Chicken
chicken_id <-c(0,1,2,3)
chicken_name <-c("NO","BBQ chicken wings", "korean chicken wings", "nuggets")
chicken_price <-c(0,100,120,80)
df_chicken <-data.frame(chicken_id,chicken_name,chicken_price)

#Salad
salad_id <-c(0,1,2)
salad_name <-c("NO","caesar salad", "garden salad")
salad_price <-c(0,90,80)
df_salad <- data.frame(salad_id,salad_name,salad_price)

#Drink
drink_id <-c(0,1,2)
drink_name <-c("NO","coke","sprite")
drink_price <-c(0,30,30)
df_drink <-data.frame(drink_id,drink_name,drink_price)
#--------------

#start
print("Hello")
print("Welcome to The Pizza World")

#Question 1
print("What's your name?")
user_name <- readLines("stdin" , n=1)
print(paste("Hi!", user_name))

#Question 2
print("What do you want to order today?")
print("Let's choose your menu step by step.")
print("------------------------------")
print("1.Pizza")
print(df_pizza)
print("Plese type pizza_id")
choose_pizza <- readLines("stdin" , n=1)
if (choose_pizza == 0){
  pizza <-"NO"
  pizza_price <- 0
  print(paste("You didn't choose pizza","price",pizza_price))
} else if (choose_pizza == 1){
  pizza <- "cheese"
  pizza_price <- 300
  print(paste("You choose pizza",pizza,"price",pizza_price))
}else if (choose_pizza == 2){
  pizza <- "hawaiian"
  pizza_price <- 250
  print(paste("You choose pizza",pizza,"price",pizza_price))
}else if (choose_pizza == 3){
  pizza <- "mushroom"
  pizza_price <- 200
  print(paste("You choose pizza",pizza,"price",pizza_price))
}else if (choose_pizza == 4){
  pizza <- "seafood"
  pizza_price <- 350
  print(paste("You choose pizza",pizza,"price",pizza_price))
}
total_price1 <- sum(pizza_price)
print (paste("Total price :", total_price1))

#Question 3
print("------------------------------")
print("2.Chicken")
print(df_chicken)
print("Plese type chicken_id")
choose_chicken <- readLines("stdin" , n=1)
if (choose_chicken == 0){
  chicken <- "NO"
  chicken_price <-0
  print(paste("You didn't choose chicken","price",chicken_price))
}else if(choose_chicken == 1){
  chicken <- "BBQ chicken wings"
  chicken_price <- 100
  print(paste("You choose",chicken,"price",chicken_price))
}else if (choose_chicken == 2){
  chicken <- "korean chicken wings"
  chicken_price <- 120
  print(paste("You choose",chicken,"price",chicken_price))
}else if (choose_chicken == 3){
  chicken <- "nuggets"
  chicken_price <- 80
  print(paste("You choose",chicken,"price",chicken_price))
}
total_price2 <- sum(pizza_price,chicken_price)
print (paste("Total price :", total_price2))


#Question 4
print("------------------------------")
print("3.Salad")
print(df_salad)
print("Plese type salad_id")
choose_salad <- readLines("stdin" , n=1)
if (choose_salad == 0){
  salad <- "NO"
  salad_price <-0
  print(paste("You didn't choose salad","price",salad_price)) 
}else if (choose_salad == 1){
  salad <- "caesar salad"
  salad_price <- 90
  print(paste("You choose",salad,"price",salad_price))
}else if (choose_salad == 2){
  salad <- "garden salad"
  salad_price <- 80
  print(paste("You choose",salad,"price",salad_price))
}
total_price3 <- sum(pizza_price,chicken_price,salad_price)
print (paste("Total price :", total_price3))

#Question 5
print("------------------------------")
print("4.Drink")
print(df_drink)
print("Plese type drink_id")
choose_drink <- readLines("stdin" , n=1)
if (choose_drink == 0){
  drink <- "NO"
  drink_price <- 0
  print(paste("You didn't choose drink","price",drink_price))
 }else if (choose_drink == 1){
  drink <- "coke"
  drink_price <- 30
  print(paste("You choose",drink,"price",drink_price))
}else if (choose_drink == 2){
  drink <- "sprite"
  drink_price <- 30
  print(paste("You choose",drink,"price",drink_price))
}
total_price4 <- sum(pizza_price,chicken_price,salad_price,drink_price)
print (paste("Total price :", total_price4))


#Question 6 order summary
print("------------------------------")
print("---------order summary--------")
print(paste("customer name :", user_name))

if (choose_pizza == 0){
  print(paste("You didn't choose pizza","price",pizza_price))
}else {
  print(paste("You choose pizza",pizza,"price",pizza_price))
}

if (choose_chicken == 0){
  print(paste("You didn't choose chicken","price",chicken_price))
}else {
  print(paste("You choose",chicken,"price",chicken_price))
}

if (choose_salad == 0){
  print(paste("You didn't choose salad","price",salad_price)) 
}else {
  print(paste("You choose",salad,"price",salad_price))
}

if (choose_drink == 0){
  print(paste("You didn't choose drink","price",drink_price))
}else {
  print(paste("You choose",drink,"price",drink_price))
}
total_price4 <- sum(pizza_price,chicken_price,salad_price,drink_price)
print (paste("Total price :", total_price4))
print("------------------------------")

#Question 7
print("Are you confirm order?")
print("type Y for Yes, type N for No")
result <- (toupper(readLines("stdin" , n=1)))

if (result == "Y"){
  print("Order comfirmed")
  print("please fill your phone number.")
  number <-readLines("stdin",n=1)
  print("Please fill your address.")
  address <-readLines("stdin" , n=1)
  
#Question 8
  print("------------------------------")
  print("select your payment method.")
  print("1.Bank transfer, 2.Credit card")
  print("type 1 for Bank transfer, type 2 for Credit card")
  payment<- readLines("stdin",n=1)    
      if(payment == 1){
      print("please transfer to A bank acc.num 1234")
      print("after transfer please attach slip (link below)")
      print("------------------------------")
      print("Your order will deliver in 30 mins")
      print("Enjoy your meal")
      print("Thank you for support The Pizza World")
    }  else if (payment == 2){
      print("Please fill your credit card number")
      readLines("stdin",n=1)
      print("------------------------------")
      print("Your order will deliver in 30 mins")
      print("Enjoy your meal")
      print("Thank you for support The Pizza World")
    }

} else if(result == "N"){
  print("Order canceled")
  print("Thank You")
}
