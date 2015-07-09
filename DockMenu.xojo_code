#tag Module
Protected Module DockMenu
	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function delDockMenuHandler() As Ptr
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function impl_applicationDockMenu(id as Ptr, sel as Ptr, sender as Ptr) As Ptr
		  #pragma unused id
		  #pragma unused sel
		  #pragma unused sender
		  
		  
		  if theHandler = nil then return nil
		  
		  return theHandler.Invoke
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub install(handler As delDockMenuHandler = nil)
		  declare function NSClassFromString    lib Cocoa (aClassName As CFStringRef) As Ptr
		  declare function sharedApplication    lib Cocoa selector "sharedApplication" (cls as Ptr) as Ptr
		  declare function getDelegate          lib Cocoa selector "delegate" (id as Ptr) as Ptr
		  declare function object_getClass      lib Cocoa (obj As Ptr) As Ptr
		  declare function NSSelectorFromString lib Cocoa (aSelectorName As CFStringRef) As Ptr
		  declare function class_addMethod      lib Cocoa (cls As Ptr, name As Ptr, imp As Ptr, types As CFStringRef) As boolean
		  declare function respondsToSel        lib Cocoa selector "respondsToSelector:" (id As Ptr, sel As Ptr) As boolean
		  
		  
		  theHandler = handler
		  
		  if isInstalled then return
		  
		  
		  //get xojos app delegate class
		  dim nsappCls As Ptr      = NSClassFromString("NSApplication")
		  dim nsapp As Ptr         = sharedApplication(nsappCls)
		  dim appDel As Ptr        = getDelegate(nsapp)
		  dim xojoAppDelCls As Ptr = object_getClass(appDel)
		  
		  //make selector to add
		  dim appDockMenuSel As Ptr = NSSelectorFromString("applicationDockMenu:")
		  
		  //check if selector is already there
		  if respondsToSel(appDel, appDockMenuSel) then
		    break
		    theError = 1 : "applicationDockMenu: is now part of the Xojo supplied application delegate"
		    return
		  end
		  
		  //add the method
		  if class_addMethod(xojoAppDelCls, appDockMenuSel, AddressOf impl_applicationDockMenu, "@@:@") then
		    isInstalled = true
		    theError = nil
		  else
		    break
		    theError = 2 : "unable to add applicationDockMenu:"
		  end
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function lastErrorCode() As integer
		  
		  if theError = nil then return 0
		  
		  return theError.Left
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function lastErrorMessage() As String
		  
		  if theError = nil then return "no error"
		  
		  return theError.Right
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub setHandler(handler As delDockMenuHandler)
		  
		  theHandler = handler
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function successfullyInstalled() As boolean
		  
		  return isInstalled
		End Function
	#tag EndMethod


	#tag Note, Name = description
		
		Module DockMenu, William Shank, 2015-7-9
		
		Adds method applicationDockMenu: to the app delegate which lets
		you return an NSMenu of items to show in the dock menu.
		
		
		
		============= Public API
		
		   DockMenu.install(handler As delDockMenuHandler = nil)
		
		This is probably the only thing you need to call.
		Pass the method you want called when the app requests the dock menu.
		Each time the dock menu is shown the handler is called.
		Pass nil or nothing to set the handler later.
		
		
		   Function foo() As Ptr
		
		This is the signature for handlers.
		The returned Ptr should be an NSMenu or nil.
		
		
		   DockMenu.setHandler(handler As delDockMenuHandler)
		
		Simply changes the handler. You may pass nil.
		
		
		   DockMenu.successfullyInstalled() As Boolean
		
		Returns True if applicationDockMenu: has been added. 
		
		
		   DockMenu.lastErrorCode() As Integer
		   DockMenu.lastErrorMessage() As String
		
		If installing was unsuccessful these return a code and message about why.
		Code 0 means no error.
		code  message
		0     
		1     applicationDockMenu: is now part of the Xojo supplied application delegate
		2     unable to add applicationDockMenu:
		
		
		
		============= Notes
		
		This module is self contained. Simply copy it to your project.
		
		You can use MacOSLib to construct the NSMenu.
		
		There's no mechanism to remove applicationDockMenu: once added. This is a
		limitation of the ObjC Runtime functions. To stop using a custom dock menu
		return nil from your handler or call DockMenu.setHandler(nil).
		
		DockMenu.install can be called multiple times and acts like an alias
		for DockMenu.setHandler.
		
		If an error occurs during a debug run the code will break into the debugger
		so you're forced to see it.
		
		If/When Xojo adds applicationDockMenu: to its app delegate this module
		will no longer work and there's no easy work-around. Hopefully they'll
		provide in-Xojo access at the same time.
		
		Not sure if 64bit will require changes.
		
		
		
		============= Example
		
		//App Event
		Sub Open()
		  DockMenu.install(AddressOf getDockMenu)
		End Sub
		
		//App Method
		Sub getDockMenu() As Ptr
		  dim m As Ptr = buildAnNSMenu()
		  return m
		End Sub
		
		
		
		============ Example with error checking
		
		//App Event
		Sub Open()
		  DockMenu.install(AddressOf getDockMenu)
		  if not DockMenu.successfullyInstalled then
		    MsgBox Str(DockMenu.lastErrorCode) + ", " + DockMenu.lastErrorMessage
		  end
		End Sub
		
		//App Method
		Sub getDockMenu() As Ptr
		  dim m As Ptr = buildAnNSMenu()
		  return m
		End Sub
		
		
		
		============= Internal Structure
		
		Pretty simple. Not much to say. All the meat is in DockMenu.install.
		
		
		
		============= Development References
		
		http://cocoadevcentral.com/articles/000036.php
		https://developer.apple.com/library/mac/documentation/Cocoa/Reference/NSApplicationDelegate_Protocol/
		https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/index.html
	#tag EndNote


	#tag Property, Flags = &h21
		Private isInstalled As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theError As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theHandler As delDockMenuHandler
	#tag EndProperty


	#tag Constant, Name = Cocoa, Type = String, Dynamic = False, Default = \"Cocoa", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
