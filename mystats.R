mystats <- function(v, center=TRUE){ # 2个参数，第2个参数默认值是TRUE
  if(center == TRUE){          # 满足条件则...
    均值 <- mean(v)
    标准差 <- sd(v)
    res <- c(均值,标准差)
  } else {                     # 不满足条件则...
    中位数 <- median(v)
    绝对中位差 <- mad(v)
    res <- c(中位数, 绝对中位差)
  }
  return(res) # 不写这句也可以
}