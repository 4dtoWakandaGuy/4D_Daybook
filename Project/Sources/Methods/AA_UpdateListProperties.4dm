//%attributes = {}
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DefaultPropertyNumbers; 0)
	ARRAY LONGINT:C221($_al_ListPropertiesNUM; 0)
	ARRAY LONGINT:C221($_al_PropertyIDS; 0)
	ARRAY LONGINT:C221($_al_PropertyListIDS; 0)
	ARRAY LONGINT:C221($_al_PropertyNumber; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_ListPropertySublists;0)
	ARRAY TEXT:C222($_at_DefaultPropertyNames; 0)
	ARRAY TEXT:C222($_at_DefaultPropertyValue; 0)
	ARRAY TEXT:C222($_at_ListPropertiesSTR; 0)
	ARRAY TEXT:C222($_at_ListPropertyNames; 0)
	ARRAY TEXT:C222($_at_PropertyList; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_PropertyValue; 0)
	ARRAY TEXT:C222($_at_PropertyValues; 0)
	//ARRAY TEXT(AA_at_ListProperties;0)
	//ARRAY TEXT(AA_at_PropertiesListProperties;0)
	C_BOOLEAN:C305(<>SYS_bo_SkipDateUpdates; $_bo_Validation; $1)
	C_COLLECTION:C1488($_col_ListItemIDS; $_col_ListItemProperties; $_Col_ListItemSublists)
	C_LONGINT:C283($_l_AccessNumber; $_l_accessPosition; $_l_Element; $_l_EndOfLinePosition; $_l_EolPosition; $_l_Index; $_l_Index2; $_l_ListID; $_l_NextRevision; $_l_Offset; $_l_PropertyPosition)
	C_LONGINT:C283($_l_PropertyTypePosition; $_l_SemiColonPosition; $_l_SubListPosition; $_l_Tries; $2; $3)
	C_OBJECT:C1216($_obj_list; $_obj_ListItem; $_obj_ListItems; $_obj_Lists; $_obj_ProperitiesList)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_access; $_t_ListAttributes; $_t_ListItemProperties; $_t_oldMethodName; $_t_Properties; $_t_PropertyItem; $_t_SublistName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_UpdateListProperties")


//We will now pack them in variables  instead of text.  each property will be packed into an array with the property name a numeric value and a string value(the numeric or string value or both can be used) this is like virtual fields on the list
StartTransaction

//```
If (Not:C34(<>SYS_bo_SkipDateUpdates))
	$_obj_Lists:=ds:C1482.X_LISTS.query("x_ListName =:1"; "List Properties")
	If ($_obj_Lists.length=0)
		$_obj_list:=ds:C1482.X_LISTS.new()
		$_obj_list.x_ID:=AA_GetNextIDinMethod(->[X_LISTS:111]x_ID:1)
		$_obj_list.x_ListName:="List Properties"
		DB_SaveEntity($_obj_ProperitiesList)
	Else 
		$_obj_list:=$_obj_lists[0]
	End if 
	//QUERY([X_LISTS]; [X_LISTS]x_ListName="List Properties")
	//If (Records in selection([X_LISTS])=0)
	//$_l_Tries:=0
	//While (Semaphore("LoadingListofLists"))  //about to write-stop everyone
	//$_l_Tries:=$_l_Tries+1
	//DelayTicks(2*(1+$_l_Tries))
	//End while 
	//QUERY([X_LISTS]; [X_LISTS]x_ListName="List Properties")
	//If (Records in selection([X_LISTS])=0)
	
	//READ WRITE([X_LISTS])
	//CREATE RECORD([X_LISTS])
	//[X_LISTS]x_ID:=AA_GetNextIDinMethod(->[X_LISTS]x_ID)
	//[X_LISTS]x_ListName:="List Properties"
	//DB_SaveRecord(->[X_LISTS])
	//AA_CheckFileUnlocked(->[X_LISTS]x_ID)
End if 

//$_l_ListID:=[X_LISTS]x_ID
//UNLOAD RECORD([X_LISTS])
//READ ONLY([X_LISTS])
//CLEAR SEMAPHORE("LoadingListofLists")  //release everyone
//Else 
//$_l_ListID:=[X_LISTS]x_ID
//UNLOAD RECORD([X_LISTS])
//End if 
$_obj_ListItems:=ds:C1482.LIST_ITEMS.query("X_ListID =:1"; $_obj_list.x_ID)
$_col_ListItemProperties:=$_obj_ListItems.List_Entry
$_col_ListItemIDS:=$_obj_ListItems.X_ID
$_Col_ListItemSublists:=New collection:C1472

