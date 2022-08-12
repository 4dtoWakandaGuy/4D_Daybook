//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_UpdateListItemProperties
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 23:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ListPropertiesNUM; 0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_ListPropertySublists;0)
	ARRAY TEXT:C222($_at_ListPropertiesSTR; 0)
	ARRAY TEXT:C222($_at_ListPropertyNames; 0)
	//ARRAY TEXT(AA_at_ListProperties;0)
	//ARRAY TEXT(AA_at_PropertiesListProperties;0)
	C_LONGINT:C283($_l_AttributeNUM; $_l_EndOfLinePosition; $_l_Index; $_l_ListID; $_l_OK; $_l_Properties; $_l_SubListNum; $_l_SUbslistPosition; $_l_Tries)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_Attribute; $_t_ListAttributes; $_t_oldMethodName; $_t_SublistName; $_t_SublistType)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AA_UpdateListitemProperties")
//I have decided that the way we have the data packed into the blobs in the list properties is just 2 slow
//We will now pack them in variables  instead of text.  each property will be packed into an array with the property name a numeric value and a string value(the numeric or string value or both can be used) this is like virtual fields on the list
StartTransaction
//```
QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="List Properties")
If (Records in selection:C76([X_LISTS:111])=0)
	$_l_Tries:=0
	While (Semaphore:C143("LoadingListofLists"))  //about to write-stop everyone
		$_l_Tries:=$_l_Tries+1
		DelayTicks(2*(1+$_l_Tries))
	End while 
	QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="List Properties")
	If (Records in selection:C76([X_LISTS:111])=0)
		
		READ WRITE:C146([X_LISTS:111])
		CREATE RECORD:C68([X_LISTS:111])
		[X_LISTS:111]x_ID:1:=AA_GetNextIDinMethod(->[X_LISTS:111]x_ID:1)
		[X_LISTS:111]x_ListName:2:="List Properties"
		DB_SaveRecord(->[X_LISTS:111])
		AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
	End if 
	$_l_ListID:=[X_LISTS:111]x_ID:1
	UNLOAD RECORD:C212([X_LISTS:111])
	READ ONLY:C145([X_LISTS:111])
	CLEAR SEMAPHORE:C144("LoadingListofLists")  //release everyone
Else 
	$_l_ListID:=[X_LISTS:111]x_ID:1
	UNLOAD RECORD:C212([X_LISTS:111])
End if 
READ WRITE:C146([LIST_ITEMS:95])
QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ListID)
SELECTION TO ARRAY:C260([LIST_ITEMS:95]List_Entry:2; AA_at_ListProperties; [LIST_ITEMS:95]X_ID:3; AA_al_ListPropertyIDs)
ARRAY TEXT:C222(AA_at_PropertiesListProperties; Size of array:C274(AA_at_ListProperties))
ARRAY LONGINT:C221(AA_al_ListPropertySublists; Size of array:C274(AA_at_PropertiesListProperties))
FIRST RECORD:C50([LIST_ITEMS:95])
For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
	If (BLOB size:C605([LIST_ITEMS:95]X_Item_Attributes:6)>0)
		If (BLOB size:C605([LIST_ITEMS:95]X_Revised_Attributes:9)=0)
			AA_at_PropertiesListProperties{$_l_Index}:=BLOB to text:C555([LIST_ITEMS:95]X_Item_Attributes:6; 3)
			ARRAY LONGINT:C221(AA_al_ListPropertySublists; 0)
			ARRAY LONGINT:C221(AA_al_ListPropertySublists; Size of array:C274(AA_at_PropertiesListProperties))
			For ($_l_Index; 1; Size of array:C274(AA_at_PropertiesListProperties))  //F2
				$_l_EndOfLinePosition:=Position:C15("SUBLIST:"; AA_at_PropertiesListProperties{$_l_Index})
				If ($_l_EndOfLinePosition>0)  //I3
					//the sublist exisits so get the ID
					$_t_SublistName:=Substring:C12(AA_at_PropertiesListProperties{$_l_Index}; $_l_EndOfLinePosition+Length:C16("SUBLIST:"); Length:C16(AA_at_PropertiesListProperties{$_l_Index}))
					
					$_l_EndOfLinePosition:=Position:C15(Char:C90(13); $_t_SublistName)
					If ($_l_EndOfLinePosition>0)  //i4
						$_t_SublistName:=Substring:C12($_t_SublistName; 1; $_l_EndOfLinePosition-1)
					End if   //end i4
					AA_al_ListPropertySublists{$_l_Index}:=Num:C11($_t_SublistName)
				End if   //i3
			End for 
		Else 
			ARRAY LONGINT:C221($_al_ListPropertiesNUM; 0)
			ARRAY TEXT:C222($_at_ListPropertyNames; 0)
			ARRAY TEXT:C222($_at_ListPropertiesSTR; 0)
			AA_GetListItemProperties(->$_at_ListPropertyNames; ->$_al_ListPropertiesNUM; ->$_at_ListPropertiesSTR)
			$_l_SUbslistPosition:=Find in array:C230($_at_ListPropertyNames; "SUBLIST")
			If ($_l_SUbslistPosition>0)
				AA_al_ListPropertySublists{$_l_Index}:=$_al_ListPropertiesNUM{$_l_SUbslistPosition}  //$_al_ListPropertiesNUMNum($Sub)
			End if 
			
		End if 
	End if 
	NEXT RECORD:C51([LIST_ITEMS:95])
