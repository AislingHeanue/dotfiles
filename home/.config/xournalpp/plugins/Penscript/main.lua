-- This is an example Xournal++ Plugin - copy this to get started
--

--local colorList = { 
--  {"black", 0x000000},  
--  {"green", 0x008000},
--  {"lightblue", 0x00c0ff}, 
--  {"lightgreen", 0x00ff00}, 
--  {"blue", 0x3333cc},      
--  {"gray", 0x808080},   
--  {"red", 0xff0000},        
--  {"magenta", 0xff00ff},
--  {"orange", 0xff8000}, 
--  {"yellow", 0xffff00},    
-- {"white", 0xffffff}
--}


local colorList = { 
  {"magenta", 0xff00ff},
  {"white", 0xffffff},  
  {"lightblue", 0x00c0ff},  
  {"red", 0xff0000}
}

-- Register all Toolbar actions and intialize all UI stuff
function initUi()
  print("Hello from Example: Plugin initUi called\n");

  ref = app.registerUi({["menu"] = "Pen Button 1", ["callback"] = "button1", ["accelerator"] = "<Control><Alt><Shift>F7"});
  print("Menu reference:");
  b1calls = 0
  initfile = io.open("/home/aisling/.config/xournalpp/plugins/Penscript/b1calls","w+")
  io.output(initfile)
  io.write(b1calls)
  initfile:close()
  print("Pen Button 1 registered\n");
end

-- Callback if the menu item is executed
function button1()
  --STEP ONE: READ THE FILE TO SEE HOW MANY TIMES B1 HAS BEEN CALLED
  fileread = io.open("/home/aisling/.config/xournalpp/plugins/Penscript/b1calls","r")
  io.input(fileread)
  b1calls = io.read()
  b1calls = b1calls + 1
  fileread:close()
  --STEP TWO: OVERWRITE THE FILE AND REPLACE IT WITH ONE WITH THE NEW COUNT
  filewrite = io.open("/home/aisling/.config/xournalpp/plugins/Penscript/b1calls","w+")
  io.output(filewrite)
  io.write(b1calls)
  filewrite:close()
  --STEP THREE: ZERO THE AMOUNT OF CALLS OF B2
  file2 = io.open("/home/aisling/.config/xournalpp/plugins/Penscript/b2calls","w+")
  io.output(file2)
  io.write(0)
  file2:close()
  app.uiAction({["action"]="ACTION_TOOL_DEFAULT"})
  app.changeToolColor({["color"] = colorList[(b1calls%#colorList) + 1][2], ["tool"] = "pen"})
end

--button1()