For each ($_obj_ListItem; $_obj_ListItems)
	If ($_obj_ListItem.x_ItemAttributesOBJECT=Null:C1517)
		If (BLOB size:C605($_obj_ListItem.X_Item_Attributes)>0)
			//this may not have been converted from old to new blob yet
			If (BLOB size:C605($_obj_ListItem.X_Revised_Attributes)=0)
				$_t_ListItemProperties:=BLOB to text:C555($_obj_ListItem.X_Item_Attributes)
				$_l_SubListPosition:=Position:C15("SUBLIST:"; $_t_ListItemProperties)
				If ($_l_SubListPosition>0)
					$_t_SublistName:=Substring:C12($_t_ListItemProperties; $_l_SubListPosition+Length:C16("SUBLIST:"))
					$_l_EolPosition:=Position:C15(Char:C90(13); $_t_SublistName)
					If ($_l_EolPosition>0)  //i4
						$_t_SublistName:=Substring:C12($_t_SublistName; 1; $_l_EolPosition-1)
						
					End if 
					$_Col_ListItemSublists.push($_t_SublistName)  //this should be a sublist id-stored as a string?
					
				Else 
					$_Col_ListItemSublists.push("")
				End if 
				
			Else 
				AA_GetListItemProperties($_obj_ListItem
			End if 
		Else 
		End if 
	Else 
	End if 
End for each 
//QUERY([LIST_ITEMS]; [LIST_ITEMS]X_ListID=$_l_ListID)
SELECTION TO ARRAY:C260([LIST_ITEMS:95]List_Entry:2; AA_at_ListProperties; [LIST_ITEMS:95]X_ID:3; AA_al_ListPropertyIDs)
ARRAY TEXT:C222(AA_at_PropertiesListProperties; Size of array:C274(AA_at_ListProperties))
ARRAY LONGINT:C221(AA_al_ListPropertySublists; Size of array:C274(AA_at_PropertiesListProperties))
FIRST RECORD:C50([LIST_ITEMS:95])
For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))  //these are the list items for the items that are in the list PROPERTIES
	If (BLOB size:C605([LIST_ITEMS:95]X_Item_Attributes:6)>0)
		If (BLOB size:C605([LIST_ITEMS:95]X_Revised_Attributes:9)=0)
			AA_at_PropertiesListProperties{$_l_Index}:=BLOB to text:C555([LIST_ITEMS:95]X_Item_Attributes:6; 3)
			ARRAY LONGINT:C221(AA_al_ListPropertySublists; 0)
			ARRAY LONGINT:C221(AA_al_ListPropertySublists; Size of array:C274(AA_at_PropertiesListProperties))
			For ($_l_Index; 1; Size of array:C274(AA_at_PropertiesListProperties))  //F2
				$_l_SubListPosition:=Position:C15("SUBLIST:"; AA_at_PropertiesListProperties{$_l_Index})
				If ($_l_SubListPosition>0)  //I3
					//the sublist exisits so get the ID
					$_t_SublistName:=Substring:C12(AA_at_PropertiesListProperties{$_l_Index}; $_l_SubListPosition+Length:C16("SUBLIST:"); Length:C16(AA_at_PropertiesListProperties{$_l_Index}))
					$_l_EolPosition:=Position:C15(Char:C90(13); $_t_SublistName)
					If ($_l_EolPosition>0)  //i4
						$_t_SublistName:=Substring:C12($_t_SublistName; 1; $_l_EolPosition-1)
					End if   //end i4
					AA_al_ListPropertySublists{$_l_Index}:=Num:C11($_t_SublistName)
				End if   //i3
			End for 
		Else 
			ARRAY LONGINT:C221($_al_ListPropertiesNUM; 0)
			ARRAY TEXT:C222($_at_ListPropertyNames; 0)
			ARRAY TEXT:C222($_at_ListPropertiesSTR; 0)
			AA_GetListItemProperties(->$_at_ListPropertyNames; ->$_al_ListPropertiesNUM; ->$_at_ListPropertiesSTR)
			$_l_SublistPosition:=Find in array:C230($_at_ListPropertyNames; "SUBLIST")
			If ($_l_SublistPosition>0)
				AA_al_ListPropertySublists{$_l_Index}:=$_al_ListPropertiesNUM{$_l_SublistPosition}
			End if 
			
		End if 
	End if 
	NEXT RECORD:C51([LIST_ITEMS:95])