End for 

//`we need to know the sublists used by the properties

//``
ALL RECORDS:C47([LIST_ITEMS:95])
For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
	//To keep this simple and to make sure that a converted set of data can be re-opened with an older structure i have added a new field.
	If (BLOB size:C605([LIST_ITEMS:95]X_Revised_Attributes:9)=0) & (BLOB size:C605([LIST_ITEMS:95]X_Item_Attributes:6)>0)  //if this is filled
		$_t_ListAttributes:=BLOB to text:C555([LIST_ITEMS:95]X_Item_Attributes:6; 3)
		$_t_Attribute:=""
		If ($_t_ListAttributes#"")  //i6
			$_l_EndOfLinePosition:=Position:C15("SUBLIST:"; $_t_ListAttributes)
			If ($_l_EndOfLinePosition>0)
				$_t_Attribute:=Substring:C12($_t_ListAttributes; $_l_EndOfLinePosition)
				$_l_EndOfLinePosition:=Position:C15(Char:C90(13); $_t_Attribute)
				If ($_l_EndOfLinePosition>0)
					$_t_Attribute:=Substring:C12($_t_Attribute; 1; $_l_EndOfLinePosition-1)
				Else 
				End if 
				$_t_Attribute:=Substring:C12($_t_Attribute; (Length:C16("SUBLIST:"))+1)
				
			End if 
			$_l_SubListNum:=Num:C11($_t_Attribute)
			If ($_l_SubListNum>0)
				AA_SetListItemProperty("SUBLIST"; $_l_SubListNum)
			End if 
			For ($_l_Properties; 1; Size of array:C274(AA_at_ListProperties))
				
				$_l_EndOfLinePosition:=Position:C15(AA_at_ListProperties{$_l_Properties}+":"; $_t_ListAttributes)
				If ($_l_EndOfLinePosition=0)
					$_l_EndOfLinePosition:=Position:C15(AA_at_ListProperties{$_l_Properties}+","; $_t_ListAttributes)
				End if 
				$_t_SublistType:=String:C10(AA_al_ListPropertySublists{$_l_Properties})
				If ($_l_EndOfLinePosition=0)
					$_l_EndOfLinePosition:=Position:C15($_t_SublistType+","; $_t_ListAttributes)
				End if 
				If ($_l_EndOfLinePosition=0)
					$_l_EndOfLinePosition:=Position:C15($_t_SublistType+":"; $_t_ListAttributes)
				End if 
				If ($_l_EndOfLinePosition>0)
					$_t_Attribute:=Substring:C12($_t_ListAttributes; $_l_EndOfLinePosition)
					$_l_EndOfLinePosition:=Position:C15(Char:C90(13); $_t_Attribute)
					If ($_l_EndOfLinePosition>0)
						$_t_Attribute:=Substring:C12($_t_Attribute; 1; $_l_EndOfLinePosition-1)
					Else 
						
					End if 
					
					$_l_OK:=0
					If (Position:C15(AA_at_ListProperties{$_l_Properties}; $_t_Attribute)>0)
						$_l_OK:=1
						$_t_Attribute:=Substring:C12($_t_Attribute; (Length:C16(AA_at_ListProperties{$_l_Properties}+":")+1))
					Else 
						$_t_SublistType:=String:C10(AA_al_ListPropertySublists{$_l_Properties})
						If (Position:C15($_t_SublistType+","; $_t_Attribute)=1) | (Position:C15($_t_SublistType+":"; $_t_Attribute)=1)
							$_l_OK:=1
							$_t_Attribute:=Substring:C12($_t_Attribute; (Length:C16($_t_SublistType+":")+1))
						Else 
						End if 
					End if 
					If ($_l_OK=1)
						$_l_AttributeNUM:=Num:C11($_t_Attribute)
						If ($_l_AttributeNUM>0)
							AA_SetListItemProperty(AA_at_ListProperties{$_l_Properties}; $_l_AttributeNUM)
						End if 
					End if 
				End if 
			End for 
			AA_CheckUUID(Table:C252(->[LIST_ITEMS:95]))
			<>SYS_t_LastSavedTableName:="LIST_ITEMS"
			SAVE RECORD:C53([LIST_ITEMS:95])
			
		End if 
	End if 
	NEXT RECORD:C51([LIST_ITEMS:95])
End for 
//VALIDATE TRANSACTION
Transact_End(True:C214)
ERR_MethodTrackerReturn("AA_UpdateListitemProperties"; $_t_oldMethodName)