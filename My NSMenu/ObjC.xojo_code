#tag Module
Protected Module ObjC
	#tag Method, Flags = &h1
		Protected Function class_addIvar(cls As Ptr, name As CFStringRef, size As Ptr, alignment As UInt8, types As CFStringRef) As boolean
		  declare function class_addIvar lib Cocoa (cls As Ptr, name As CFStringRef, size As Ptr, alignment As UInt8, types As CFStringRef) As boolean
		  return class_addIvar(cls, name, size, alignment, types)
		  
		  //Adds a new instance variable to a class.
		  //BOOL class_addIvar ( Class cls , const char * name , size_t size , uint8_t alignment , const char * types );
		  //Return Value YES true if the instance variable was added successfully, otherwise NO false (for example, the class already contains an instance variable with that name).
		  //Discussion This function may only be called after objc_allocateClassPair and before objc_registerClassPair . Adding an instance variable to an existing class is not supported. The class must not be a metaclass. Adding an instance variable to a metaclass is not supported. The instance variable's minimum alignment in bytes is 1<<align . The minimum alignment of an instance variable depends on the ivar's type and the machine architecture. For variables of any pointer type, pass log2(sizeof(pointer_type)) .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_addMethod(cls As Ptr, name As Ptr, imp As Ptr, types As CFStringRef) As boolean
		  declare function class_addMethod lib Cocoa (cls As Ptr, name As Ptr, imp As Ptr, types As CFStringRef) As boolean
		  return class_addMethod(cls, name, imp, types)
		  
		  //Adds a new method to a class with a given name and implementation.
		  //BOOL class_addMethod ( Class cls , SEL name , IMP imp , const char * types );
		  //Parameters cls The class to which to add a method. name A selector that specifies the name of the method being added. imp A function which is the implementation of the new method. The function must take at least two arguments‚Äî self and _cmd . types An array of characters that describe the types of the arguments to the method. For possible values, see Objective-C Runtime Programming Guide > Type Encodings in Objective-C Runtime Programming Guide . Since the function must take at least two arguments‚Äî self and _cmd , the second and third characters must be ‚Äú @: ‚Äù (the first character is the return type).
		  //Return Value YES true if the method was added successfully, otherwise NO false (for example, the class already contains a method implementation with that name).
		  //Discussion class_addMethod will add an override of a superclass's implementation, but will not replace an existing implementation in this class. To change an existing implementation, use method_setImplementation . An Objective-C method is simply a C function that take at least two arguments‚Äî self and _cmd . For example, given the following function: void myMethodIMP ( id self , SEL _cmd ) { // implementation .... } you can dynamically add it to a class as a method (called resolveThisMethodDynamically ) like this: class_addMethod ([ self class ], @selector ( resolveThisMethodDynamically ), ( IMP ) myMethodIMP , "v@:" );
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_addProperty(cls As Ptr, name As CFStringRef, attributesp As Ptr, attributeCount As UInt32) As boolean
		  declare function class_addProperty lib Cocoa (cls As Ptr, name As CFStringRef, attributesp As Ptr, attributeCount As UInt32) As boolean
		  return class_addProperty(cls, name, attributesp, attributeCount)
		  
		  //Adds a property to a class.
		  //BOOL class_addProperty ( Class cls , const char * name , const objc_property_attribute_t * attributes , unsigned int attributeCount );
		  //Parameters cls The class to modify. name The name of the property. attributes An array of property attributes. attributeCount The number of attributes in attributes .
		  //Return Value YES true if the property was added successfully; otherwise NO false (for example, this function returns NO false if the class already has that property).
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		  //See Also class_replaceProperty
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_addProtocol(cls As Ptr, protocol As Ptr) As boolean
		  declare function class_addProtocol lib Cocoa (cls As Ptr, protocol As Ptr) As boolean
		  return class_addProtocol(cls, protocol)
		  
		  //Adds a protocol to a class.
		  //BOOL class_addProtocol ( Class cls , Protocol * protocol );
		  //Parameters cls The class to modify. outCount The protocol to add to cls .
		  //Return Value YES true if the protocol was added successfully, otherwise NO false (for example, the class already conforms to that protocol).
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_conformsToProtocol(cls As Ptr, protocol As Ptr) As boolean
		  declare function class_conformsToProtocol lib Cocoa (cls As Ptr, protocol As Ptr) As boolean
		  return class_conformsToProtocol(cls, protocol)
		  
		  //Returns a Boolean value that indicates whether a class conforms to a given protocol.
		  //BOOL class_conformsToProtocol ( Class cls , Protocol * protocol );
		  //Parameters cls The class you want to inspect. protocol A protocol.
		  //Return Value YES true if cls conforms to protocol , otherwise NO false .
		  //Discussion You should usually use NSObject ‚Äòs conformsToProtocol: method instead of this function.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_copyIvarList(cls As Ptr, outCount As UInt32) As Ptr
		  declare function class_copyIvarList lib Cocoa (cls As Ptr, outCount As UInt32) As Ptr
		  return class_copyIvarList(cls, outCount)
		  
		  //Describes the instance variables declared by a class.
		  //Ivar * class_copyIvarList ( Class cls , unsigned int * outCount );
		  //Parameters cls The class to inspect. outCount On return, contains the length of the returned array. If outCount is NULL , the length is not returned.
		  //Return Value An array of pointers of type Ivar describing the instance variables declared by the class. Any instance variables declared by superclasses are not included. The array contains *outCount pointers followed by a NULL terminator. You must free the array with free() . If the class declares no instance variables, or cls is Nil , NULL is returned and *outCount is 0 .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_copyMethodList(cls As Ptr, byref outCount As UInt32) As Ptr
		  'declare function class_copyMethodList lib Cocoa (cls As Ptr, outCount As UInt32) As Ptr
		  'return class_copyMethodList(cls, outCount)
		  
		  declare function class_copyMethodList lib Cocoa (cls As Ptr, byref outCount As UInt32) As Ptr
		  dim c As UInt32
		  dim m As Ptr = class_copyMethodList(cls, c)
		  outCount = c
		  return m
		  
		  //Describes the instance methods implemented by a class.
		  //Method * class_copyMethodList ( Class cls , unsigned int * outCount );
		  //Parameters cls The class you want to inspect. outCount On return, contains the length of the returned array. If outCount is NULL , the length is not returned.
		  //Return Value An array of pointers of type Method describing the instance methods implemented by the class‚Äîany instance methods implemented by superclasses are not included. The array contains *outCount pointers followed by a NULL terminator. You must free the array with free() . If cls implements no instance methods, or cls is Nil , returns NULL and *outCount is 0 .
		  //Discussion To get the class methods of a class, use class_copyMethodList(object_getClass(cls), &count) . To get the implementations of methods that may be implemented by superclasses, use class_getInstanceMethod or class_getClassMethod .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_copyPropertyList(cls As Ptr, outCount As UInt32) As Ptr
		  declare function class_copyPropertyList lib Cocoa (cls As Ptr, outCount As UInt32) As Ptr
		  return class_copyPropertyList(cls, outCount)
		  
		  //Describes the properties declared by a class.
		  //objc_property_t * class_copyPropertyList ( Class cls , unsigned int * outCount );
		  //Parameters cls The class you want to inspect. outCount On return, contains the length of the returned array. If outCount is NULL , the length is not returned.
		  //Return Value An array of pointers of type objc_property_t describing the properties declared by the class. Any properties declared by superclasses are not included. The array contains *outCount pointers followed by a NULL terminator. You must free the array with free() . If cls declares no properties, or cls is Nil , returns NULL and *outCount is 0 .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_copyProtocolList(cls As Ptr, outCount As UInt32) As Ptr
		  declare function class_copyProtocolList lib Cocoa (cls As Ptr, outCount As UInt32) As Ptr
		  return class_copyProtocolList(cls, outCount)
		  
		  //Describes the protocols adopted by a class.
		  //Protocol ** class_copyProtocolList ( Class cls , unsigned int * outCount );
		  //Parameters cls The class you want to inspect. outCount On return, contains the length of the returned array. If outCount is NULL , the length is not returned.
		  //Return Value An array of pointers of type Protocol* describing the protocols adopted by the class. Any protocols adopted by superclasses or other protocols are not included. The array contains *outCount pointers followed by a NULL terminator. You must free the array with free() . If cls adopts no protocols, or cls is Nil , returns NULL and *outCount is 0 .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_createInstance(cls As Ptr, extraBytes As Ptr) As Ptr
		  declare function class_createInstance lib Cocoa (cls As Ptr, extraBytes As Ptr) As Ptr
		  return class_createInstance(cls, extraBytes)
		  
		  //Creates an instance of a class, allocating memory for the class in the default malloc memory zone.
		  //id class_createInstance ( Class cls , size_t extraBytes );
		  //Parameters cls The class that you want to allocate an instance of. extraBytes An integer indicating the number of extra bytes to allocate. The additional bytes can be used to store additional instance variables beyond those defined in the class definition.
		  //Return Value An instance of the class cls .
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		  //See Also objc_constructInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getClassMethod(cls As Ptr, name As Ptr) As Ptr
		  declare function class_getClassMethod lib Cocoa (cls As Ptr, name As Ptr) As Ptr
		  return class_getClassMethod(cls, name)
		  
		  //Returns a pointer to the data structure describing a given class method for a given class.
		  //Method class_getClassMethod ( Class cls , SEL name );
		  //Parameters aClass A pointer to a class definition. Pass the class that contains the method you want to retrieve. aSelector A pointer of type SEL . Pass the selector of the method you want to retrieve.
		  //Return Value A pointer to the Method data structure that corresponds to the implementation of the selector specified by aSelector for the class specified by aClass , or NULL if the specified class or its superclasses do not contain a class method with the specified selector.
		  //Discussion Note that this function searches superclasses for implementations, whereas class_copyMethodList does not.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getClassVariable(cls As Ptr, name As CFStringRef) As Ptr
		  declare function class_getClassVariable lib Cocoa (cls As Ptr, name As CFStringRef) As Ptr
		  return class_getClassVariable(cls, name)
		  
		  //Returns the Ivar for a specified class variable of a given class.
		  //Ivar class_getClassVariable ( Class cls , const char * name );
		  //Parameters cls The class definition whose class variable you wish to obtain. name The name of the class variable definition to obtain.
		  //Return Value A pointer to an Ivar data structure containing information about the class variable specified by name .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getImageName(cls As Ptr) As CFStringRef
		  declare function class_getImageName lib Cocoa (cls As Ptr) As CFStringRef
		  return class_getImageName(cls)
		  
		  //Returns the name of the dynamic library a class originated from.
		  //const char * class_getImageName ( Class cls );
		  //Parameters cls The class you are inquiring about.
		  //Return Value A C string representing the name of the library containing the cls class.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getInstanceMethod(cls As Ptr, name As Ptr) As Ptr
		  declare function class_getInstanceMethod lib Cocoa (cls As Ptr, name As Ptr) As Ptr
		  return class_getInstanceMethod(cls, name)
		  
		  //Returns a specified instance method for a given class.
		  //Method class_getInstanceMethod ( Class cls , SEL name );
		  //Parameters aClass The class you want to inspect. aSelector The selector of the method you want to retrieve.
		  //Return Value The method that corresponds to the implementation of the selector specified by aSelector for the class specified by aClass , or NULL if the specified class or its superclasses do not contain an instance method with the specified selector.
		  //Discussion Note that this function searches superclasses for implementations, whereas class_copyMethodList does not.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getInstanceSize(cls As Ptr) As Ptr
		  declare function class_getInstanceSize lib Cocoa (cls As Ptr) As Ptr
		  return class_getInstanceSize(cls)
		  
		  //Returns the size of instances of a class.
		  //size_t class_getInstanceSize ( Class cls );
		  //Parameters cls A class object.
		  //Return Value The size in bytes of instances of the class cls , or 0 if cls is Nil .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getInstanceVariable(cls As Ptr, name As CFStringRef) As Ptr
		  declare function class_getInstanceVariable lib Cocoa (cls As Ptr, name As CFStringRef) As Ptr
		  return class_getInstanceVariable(cls, name)
		  
		  //Returns the Ivar for a specified instance variable of a given class.
		  //Ivar class_getInstanceVariable ( Class cls , const char * name );
		  //Parameters cls The class whose instance variable you wish to obtain. name The name of the instance variable definition to obtain.
		  //Return Value A pointer to an Ivar data structure containing information about the instance variable specified by name .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getIvarLayout(cls As Ptr) As Ptr
		  declare function class_getIvarLayout lib Cocoa (cls As Ptr) As Ptr
		  return class_getIvarLayout(cls)
		  
		  //Returns a description of the Ivar layout for a given class.
		  //const uint8_t * class_getIvarLayout ( Class cls );
		  //Parameters cls The class to inspect.
		  //Return Value A description of the Ivar layout for cls .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getMethodImplementation(cls As Ptr, name As Ptr) As Ptr
		  declare function class_getMethodImplementation lib Cocoa (cls As Ptr, name As Ptr) As Ptr
		  return class_getMethodImplementation(cls, name)
		  
		  //Returns the function pointer that would be called if a particular message were sent to an instance of a class.
		  //IMP class_getMethodImplementation ( Class cls , SEL name );
		  //Parameters cls The class you want to inspect. name A selector.
		  //Return Value The function pointer that would be called if [object name] were called with an instance of the class, or NULL if cls is Nil .
		  //Discussion class_getMethodImplementation may be faster than method_getImplementation(class_getInstanceMethod(cls, name)) . The function pointer returned may be a function internal to the runtime instead of an actual method implementation. For example, if instances of the class do not respond to the selector, the function pointer returned will be part of the runtime's message forwarding machinery.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getMethodImplementation_stret(cls As Ptr, name As Ptr) As Ptr
		  declare function class_getMethodImplementation_stret lib Cocoa (cls As Ptr, name As Ptr) As Ptr
		  return class_getMethodImplementation_stret(cls, name)
		  
		  //Returns the function pointer that would be called if a particular message were sent to an instance of a class.
		  //IMP class_getMethodImplementation_stret ( Class cls , SEL name );
		  //Parameters cls The class you want to inspect. name A selector.
		  //Return Value The function pointer that would be called if [object name] were called with an instance of the class, or NULL if cls is Nil .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getName(cls As Ptr) As CFStringRef
		  declare function class_getName lib Cocoa (cls As Ptr) As CFStringRef
		  return class_getName(cls)
		  
		  //Returns the name of a class.
		  //const char * class_getName ( Class cls );
		  //Parameters cls A class object.
		  //Return Value The name of the class, or the empty string if cls is Nil .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getProperty(cls As Ptr, name As CFStringRef) As Ptr
		  declare function class_getProperty lib Cocoa (cls As Ptr, name As CFStringRef) As Ptr
		  return class_getProperty(cls, name)
		  
		  //Returns a property with a given name of a given class.
		  //objc_property_t class_getProperty ( Class cls , const char * name );
		  //Return Value A pointer of type objc_property_t describing the property, or NULL if the class does not declare a property with that name, or NULL if cls is Nil .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getSuperclass(cls As Ptr) As Ptr
		  declare function class_getSuperclass lib Cocoa (cls As Ptr) As Ptr
		  return class_getSuperclass(cls)
		  
		  //Returns the superclass of a class.
		  //Class class_getSuperclass ( Class cls );
		  //Parameters cls A class object.
		  //Return Value The superclass of the class, or Nil if cls is a root class, or Nil if cls is Nil .
		  //Discussion You should usually use NSObject ‚Äòs superclass method instead of this function.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getVersion(cls As Ptr) As integer
		  declare function class_getVersion lib Cocoa (cls As Ptr) As integer
		  return class_getVersion(cls)
		  
		  //Returns the version number of a class definition.
		  //int class_getVersion ( Class cls );
		  //Parameters theClass A pointer to an Class data structure. Pass the class definition for which you wish to obtain the version.
		  //Return Value An integer indicating the version number of the class definition.
		  //Discussion You can use the version number of the class definition to provide versioning of the interface that your class represents to other classes. This is especially useful for object serialization (that is, archiving of the object in a flattened form), where it is important to recognize changes to the layout of the instance variables in different class-definition versions. Classes derived from the Foundation framework NSObject class can obtain the class-definition version number using the getVersion class method, which is implemented using the class_getVersion function.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_getWeakIvarLayout(cls As Ptr) As Ptr
		  declare function class_getWeakIvarLayout lib Cocoa (cls As Ptr) As Ptr
		  return class_getWeakIvarLayout(cls)
		  
		  //Returns a description of the layout of weak Ivar s for a given class.
		  //const uint8_t * class_getWeakIvarLayout ( Class cls );
		  //Parameters cls The class to inspect.
		  //Return Value A description of the layout of the weak Ivar s for cls .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_isMetaClass(cls As Ptr) As boolean
		  declare function class_isMetaClass lib Cocoa (cls As Ptr) As boolean
		  return class_isMetaClass(cls)
		  
		  //Returns a Boolean value that indicates whether a class object is a metaclass.
		  //BOOL class_isMetaClass ( Class cls );
		  //Parameters cls A class object.
		  //Return Value YES true if cls is a metaclass, NO false if cls is a non-meta class, NO false if cls is Nil .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_replaceMethod(cls As Ptr, name As Ptr, imp As Ptr, types As CFStringRef) As Ptr
		  declare function class_replaceMethod lib Cocoa (cls As Ptr, name As Ptr, imp As Ptr, types As CFStringRef) As Ptr
		  return class_replaceMethod(cls, name, imp, types)
		  
		  //Replaces the implementation of a method for a given class.
		  //IMP class_replaceMethod ( Class cls , SEL name , IMP imp , const char * types );
		  //Parameters cls The class you want to modify. name A selector that identifies the method whose implementation you want to replace. imp The new implementation for the method identified by name for the class identified by cls . types An array of characters that describe the types of the arguments to the method. For possible values, see Objective-C Runtime Programming Guide > Type Encodings in Objective-C Runtime Programming Guide . Since the function must take at least two arguments‚Äî self and _cmd , the second and third characters must be ‚Äú @: ‚Äù (the first character is the return type).
		  //Return Value The previous implementation of the method identified by name for the class identified by cls .
		  //Discussion This function behaves in two different ways: If the method identified by name does not yet exist, it is added as if class_addMethod were called. The type encoding specified by types is used as given. If the method identified by name does exist, its IMP is replaced as if method_setImplementation were called. The type encoding specified by types is ignored.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub class_replaceProperty(cls As Ptr, name As CFStringRef, attributesp As Ptr, attributeCount As UInt32)
		  declare sub class_replaceProperty lib Cocoa (cls As Ptr, name As CFStringRef, attributesp As Ptr, attributeCount As UInt32)
		  class_replaceProperty(cls, name, attributesp, attributeCount)
		  
		  //Replace a property of a class.
		  //void class_replaceProperty ( Class cls , const char * name , const objc_property_attribute_t * attributes , unsigned int attributeCount );
		  //Parameters cls The class to modify. name The name of the property. attributes An array of property attributes. attributeCount The number of attributes in attributes .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		  //See Also class_addProperty
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_respondsToSelector(cls As Ptr, sel As Ptr) As boolean
		  declare function class_respondsToSelector lib Cocoa (cls As Ptr, sel As Ptr) As boolean
		  return class_respondsToSelector(cls, sel)
		  
		  //Returns a Boolean value that indicates whether instances of a class respond to a particular selector.
		  //BOOL class_respondsToSelector ( Class cls , SEL sel );
		  //Parameters cls The class you want to inspect. sel A selector.
		  //Return Value YES true if instances of the class respond to the selector, otherwise NO false .
		  //Discussion You should usually use NSObject 's respondsToSelector: or instancesRespondToSelector: methods instead of this function.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub class_setIvarLayout(cls As Ptr, layout As Ptr)
		  declare sub class_setIvarLayout lib Cocoa (cls As Ptr, layout As Ptr)
		  class_setIvarLayout(cls, layout)
		  
		  //Sets the Ivar layout for a given class.
		  //void class_setIvarLayout ( Class cls , const uint8_t * layout );
		  //Parameters cls The class to modify. layout The layout of the Ivar s for cls .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_setSuperclass(cls As Ptr, newSuper As Ptr) As Ptr
		  declare function class_setSuperclass lib Cocoa (cls As Ptr, newSuper As Ptr) As Ptr
		  return class_setSuperclass(cls, newSuper)
		  
		  //Sets the superclass of a given class.
		  //Class class_setSuperclass ( Class cls , Class newSuper );
		  //Parameters cls The class whose superclass you want to set. newSuper The new superclass for cls .
		  //Return Value The old superclass for cls .
		  //Special Considerations You should not use this function.
		  //Import Statement 
		  //Availability Available in OS X v10.5 and later. Deprecated in OS X v10.5.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub class_setVersion(cls As Ptr, version As integer)
		  declare sub class_setVersion lib Cocoa (cls As Ptr, version As integer)
		  class_setVersion(cls, version)
		  
		  //Sets the version number of a class definition.
		  //void class_setVersion ( Class cls , int version );
		  //Parameters theClass A pointer to an Class data structure. Pass the class definition for which you wish to set the version. version An integer. Pass the new version number of the class definition.
		  //Discussion You can use the version number of the class definition to provide versioning of the interface that your class represents to other classes. This is especially useful for object serialization (that is, archiving of the object in a flattened form), where it is important to recognize changes to the layout of the instance variables in different class-definition versions. Classes derived from the Foundation framework NSObject class can set the class-definition version number using the setVersion: class method, which is implemented using the class_setVersion function.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub class_setWeakIvarLayout(cls As Ptr, layout As Ptr)
		  declare sub class_setWeakIvarLayout lib Cocoa (cls As Ptr, layout As Ptr)
		  class_setWeakIvarLayout(cls, layout)
		  
		  //Sets the layout for weak Ivar s for a given class.
		  //void class_setWeakIvarLayout ( Class cls , const uint8_t * layout );
		  //Parameters cls The class to modify. layout The layout of the weak Ivar s for cls .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function imp_getBlock(anImp As Ptr) As Ptr
		  declare function imp_getBlock lib Cocoa (anImp As Ptr) As Ptr
		  return imp_getBlock(anImp)
		  
		  //Returns the block associated with an IMP that was created using imp_implementationWithBlock .
		  //id imp_getBlock ( IMP anImp );
		  //Parameters anImp The IMP that calls this block.
		  //Return Value The block called by anImp .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		  //See Also imp_implementationWithBlock
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function imp_implementationWithBlock(block As Ptr) As Ptr
		  declare function imp_implementationWithBlock lib Cocoa (block As Ptr) As Ptr
		  return imp_implementationWithBlock(block)
		  
		  //Creates a pointer to a function that calls the specified block when the method is called.
		  //IMP imp_implementationWithBlock ( id block );
		  //Parameters block The block that implements this method. The signature of block should be method_return_type ^(id self, self, method_args ‚Ä¶) . The selector of the method is not available to block . block is copied with Block_copy() .
		  //Return Value The IMP that calls block . You must dispose of the returned IMP using the function.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		  //See Also imp_getBlock
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function imp_removeBlock(anImp As Ptr) As boolean
		  declare function imp_removeBlock lib Cocoa (anImp As Ptr) As boolean
		  return imp_removeBlock(anImp)
		  
		  //Disassociates a block from an IMP that was created using imp_implementationWithBlock , and releases the copy of the block that was created.
		  //BOOL imp_removeBlock ( IMP anImp );
		  //Parameters anImp An IMP that was created using the imp_implementationWithBlock function.
		  //Return Value YES true if the block was released successfully; otherwise, NO false (for example, the function returns NO false if the block was not used to create anImp previously).
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		  //See Also imp_implementationWithBlock
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ivar_getName(v As Ptr) As CFStringRef
		  declare function ivar_getName lib Cocoa (v As Ptr) As CFStringRef
		  return ivar_getName(v)
		  
		  //Returns the name of an instance variable.
		  //const char * ivar_getName ( Ivar v );
		  //Return Value A C string containing the instance variable's name.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ivar_getOffset(v As Ptr) As Ptr
		  declare function ivar_getOffset lib Cocoa (v As Ptr) As Ptr
		  return ivar_getOffset(v)
		  
		  //Returns the offset of an instance variable.
		  //ptrdiff_t ivar_getOffset ( Ivar v );
		  //Discussion For instance variables of type id or other object types, call object_getIvar and object_setIvar instead of using this offset to access the instance variable data directly.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ivar_getTypeEncoding(v As Ptr) As CFStringRef
		  declare function ivar_getTypeEncoding lib Cocoa (v As Ptr) As CFStringRef
		  return ivar_getTypeEncoding(v)
		  
		  //Returns the type string of an instance variable.
		  //const char * ivar_getTypeEncoding ( Ivar v );
		  //Return Value A C string containing the instance variable's type encoding.
		  //Discussion For possible values, see Objective-C Runtime Programming Guide > Type Encodings in Objective-C Runtime Programming Guide .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function method_copyArgumentType(m As Ptr, index As UInt32) As CFStringRef
		  declare function method_copyArgumentType lib Cocoa (m As Ptr, index As UInt32) As CFStringRef
		  return method_copyArgumentType(m, index)
		  
		  //Returns a string describing a single parameter type of a method.
		  //char * method_copyArgumentType ( Method m , unsigned int index );
		  //Parameters method The method to inspect. index The index of the parameter to inspect.
		  //Return Value A C string describing the type of the parameter at index index , or NULL if method has no parameter index index . You must free the string with free() .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function method_copyReturnType(m As Ptr) As CFStringRef
		  declare function method_copyReturnType lib Cocoa (m As Ptr) As CFStringRef
		  return method_copyReturnType(m)
		  
		  //Returns a string describing a method's return type.
		  //char * method_copyReturnType ( Method m );
		  //Parameters method The method to inspect.
		  //Return Value A C string describing the return type. You must free the string with free() .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub method_exchangeImplementations(m1 As Ptr, m2 As Ptr)
		  declare sub method_exchangeImplementations lib Cocoa (m1 As Ptr, m2 As Ptr)
		  method_exchangeImplementations(m1, m2)
		  
		  //Exchanges the implementations of two methods.
		  //void method_exchangeImplementations ( Method m1 , Method m2 );
		  //Discussion This is an atomic version of the following: IMP imp1 = method_getImplementation ( m1 ); IMP imp2 = method_getImplementation ( m2 ); method_setImplementation ( m1 , imp2 ); method_setImplementation ( m2 , imp1 );
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub method_getArgumentType(m As Ptr, index As UInt32, dst As CFStringRef, dst_len As Ptr)
		  declare sub method_getArgumentType lib Cocoa (m As Ptr, index As UInt32, dst As CFStringRef, dst_len As Ptr)
		  method_getArgumentType(m, index, dst, dst_len)
		  
		  //Returns by reference a string describing a single parameter type of a method.
		  //void method_getArgumentType ( Method m , unsigned int index , char * dst , size_t dst_len );
		  //Discussion The parameter type string is copied to dst . dst is filled as if strncpy(dst, parameter_type, dst_len) were called. If the method contains no parameter with that index, dst is filled as if strncpy(dst, "", dst_len) were called.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function method_getDescription(m As Ptr) As Ptr
		  declare function method_getDescription lib Cocoa (m As Ptr) As Ptr
		  return method_getDescription(m)
		  
		  //Returns a method description structure for a specified method.
		  //struct objc_method_description * method_getDescription ( Method m );
		  //Parameters m The method you want to inquire about.
		  //Return Value An objc_method_description structure that describes the method specified by m .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function method_getImplementation(m As Ptr) As Ptr
		  declare function method_getImplementation lib Cocoa (m As Ptr) As Ptr
		  return method_getImplementation(m)
		  
		  //Returns the implementation of a method.
		  //IMP method_getImplementation ( Method m );
		  //Parameters method The method to inspect.
		  //Return Value A function pointer of type IMP .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function method_getName(m As Ptr) As Ptr
		  declare function method_getName lib Cocoa (m As Ptr) As Ptr
		  return method_getName(m)
		  
		  //Returns the name of a method.
		  //SEL method_getName ( Method m );
		  //Parameters method The method to inspect.
		  //Return Value A pointer of type SEL.
		  //Discussion To get the method name as a C string, call sel_getName(method_getName(method)) .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function method_getNumberOfArguments(m As Ptr) As UInt32
		  declare function method_getNumberOfArguments lib Cocoa (m As Ptr) As UInt32
		  return method_getNumberOfArguments(m)
		  
		  //Returns the number of arguments accepted by a method.
		  //unsigned int method_getNumberOfArguments ( Method m );
		  //Parameters method A pointer to a Method data structure. Pass the method in question.
		  //Return Value An integer containing the number of arguments accepted by the given method.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub method_getReturnType(m As Ptr, dst As CFStringRef, dst_len As Ptr)
		  declare sub method_getReturnType lib Cocoa (m As Ptr, dst As CFStringRef, dst_len As Ptr)
		  method_getReturnType(m, dst, dst_len)
		  
		  //Returns by reference a string describing a method's return type.
		  //void method_getReturnType ( Method m , char * dst , size_t dst_len );
		  //Discussion The method's return type string is copied to dst . dst is filled as if strncpy(dst, parameter_type, dst_len) were called.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function method_getTypeEncoding(m As Ptr) As CFStringRef
		  declare function method_getTypeEncoding lib Cocoa (m As Ptr) As CFStringRef
		  return method_getTypeEncoding(m)
		  
		  //Returns a string describing a method's parameter and return types.
		  //const char * method_getTypeEncoding ( Method m );
		  //Parameters method The method to inspect.
		  //Return Value A C string. The string may be NULL .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function method_invoke(receiver As Ptr, m As Ptr) As Ptr
		  declare function method_invoke lib Cocoa (receiver As Ptr, m As Ptr) As Ptr
		  return method_invoke(receiver, m)
		  
		  //Calls the implementation of a specified method.
		  //id method_invoke ( id receiver , Method m , ... );
		  //Parameters receiver A pointer to the instance of the class that you want to invoke the method on. This value must not be nil . m The method whose implementation you want to call. ... A variable argument list containing the arguments to the method.
		  //Return Value The return value of the method.
		  //Discussion Using this function to call the implementation of a method is faster than calling method_getImplementation and method_getName .
		  //Import Statement 
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub method_invoke_stret(receiver As Ptr, m As Ptr)
		  declare sub method_invoke_stret lib Cocoa (receiver As Ptr, m As Ptr)
		  method_invoke_stret(receiver, m)
		  
		  //Calls the implementation of a specified method that returns a data-structure.
		  //void method_invoke_stret ( id receiver , Method m , ... );
		  //Parameters receiver A pointer to the instance of the class that you want to invoke the method on. This value must not be nil . m The method whose implementation you want to call. ... A variable argument list containing the arguments to the method.
		  //Discussion Using this function to call the implementation of a method is faster than calling method_getImplementation and method_getName .
		  //Import Statement 
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function method_setImplementation(m As Ptr, imp As Ptr) As Ptr
		  declare function method_setImplementation lib Cocoa (m As Ptr, imp As Ptr) As Ptr
		  return method_setImplementation(m, imp)
		  
		  //Sets the implementation of a method.
		  //IMP method_setImplementation ( Method m , IMP imp );
		  //Return Value The previous implementation of the method.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSClassFromString(aClassName As String) As Ptr
		  
		  declare function NSClassFromString lib Cocoa (aClassName As CFStringRef) As Ptr
		  return NSClassFromString(aClassName)
		  
		  'Obtains a class by name.
		  '
		  'Declaration
		  'OBJECTIVE-C
		  'Class NSClassFromString ( NSString *aClassName );
		  'Parameters
		  'aClassName
		  'The name of a class.
		  'Return Value
		  'The class object named by aClassName, or nil if no class by that name is currently loaded. If aClassName is nil, returns nil.
		  '
		  'Import Statement
		  'Availability
		  'Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NSGetSizeAndAlignment()
		  
		  'declare function NSClassFromString lib Cocoa (aClassName As CFStringRef) As Ptr
		  'return NSClassFromString(aClassName)
		  
		  'Obtains the actual size and the aligned size of an encoded type.
		  '
		  'Declaration
		  'OBJECTIVE-C
		  'const char * NSGetSizeAndAlignment ( const char *typePtr, NSUInteger *sizep, NSUInteger *alignp );
		  'Discussion
		  'Obtains the actual size and the aligned size of the first data type represented by typePtr and returns a pointer to the position of the next data type in typePtr. You can specify NULL for either sizep or alignp to ignore the corresponding information.
		  '
		  'The value returned in alignp is the aligned size of the data type; for example, on some platforms, the aligned size of a char might be 2 bytes while the actual physical size is 1 byte.
		  '
		  'Import Statement
		  'Availability
		  'Available in OS X v10.0 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSProtocolFromString(namestr As String) As Ptr
		  
		  declare function NSProtocolFromString lib Cocoa (namestr As CFStringRef) As Ptr
		  return NSProtocolFromString(namestr)
		  
		  'Returns a the protocol with a given name.
		  '
		  'Declaration
		  'OBJECTIVE-C
		  'Protocol * NSProtocolFromString ( NSString *namestr );
		  'Parameters
		  'namestr
		  'The name of a protocol.
		  'Return Value
		  'The protocol object named by namestr, or nil if no protocol by that name is currently loaded. If namestr is nil, returns nil.
		  '
		  'Import Statement
		  'Availability
		  'Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSSelectorFromString(aSelectorName As String) As Ptr
		  
		  declare function NSSelectorFromString lib Cocoa (aSelectorName As CFStringRef) As Ptr
		  return NSSelectorFromString(aSelectorName)
		  
		  'Returns the selector with a given name.
		  '
		  'Declaration
		  'OBJECTIVE-C
		  'SEL NSSelectorFromString ( NSString *aSelectorName );
		  'Parameters
		  'aSelectorName
		  'A string of any length, with any characters, that represents the name of a selector.
		  'Return Value
		  'The selector named by aSelectorName. If aSelectorName is nil, or cannot be converted to UTF-8 (this should be only due to insufficient memory), returns (SEL)0.
		  '
		  'Discussion
		  'To make a selector, NSSelectorFromString passes a UTF-8 encoded character representation of aSelectorName to sel_registerName and returns the value returned by that function. Note, therefore, that if the selector does not exist it is registered and the newly-registered selector is returned.
		  '
		  'Recall that a colon (“:”) is part of a method name; setHeight is not the same as setHeight:.
		  '
		  'Import Statement
		  'Availability
		  'Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSStringFromClass(aClass As Ptr) As String
		  
		  declare function NSStringFromClass lib Cocoa (aClass As Ptr) As CFStringRef
		  return NSStringFromClass(aClass)
		  
		  'Returns the name of a class as a string.
		  '
		  'Declaration
		  'OBJECTIVE-C
		  'NSString * NSStringFromClass ( Class aClass );
		  'Parameters
		  'aClass
		  'A class.
		  'Return Value
		  'A string containing the name of aClass. If aClass is nil, returns nil.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSStringFromProtocol(proto As Ptr) As String
		  
		  declare function NSStringFromProtocol lib Cocoa (proto As Ptr) As CFStringRef
		  return NSStringFromProtocol(proto)
		  
		  'Returns the name of a protocol as a string.
		  '
		  'Declaration
		  'OBJECTIVE-C
		  'NSString * NSStringFromProtocol ( Protocol *proto );
		  'Parameters
		  'proto
		  'A protocol.
		  'Return Value
		  'A string containing the name of proto.
		  '
		  'Import Statement
		  'Availability
		  'Available in OS X v10.5 and later.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NSStringFromSelector(aSelector As Ptr) As String
		  
		  declare function NSStringFromSelector lib Cocoa (aSelector As Ptr) As CFStringRef
		  return NSStringFromSelector(aSelector)
		  
		  'Returns a string representation of a given selector.
		  '
		  'Declaration
		  'OBJECTIVE-C
		  'NSString * NSStringFromSelector ( SEL aSelector );
		  'Parameters
		  'aSelector
		  'A selector.
		  'Return Value
		  'A string representation of aSelector.
		  '
		  'Import Statement
		  'Availability
		  'Available in OS X v10.0 and later.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_allocateClassPair(superclass As Ptr, name As String, extraBytes As integer) As Ptr
		  declare function objc_allocateClassPair lib Cocoa (superclass As Ptr, name As CFStringRef, extraBytes As integer) As Ptr
		  return objc_allocateClassPair(superclass, name, extraBytes)
		  
		  //Creates a new class and metaclass.
		  //Class objc_allocateClassPair ( Class superclass , const char * name , size_t extraBytes );
		  //Parameters superclass The class to use as the new class's superclass, or Nil to create a new root class. name The string to use as the new class's name. The string will be copied. extraBytes The number of bytes to allocate for indexed ivars at the end of the class and metaclass objects. This should usually be 0 .
		  //Return Value The new class, or Nil if the class could not be created (for example, the desired name is already in use).
		  //Discussion You can get a pointer to the new metaclass by calling object_getClass(newClass) . To create a new class, start by calling objc_allocateClassPair . Then set the class's attributes with functions like class_addMethod and class_addIvar . When you are done building the class, call objc_registerClassPair . The new class is now ready for use. Instance methods and instance variables should be added to the class itself. Class methods should be added to the metaclass.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		  //See Also objc_disposeClassPair
		  
		  //Edited**
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_allocateProtocol(name As CFStringRef) As Ptr
		  declare function objc_allocateProtocol lib Cocoa (name As CFStringRef) As Ptr
		  return objc_allocateProtocol(name)
		  
		  //Creates a new protocol instance.
		  //Protocol * objc_allocateProtocol ( const char * name );
		  //Parameters name The name of the protocol you want to create.
		  //Return Value A new protocol instance or nil if a protocol with the same name as name already exists.
		  //Discussion You must register the returned protocol instance with the objc_registerProtocol function before you can use it. There is no dispose method associated with this function.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		  //See Also objc_registerProtocol
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_constructInstance(cls As Ptr, bytes As Ptr) As Ptr
		  declare function objc_constructInstance lib Cocoa (cls As Ptr, bytes As Ptr) As Ptr
		  return objc_constructInstance(cls, bytes)
		  
		  //Creates an instance of a class at the specified location.
		  //id objc_constructInstance ( Class cls , void * bytes );
		  //Parameters cls The class that you want to allocate an instance of. bytes The location at which to allocate an instance of the cls class. bytes myst point to at least class_getInstanceSize(cls) bytes of well-aligned, zero-filled memory.
		  //Return Value An instance of the class cls at bytes , if successful; otherwise nil (for example, if cls or bytes are themselves nil ).
		  //Import Statement 
		  //Availability Available in OS X v10.6 and later.
		  //See Also class_createInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_copyClassList(outCount As UInt32) As Ptr
		  declare function objc_copyClassList lib Cocoa (outCount As UInt32) As Ptr
		  return objc_copyClassList(outCount)
		  
		  //Creates and returns a list of pointers to all registered class definitions.
		  //Class * objc_copyClassList ( unsigned int * outCount );
		  //Parameters outCount An integer pointer used to store the number of classes returned by this function in the list. This parameter may be nil .
		  //Return Value A nil terminated array of classes. You must free the array with free() .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		  //See Also objc_getClassList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_copyClassNamesForImage(image As CFStringRef, outCount As UInt32) As Ptr
		  declare function objc_copyClassNamesForImage lib Cocoa (image As CFStringRef, outCount As UInt32) As Ptr
		  return objc_copyClassNamesForImage(image, outCount)
		  
		  //Returns the names of all the classes within a specified library or framework.
		  //const char ** objc_copyClassNamesForImage ( const char * image , unsigned int * outCount );
		  //Parameters image The library or framework you are inquiring about. outCount The number of class names in the returned array.
		  //Return Value An array of C strings representing all of the class names within the specified library or framework.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_copyImageNames(outCount As UInt32) As Ptr
		  declare function objc_copyImageNames lib Cocoa (outCount As UInt32) As Ptr
		  return objc_copyImageNames(outCount)
		  
		  //Returns the names of all the loaded Objective-C frameworks and dynamic libraries.
		  //const char ** objc_copyImageNames ( unsigned int * outCount );
		  //Parameters outCount The number of names in the returned array.
		  //Return Value An array of C strings representing the names of all the loaded Objective-C frameworks and dynamic libraries.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_copyProtocolList(outCount As UInt32) As Ptr
		  declare function objc_copyProtocolList lib Cocoa (outCount As UInt32) As Ptr
		  return objc_copyProtocolList(outCount)
		  
		  //Returns an array of all the protocols known to the runtime.
		  //Protocol ** objc_copyProtocolList ( unsigned int * outCount );
		  //Parameters outCount Upon return, contains the number of protocols in the returned array.
		  //Return Value A C array of all the protocols known to the runtime. The array contains *outCount pointers followed by a NULL terminator. You must free the list with free() .
		  //Discussion This function acquires the runtime lock.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_destructInstance(obj As Ptr) As Ptr
		  declare function objc_destructInstance lib Cocoa (obj As Ptr) As Ptr
		  return objc_destructInstance(obj)
		  
		  //Destroys an instance of a class without freeing memory and removes any of its associated references.
		  //void * objc_destructInstance ( id obj );
		  //Discussion This method does nothing if obj is nil . Important The garbage collector does not call this function. As a result, if you edit this function, you should also edit finalize. That said, Core Foundation and other clients do call this function under garbage collection.
		  //Import Statement 
		  //Availability Available in OS X v10.6 and later.
		  //See Also objc_constructInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub objc_disposeClassPair(cls As Ptr)
		  declare sub objc_disposeClassPair lib Cocoa (cls As Ptr)
		  objc_disposeClassPair(cls)
		  
		  //Destroys a class and its associated metaclass.
		  //void objc_disposeClassPair ( Class cls );
		  //Parameters cls The class to be destroyed. This class must have been allocated using objc_allocateClassPair .
		  //Discussion Do not call this function if instances of the cls class or any subclass exist.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_duplicateClass(original As Ptr, name As CFStringRef, extraBytes As Ptr) As Ptr
		  declare function objc_duplicateClass lib Cocoa (original As Ptr, name As CFStringRef, extraBytes As Ptr) As Ptr
		  return objc_duplicateClass(original, name, extraBytes)
		  
		  //Used by Foundation's Key-Value Observing.
		  //Class objc_duplicateClass ( Class original , const char * name , size_t extraBytes );
		  //Special Considerations Do not call this function yourself.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub objc_enumerationMutation(obj As Ptr)
		  declare sub objc_enumerationMutation lib Cocoa (obj As Ptr)
		  objc_enumerationMutation(obj)
		  
		  //Inserted by the compiler when a mutation is detected during a foreach iteration.
		  //void objc_enumerationMutation ( id obj );
		  //Parameters obj The object being mutated.
		  //Discussion The compiler inserts this function when it detects that an object is mutated during a foreach iteration. The function is called when a mutation occurs, and the enumeration mutation handler is enacted if it is set up (via the objc_setEnumerationMutationHandler function). If the handler is not set up, a fatal error occurs.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		  //See Also objc_setEnumerationMutationHandler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_getAssociatedObject(object As Ptr, key As Ptr) As Ptr
		  declare function objc_getAssociatedObject lib Cocoa (object As Ptr, key As Ptr) As Ptr
		  return objc_getAssociatedObject(object, key)
		  
		  //Returns the value associated with a given object for a given key.
		  //id objc_getAssociatedObject ( id object , const void * key );
		  //Parameters object The source object for the association. key The key for the association.
		  //Return Value The value associated with the key key for object .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.6 and later.
		  //See Also objc_setAssociatedObject
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_getClass(name As CFStringRef) As Ptr
		  declare function objc_getClass lib Cocoa (name As CFStringRef) As Ptr
		  return objc_getClass(name)
		  
		  //Returns the class definition of a specified class.
		  //Class objc_getClass ( const char * name );
		  //Parameters name The name of the class to look up.
		  //Return Value The Class object for the named class, or nil if the class is not registered with the Objective-C runtime.
		  //Discussion objc_getClass is different from objc_lookUpClass in that if the class is not registered, objc_getClass calls the class handler callback and then checks a second time to see whether the class is registered. objc_lookUpClass does not call the class handler callback.
		  //Special Considerations Earlier implementations of this function (prior to OS X v10.0) terminate the program if the class does not exist.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_getClassList(buffer As Ptr, bufferCount As integer) As integer
		  declare function objc_getClassList lib Cocoa (buffer As Ptr, bufferCount As integer) As integer
		  return objc_getClassList(buffer, bufferCount)
		  
		  //Obtains the list of registered class definitions.
		  //int objc_getClassList ( Class * buffer , int bufferCount );
		  //Parameters buffer An array of Class values. On output, each Class value points to one class definition, up to either bufferLen or the total number of registered classes, whichever is less. You can pass NULL to obtain the total number of registered class definitions without actually retrieving any class definitions. bufferLen An integer value. Pass the number of pointers for which you have allocated space in buffer . On return, this function fills in only this number of elements. If this number is less than the number of registered classes, this function returns an arbitrary subset of the registered classes.
		  //Return Value An integer value indicating the total number of registered classes.
		  //Discussion The Objective-C runtime library automatically registers all the classes defined in your source code. You can create class definitions at runtime and register them with the objc_addClass function. Listing 1 demonstrates how to use this function to retrieve all the class definitions that have been registered with the Objective-C runtime in the current process. Listing 1 Using objc_getClassList int numClasses ; Class * classes = NULL ;  classes = NULL ; numClasses = objc_getClassList ( NULL , 0 );  if ( numClasses > 0 ) { classes = malloc ( sizeof ( Class ) * numClasses ); numClasses = objc_getClassList ( classes , numClasses ); free ( classes ); }
		  //Special Considerations You cannot assume that class objects you get from this function are classes that inherit from NSObject , so you cannot safely call any methods on such classes without detecting that the method is implemented first.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_getFutureClass(name As CFStringRef) As Ptr
		  declare function objc_getFutureClass lib Cocoa (name As CFStringRef) As Ptr
		  return objc_getFutureClass(name)
		  
		  //Used by CoreFoundation's toll-free bridging.
		  //Class objc_getFutureClass ( const char * name );
		  //Special Considerations Do not call this function yourself.
		  //Import Statement 
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_getMetaClass(name As CFStringRef) As Ptr
		  declare function objc_getMetaClass lib Cocoa (name As CFStringRef) As Ptr
		  return objc_getMetaClass(name)
		  
		  //Returns the metaclass definition of a specified class.
		  //Class objc_getMetaClass ( const char * name );
		  //Parameters name The name of the class to look up.
		  //Return Value The Class object for the metaclass of the named class, or nil if the class is not registered with the Objective-C runtime.
		  //Discussion If the definition for the named class is not registered, this function calls the class handler callback and then checks a second time to see if the class is registered. However, every class definition must have a valid metaclass definition, and so the metaclass definition is always returned, whether it‚Äôs valid or not.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_getProtocol(name As CFStringRef) As Ptr
		  declare function objc_getProtocol lib Cocoa (name As CFStringRef) As Ptr
		  return objc_getProtocol(name)
		  
		  //Returns a specified protocol.
		  //Protocol * objc_getProtocol ( const char * name );
		  //Parameters name The name of a protocol.
		  //Return Value The protocol named name , or NULL if no protocol named name could be found.
		  //Discussion This function acquires the runtime lock.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_getRequiredClass(name As CFStringRef) As Ptr
		  declare function objc_getRequiredClass lib Cocoa (name As CFStringRef) As Ptr
		  return objc_getRequiredClass(name)
		  
		  //Returns the class definition of a specified class.
		  //Class objc_getRequiredClass ( const char * name );
		  //Parameters name The name of the class to look up.
		  //Return Value The Class object for the named class.
		  //Discussion This function is the same as objc_getClass , but kills the process if the class is not found. This function is used by ZeroLink, where failing to find a class would be a compile-time link error without ZeroLink.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_loadWeak(location As Ptr) As Ptr
		  declare function objc_loadWeak lib Cocoa (location As Ptr) As Ptr
		  return objc_loadWeak(location)
		  
		  //Loads the object referenced by a weak pointer and returns it.
		  //id objc_loadWeak ( id * location );
		  //Parameters location The address of the weak pointer.
		  //Return Value The object pointed to by location , or nil if location is nil .
		  //Discussion This function loads the object referenced by a weak pointer and returns it after retaining and autoreleasing the object. As a result, the object stays alive long enough for the caller to use it. This function is typically used anywhere a __weak variable is used in an expression.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_lookUpClass(name As CFStringRef) As Ptr
		  declare function objc_lookUpClass lib Cocoa (name As CFStringRef) As Ptr
		  return objc_lookUpClass(name)
		  
		  //Returns the class definition of a specified class.
		  //Class objc_lookUpClass ( const char * name );
		  //Parameters name The name of the class to look up.
		  //Return Value The Class object for the named class, or nil if the class is not registered with the Objective-C runtime.
		  //Discussion objc_getClass is different from this function in that if the class is not registered, objc_getClass calls the class handler callback and then checks a second time to see whether the class is registered. This function does not call the class handler callback.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_msgSend(selfp As Ptr, op As Ptr) As Ptr
		  declare function objc_msgSend lib Cocoa (selfp As Ptr, op As Ptr) As Ptr
		  return objc_msgSend(selfp, op)
		  
		  //Sends a message with a simple return value to an instance of a class.
		  //id objc_msgSend ( id self , SEL op , ... );
		  //Parameters self A pointer that points to the instance of the class that is to receive the message. op The selector of the method that handles the message. ... A variable argument list containing the arguments to the method.
		  //Return Value The return value of the method.
		  //Discussion When it encounters a method call, the compiler generates a call to one of the functions objc_msgSend , objc_msgSend_stret , objc_msgSendSuper , or objc_msgSendSuper_stret . Messages sent to an object‚Äôs superclass (using the super keyword) are sent using objc_msgSendSuper ; other messages are sent using objc_msgSend . Methods that have data structures as return values are sent using objc_msgSendSuper_stret and objc_msgSend_stret .
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_msgSendSuper(superp As Ptr, op As Ptr) As Ptr
		  declare function objc_msgSendSuper lib Cocoa (superp As Ptr, op As Ptr) As Ptr
		  return objc_msgSendSuper(superp, op)
		  
		  //Sends a message with a simple return value to the superclass of an instance of a class.
		  //id objc_msgSendSuper ( struct objc_super * super , SEL op , ... );
		  //Parameters super A pointer to an objc_super data structure. Pass values identifying the context the message was sent to, including the instance of the class that is to receive the message and the superclass at which to start searching for the method implementation. op A pointer of type SEL . Pass the selector of the method that will handle the message. ... A variable argument list containing the arguments to the method.
		  //Return Value The return value of the method identified by op .
		  //Discussion When it encounters a method call, the compiler generates a call to one of the functions objc_msgSend , objc_msgSend_stret , objc_msgSendSuper , or objc_msgSendSuper_stret . Messages sent to an object‚Äôs superclass (using the super keyword) are sent using objc_msgSendSuper ; other messages are sent using objc_msgSend . Methods that have data structures as return values are sent using objc_msgSendSuper_stret and objc_msgSend_stret .
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub objc_msgSendSuper_stret(superp As Ptr, op As Ptr)
		  declare sub objc_msgSendSuper_stret lib Cocoa (superp As Ptr, op As Ptr)
		  objc_msgSendSuper_stret(superp, op)
		  
		  //Sends a message with a data-structure return value to the superclass of an instance of a class.
		  //void objc_msgSendSuper_stret ( struct objc_super * super , SEL op , ... );
		  //Parameters super A pointer to an objc_super data structure. Pass values identifying the context the message was sent to, including the instance of the class that is to receive the message and the superclass at which to start searching for the method implementation. op A pointer of type SEL . Pass the selector of the method. ... A variable argument list containing the arguments to the method.
		  //Discussion When it encounters a method call, the compiler generates a call to one of the functions objc_msgSend , objc_msgSend_stret , objc_msgSendSuper , or objc_msgSendSuper_stret . Messages sent to an object‚Äôs superclass (using the super keyword) are sent using objc_msgSendSuper ; other messages are sent using objc_msgSend . Methods that have data structures as return values are sent using objc_msgSendSuper_stret and objc_msgSend_stret .
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_msgSend_fpret(selfp As Ptr, op As Ptr) As double
		  declare function objc_msgSend_fpret lib Cocoa (selfp As Ptr, op As Ptr) As double
		  return objc_msgSend_fpret(selfp, op)
		  
		  //Sends a message with a floating-point return value to an instance of a class.
		  //double objc_msgSend_fpret ( id self , SEL op , ... );
		  //Parameters self A pointer that points to the instance of the class that is to receive the message. op The selector of the method that handles the message. ... A variable argument list containing the arguments to the method.
		  //Discussion On the i386 platform, the ABI for functions returning a floating-point value is incompatible with that for functions returning an integral type. On the i386 platform, therefore, you must use objc_msgSend_fpret for functions that for functions returning non-integral type. For float or long double return types, cast the function to an appropriate function pointer type first. This function is not used on the PPC or PPC64 platforms.
		  //Import Statement 
		  //Availability Available in OS X v10.4 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub objc_msgSend_stret(selfp As Ptr, op As Ptr)
		  declare sub objc_msgSend_stret lib Cocoa (selfp As Ptr, op As Ptr)
		  objc_msgSend_stret(selfp, op)
		  
		  //Sends a message with a data-structure return value to an instance of a class.
		  //void objc_msgSend_stret ( id self , SEL op , ... );
		  //Parameters stretAddr On input, a pointer that points to a block of memory large enough to contain the return value of the method. On output, contains the return value of the method. theReceiver A pointer to the instance of the class that is to receive the message. theSelector A pointer of type SEL . Pass the selector of the method that handles the message. ... A variable argument list containing the arguments to the method.
		  //Discussion When it encounters a method call, the compiler generates a call to one of the functions objc_msgSend , objc_msgSend_stret , objc_msgSendSuper , or objc_msgSendSuper_stret . Messages sent to an object‚Äôs superclass (using the super keyword) are sent using objc_msgSendSuper ; other messages are sent using objc_msgSend . Methods that have data structures as return values are sent using objc_msgSendSuper_stret and objc_msgSend_stret .
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub objc_registerClassPair(cls As Ptr)
		  declare sub objc_registerClassPair lib Cocoa (cls As Ptr)
		  objc_registerClassPair(cls)
		  
		  //Registers a class that was allocated using objc_allocateClassPair .
		  //void objc_registerClassPair ( Class cls );
		  //Parameters cls The class you want to register.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub objc_registerProtocol(proto As Ptr)
		  declare sub objc_registerProtocol lib Cocoa (proto As Ptr)
		  objc_registerProtocol(proto)
		  
		  //Registers a newly created protocol with the Objective-C runtime.
		  //void objc_registerProtocol ( Protocol * proto );
		  //Parameters proto The protocol you want to register with the Objective-C runtime.
		  //Discussion When you create a new protocol using the objc_allocateProtocol , you then register it with the Objective-C runtime by calling this function. After a protocol is successfully registered, it is immutable and ready to use.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		  //See Also objc_allocateProtocol
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub objc_removeAssociatedObjects(object As Ptr)
		  declare sub objc_removeAssociatedObjects lib Cocoa (object As Ptr)
		  objc_removeAssociatedObjects(object)
		  
		  //Removes all associations for a given object.
		  //void objc_removeAssociatedObjects ( id object );
		  //Parameters object An object that maintains associated objects.
		  //Discussion The main purpose of this function is to make it easy to return an object to a "pristine state‚Äù. You should not use this function for general removal of associations from objects, since it also removes associations that other clients may have added to the object. Typically you should use objc_setAssociatedObject with a nil value to clear an association.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.6 and later.
		  //See Also objc_setAssociatedObject  objc_getAssociatedObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub objc_setAssociatedObject(object As Ptr, key As Ptr, value As Ptr, policy As Ptr)
		  declare sub objc_setAssociatedObject lib Cocoa (object As Ptr, key As Ptr, value As Ptr, policy As Ptr)
		  objc_setAssociatedObject(object, key, value, policy)
		  
		  //Sets an associated value for a given object using a given key and association policy.
		  //void objc_setAssociatedObject ( id object , const void * key , id value , objc_AssociationPolicy policy );
		  //Parameters object The source object for the association. key The key for the association. value The value to associate with the key key for object . Pass nil to clear an existing association. policy The policy for the association. For possible values, see Associative Object Behaviors .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.6 and later.
		  //See Also objc_setAssociatedObject  objc_removeAssociatedObjects
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub objc_setEnumerationMutationHandler(block As Ptr)
		  declare sub objc_setEnumerationMutationHandler lib Cocoa (block As Ptr)
		  objc_setEnumerationMutationHandler(block)
		  
		  //Sets the current mutation handler.
		  //void objc_setEnumerationMutationHandler ( void ( * handler )( id ) );
		  //Parameters handler A function pointer to the new mutation handler.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub objc_setFutureClass(cls As Ptr, name As CFStringRef)
		  declare sub objc_setFutureClass lib Cocoa (cls As Ptr, name As CFStringRef)
		  objc_setFutureClass(cls, name)
		  
		  //Used by CoreFoundation's toll-free bridging.
		  //void objc_setFutureClass ( Class cls , const char * name );
		  //Special Considerations Do not call this function yourself.
		  //Import Statement 
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objc_storeWeak(location As Ptr, obj As Ptr) As Ptr
		  declare function objc_storeWeak lib Cocoa (location As Ptr, obj As Ptr) As Ptr
		  return objc_storeWeak(location, obj)
		  
		  //Stores a new value in a __weak variable.
		  //id objc_storeWeak ( id * location , id obj );
		  //Parameters location The address of the weak pointer. obj The new object you want the weak pointer to now point to.
		  //Return Value The value stored in location (that is, obj ).
		  //Discussion This function is typically used anywhere a __weak variable is the target of an assignment.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function object_copy(obj As Ptr, size As Ptr) As Ptr
		  declare function object_copy lib Cocoa (obj As Ptr, size As Ptr) As Ptr
		  return object_copy(obj, size)
		  
		  //Returns a copy of a given object.
		  //id object_copy ( id obj , size_t size );
		  //Parameters obj An Objective-C object. size The size of the object obj .
		  //Return Value A copy of obj .
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function object_dispose(obj As Ptr) As Ptr
		  declare function object_dispose lib Cocoa (obj As Ptr) As Ptr
		  return object_dispose(obj)
		  
		  //Frees the memory occupied by a given object.
		  //id object_dispose ( id obj );
		  //Parameters obj An Objective-C object.
		  //Return Value nil .
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function object_getClass(obj As Ptr) As Ptr
		  declare function object_getClass lib Cocoa (obj As Ptr) As Ptr
		  return object_getClass(obj)
		  
		  //Returns the class of an object.
		  //Class object_getClass ( id obj );
		  //Parameters object The object you want to inspect.
		  //Return Value The class object of which object is an instance, or Nil if object is nil .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function object_getClassName(obj As Ptr) As CFStringRef
		  declare function object_getClassName lib Cocoa (obj As Ptr) As CFStringRef
		  return object_getClassName(obj)
		  
		  //Returns the class name of a given object.
		  //const char * object_getClassName ( id obj );
		  //Parameters obj An Objective-C object.
		  //Return Value The name of the class of which obj is an instance.
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function object_getIndexedIvars(obj As Ptr) As Ptr
		  declare function object_getIndexedIvars lib Cocoa (obj As Ptr) As Ptr
		  return object_getIndexedIvars(obj)
		  
		  //Returns a pointer to any extra bytes allocated with a instance given object.
		  //void * object_getIndexedIvars ( id obj );
		  //Parameters obj An Objective-C object.
		  //Return Value A pointer to any extra bytes allocated with obj . If obj was not allocated with any extra bytes, then dereferencing the returned pointer is undefined.
		  //Discussion This function returns a pointer to any extra bytes allocated with the instance (as specified by class_createInstance with extraBytes>0). This memory follows the object's ordinary ivars, but may not be adjacent to the last ivar. The returned pointer is guaranteed to be pointer-size aligned, even if the area following the object's last ivar is less aligned than that. Alignment greater than pointer-size is never guaranteed, even if the area following the object's last ivar is more aligned than that. In a garbage-collected environment, the memory is scanned conservatively.
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function object_getInstanceVariable(obj As Ptr, name As CFStringRef, outValue As Ptr) As Ptr
		  declare function object_getInstanceVariable lib Cocoa (obj As Ptr, name As CFStringRef, outValue As Ptr) As Ptr
		  return object_getInstanceVariable(obj, name, outValue)
		  
		  //Obtains the value of an instance variable of a class instance.
		  //Ivar object_getInstanceVariable ( id obj , const char * name , void ** outValue );
		  //Parameters obj A pointer to an instance of a class. Pass the object containing the instance variable whose value you wish to obtain. name A C string. Pass the name of the instance variable whose value you wish to obtain. outValue On return, contains a pointer to the value of the instance variable.
		  //Return Value A pointer to the Ivar data structure that defines the type and name of the instance variable specified by name .
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function object_getIvar(obj As Ptr, ivar As Ptr) As Ptr
		  declare function object_getIvar lib Cocoa (obj As Ptr, ivar As Ptr) As Ptr
		  return object_getIvar(obj, ivar)
		  
		  //Reads the value of an instance variable in an object.
		  //id object_getIvar ( id obj , Ivar ivar );
		  //Parameters object The object containing the instance variable whose value you want to read. ivar The Ivar describing the instance variable whose value you want to read.
		  //Return Value The value of the instance variable specified by ivar , or nil if object is nil .
		  //Discussion object_getIvar is faster than object_getInstanceVariable if the Ivar for the instance variable is already known.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function object_setClass(obj As Ptr, cls As Ptr) As Ptr
		  declare function object_setClass lib Cocoa (obj As Ptr, cls As Ptr) As Ptr
		  return object_setClass(obj, cls)
		  
		  //Sets the class of an object.
		  //Class object_setClass ( id obj , Class cls );
		  //Parameters object The object to modify. sel A class object.
		  //Return Value The previous value of object ‚Äòs class, or Nil if object is nil .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function object_setInstanceVariable(obj As Ptr, name As CFStringRef, value As Ptr) As Ptr
		  declare function object_setInstanceVariable lib Cocoa (obj As Ptr, name As CFStringRef, value As Ptr) As Ptr
		  return object_setInstanceVariable(obj, name, value)
		  
		  //Changes the value of an instance variable of a class instance.
		  //Ivar object_setInstanceVariable ( id obj , const char * name , void * value );
		  //Parameters obj A pointer to an instance of a class. Pass the object containing the instance variable whose value you wish to modify. name A C string. Pass the name of the instance variable whose value you wish to modify. value The new value for the instance variable.
		  //Return Value A pointer to the Ivar data structure that defines the type and name of the instance variable specified by name .
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub object_setIvar(obj As Ptr, ivar As Ptr, value As Ptr)
		  declare sub object_setIvar lib Cocoa (obj As Ptr, ivar As Ptr, value As Ptr)
		  object_setIvar(obj, ivar, value)
		  
		  //Sets the value of an instance variable in an object.
		  //void object_setIvar ( id obj , Ivar ivar , id value );
		  //Parameters object The object containing the instance variable whose value you want to set. ivar The Ivar describing the instance variable whose value you want to set. value The new value for the instance variable.
		  //Discussion object_setIvar is faster than object_setInstanceVariable if the Ivar for the instance variable is already known.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function property_copyAttributeList(propertyp As Ptr, outCount As UInt32) As Ptr
		  declare function property_copyAttributeList lib Cocoa (propertyp As Ptr, outCount As UInt32) As Ptr
		  return property_copyAttributeList(propertyp, outCount)
		  
		  //Returns an array of property attributes for a given property.
		  //objc_property_attribute_t * property_copyAttributeList ( objc_property_t property , unsigned int * outCount );
		  //Parameters property The property whose attributes you want to copy. outCount The number of attributes returned in the array.
		  //Return Value An array of property attributes. You must free the array with free() .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function property_copyAttributeValue(propertyp As Ptr, attributeName As CFStringRef) As CFStringRef
		  declare function property_copyAttributeValue lib Cocoa (propertyp As Ptr, attributeName As CFStringRef) As CFStringRef
		  return property_copyAttributeValue(propertyp, attributeName)
		  
		  //Returns the value of a property attribute given the attribute name.
		  //char * property_copyAttributeValue ( objc_property_t property , const char * attributeName );
		  //Parameters property The property whose value you are interested in. attributeName A C string representing the name of the attribute.
		  //Return Value The value string of the attributeName attribute, if one exists in property ; otherwise, nil . You must free the returned value string with free() .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function property_getAttributes(propertyp As Ptr) As CFStringRef
		  declare function property_getAttributes lib Cocoa (propertyp As Ptr) As CFStringRef
		  return property_getAttributes(propertyp)
		  
		  //Returns the attribute string of a property.
		  //const char * property_getAttributes ( objc_property_t property );
		  //Return Value A C string containing the property's attributes.
		  //Discussion The format of the attribute string is described in Declared Properties in Objective-C Runtime Programming Guide .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function property_getName(propertyp As Ptr) As CFStringRef
		  declare function property_getName lib Cocoa (propertyp As Ptr) As CFStringRef
		  return property_getName(propertyp)
		  
		  //Returns the name of a property.
		  //const char * property_getName ( objc_property_t property );
		  //Return Value A C string containing the property's name.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub protocol_addMethodDescription(proto As Ptr, name As Ptr, types As CFStringRef, isRequiredMethod As boolean, isInstanceMethod As boolean)
		  declare sub protocol_addMethodDescription lib Cocoa (proto As Ptr, name As Ptr, types As CFStringRef, isRequiredMethod As boolean, isInstanceMethod As boolean)
		  protocol_addMethodDescription(proto, name, types, isRequiredMethod, isInstanceMethod)
		  
		  //Adds a method to a protocol.
		  //void protocol_addMethodDescription ( Protocol * proto , SEL name , const char * types , BOOL isRequiredMethod , BOOL isInstanceMethod );
		  //Parameters proto The protocol you want to add a method to. name The name of the method you want to add. types A C string representing the signature of the method you want to add. isRequiredMethod A Boolean indicating whether the method is a required method of the proto protocol. If YES true , the method is a required method; if NO false , the method is an optional method. isInstanceMethod A Boolean indicating whether the method is an instance method. If YES true , the method is an instance method; if NO false , the method is a class method.
		  //Discussion To add a method to a protocol using this function, the protocol must be under construction. That is, you must add any methods to proto before you register it with the Objective-C runtime (via the objc_registerProtocol function).
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub protocol_addProperty(proto As Ptr, name As CFStringRef, attributesp As Ptr, attributeCount As UInt32, isRequiredProperty As boolean, isInstanceProperty As boolean)
		  declare sub protocol_addProperty lib Cocoa (proto As Ptr, name As CFStringRef, attributesp As Ptr, attributeCount As UInt32, isRequiredProperty As boolean, isInstanceProperty As boolean)
		  protocol_addProperty(proto, name, attributesp, attributeCount, isRequiredProperty, isInstanceProperty)
		  
		  //Adds a property to a protocol that is under construction.
		  //void protocol_addProperty ( Protocol * proto , const char * name , const objc_property_attribute_t * attributes , unsigned int attributeCount , BOOL isRequiredProperty , BOOL isInstanceProperty );
		  //Parameters proto The protocol you want to add a property to. name The name of the property you want to add. attributes An array of property attributes. attributeCount The number of properties in attributes . isRequiredProperty A Boolean indicating whether the property‚Äôs accessor methods are required methods of the proto protocol. If YES true , the property‚Äôs accessor methods are required methods; if NO false , the property‚Äôs accessor methods are optional methods. isInstanceProperty A Boolean indicating whether the property‚Äôs accessor methods are instance methods. If YES true , the property‚Äôs accessor methods are instance methods. YES true is the only value allowed for a property. As a result, if you set this value to NO false , the property will not be added to the protocol.
		  //Discussion The protocol you want to add the property to must be under construction‚Äîallocated but not yet registered with the Objective-C runtime (via the objc_registerProtocol function).
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub protocol_addProtocol(proto As Ptr, addition As Ptr)
		  declare sub protocol_addProtocol lib Cocoa (proto As Ptr, addition As Ptr)
		  protocol_addProtocol(proto, addition)
		  
		  //Adds a registered protocol to another protocol that is under construction.
		  //void protocol_addProtocol ( Protocol * proto , Protocol * addition );
		  //Parameters proto The protocol you want to add the registered protocol to. addition The registered protocol you want to add to proto .
		  //Discussion The protocol you want to add to ( proto ) must be under construction‚Äîallocated but not yet registered with the Objective-C runtime. The protocol you want to add ( addition ) must be registered already.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.7 and later.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function protocol_conformsToProtocol(proto As Ptr, other As Ptr) As boolean
		  declare function protocol_conformsToProtocol lib Cocoa (proto As Ptr, other As Ptr) As boolean
		  return protocol_conformsToProtocol(proto, other)
		  
		  //Returns a Boolean value that indicates whether one protocol conforms to another protocol.
		  //BOOL protocol_conformsToProtocol ( Protocol * proto , Protocol * other );
		  //Parameters proto A protocol. other A protocol.
		  //Return Value YES true if proto conforms to other , otherwise NO false .
		  //Discussion One protocol can incorporate other protocols using the same syntax that classes use to adopt a protocol: @protocol ProtocolName < protocol list > All the protocols listed between angle brackets are considered part of the ProtocolName protocol.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function protocol_copyMethodDescriptionList(p As Ptr, isRequiredMethod As boolean, isInstanceMethod As boolean, outCount As UInt32) As Ptr
		  declare function protocol_copyMethodDescriptionList lib Cocoa (p As Ptr, isRequiredMethod As boolean, isInstanceMethod As boolean, outCount As UInt32) As Ptr
		  return protocol_copyMethodDescriptionList(p, isRequiredMethod, isInstanceMethod, outCount)
		  
		  //Returns an array of method descriptions of methods meeting a given specification for a given protocol.
		  //struct objc_method_description * protocol_copyMethodDescriptionList ( Protocol * p , BOOL isRequiredMethod , BOOL isInstanceMethod , unsigned int * outCount );
		  //Parameters p A protocol. isRequiredMethod A Boolean value that indicates whether returned methods should be required methods (pass YES true to specify required methods). isInstanceMethod A Boolean value that indicates whether returned methods should be instance methods (pass YES true to specify instance methods). outCount Upon return, contains the number of method description structures in the returned array.
		  //Return Value A C array of objc_method_description structures containing the names and types of p ‚Äôs methods specified by isRequiredMethod and isInstanceMethod . The array contains *outCount pointers followed by a NULL terminator. You must free the list with free() . If the protocol declares no methods that meet the specification, NULL is returned and *outCount is 0 .
		  //Discussion Methods in other protocols adopted by this protocol are not included.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function protocol_copyPropertyList(proto As Ptr, outCount As UInt32) As Ptr
		  declare function protocol_copyPropertyList lib Cocoa (proto As Ptr, outCount As UInt32) As Ptr
		  return protocol_copyPropertyList(proto, outCount)
		  
		  //Returns an array of the properties declared by a protocol.
		  //objc_property_t * protocol_copyPropertyList ( Protocol * proto , unsigned int * outCount );
		  //Parameters proto A protocol. outCount Upon return, contains the number of elements in the returned array.
		  //Return Value A C array of pointers of type objc_property_t describing the properties declared by proto . Any properties declared by other protocols adopted by this protocol are not included. The array contains *outCount pointers followed by a NULL terminator. You must free the array with free() . If the protocol declares no properties, NULL is returned and *outCount is 0 .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function protocol_copyProtocolList(proto As Ptr, outCount As UInt32) As Ptr
		  declare function protocol_copyProtocolList lib Cocoa (proto As Ptr, outCount As UInt32) As Ptr
		  return protocol_copyProtocolList(proto, outCount)
		  
		  //Returns an array of the protocols adopted by a protocol.
		  //Protocol ** protocol_copyProtocolList ( Protocol * proto , unsigned int * outCount );
		  //Parameters proto A protocol. outCount Upon return, contains the number of elements in the returned array.
		  //Return Value A C array of protocols adopted by proto . The array contains *outCount pointers followed by a NULL terminator. You must free the array with free() . If the protocol declares no properties, NULL is returned and *outCount is 0 .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function protocol_getMethodDescription(p As Ptr, aSel As Ptr, isRequiredMethod As boolean, isInstanceMethod As boolean) As Ptr
		  declare function protocol_getMethodDescription lib Cocoa (p As Ptr, aSel As Ptr, isRequiredMethod As boolean, isInstanceMethod As boolean) As Ptr
		  return protocol_getMethodDescription(p, aSel, isRequiredMethod, isInstanceMethod)
		  
		  //Returns a method description structure for a specified method of a given protocol.
		  //struct objc_method_description protocol_getMethodDescription ( Protocol * p , SEL aSel , BOOL isRequiredMethod , BOOL isInstanceMethod );
		  //Parameters p A protocol. aSel A selector isRequiredMethod A Boolean value that indicates whether aSel is a required method. isInstanceMethod A Boolean value that indicates whether aSel is an instance method.
		  //Return Value An objc_method_description structure that describes the method specified by aSel , isRequiredMethod , and isInstanceMethod for the protocol p . If the protocol does not contain the specified method, returns an objc_method_description structure with the value {NULL, NULL} .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function protocol_getName(p As Ptr) As CFStringRef
		  declare function protocol_getName lib Cocoa (p As Ptr) As CFStringRef
		  return protocol_getName(p)
		  
		  //Returns a the name of a protocol.
		  //const char * protocol_getName ( Protocol * p );
		  //Parameters p A protocol.
		  //Return Value The name of the protocol p as a C string.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function protocol_getProperty(proto As Ptr, name As CFStringRef, isRequiredProperty As boolean, isInstanceProperty As boolean) As Ptr
		  declare function protocol_getProperty lib Cocoa (proto As Ptr, name As CFStringRef, isRequiredProperty As boolean, isInstanceProperty As boolean) As Ptr
		  return protocol_getProperty(proto, name, isRequiredProperty, isInstanceProperty)
		  
		  //Returns the specified property of a given protocol.
		  //objc_property_t protocol_getProperty ( Protocol * proto , const char * name , BOOL isRequiredProperty , BOOL isInstanceProperty );
		  //Parameters proto A protocol. name The name of a property. isRequiredProperty A Boolean value that indicates whether name is a required property. isInstanceProperty A Boolean value that indicates whether name is an instance property.
		  //Return Value The property specified by name , isRequiredProperty , and isInstanceProperty for proto , or NULL if none of proto ‚Äôs properties meets the specification.
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function protocol_isEqual(proto As Ptr, other As Ptr) As boolean
		  declare function protocol_isEqual lib Cocoa (proto As Ptr, other As Ptr) As boolean
		  return protocol_isEqual(proto, other)
		  
		  //Returns a Boolean value that indicates whether two protocols are equal.
		  //BOOL protocol_isEqual ( Protocol * proto , Protocol * other );
		  //Parameters proto A protocol. other A protocol.
		  //Return Value YES true if proto is the same as other , otherwise NO false .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function sel_getName(sel As Ptr) As CString
		  'declare function sel_getName lib Cocoa (sel As Ptr) As CFStringRef
		  'return sel_getName(sel)
		  
		  declare function sel_getName lib Cocoa (sel As Ptr) As CString
		  return sel_getName(sel)
		  
		  //Returns the name of the method specified by a given selector.
		  //const char * sel_getName ( SEL sel );
		  //Parameters aSelector A pointer of type SEL . Pass the selector whose name you wish to determine.
		  //Return Value A C string indicating the name of the selector.
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function sel_getUid(str As CFStringRef) As Ptr
		  declare function sel_getUid lib Cocoa (str As CFStringRef) As Ptr
		  return sel_getUid(str)
		  
		  //Registers a method name with the Objective-C runtime system.
		  //SEL sel_getUid ( const char * str );
		  //Parameters str A pointer to a C string. Pass the name of the method you wish to register.
		  //Return Value A pointer of type SEL specifying the selector for the named method.
		  //Discussion The implementation of this method is identical to the implementation of sel_registerName .
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function sel_isEqual(lhs As Ptr, rhs As Ptr) As boolean
		  declare function sel_isEqual lib Cocoa (lhs As Ptr, rhs As Ptr) As boolean
		  return sel_isEqual(lhs, rhs)
		  
		  //Returns a Boolean value that indicates whether two selectors are equal.
		  //BOOL sel_isEqual ( SEL lhs , SEL rhs );
		  //Parameters lhs The selector to compare with rhs . rhs The selector to compare with lhs .
		  //Return Value YES true if rhs and rhs are equal, otherwise NO false .
		  //Discussion sel_isEqual is equivalent to == .
		  //Import Statement import ObjectiveC
		  //Availability Available in OS X v10.5 and later.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function sel_registerName(str As CFStringRef) As Ptr
		  declare function sel_registerName lib Cocoa (str As CFStringRef) As Ptr
		  return sel_registerName(str)
		  
		  //Registers a method with the Objective-C runtime system, maps the method name to a selector, and returns the selector value.
		  //SEL sel_registerName ( const char * str );
		  //Parameters str A pointer to a C string. Pass the name of the method you wish to register.
		  //Return Value A pointer of type SEL specifying the selector for the named method.
		  //Discussion You must register a method name with the Objective-C runtime system to obtain the method‚Äôs selector before you can add the method to a class definition. If the method name has already been registered, this function simply returns the selector.
		  //Import Statement 
		  //Availability Available in OS X v10.0 and later.
		End Function
	#tag EndMethod


	#tag Note, Name = info
		
		This module is a wrapper for the Objective-C Runtime functions
		
		
		This module has been auto-generated from either the docs or header (don't remember)
		
		The typing conversion was given a best guess but is probably incorrect in places
		
		Not all methods (as in most) have been tested
		
		The intention was to auto-generate 90% of the needed form and to include function descriptions
		
		Methods are fixed as used
		
		
		Some non-ObjC-Runtime functions are included
	#tag EndNote

	#tag Note, Name = mods
		
		modified class_getMethodList to use byref
		
		modified sel_getName to use CString instead of CFStringRef
	#tag EndNote


	#tag Constant, Name = Cocoa, Type = String, Dynamic = False, Default = \"Cocoa.framework", Scope = Private
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