End for 
//`we need to know the sublists used by the properties
//F2

//``

READ WRITE:C146([X_LISTS:111])
ALL RECORDS:C47([X_LISTS:111])
For ($_l_Index; 1; Records in selection:C76([X_LISTS:111]))
	ARRAY LONGINT:C221($_al_PropertyIDS; 0)
	//To keep this simple and to make sure that a converted set of data can be re-opened with an older structure i have added a new field.
	If (BLOB size:C605([X_LISTS:111]x_ListValues:6)>=0) & (BLOB size:C605([X_LISTS:111]x_ListAttributes:3)>0)  //if this is filled
		$_t_ListAttributes:=BLOB to text:C555([X_LISTS:111]x_ListAttributes:3; 3)
		If ($_t_ListAttributes#"")  //i6
			$_l_accessPosition:=Position:C15("Access:"; $_t_ListAttributes)
			$_l_EolPosition:=0
			If ($_l_accessPosition>0)  //i7
				For ($_l_Index2; $_l_accessPosition+Length:C16("Access:"); Length:C16($_t_ListAttributes))  //F8
					If ($_t_ListAttributes[[$_l_Index2]]=Char:C90(13))  //i9
						$_l_EolPosition:=$_l_Index2-1
						$_l_Index2:=Length:C16($_t_ListAttributes)
					End if   //Endi9
				End for   //end F8
				If ($_l_EolPosition=0)  //i10
					$_l_EolPosition:=Length:C16($_t_ListAttributes)
				End if   //end I10
				$_t_access:=Substring:C12($_t_ListAttributes; $_l_accessPosition+Length:C16("Access:"); $_l_EolPosition)
				//this is a number in a string
				
				$_l_AccessNumber:=Num:C11($_t_access)
				//this is a binary number
				
				
			End if   //end i7
			
			// ````Now try to get the property types
			$_l_PropertyTypePosition:=Position:C15("PropertyTypes:"; $_t_ListAttributes)
			$_l_EndOfLinePosition:=0
			If ($_l_PropertyTypePosition>0)  //i11
				For ($_l_Index2; $_l_PropertyTypePosition+Length:C16("PropertyTypes:"); Length:C16($_t_ListAttributes))  //F12
					If ($_t_ListAttributes[[$_l_Index2]]=Char:C90(13))  //I13
						$_l_EndOfLinePosition:=$_l_Index2-1
						$_l_Index2:=Length:C16($_t_ListAttributes)
					End if   //END i13
				End for   //end F12
				If ($_l_EndOfLinePosition=0)  //i14
					$_l_EndOfLinePosition:=Length:C16($_t_ListAttributes)
				End if   //end i14
				$_t_Properties:=Substring:C12($_t_ListAttributes; $_l_PropertyTypePosition+Length:C16("PropertyTypes:"); $_l_EndOfLinePosition)
				//we now extract from there the list of properties
				//these are seperated by ":"
				
				//this will be the one after "Property Types")`
				//so
				//$_t_Properties:=Substring($_t_Properties;$pos+1;Length($_t_Properties))
				ARRAY LONGINT:C221($_al_PropertyTypes; 0)
				$_l_Element:=0
				Repeat   //R15
					$_l_SemiColonPosition:=Position:C15(";"; $_t_Properties)
					If ($_l_SemiColonPosition>0)  //I16
						$_t_PropertyItem:=Substring:C12($_t_Properties; 1; $_l_SemiColonPosition-1)
						$_t_Properties:=Substring:C12($_t_Properties; $_l_SemiColonPosition+1; Length:C16($_t_Properties))
						If (Num:C11($_t_PropertyItem)>0)
							APPEND TO ARRAY:C911($_al_PropertyTypes; Num:C11($_t_PropertyItem))
						End if 
					Else   //elseI16
						If ($_t_Properties#"")  //i17
							If (Num:C11($_t_Properties)>0)
								APPEND TO ARRAY:C911($_al_PropertyTypes; Num:C11($_t_Properties))
							End if 
							
						End if   //end i17
					End if   //end i16
				Until ($_t_Properties="")  //end R15
				
				
				
			End if   //end i11
			
			//So now we have the access and the other properties
			ARRAY TEXT:C222($_at_DefaultPropertyNames; 0)
			ARRAY LONGINT:C221($_al_DefaultPropertyNumbers; 0)
			ARRAY TEXT:C222($_at_DefaultPropertyValue; 0)
			APPEND TO ARRAY:C911($_at_DefaultPropertyNames; "ACCESS")
			APPEND TO ARRAY:C911($_al_DefaultPropertyNumbers; $_l_AccessNumber)
			APPEND TO ARRAY:C911($_at_DefaultPropertyValue; "")
			ARRAY TEXT:C222($_at_PropertyList; 0)
			ARRAY LONGINT:C221($_al_PropertyListIDS; 0)
			//SELECTION TO ARRAY([LIST_ITEMS]List Entry;AA_at_ListProperties;[LIST_ITEMS]x_ID;AA_al_ListPropertyIDs)
			For ($_l_Index; 1; Size of array:C274($_al_PropertyIDS))
				If ($_l_Index<=Size of array:C274(AA_at_ListProperties))  //Just to make sure we do get an error
					If (AA_al_ListPropertySublists{$_l_Index}>0)
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ListID)
						SELECTION TO ARRAY:C260([LIST_ITEMS:95]List_Entry:2; $_at_PropertyList; [LIST_ITEMS:95]X_ID:3; $_al_PropertyListIDS)
					Else 
						ARRAY TEXT:C222($_at_PropertyList; 0)
						ARRAY LONGINT:C221($_al_PropertyListIDS; 0)
						
					End if 
					APPEND TO ARRAY:C911($_at_DefaultPropertyNames; AA_at_ListProperties{$_l_Index})  //The property type name
					APPEND TO ARRAY:C911($_al_DefaultPropertyNumbers; $_al_PropertyIDS{$_l_Index})
					$_l_PropertyPosition:=Find in array:C230($_al_PropertyListIDS; $_al_PropertyIDS{$_l_Index})
					If ($_l_PropertyPosition>0)
						APPEND TO ARRAY:C911($_at_DefaultPropertyValue; $_at_PropertyList{$_l_PropertyPosition})
					Else 
						APPEND TO ARRAY:C911($_at_DefaultPropertyValue; "")
					End if 
				End if 
			End for 
			//We now have all the properties in an array
			SET BLOB SIZE:C606([X_LISTS:111]x_ListValues:6; 0)
			VARIABLE TO BLOB:C532($_at_DefaultPropertyNames; [X_LISTS:111]x_ListValues:6; *)
			VARIABLE TO BLOB:C532($_al_DefaultPropertyNumbers; [X_LISTS:111]x_ListValues:6; *)
			VARIABLE TO BLOB:C532($_at_DefaultPropertyValue; [X_LISTS:111]x_ListValues:6; *)
			AA_CheckUUID(Table:C252(->[X_LISTS:111]))
			<>SYS_t_LastSavedTableName:="X_LISTS"
			SAVE RECORD:C53([X_LISTS:111])
			ARRAY TEXT:C222($_at_PropertyNames; 0)
			ARRAY LONGINT:C221($_al_PropertyNumber; 0)
			ARRAY TEXT:C222($_at_PropertyValue; 0)
			$_l_Offset:=0
			BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyNames; $_l_Offset)
			BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_al_PropertyNumber; $_l_Offset)
			BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyValue; $_l_Offset)
			
			
		End if 
		
	End if 
	NEXT RECORD:C51([X_LISTS:111])
End for 
//VALIDATE TRANSACTION
Transact_End(True:C214)
AA_UpdateListItemProperties
End if 
If (Count parameters:C259>=3)
	
	$_bo_Validation:=$1
	$_l_NextRevision:=$2
	$_l_Element:=$3
	VER_UpdateRoutineValidation($_l_Element; $_l_NextRevision)
End if 
ERR_MethodTrackerReturn("AA_UpdateListProperties"; $_t_oldMethodName)
