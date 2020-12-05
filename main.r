# Made by Pranshu Aggarwal

# suggesting mtcars ased on requirements givern and creating plots and adding preferablility fro different cars

# variables to be considered - hp, qsec, disp

# requirements: disp>300 hp>150 qsec>17

n <- length(mtcars$cyl)
# getting the names of the cars by rownames(mtcars)
names <- c(rownames(mtcars))
ans <- c()
prefered <- c()

for (i in 1:n){
    if (mtcars[["disp"]][[i]] > 300 && mtcars[["hp"]][[i]] > 150 && mtcars[["qsec"]][[i]] > 17.0){
        ans <- c(ans, names[i])
        if (mtcars[["disp"]][[i]] > 400 | mtcars[["hp"]][[i]] > 200 | mtcars[["qsec"]][[i]] > 20.0){
            prefered <- c(prefered, names[i])
        }
    }
}
# prefered indexing
prob <- c()
n <- length(ans)
for (i in 1:n){
    if (ans[i] %in% prefered){
        prob <- c(prob, 0.3)
    }
    else{
        prob <- c(prob, 0.2)
    }
}

# plotting
jpeg(file="cars.jpeg")

barplot(prob,col = c("lightblue","lightcyan","lavender", "mistyrose", "cornsilk"), legend.text = ans, main = "Preferance of cars based on entered data")

dev.off()
