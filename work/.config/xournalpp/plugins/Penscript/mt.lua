-- This is an example Xournal++ Plugin - copy this to get started

var_dump = require "var_dump"
b1calls = 2
b1file = io.open("./b1calls","r+") 
io.write("hoooi")
b1file:close()
filechanged = io.open("./b1calls","r+")
b1calls2 = io.read()
print(b1calls2)

