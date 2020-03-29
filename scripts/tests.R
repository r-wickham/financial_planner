


#source util scripts
for(s in dir("scripts/util",full.names = T,pattern = "*.R")) source(s)


#pf <- portfolio("test",2017:2060)

### Initialization --------------------------------------------------------------------------------

#Bad
bad <- createNewAsset("a","Joe-Income")
bad <- createNewExpense("a","Joe-Groceries")

#Good
pf <- createNewAsset(pf,"Joe-Income")
pf <- createNewExpense(pf,"Joe-Groceries")

### Removal ---------------------------------------------------------------------------------------

#Bad
bad <- removeIncome("a","Joe-Income")
bad <- removeExpense("a","Joe-Groceries")

#Good
pf <- removeIncome(pf,"Joe-Income")
pf <- removeExpense(pf,"Joe-Groceries")

### Modification ----------------------------------------------------------------------------------

### Computing -------------------------------------------------------------------------------------

### Plotly ----------------------------------------------------------------------------------------

# Summary

# Income
pIn(pf$assets$`Joe's Income`)

# Expenses
pEx(pf$expenses)

# Expense Allocation

### Saving ----------------------------------------------------------------------------------------


