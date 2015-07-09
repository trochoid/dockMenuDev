# dockMenuDev
Customize the dock menu in Xojo


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
