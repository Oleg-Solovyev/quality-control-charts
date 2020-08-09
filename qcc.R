library(qcc)


df = cbind(c(98, 99, 100, 99.8, 99.05, 97, 99.05, 99.9, 99, 100.5, 99))


LCL = 95
UCL = 105

LSL = min(df)
USL = max(df)


# plot
q <- qcc(df, type="xbar.one", nsigmas=3, limits = c(LCL, UCL))
plot(q, restore.par = FALSE)


# LSL
abline(h = LSL, lty = 3, col = "chocolate")
axis(4, at=LSL, labels='LSL', las=2, tck=0, line = -0.9)

# USL
abline(h = USL, lty = 3, col = "chocolate")
axis(4, at = USL, labels='USL', las=2, tck=0, line = -0.9)

