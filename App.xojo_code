#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  DockMenu.install(AddressOf getDockMenu)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function getDockMenu() As Ptr
		  
		  //create 3 item menu
		  if theMenu = nil then
		    
		    theMenu = new NSMenu
		    
		    dim action As Variant = AddressOf handleDockMenuChoice
		    
		    theMenu.addItem(new NSMenuItem("New Window", action, 0))
		    theMenu.addItem(new NSMenuItem("Render",     action, 1))
		    theMenu.addItem(new NSMenuItem("Stop",       action, 2))
		    
		  end
		  
		  //update middle item on each call
		  static pass As integer
		  pass = pass + 1
		  theMenu.getItem(1).setTitle("Render " + Str(pass))
		  
		  //show menu
		  return theMenu.getID
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handleDockMenuChoice(sender As NSMenuItem)
		  
		  MainWindow.log "chose '" + sender.getTitle + "', has tag " + Str(sender.getTag)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private theMenu As NSMenu
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
