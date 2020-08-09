# https://cran.r-project.org/web/packages/qcc/vignettes/qcc_a_quick_tour.html
# https://tomhopper.me/2014/03/01/individuals-and-moving-range-charts-in-r/


library(qcc)


# process data
df = cbind(c(98, 99, 100, 99.8, 99.05, 97, 99.05, 99.9, 99, 100.5, 99))


# several charts on one page
par(mfrow=c(3,2))


LCL = 95
UCL = 105

LSL = min(df)
USL = max(df)


## I Chart
q <- qcc(df, type="xbar.one", limits = c(LCL, UCL), restore.par=FALSE, title = 'I Chart', ylab = 'Individual Value', xlab = '')

# LSL
abline(h = LSL, lty = 3, col = "chocolate")
axis(4, at=LSL, labels='LSL', las=2, tck=0, line = -0.9)

# USL
abline(h = USL, lty = 3, col = "chocolate")
axis(4, at = USL, labels='USL', las=2, tck=0, line = -0.9)


## Capability histogram 
process.capability(q, restore.par=FALSE, spec.limits=c(LSL,USL))


## Moving Range Chart
mat = matrix(cbind(df[1:length(df)-1], df[2:length(df)]), ncol=2)
q <- qcc(mat, type="R", title = 'Moving Range Chart', restore.par=FALSE, ylab = 'Moving Range', xlab = '')
qqnorm(df)


## Last 15 Observations
qcc(df, type="xbar.one", restore.par=FALSE, title = 'Last 15 Observations', ylab = 'Individual Value', xlab = '')


