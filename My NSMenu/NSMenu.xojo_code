#tag Class
Protected Class NSMenu
	#tag Method, Flags = &h0
		Sub addItem(item As NSMenuItem)
		  
		  insertItem(items.Ubound + 1, item)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(title As String = "")
		  declare function alloc         lib Cocoa selector "alloc"          (classRef as Ptr) as Ptr
		  declare function initWithTitle lib Cocoa selector "initWithTitle:" (id as Ptr, title As CFStringRef) as Ptr
		  
		  
		  dim NSMenuCls As Ptr = ObjC.NSClassFromString("NSMenu")
		  
		  thisID = initWithTitle(alloc(NSMenuCls), title)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  declare sub release lib Cocoa selector "release" (id as Ptr)
		  
		  release(thisID)
		  
		  
		  //clean up items ?
		  //unhook OS ? 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getAllItems() As NSMenuItem()
		  
		  return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getID() As Ptr
		  
		  return thisID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getItem(index As integer) As NSMenuItem
		  
		  if not validIndex(index) then return nil
		  
		  return items(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getItemCount() As integer
		  
		  return items.Ubound + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub insertItem(index As integer, item As NSMenuItem)
		  declare sub insertItemAtIndex lib Cocoa selector "insertItem:atIndex:" (id as Ptr, item As Ptr, index As integer)
		  
		  
		  
		  if not validIndex(index) then return
		  
		  items.Insert(index, item)
		  
		  
		  
		  insertItemAtIndex(thisID, item.getID, index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeItem(index As integer)
		  declare sub removeItemAtIndex lib Cocoa selector "removeItemAtIndex:" (id as Ptr, index As integer)
		  
		  
		  
		  if not validIndex(index) then return
		  
		  items.Remove(index)
		  
		  
		  
		  removeItemAtIndex(thisID, index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeItemObj(item As NSMenuItem)
		  
		  for idx As integer = 0 to items.Ubound
		    
		    if item = items(idx) then
		      removeItem(idx)
		      exit
		    end
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function validIndex(index As integer) As boolean
		  
		  return index >= 0 and index <= items.Ubound + 1
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private items() As NSMenuItem
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
