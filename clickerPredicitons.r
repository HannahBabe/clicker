library(dplyr)

gender <- `CSCI.T.Numbers.(1).xls...Sheet`
names(grades)[2] <- "Weighted.Total"
names(grades)[1] <- "TNum"
names(gender)[4] <- "TNum"
names(gender)[5] <- "gen"
for (i in 3:13){
  names(grades)[i] = capture.output(cat("Lab",i-2, sep=""))
}
  
total <- merge(gender, grades, by="TNum")

attach(total)
newTotal0 <- total[which(Lab1 <= 32), ] 
newTotal1 <- total[which(Lab2 <= 32), ]
newTotal2 <- total[which(Lab3 <= 32), ]
newTotal3 <- total[which(Lab3 <= 32), ]
detach(total)

newTotal <- rbind(newTotal0, newTotal1, newTotal2, newTotal3)
newTotal



responseTotal <- merge(responses, questions, by="question_unique_id")
responseTotal <- merge(responseTotal, dates, by="question_unique_id")

noChangeCorrect <- 0
noChangeTotal <-0
for (x in 1:length(responseTotal$correct_answer)){
  if (identical(responseTotal$final_response[x], responseTotal$first_response[x])){
    noChangeTotal <- noChangeTotal +1
    if (identical(responseTotal$final_response[x], responseTotal$correct_answer[x])){
      noChangeCorrect <- noChangeCorrect + 1
  }
  }
}
percent_correct <- noChangeCorrect/noChangeTotal
percent_correct

changeCorrect <- 0
changeTotal <- 0
for (x in 1:length(responseTotal$correct_answer)){
  if (!identical(responseTotal$final_response[x], responseTotal$first_response[x])){
    changeTotal <- changeTotal +1
    if (identical(responseTotal$final_response[x], responseTotal$correct_answer[x])){
      changeCorrect <- changeCorrect + 1
    }
  }
}
changeCorrect
changeTotal

percent_correct1 <- changeCorrect/changeTotal
percent_correct1