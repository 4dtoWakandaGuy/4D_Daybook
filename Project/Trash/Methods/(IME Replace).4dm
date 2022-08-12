//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME Replace
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
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
	C_BOOLEAN:C305($_bo_FurtherField)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharPositon; $_l_CharPositon2; $_l_FieldNumber; $_l_FieldType; $_l_TableNumber; $_t_CharPosition1; $_t_CharPosition2; $_t_CharPosition3)
	C_POINTER:C301($_Ptr_Field)
	C_TEXT:C284(<>QUOTE; $_t_CustomFieldTable; $_t_FIeldName; $_t_FieldValue; $_t_Format; $_t_oldMethodName; $_t_oldMethodName2; $_t_TableName; $0; $1; MOD_FieldValue)
	C_TEXT:C284(vDesc)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("IME Replace")

//IME Replace
If (<>QUOTE="")
	<>Quote:=Char:C90(34)
End if 
Load_Fields


//could replace <*<>iCGI*> with its value (but would have to AAAC the variable)
//likewise for viSearch
//make a way of defining variables so that they can be auto-replaced?
//eg <>IME_t_Images

$_t_CharPosition1:=Position:C15("<*"; $1)
$_t_CharPosition2:=Position:C15("*>"; $1)
While (($_t_CharPosition1>0) & ($_t_CharPosition2>$_t_CharPosition1))
	IDLE:C311  // 7/04/03 pb
	OK:=1
	MOD_FieldValue:=""
	RemoveLeadTr(Substring:C12($1; $_t_CharPosition1+2; $_t_CharPosition2-$_t_CharPosition1-2); ->MOD_FieldValue)
	$_t_FieldValue:=MOD_FieldValue
	If ($_t_FieldValue="ITX @")
		$_t_CharPosition3:=Position:C15("("; $_t_FieldValue)  //don't execute if can avoid it
		If ($_t_CharPosition3>0)
			MOD_FieldValue:=""
			RemoveLeadTr(Substring:C12($_t_FieldValue; 1; $_t_CharPosition3-1); ->MOD_FieldValue)
			$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:=IME_Text2 ("+<>Quote+MOD_FieldValue+<>Quote+";"+Substring:C12($_t_FieldValue; $_t_CharPosition3+1; Length:C16($_t_FieldValue)))
			EXECUTE FORMULA:C63("vDesc:=IME_Text2 ("+<>Quote+MOD_FieldValue+<>Quote+";"+STR_StringLiteral(Substring:C12($_t_FieldValue; $_t_CharPosition3+1; Length:C16($_t_FieldValue))))
		Else 
			vDesc:=IME_Text2($_t_FieldValue)
		End if 
	Else 
		If (($_t_FieldValue="[@") | ($_t_FieldValue="FF[@") | ($_t_FieldValue="Further Field[@"))
			If (($_t_FieldValue#"@(@") & ($_t_FieldValue#"@+@") & ($_t_FieldValue#"@-@") & ($_t_FieldValue#("@"+Char:C90(34)+"@")) & ($_t_FieldValue#"@*@") & ($_t_FieldValue#"@&@") & ($_t_FieldValue#"@?@"))  //& ($_t_FieldValue#"@/@")
				
				$_l_CharacterPosition:=Position:C15("]"; $_t_FieldValue)
				If ($_l_CharacterPosition>0)
					
					$_l_CharPositon:=Position:C15(";"; $_t_FieldValue)
					$_l_CharPositon2:=Position:C15(";"; Substring:C12($_t_FieldValue; $_l_CharPositon+1))
					If ($_l_CharPositon2<1)
						If ($_l_CharPositon>0)
							$_t_Format:=Str RemQuote(Substring:C12($_t_FieldValue; $_l_CharPositon+1))
							$_t_FieldValue:=Substring:C12($_t_FieldValue; 1; $_l_CharPositon-1)
						Else 
							$_t_Format:=""
						End if 
						
						Case of   //Rollo 22/10/2004 - added Further Field getting
							: ($_t_FieldValue="FF[@")
								$_t_CustomFieldTable:=Substring:C12($_t_FieldValue; 4; $_l_CharacterPosition-4)
								$_bo_FurtherField:=True:C214
							: ($_t_FieldValue="Further Field[@")
								$_t_CustomFieldTable:=Substring:C12($_t_FieldValue; 15; $_l_CharacterPosition-15)
								$_bo_FurtherField:=True:C214
							Else 
								$_t_CustomFieldTable:=Substring:C12($_t_FieldValue; 2; $_l_CharacterPosition-2)
								$_bo_FurtherField:=False:C215
						End case 
						$_t_TableName:=$_t_CustomFieldTable
						$_t_FIeldName:=Substring:C12($_t_FieldValue; $_l_CharacterPosition+1)
						$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
						$_l_TableNumber:=<>DB_al_TableNums{$_l_TableNumber}
						If ($_l_TableNumber>0)  //Rollo 24/6/2004
							
							If ($_bo_FurtherField)  //Rollo 22/10/2004 - added Further Field getting
								
								If ($_t_Format#"")
									If (($_t_Format="@|@") & ($_t_Format#"@;|@"))
										vDesc:=FurthFld_Get2($_t_CustomFieldTable; $_t_FIeldName)
									Else 
										vDesc:=FurthFld_Get2($_t_CustomFieldTable; $_t_FIeldName; ""; $_t_Format)
									End if 
								Else 
									vDesc:=FurthFld_Get2($_t_CustomFieldTable; $_t_FIeldName)
								End if 
								
							Else 
								
								$_l_FieldNumber:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TableNumber}; $_t_FIeldName)
								If ($_l_FieldNumber>0)  //Rollo 24/6/2004
									$_l_FieldNumber:=<>SYS_al_2DFieldNumbers{$_l_TableNumber}{$_l_FieldNumber}
									If ($_l_FieldNumber>0)
										$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
										GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType)
										If (($_l_FieldType=1) | ($_l_FieldType=4) | ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=11))  //real, date, integer, longint, time
											If ($_t_Format#"")
												If (($_t_Format="@|@") & ($_t_Format#"@;|@"))  //Rollo 30/9/2004
													vDesc:=String:C10($_Ptr_Field->)
													//Case of   `if there are formats like ;0/None|1/This, then look for the replacement value
													//BUT - no, we have to know if the values are for true value purposes or for display only
													//End case
												Else 
													vDesc:=String:C10($_Ptr_Field->; $_t_Format)
												End if 
											Else 
												vDesc:=String:C10($_Ptr_Field->)
											End if 
										Else 
											If ($_l_FieldType=6)  //boolean
												If ($_Ptr_Field->)  //Rollo 30/9/2004
													vDesc:="Yes"
												Else 
													vDesc:="No"
												End if 
											Else 
												vDesc:=$_Ptr_Field->
											End if 
										End if 
									Else 
										$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:="+$_t_FieldValue)
										EXECUTE FORMULA:C63("vDesc:="+$_t_FieldValue)
									End if 
								Else 
									$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:="+$_t_FieldValue)
									EXECUTE FORMULA:C63("vDesc:="+$_t_FieldValue)
								End if 
								
							End if 
							
						Else 
							$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:="+$_t_FieldValue)
							EXECUTE FORMULA:C63("vDesc:="+$_t_FieldValue)
						End if 
					Else 
						$_t_oldMethodName2:=ERR_MethodTracker("Execute: vDesc:="+$_t_FieldValue)
						EXECUTE FORMULA:C63(STR_StringLiteral("vDesc:="+$_t_FieldValue))
					End if 
				Else 
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: vDesc:="+$_t_FieldValue)
					EXECUTE FORMULA:C63(STR_StringLiteral("vDesc:="+$_t_FieldValue))
				End if 
			Else 
				$_t_oldMethodName2:=ERR_MethodTracker("Execute: vDesc:="+$_t_FieldValue)
				EXECUTE FORMULA:C63(STR_StringLiteral("vDesc:="+$_t_FieldValue))
			End if 
		Else 
			$_t_oldMethodName2:=ERR_MethodTracker("Execute: vDesc:="+$_t_FieldValue)
			EXECUTE FORMULA:C63(STR_StringLiteral("vDesc:="+$_t_FieldValue))
		End if 
	End if 
	If ((OK=0) | (Type:C295(vDesc)#2))
		$1:=Substring:C12($1; 1; $_t_CharPosition1-1)+"***ERROR***"+Substring:C12($1; $_t_CharPosition2+2; Length:C16($1))
	Else 
		$1:=Substring:C12($1; 1; $_t_CharPosition1-1)+vDesc+Substring:C12($1; $_t_CharPosition2+2; Length:C16($1))
	End if 
	$_t_CharPosition1:=Position:C15("<*"; $1)
	$_t_CharPosition2:=Position:C15("*>"; $1)
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
ERR_MethodTrackerReturn("IME Replace"; $_t_oldMethodName)