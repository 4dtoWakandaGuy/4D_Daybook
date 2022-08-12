//%attributes = {}
If (False:C215)
	//Project Method Name:      ReplaceIME
	//------------------ Method Notes ------------------
	// ReplaceIME
	//was formerly IME_Replace
	// Changed when all the IME stuff was removed
	// 22/04/02 pb
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_FIeldColumn; $_l_FieldNumber; $_l_FieldType; $_l_Position1; $_l_Position2; $_l_Position3; $_l_Position4; $_l_Position5; $_l_TableNumber; $_l_TableRow)
	C_POINTER:C301($_Ptr_Field)
	C_TEXT:C284(<>QUOTE; $_t_DatatoProcess; $_t_FieldName; $_t_Format; $_t_oldMethodName; $_t_oldMethodName2; $_t_TableName; $0; $1; MOD_FieldValue; vDesc)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ReplaceIME")


If (<>QUOTE="")
	<>Quote:=Char:C90(34)
End if 
Load_Fields

//could replace <*<>iCGI*> with its value (but would have to AAAC the variable)
//likewise for viSearch
//make a way of defining variables so that they can be auto-replaced?
//eg <>IME_t_Images

$_l_Position1:=Position:C15("<*"; $1)
$_l_Position2:=Position:C15("*>"; $1)
While (($_l_Position1>0) & ($_l_Position2>$_l_Position1))
	IDLE:C311  // 7/04/03 pb
	OK:=1
	MOD_FieldValue:=""
	RemoveLeadTr(Substring:C12($1; $_l_Position1+2; $_l_Position2-$_l_Position1-2); ->MOD_FieldValue)
	$_t_DatatoProcess:=MOD_FieldValue
	If ($_t_DatatoProcess="ITX @")
		$_l_Position3:=Position:C15("("; $_t_DatatoProcess)  //don't execute if can avoid it
		If ($_l_Position3>0)
			MOD_FieldValue:=""
			RemoveLeadTr(Substring:C12($_t_DatatoProcess; 1; $_l_Position3-1); ->MOD_FieldValue)
			$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:=IME Text ("+<>Quote+MOD_FieldValue+<>Quote+";"+Substring:C12($_t_DatatoProcess; $_l_Position3+1; Length:C16($_t_DatatoProcess)))
			EXECUTE FORMULA:C63("vDesc:=IME Text ("+<>Quote+MOD_FieldValue+<>Quote+";"+Substring:C12($_t_DatatoProcess; $_l_Position3+1; Length:C16($_t_DatatoProcess)))
		Else 
			vDesc:=IME_Text2($_t_DatatoProcess)
		End if 
	Else 
		If ($_t_DatatoProcess="[@")
			If (($_t_DatatoProcess#"@(@") & ($_t_DatatoProcess#"@+@") & ($_t_DatatoProcess#"@-@") & ($_t_DatatoProcess#("@"+Char:C90(34)+"@")) & ($_t_DatatoProcess#"@/@") & ($_t_DatatoProcess#"@*@") & ($_t_DatatoProcess#"@&@") & ($_t_DatatoProcess#"@?@"))
				
				$_l_CharacterPosition:=Position:C15("]"; $_t_DatatoProcess)
				If ($_l_CharacterPosition>0)
					
					$_l_Position4:=Position:C15(";"; $_t_DatatoProcess)
					$_l_Position5:=Position:C15(";"; Substring:C12($_t_DatatoProcess; $_l_Position4+1; 32000))
					If ($_l_Position5<1)
						If ($_l_Position4>0)
							$_t_Format:=STR_RemQuote(Substring:C12($_t_DatatoProcess; $_l_Position4+1; 32000))
							$_t_DatatoProcess:=Substring:C12($_t_DatatoProcess; 1; $_l_Position4-1)
						Else 
							$_t_Format:=""
						End if 
						
						$_t_TableName:=Substring:C12($_t_DatatoProcess; 2; $_l_CharacterPosition-2)
						$_t_FieldName:=Substring:C12($_t_DatatoProcess; $_l_CharacterPosition+1; 32000)
						$_t_TableName:=$_t_TableName
						$_l_TableRow:=DB_GetTableNumFromNameString($_t_TableName)
						$_l_TableNumber:=<>DB_al_TableNums{$_l_TableRow}
						$_l_FIeldColumn:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TableRow}; $_t_FieldName)
						$_l_FieldNumber:=<>SYS_al_2DFieldNumbers{$_l_TableRow}{$_l_FIeldColumn}
						If (($_l_TableNumber#-1) & ($_l_FieldNumber#-1))
							$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
							GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType)
							If (($_l_FieldType=1) | ($_l_FieldType=4) | ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=11))
								If ($_t_Format#"")
									vDesc:=String:C10($_Ptr_Field->; $_t_Format)
								Else 
									vDesc:=String:C10($_Ptr_Field->)
								End if 
							Else 
								vDesc:=$_Ptr_Field->
							End if 
						Else 
							$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:="+$_t_DatatoProcess)
							EXECUTE FORMULA:C63("vDesc:="+$_t_DatatoProcess)
						End if 
					Else 
						$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:="+$_t_DatatoProcess)
						EXECUTE FORMULA:C63("vDesc:="+$_t_DatatoProcess)
					End if 
				Else 
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:="+$_t_DatatoProcess)
					EXECUTE FORMULA:C63("vDesc:="+$_t_DatatoProcess)
				End if 
			Else 
				$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:="+$_t_DatatoProcess)
				EXECUTE FORMULA:C63("vDesc:="+$_t_DatatoProcess)
			End if 
		Else 
			$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:="+$_t_DatatoProcess)
			EXECUTE FORMULA:C63("vDesc:="+$_t_DatatoProcess)
		End if 
	End if 
	If ((OK=0) | (Type:C295(vDesc)#2))
		$1:=Substring:C12($1; 1; $_l_Position1-1)+"***ERROR***"+Substring:C12($1; $_l_Position2+2; Length:C16($1))
	Else 
		$1:=Substring:C12($1; 1; $_l_Position1-1)+vDesc+Substring:C12($1; $_l_Position2+2; Length:C16($1))
	End if 
	$_l_Position1:=Position:C15("<*"; $1)
	$_l_Position2:=Position:C15("*>"; $1)
End while 
If ($1=" @")
	MOD_FieldValue:=""
	RemoveLeadTr($1; ->MOD_FieldValue)
	$1:=MOD_FieldValue
End if 
If ($1="*@")
	$1:=Substring:C12($1; 2; Length:C16($1))
End if 
$0:=$1
ERR_MethodTrackerReturn("ReplaceIME"; $_t_oldMethodName)
