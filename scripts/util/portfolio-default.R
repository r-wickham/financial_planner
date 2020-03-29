# A default portfolio to load on startup

### Default Portfolio -----------------------------------------------------------------------------
# A default portfolio to use as an example
#
# TODO:   Eventually save a pre-created portfolio as 'Default Portfolio'
#         to auto-load or be created on startup if no other portfolios are available
#         to load

cat("\n\n--- Creating Default Portfolio --------\n")

# 50 years out from now
pf <- portfolio(name = "Default Portfolio",
                times = year(Sys.Date()):(year(Sys.Date())+60))

# Income of 50k
pf <- createNewAsset(pf = pf, name = "Joe Income")
pf$assets$`Joe Income`$income <- 50
pf$assets$`Joe Income`$ror <- 0
pf$assets$`Joe Income` <- computeIncome(pf$assets$`Joe Income`)
pf$assets <- lapply(pf$assets, roundIncomeDF)

# Income of 50k, invested
pf <- createNewAsset(pf = pf, name = "Joe Investment")
pf$assets$`Joe Investment`$income <- 4
pf$assets$`Joe Investment`$ror <- 7
pf$assets$`Joe Investment` <- computeIncome(pf$assets$`Joe Investment`)
pf$assets <- lapply(pf$assets, roundIncomeDF)



# Expenses of 7.5k, 12k
pf <- createNewExpense(pf = pf, name = "Joe Groceries")
pf <- createNewExpense(pf = pf, name = "Joe Rent")
pf$expenses$`Joe Groceries` <- 7.5
pf$expenses$`Joe Rent` <- 12
pf$expenses <- roundExpenseDF(pf$expenses)
pf$expenses <- totalExpenses(pf$expenses)

# Credit Card bill of 35k

# Allocate the expenses
pf <- allocateExpenses(pf)


cat("\n\n--- Done Creating Default Portfolio ---")

