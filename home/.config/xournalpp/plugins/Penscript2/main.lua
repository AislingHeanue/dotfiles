-- This is an example Xournal++ Plugin - copy this to get started
--

var_dump = require "var_dump"
-- Register all Toolbar actions and intialize all UI stuff
function initUi()
  print("Hello from Example: Plugin initUi called\n");

  ref = app.registerUi({["menu"] = "Pen Button 2", ["callback"] = "button2", ["accelerator"] = "<Alt><Shift>F7"});
  print("Menu reference:");
  b2calls = 0
  initfile = io.open("/home/aisling/.config/xournalpp/plugins/Penscript/b2calls","w+")
  io.output(initfile)
  io.write(b2calls)
  initfile:close()
  print("Pen Button 2 registered\n");
end

-- Callback if the menu item is executed
function button2()
  --STEP ONE: READ THE FILE TO SEE HOW MANY TIMES B2 HAS BEEN CALLED
  fileread = io.open("/home/aisling/.config/xournalpp/plugins/Penscript/b2calls","r")
  io.input(fileread)
  b2calls = io.read()
  b2calls = b2calls + 1
  fileread:close()
  --STEP TWO: OVERWRITE THE FILE AND REPLACE IT WITH ONE WITH THE NEW COUNT
  filewrite = io.open("/home/aisling/.config/xournalpp/plugins/Penscript/b2calls","w+")
  io.output(filewrite)
  io.write(b2calls)
  filewrite:close()
  --STEP THREE: ZERO THE AMOUNT OF CALLS OF B1
  file2 = io.open("/home/aisling/.config/xournalpp/plugins/Penscript/b1calls","w+")
  io.output(file2)
  io.write(0)
  file2:close()

  if b2calls % 2  == 0 then
    app.uiAction({["action"]="ACTION_TOOL_HAND"})
	app.uiAction({["action"]="ACTION_SAVE"})
  else
    app.uiAction({["action"]="ACTION_TOOL_ERASER"})
  end
end

--button1()
