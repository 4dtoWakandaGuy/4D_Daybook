//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME DBLookup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	C_LONGINT:C283($_l_ArraySize; $_l_CharacterPosition1; $_l_CharacterPosition2; $_l_CharacterPosition4; $_l_FieldLength; $_l_FieldLength2; $_l_FieldLength4; $_l_FieldType; $_l_FieldType2; $_l_FieldType4; $_l_Index)
	C_LONGINT:C283($_l_MaxRows; $_l_MaxSort; $_l_OriginalFieldLength; $_l_RecordsCount)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_FieldPointer2; $_ptr_FieldPointer4; $_ptr_Table)
	C_TEXT:C284($_t_Direct; $_t_FIeld1; $_t_FIeld2; $_t_FIeld3; $_t_Field4; $_t_Name; $_t_oldMethodName; $_t_TableFieldName1; $_t_TableFieldName2; $_t_TableFieldName4; $_t_TableName1)
	C_TEXT:C284($_t_TableName2; $_t_Value; $_t_ValueOriginal; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME DBLookup")
//IME DBLookup
//Rollo 8/10/2004

//Draw a lookup page for related data


$_t_Direct:=$1  //the page url

$_l_MaxRows:=200  //max no ever shown in one set of results
$_l_MaxSort:=1000  //don't do a sort of all rows if more than this - too slow

//`the UNDERSSS string replaced underscores in the url due to encryption
$_t_FIeld1:=Replace string:C233(IME_Parameter("field1"); "UNDERSSS"; "_")  //lookup code field eg [CONTACTS]Contact Code
$_t_FIeld2:=Replace string:C233(IME_Parameter("field2"); "UNDERSSS"; "_")  //lookup name field eg [CONTACTS]Contact_Name
$_t_FIeld3:=Replace string:C233(IME_Parameter("field3"); "UNDERSSS"; "_")  //dependent on field on same form eg [SERVICE CALL]Company Code
$_t_Field4:=Replace string:C233(IME_Parameter("field4"); "UNDERSSS"; "_")  //dependent on field in the other table eg [CONTACTS]Company Code

If (($_t_FIeld1#"") & ($_t_FIeld2#""))
	
	$_l_CharacterPosition1:=Position:C15("-"; $_t_FIeld1)
	$_l_CharacterPosition2:=Position:C15("-"; $_t_FIeld2)
	
	If (($_l_CharacterPosition1>0) & ($_l_CharacterPosition2>0))
		
		$_t_TableName1:=Substring:C12($_t_FIeld1; 1; $_l_CharacterPosition1-1)
		$_t_TableName2:=Substring:C12($_t_FIeld2; 1; $_l_CharacterPosition1-1)
		
		If ($_t_TableName1=$_t_TableName2)
			
			$_ptr_Table:=UTI_TablePointerFromString($_t_TableName1)
			
			$_t_TableFieldName1:="["+$_t_TableName1+"]"+Substring:C12($_t_FIeld1; $_l_CharacterPosition1+1)
			$_ptr_FieldPointer:=UTI_FieldPointerFromString($_t_TableFieldName1)
			
			$_t_TableFieldName2:="["+$_t_TableName1+"]"+Substring:C12($_t_FIeld2; $_l_CharacterPosition2+1)
			$_ptr_FieldPointer2:=UTI_FieldPointerFromString($_t_TableFieldName2)
			
			If ($_t_Field4#"")
				$_l_CharacterPosition4:=Position:C15("-"; $_t_Field4)
				$_t_TableFieldName4:="["+$_t_TableName1+"]"+Substring:C12($_t_Field4; $_l_CharacterPosition4+1)
				$_ptr_FieldPointer4:=UTI_FieldPointerFromString($_t_TableFieldName4)
			Else 
				$_ptr_FieldPointer4:=$_ptr_FieldPointer2
			End if 
			
			If ((Not:C34(Is nil pointer:C315($_ptr_FieldPointer))) & (Not:C34(Is nil pointer:C315($_ptr_FieldPointer2))) & (Not:C34(Is nil pointer:C315($_ptr_FieldPointer4))))
				
				GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength)
				GET FIELD PROPERTIES:C258($_ptr_FieldPointer2; $_l_FieldType2; $_l_FieldLength2)
				If ($_t_Field4#"")
					GET FIELD PROPERTIES:C258($_ptr_FieldPointer4; $_l_FieldType4; $_l_FieldLength4)
				Else 
					$_l_FieldType4:=0
					$_l_FieldLength4:=0
				End if 
				
				If ((($_l_FieldType=0) | ($_l_FieldType=2)) & (($_l_FieldType2=0) | ($_l_FieldType2=2)) & (($_l_FieldType4=0) | ($_l_FieldType4=2)))
					
					$_t_ValueOriginal:=IME_Parameter("value")
					$_t_Field3:=IME_Parameter("value3")  //the value of the the other field on which this depends
					
					//$_t_Name:=ITK_URL2Text (IME_Parameter ("name"))
					$_t_Name:=STR_URLDecode(IME_Parameter("name"))
					
					If ($_t_ValueOriginal#"")
						
						//don't allow @ in the middle, but auto-add one at the end
						
						$_t_Value:=""
						$_l_OriginalFieldLength:=Length:C16($_t_ValueOriginal)
						
						For ($_l_Index; 1; $_l_OriginalFieldLength)
							If (Character code:C91($_t_ValueOriginal[[$_l_Index]])#64)
								$_t_Value:=$_t_Value+$_t_ValueOriginal[[$_l_Index]]
							End if 
						End for 
						
						$_t_Value:=$_t_Value+"@"
						
						If ($_t_Name#"")
							
							If ($_t_Field4#"")
								
								QUERY:C277($_ptr_Table->; $_ptr_FieldPointer4->=$_t_Field3)
								QUERY SELECTION:C341($_ptr_Table->; $_ptr_FieldPointer->=$_t_Value; *)
								QUERY SELECTION:C341($_ptr_Table->;  | ; $_ptr_FieldPointer2->=$_t_Value)
								
							Else 
								QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_t_Value; *)
								QUERY:C277($_ptr_Table->;  | ; $_ptr_FieldPointer2->=$_t_Value)
							End if 
							
							$_l_RecordsCount:=Records in selection:C76($_ptr_Table->)
							
							If ($_l_RecordsCount>0)
								
								If ($_l_RecordsCount>$_l_MaxRows)  //max ever shown
									If ($_l_RecordsCount<=$_l_MaxSort)
										ORDER BY:C49($_ptr_Table->; $_ptr_FieldPointer->; >; $_ptr_FieldPointer2->; >)  //sort first or the reduce selection will be rather random
									End if 
									REDUCE SELECTION:C351($_ptr_Table->; $_l_MaxRows)
								End if 
								
								IME_ReplyText2("ITX DGLookupHeader"; Uppers2(Lowercase:C14(Replace string:C233($_t_TableName1; "_"; " ")))+" Lookup"; String:C10(Records in selection:C76($_ptr_Table->)))
								ARRAY TEXT:C222($_at_Codes; 0)  //NG 19/11/2004
								ARRAY TEXT:C222($_at_Names; 0)  //NG 19/11/2004
								SELECTION TO ARRAY:C260($_ptr_FieldPointer->; $_at_Codes; $_ptr_FieldPointer2->; $_at_Names)
								SORT ARRAY:C229($_at_Codes; $_at_Names; >)
								$_l_ArraySize:=Size of array:C274($_at_Codes)
								
								For ($_l_Index; 1; $_l_ArraySize)
									
									//IME_ReplyText2 ("ITX DGLookupLine";$_at_Codes{$_l_Index};$_at_Names{$_l_Index};$_t_Name;ITK_Text2HTML ($_at_Codes{$_l_Index});ITK_Text2HTML ($_at_Names{$_l_Index}))
									IME_ReplyText2("ITX DGLookupLine"; $_at_Codes{$_l_Index}; $_at_Names{$_l_Index}; $_t_Name; IME_Text2HTML($_at_Codes{$_l_Index}); IME_Text2HTML($_at_Names{$_l_Index}))  //removed  ITK_Text2HTML 14/02/08
									
								End for 
								
							Else 
								
								IME_ReplyText2("ITX DGLookupHeader"; Uppers2(Lowercase:C14($_t_TableName1))+" Lookup"; "0")
								IME_ReplyText2("ITX DGLookupLine"; "None found"; ""; $_t_Name; ""; "")
								
							End if 
						Else 
							IME_ReplyText2("ITX DGLookupHeader"; "Lookup Error"; "")
							IME_ReplyText2("ITX DGTextLine"; "Return field name expected")
						End if 
					Else 
						IME_ReplyText2("ITX DGLookupHeader"; "Lookup Error"; "")
						IME_ReplyText2("ITX DGTextLine"; "Entry value expected")
					End if 
				Else 
					IME_ReplyText2("ITX DGLookupHeader"; "Lookup Error"; "")
					IME_ReplyText2("ITX DGTextLine"; "Only alpha and text field types are supported by Lookup")
				End if 
			Else 
				IME_ReplyText2("ITX DGLookupHeader"; "Lookup Error"; "")
				IME_ReplyText2("ITX DGTextLine"; "Invalid pointer(s) to fields")
			End if 
		Else 
			IME_ReplyText2("ITX DGLookupHeader"; "Lookup Error"; "")
			IME_ReplyText2("ITX DGTextLine"; "The 2 fields should be from the same Table")
		End if 
	Else 
		IME_ReplyText2("ITX DGLookupHeader"; "Lookup Error"; "")
		IME_ReplyText2("ITX DGTextLine"; "Improperly defined Table names")
	End if 
Else 
	IME_ReplyText2("ITX DGLookupHeader"; "Lookup Error"; "")
	IME_ReplyText2("ITX DGTextLine"; "The Lookup Fields are not defined")
	
End if 

IME_ReplyText2("ITX DGLookupFooter")
ERR_MethodTrackerReturn("IME DBLookup"; $_t_oldMethodName)