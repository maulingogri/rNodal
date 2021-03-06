## ----rows.print=30-------------------------------------------------------
library(rNodal)

# Example from C.44 in Brown's book
# P2 (pressure at end point is given in the original example). 
# The original question is: what is the length of the tubing.
#
# In our case we aproximately know the length (from the book), so we will try to
# match P2 (known)
#
# Differences with Example C.13:
# GLR, watercut, oil viscosity and API are different in C.44
#
# The final results are very close to those of Brown.


input_example <- setWellInput(field.name = "HAGBR.MOD",
                                 well.name = "Brown_C44", 
                                 depth.wh = 0, depth.bh = 3590, 
                                 diam.in = 1.995, 
                                 GLR = 1000, liq.rt = 600, wcut = 0.0, 
                                 thp = 500, tht = 120, bht = 150, 
                                 API = 42, oil.visc = 1.0, 
                                 gas.sg = 0.65, wat.sg = 1.07, if.tens = 30
                                 )

well_model <- setVLPmodel(vlp.model = "hagbr.mod", segments = 29, tol = 0.00001)


df <- runVLP(well.input = input_example, well_model)
df

