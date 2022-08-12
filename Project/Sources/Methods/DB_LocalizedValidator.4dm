//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LocalizedValidator
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:            26/11/2010 13:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocumentInText; 0)
	ARRAY TEXT:C222($_at_Documents; 0)
	ARRAY TEXT:C222($_at_LocalizedStringUsed; 0)
	ARRAY TEXT:C222($_at_SubFolders; 0)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_QuotesPosition; $_l_StringLength; $_l_YearPosition)
	C_TEXT:C284($_t_CUrrentDateSTR; $_t_DocumentPath; $_t_ExportsPath; $_t_LocalizedStringText; $_t_oldMethodName; $_t_StringText; $_t_Time)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LocalizedValidator")


//NG this is a method to test the validity of localized strings used in methods...note it does not test menus
//TRACE
ARRAY TEXT:C222($_at_LocalizedStringUsed; 0)
$_l_StringLength:=Length:C16("Get localized string")
$_t_ExportsPath:=Select folder:C670("Select folder containing Structure Exports")
If ($_t_ExportsPath#"")
	FOLDER LIST:C473($_t_ExportsPath; $_at_SubFolders)
	DOCUMENT LIST:C474($_t_ExportsPath; $_at_Documents)
	For ($_l_Index; 15; Size of array:C274($_at_Documents))
		If ($_l_Index=287)
			//TRACE
		End if 
		If ("DB_LocalizedValidator"#$_at_Documents{$_l_Index}) & ("AAJunk"#$_at_Documents{$_l_Index})
			$_l_YearPosition:=Position:C15("_2010"; $_at_Documents{$_l_Index})
			If ($_l_YearPosition=0)
				$_t_DocumentPath:=$_t_ExportsPath+$_at_Documents{$_l_Index}
				If ("DB_BuildModuleMenu"=$_at_Documents{$_l_Index})
					//TRACE
				End if 
				$_ti_DocumentRef:=Open document:C264($_t_DocumentPath; "*")
				ARRAY TEXT:C222($_at_DocumentInText; 0)
				Repeat 
					APPEND TO ARRAY:C911($_at_DocumentInText; "")
					
					RECEIVE PACKET:C104($_ti_DocumentRef; $_at_DocumentInText{Size of array:C274($_at_DocumentInText)}; 32000)
				Until (OK=0)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				
				For ($_l_Index2; 1; Size of array:C274($_at_DocumentInText))
					Repeat 
						$_l_YearPosition:=Position:C15("Get localized string"; $_at_DocumentInText{$_l_Index2})
						If ($_l_YearPosition>0)
							//TRACE
							$_t_StringText:=Substring:C12($_at_DocumentInText{$_l_Index2}; ($_l_YearPosition+$_l_StringLength+2))
							$_l_QuotesPosition:=Position:C15(Char:C90(34); $_t_StringText)
							If ($_l_QuotesPosition>0)
								$_t_LocalizedStringText:=Substring:C12($_t_StringText; 1; $_l_QuotesPosition-1)
								If ($_t_LocalizedStringText#"")
									If (Position:C15("$Compare"; $_t_LocalizedStringText)>0)
										
										//TRACE
									End if 
									APPEND TO ARRAY:C911($_at_LocalizedStringUsed; $_t_LocalizedStringText)
								End if 
								$_at_DocumentInText{$_l_Index2}:=Substring:C12($_at_DocumentInText{$_l_Index2}; $_l_YearPosition+$_l_StringLength+2)
							Else 
								If ($_l_Index2<Size of array:C274($_at_DocumentInText))
									//TRACE
									$_t_StringText:=Substring:C12($_at_DocumentInText{$_l_Index2}; $_l_YearPosition-1)
									$_t_StringText:=$_t_StringText+$_at_DocumentInText{$_l_Index2+1}
									$_at_DocumentInText{$_l_Index2+1}:=$_t_StringText+$_at_DocumentInText{$_l_Index2+1}
									$_at_DocumentInText{$_l_Index2}:=""
								Else 
									$_at_DocumentInText{$_l_Index2}:=""
								End if 
							End if 
							
						Else 
							If ($_l_Index2<Size of array:C274($_at_DocumentInText))
								If ($_at_DocumentInText{$_l_Index2}#"")
									$_t_StringText:=Substring:C12($_at_DocumentInText{$_l_Index2}; Length:C16($_at_DocumentInText{$_l_Index2})-$_l_StringLength)
									$_at_DocumentInText{$_l_Index2+1}:=$_t_StringText+$_at_DocumentInText{$_l_Index2+1}
									$_at_DocumentInText{$_l_Index2}:=""
								End if 
							End if 
						End if 
					Until ($_l_YearPosition=0)
					
					
				End for 
			End if 
		End if 
		
	End for 
	If (Size of array:C274($_at_LocalizedStringUsed)>0)
		$_t_CUrrentDateSTR:=String:C10(Current date:C33)
		$_t_CUrrentDateSTR:=Replace string:C233($_t_CUrrentDateSTR; "/"; "_")
		$_t_Time:=Time string:C180(Current time:C178*1)
		$_t_Time:=Replace string:C233($_t_Time; ":"; "_")
		
		$_ti_DocumentRef:=Create document:C266("LocalizedStringReport"+$_t_CUrrentDateSTR+$_t_Time; "TEXT")
		For ($_l_Index; 1; Size of array:C274($_at_LocalizedStringUsed))
			$_t_StringText:=Get localized string:C991($_at_LocalizedStringUsed{$_l_Index})
			If ($_t_StringText="")
				SEND PACKET:C103($_ti_DocumentRef; $_at_LocalizedStringUsed{$_l_Index}+Char:C90(9)+"ERROR NO VALUE"+Char:C90(13))
			Else 
				//SEND PACKET($_ti_DocumentRef;$_at_LocalizedStringUsed{$_l_Index}+Char(9)+$_t_StringText+Char(13))
			End if 
			
			
		End for 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	
	
End if 
ALERT:C41("DONE")
ERR_MethodTrackerReturn("DB_LocalizedValidator"; $_t_oldMethodName)