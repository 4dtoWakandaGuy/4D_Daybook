//%attributes = {}
If (False:C215)
	//Project Method Name:      Document_EmailFieldTokens
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 09:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_isaField; $_bo_IsaTable)
	C_LONGINT:C283($_l_Count; $_l_DataType; $_l_FieldNameLength; $_l_FieldNumber; $_l_Index; $_l_Index2; $_l_TableNameEndBracket; $_l_TableNameStartBracket; $_l_TableNumber)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_FieldName1; $_t_FieldName2; $_t_InsertText; $_t_oldMethodName; $_t_ParseText; $_t_ReturnText; $_t_TableName; $_t_ValidFieldChars; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Document_EmailFieldTokens")

//This method will look for table field names in the passed string
If (Count parameters:C259>=1)
	$_l_TableNameStartBracket:=Position:C15("["; $1)
	$_t_ReturnText:=""
	
	//*************** added 12/1207 -kmw ***************
	//not sure but for purposes valid chars will be considered alphanumeric, space and underscore
	$_t_ValidFieldChars:="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890 _"
	//*********************************************
	
	If ($_l_TableNameStartBracket>0)
		$_t_ParseText:=$1
		Repeat 
			$_l_TableNameStartBracket:=Position:C15("["; $_t_ParseText)
			If ($_l_TableNameStartBracket>0)
				$_t_ReturnText:=$_t_ReturnText+Substring:C12($_t_ParseText; 1; $_l_TableNameStartBracket-1)
				$_t_ParseText:=Substring:C12($_t_ParseText; $_l_TableNameStartBracket+1)
				$_l_TableNameEndBracket:=Position:C15("]"; $_t_ParseText)
				If ($_l_TableNameEndBracket>0)
					$_t_TableName:=Substring:C12($_t_ParseText; 1; $_l_TableNameEndBracket-1)
					$_bo_IsaTable:=False:C215
					$_l_TableNumber:=0
					$_l_FieldNumber:=0
					For ($_l_Index; 1; Get last table number:C254)
						If (Is table number valid:C999($_l_Index))
							$_bo_IsaTable:=(Table name:C256($_l_Index)=$_t_TableName)
							If ($_bo_IsaTable)
								$_l_TableNumber:=$_l_Index
								//Get the field names of that table
								$_l_Count:=0
								
								$_t_ParseText:=Substring:C12($_t_ParseText; $_l_TableNameEndBracket+1)
								//$_l_FieldNameLength:=Position(" ";$_t_ParseText)
								//If ($_l_FieldNameLength>0)
								
								$_bo_isaField:=False:C215
								$_t_FieldName1:=""
								$_t_FieldName2:=""
								For ($_l_Index2; 1; Length:C16($_t_ParseText))
									Case of 
											
											//*************** added 12/1207 -kmw ***************
										: (Position:C15($_t_ParseText[[$_l_Index2]]; $_t_ValidFieldChars)<1)
											If ($_t_FieldName1="")
												$_t_FieldName1:=Substring:C12($_t_ParseText; 1; $_l_Index2-1)
											End if 
											$_t_FieldName2:=Substring:C12($_t_ParseText; 1; $_l_Index2-1)
											$_l_Count:=3
											//*********************************************
											
											//*************** disabled 12/1207 -kmw **************
										: (($_t_ParseText[[$_l_Index2]]=Char:C90(13)) | ($_t_ParseText[[$_l_Index2]]=Char:C90(9))) & (False:C215)
											If ($_t_FieldName1="")
												$_t_FieldName1:=Substring:C12($_t_ParseText; 1; $_l_Index2-1)
											End if 
											$_t_FieldName2:=Substring:C12($_t_ParseText; 1; $_l_Index2-1)
											$_l_Count:=3
											//*************** ******************************
											
										: ($_t_ParseText[[$_l_Index2]]=" ")
											If ($_t_FieldName1="")
												$_t_FieldName1:=Substring:C12($_t_ParseText; 1; $_l_Index2-1)
											Else 
												$_t_FieldName2:=Substring:C12($_t_ParseText; 1; $_l_Index2-1)
											End if 
											$_l_Count:=$_l_Count+1
										: ($_l_Index2=Length:C16($_t_ParseText))
											If ($_t_FieldName1="")
												$_t_FieldName1:=Substring:C12($_t_ParseText; 1; $_l_Index2)
											Else 
												If ($_t_FieldName2="")
													$_t_FieldName2:=Substring:C12($_t_ParseText; 1; $_l_Index2)
												End if 
											End if 
											
									End case 
									If ($_l_Count>=2)
										$_l_Index2:=Length:C16($_t_ParseText)
									End if 
								End for 
								If ($_t_FieldName1="")
									$_t_FieldName1:=$_t_ParseText
									$_t_FieldName2:=$_t_ParseText
								End if 
								
								//Else
								//could just be the end of the doc
								
								//$_bo_isaField:=False
								//End if
								$_bo_isaField:=False:C215
								For ($_l_Index2; 1; Get last field number:C255($_l_Index))
									If (Is field number valid:C1000($_l_Index; $_l_Index2))
										$_bo_isaField:=(Field name:C257($_l_Index; $_l_Index2)=$_t_FieldName1) | (Field name:C257($_l_Index; $_l_Index2)=$_t_FieldName2)
										If ($_bo_isaField)
											Case of 
												: (Field name:C257($_l_Index; $_l_Index2)=$_t_FieldName1)
													//this is a field name
													$_l_FieldNumber:=$_l_Index2
													$_t_ParseText:=Substring:C12($_t_ParseText; Length:C16($_t_FieldName1)+1)
													$_l_FieldNameLength:=Length:C16($_t_FieldName1)
												: (Field name:C257($_l_Index; $_l_Index2)=$_t_FieldName2)
													$_l_FieldNameLength:=Length:C16($_t_FieldName2)
													$_l_FieldNumber:=$_l_Index2
													$_t_ParseText:=Substring:C12($_t_ParseText; Length:C16($_t_FieldName2)+1)
											End case 
											$_l_Index2:=Get last field number:C255($_l_Index)
										End if 
									End if 
								End for 
								If (Not:C34($_bo_isaField))
									//this is not a field so put the table name back into the return text
									If ($_t_FieldName2#"")
										$_t_ReturnText:=$_t_ReturnText+"["+$_t_TableName+"]"+Substring:C12($_t_ParseText; 1; Length:C16($_t_FieldName2))
									Else 
										$_t_ReturnText:=$_t_ReturnText+"["+$_t_TableName+"]"+$_t_ParseText
										$_t_ParseText:=""
									End if 
								Else 
									$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
									$_l_DataType:=Type:C295($_ptr_Field->)
									$_t_InsertText:=""
									Case of 
										: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
											$_t_InsertText:=$_ptr_Field->
										: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is real:K8:4)
											$_t_InsertText:=String:C10($_ptr_Field->)
										: ($_l_DataType=Is date:K8:7)
											$_t_InsertText:=String:C10($_ptr_Field->)
										: ($_l_DataType=Is time:K8:8)
											$_t_InsertText:=Time string:C180($_ptr_Field->*1)
										: ($_l_DataType=Is boolean:K8:9)
											$_t_InsertText:=String:C10(Num:C11($_ptr_Field->))
										Else 
									End case 
									$_t_ReturnText:=$_t_ReturnText+$_t_InsertText
									//$_t_ParseText:=Substring($_t_ParseText;$_l_FieldNameLength)
									
								End if 
								
								$_l_Index:=Get last table number:C254
							Else 
								//it is not a table name so add it to the return text
								
							End if 
						End if 
					End for 
					If (Not:C34($_bo_IsaTable))
						$_t_ReturnText:=$_t_ReturnText+"["+$_t_TableName+"]"
						$_t_ParseText:=Substring:C12($_t_ParseText; $_l_TableNameEndBracket+1)
					End if 
				Else 
					$_t_ReturnText:=$_t_ReturnText+"["
					$_t_ParseText:=Substring:C12($_t_ParseText; 2)
				End if 
			Else 
				$_t_ReturnText:=$_t_ReturnText+$_t_ParseText
				$_t_ParseText:=""
			End if 
		Until ($_t_ParseText="")
		$0:=$_t_ReturnText
	Else 
		$0:=$1
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Document_EmailFieldTokens"; $_t_oldMethodName)