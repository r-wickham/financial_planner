


#source util scripts
for(s in dir("scripts/util",full.names = T,pattern = "*.R")) source(s)


pf <- portfolio("test",2017:2060)

### Initialization --------------------------------------------------------------------------------

#Bad
bad <- createNewAsset("a","Joe-Income")
bad <- createNewExpense("a","Joe-Groceries")

#Good
pf <- createNewAsset(pf,"Joe-Income")
pf <- createNewExpense(pf,"Joe-Groceries")

### Assignment ------------------------------------------------------------------------------------
# _assignAssetSAmount
#assignAssetIncome

#Good
pf <- assignAssetSAmount(pf = pf,name = "Joe-Income",times = c(2017,2040), values = c(40,50))
pf <- assignAssetIncome(pf = pf,name = "Joe-Income",times = c(2020,2030,2055), values = c(40,50,52))
pf <- assignAssetDeduction(pf = pf,name = "Joe-Income",times = c(2019,2055), values = c(30,50))
pf <- assignAssetROR(pf = pf,name = "Joe-Income",times = c(2017,2040), values = c(5,2))

pf <- assignExpense(pf = pf,name = "Joe-Groceries",times = c(2017,2040), values = c(41,52))

#Bad




### Modification ----------------------------------------------------------------------------------

### Computing -------------------------------------------------------------------------------------

### Saving ----------------------------------------------------------------------------------------


