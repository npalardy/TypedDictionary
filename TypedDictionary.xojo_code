#tag Class
Protected Class TypedDictionary
Inherits Dictionary
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParamArray entries() As Pair)
		  // Calling the overridden superclass constructor.
		  If entries.ubound < 0 Then 
		    Return
		  End If
		  
		  For i As Integer = 0 To entries.ubound
		    
		    // we'll assume the FIRST entry in the parm array is the types to use for everything else
		    
		    If i = 0 Then
		      // Left Is key
		      mKeyType =  Xojo.Introspection.GetType(entries(0).Left)
		      // right is value
		      mValueType =  Xojo.Introspection.GetType(entries(0).Right)
		    End If
		    
		    value(entries(i).Left) = entries(i).Right
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(keyType as Xojo.Introspection.TypeInfo, valueType as Xojo.Introspection.TypeInfo)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  mKeyType = keyType
		  mValueType = valueType
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(key As Variant) As Boolean
		  // Calling the overridden superclass method.
		  Dim newKeyType As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(key)
		  
		  If mKeyType <> newKeyType Then
		    Dim exc As New TypeMismatchException
		    exc.Message = "Invalid key type - only " + mKeyType.Name + " can be used"
		    Raise exc
		  End If
		  
		  dim returnValue as Boolean = Super.HasKey(key)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(key As Variant, defaultValue As Variant) As Variant
		  // Calling the overridden superclass method.
		  
		  // Calling the overridden superclass method.
		  Dim newKeyType As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(key)
		  
		  If mKeyType <> newKeyType Then
		    Dim exc As New TypeMismatchException
		    exc.Message = "Invalid key type - only " + mKeyType.Name + " can be used"
		    Raise exc
		  End If
		  
		  Dim newValueType As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(defaultValue)
		  If mValueType <> newValueType Then
		    Dim exc As New TypeMismatchException
		    exc.Message = "Invalid default value type - only " + mValueType.Name + " can be used"
		    Raise exc
		  End If
		  
		  Dim returnValue As Variant = Super.Lookup(key, defaultValue)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(key As Variant)
		  // Calling the overridden superclass method.
		  Dim newKeyType As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(key)
		  
		  If mKeyType <> newKeyType Then
		    Dim exc As New TypeMismatchException
		    exc.Message = "Invalid key type - only " + mKeyType.Name + " can be used"
		    Raise exc
		  End If
		  
		  Super.Remove(key)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Untitled()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key As Variant) As Variant
		  // Calling the overridden superclass method.
		  // Note that this may need modifications if there are multiple  choices.
		  // Possible calls:
		  // result1 as Variant = Value(key As Variant) -- From Dictionary
		  // Value(key As Variant, Assigns _value As Variant) -- From Dictionary
		  
		  dim newKeyType as Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(key)
		  
		  If mKeyType <> newKeyType Then
		    dim exc as new TypeMismatchException
		    exc.Message = "Invalid key type - only " + mKeyType.Name + " can be used"
		    raise exc
		  end if
		  
		  return Super.Value(key)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key As Variant, Assigns _value As Variant)
		  // Calling the overridden superclass method.
		  // Note that this may need modifications if there are multiple  choices.
		  // Possible calls:
		  // result1 as Variant = Value(key As Variant) -- From Dictionary
		  // Value(key As Variant, Assigns _value As Variant) -- From Dictionary
		  Dim newKeyType As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(key)
		  Dim newValueType As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(_value)
		  
		  if mKeyType <> newKeyType then
		    dim exc as new TypeMismatchException
		    exc.Message = "Invalid key type - only " + mKeyType.Name + " can be used"
		    raise exc
		  end if
		  If mValueType <> newValueType Then
		    dim exc as new TypeMismatchException
		    exc.Message = "Invalid value type - only " + mValueType.Name + " can be used"
		    raise exc
		  end if
		  
		  Super.Value(key) = _value
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mKeyType As Xojo.Introspection.TypeInfo
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mValueType As Xojo.Introspection.TypeInfo
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BinCount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
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
