#tag Class
Protected Class NSMenuItem
	#tag Method, Flags = &h0
		Sub Constructor(title As String, actionHandler As delNSMenuItemAction, newTag As Variant = nil)
		  declare function alloc         lib Cocoa selector "alloc"      (classRef as Ptr) as Ptr
		  declare function init          lib Cocoa selector "init"       (id as Ptr) as Ptr
		  declare function initWithTitle lib Cocoa selector "initWithTitle:action:keyEquivalent:" (id as Ptr, title As CFStringRef, action As Ptr, keyEquiv As CFStringRef) as Ptr
		  declare sub      setTarget     lib Cocoa selector "setTarget:" (id as Ptr, target As Ptr)
		  
		  //make action selector
		  dim actionSel As Ptr = ObjC.NSSelectorFromString("doAction:")
		  
		  //make targetCls with implemented selector and a singleton instance
		  if targetCls = nil then  
		    targetCls = ObjC.objc_allocateClassPair(ObjC.NSClassFromString("NSObject"), "MyTargetClass", 0)
		    ObjC.objc_registerClassPair(targetCls)
		    if not ObjC.class_addMethod(targetCls, actionSel, AddressOf impl_Action, "v@:@") then break
		    targetID = init(alloc(targetCls))
		  end
		  
		  //create NSMenuItem instance with said action and set target to singleton
		  dim NSMenuItemCls As Ptr = ObjC.NSClassFromString("NSMenuItem")
		  thisID = initWithTitle(alloc(NSMenuItemCls), title, actionSel, "")
		  setTarget(thisID, targetID)
		  
		  //store infos
		  theTitle = title
		  theHandler = actionHandler
		  theTag = newTag
		  
		  //add to dispatch
		  if dispatch = nil then dispatch = new Dictionary
		  dispatch.Value(thisID) = self
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub delNSMenuItemAction(sender As NSMenuItem)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Destructor()
		  declare sub release lib Cocoa selector "release" (id as Ptr)
		  
		  release(thisID)
		  
		  if dispatch.HasKey(thisID) then dispatch.Remove(thisID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getID() As Ptr
		  
		  return thisID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getTag() As Variant
		  
		  return theTag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getTitle() As String
		  
		  return theTitle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_Action(id As Ptr, sel As Ptr, sender As Ptr)
		  #pragma unused id
		  #pragma unused sel
		  
		  
		  dim m As NSMenuItem = dispatch.Lookup(sender, nil)
		  
		  if m = nil or m.theHandler = nil then return
		  
		  m.theHandler.Invoke(m)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setActionHandler(actionHandler As delNSMenuItemAction)
		  
		  theHandler = actionHandler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTag(newTag As Variant)
		  
		  theTag = newTag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTitle(newTitle As String)
		  declare sub doSetTitle lib Cocoa selector "setTitle:" (id as Ptr, newTitle As CFStringRef)
		  
		  theTitle = newTitle
		  
		  doSetTitle(thisID, newTitle)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared dispatch As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared targetCls As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared targetID As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theHandler As delNSMenuItemAction
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theTag As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theTitle As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private thisID As Ptr
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
End Class
#tag EndClass
