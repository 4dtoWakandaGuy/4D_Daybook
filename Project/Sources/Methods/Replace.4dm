//%attributes = {}
If (False:C215)
	//Project Method Name:      Replace
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharPosition1; $_l_CharPosition2; $_l_CharPosition3; $_l_FieldNumber; $_l_FieldType; $_l_Length; $_l_TableNumber)
	C_POINTER:C301($_ptr_Field; $_ptr_Variable)
	C_TEXT:C284($_t_DocumentCode; $_t_FIeldName1; $_t_Format; $_t_oldMethodName; $_t_oldMethodName2; $_t_Parameter; $_t_RLC; $_t_TableName; $_t_TableName1; $_t_TextToProcess; $_t_Value)
	C_TEXT:C284($0; $1; vDesc)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Replace")

//Replace
Load_Fields


$_l_CharPosition1:=Position:C15("<"; $1)
$_l_CharPosition2:=Position:C15(">"; $1)
While (($_l_CharPosition1>0) & ($_l_CharPosition2>$_l_CharPosition1))
	IDLE:C311  // 7/04/03 pb
	$_t_TextToProcess:=Substring:C12($1; $_l_CharPosition1+1; $_l_CharPosition2-$_l_CharPosition1-1)
	
	$_t_Format:=""
	$_l_Length:=0
	$_t_RLC:=""
	$_l_CharacterPosition:=Position:C15(";"; $_t_TextToProcess)
	While ($_l_CharacterPosition>0)
		IDLE:C311  // 7/04/03 pb
		$_l_CharPosition3:=Position:C15(";"; Substring:C12($_t_TextToProcess; $_l_CharacterPosition+1; 32000))
		If ($_l_CharPosition3=0)
			$_t_Parameter:=Substring:C12($_t_TextToProcess; $_l_CharacterPosition+1; 32000)
			$_t_TextToProcess:=Substring:C12($_t_TextToProcess; 1; $_l_CharacterPosition-1)
		Else 
			$_t_Parameter:=Substring:C12($_t_TextToProcess; $_l_CharacterPosition+1; $_l_CharPosition3-1)
			$_t_TextToProcess:=Substring:C12($_t_TextToProcess; 1; $_l_CharacterPosition-1)+Substring:C12($_t_TextToProcess; $_l_CharacterPosition+$_l_CharPosition3; 32000)
		End if 
		If ((Character code:C91(Substring:C12($_t_Parameter; 1; 1)))=34)
			$_t_Format:=Substring:C12($_t_Parameter; 2; Length:C16($_t_Parameter)-2)
		Else 
			If (($_t_Parameter="L") | ($_t_Parameter="R") | ($_t_Parameter="C"))
				$_t_RLC:=$_t_Parameter
			Else 
				$_l_Length:=Num:C11($_t_Parameter)
			End if 
		End if 
		
		$_l_CharacterPosition:=Position:C15(";"; $_t_TextToProcess)
	End while 
	
	If ($_t_TextToProcess="E:@")
		$_t_TextToProcess:=Substring:C12($_t_TextToProcess; 3; 32000)
		If ($_l_Length>0)
			vDesc:="LENGTH:"+String:C10($_l_Length)
		Else 
			vDesc:=""
		End if 
		$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_TextToProcess)
		EXECUTE FORMULA:C63($_t_TextToProcess)
		If (vDesc=("LENGTH:"+String:C10($_l_Length)))
			vDesc:=""
		End if 
		vDesc:=Replace_Length(vDesc; $_l_Length; $_t_RLC)
		$1:=Substring:C12($1; 1; $_l_CharPosition1-1)+vDesc+Substring:C12($1; $_l_CharPosition2+1; 32000)
	Else 
		If (((Character code:C91(Substring:C12($_t_TextToProcess; 1; 1)))=34) & ((Character code:C91(Substring:C12($_t_TextToProcess; Length:C16($_t_TextToProcess); 1)))=34))
			$_t_TextToProcess:=Replace_Length(Substring:C12($_t_TextToProcess; 2; Length:C16($_t_TextToProcess)-2); $_l_Length; $_t_RLC)
			$1:=Substring:C12($1; 1; $_l_CharPosition1-1)+$_t_TextToProcess+Substring:C12($1; $_l_CharPosition2+1; 32000)
		Else 
			$_l_CharacterPosition:=Position:C15("]"; $_t_TextToProcess)
			$_t_TableName1:=Substring:C12($_t_TextToProcess; 2; $_l_CharacterPosition-2)
			$_t_FIeldName1:=Substring:C12($_t_TextToProcess; $_l_CharacterPosition+1; 32000)
			$_t_TableName:=$_t_TableName1
			$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
			$_l_FieldNumber:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TableNumber}; $_t_FIeldName1)
			If (($_l_TableNumber#-1) & ($_l_FieldNumber#-1))
				$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
				GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType)
				If (($_l_FieldType=1) | ($_l_FieldType=4) | ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=11))
					If ($_t_Format#"")
						$_t_Value:=String:C10($_ptr_Field->; $_t_Format)
					Else 
						$_t_Value:=String:C10($_ptr_Field->)
					End if 
				Else 
					$_t_Value:=$_ptr_Field->
				End if 
				$_t_Value:=Replace_Length($_t_Value; $_l_Length; $_t_RLC)
				$1:=Substring:C12($1; 1; $_l_CharPosition1-1)+$_t_Value+Substring:C12($1; $_l_CharPosition2+1; 32000)
			Else 
				$_ptr_Variable:=Get pointer:C304($_t_TextToProcess)
				If (Type:C295($_ptr_Variable->)#5)
					If ((Type:C295($_ptr_Variable->)=4) | (Type:C295($_ptr_Variable->)=1) | (Type:C295($_ptr_Variable->)=8) | (Type:C295($_ptr_Variable->)=9) | (Type:C295($_ptr_Variable->)=11))
						If ($_t_Format#"")
							$_t_TextToProcess:=String:C10($_ptr_Variable->; $_t_Format)
						Else 
							$_t_TextToProcess:=String:C10($_ptr_Variable->)
						End if 
						$_t_TextToProcess:=Replace_Length($_t_TextToProcess; $_l_Length; $_t_RLC)
						$1:=Substring:C12($1; 1; $_l_CharPosition1-1)+$_t_TextToProcess+Substring:C12($1; $_l_CharPosition2+1; 32000)
					Else 
						$_t_TextToProcess:=Replace_Length($_ptr_Variable->; $_l_Length; $_t_RLC)
						$1:=Substring:C12($1; 1; $_l_CharPosition1-1)+$_t_TextToProcess+Substring:C12($1; $_l_CharPosition2+1; 32000)
					End if 
				Else 
					If ($_t_TextToProcess="Letter: @")
						PUSH RECORD:C176([DOCUMENTS:7])
						$_t_DocumentCode:=LastWord2($_t_TextToProcess)
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_DocumentCode)
						If (Records in selection:C76([DOCUMENTS:7])=1)
							$1:=Substring:C12($1; 1; $_l_CharPosition1-1)+Replace([DOCUMENTS:7]Text:3)+Substring:C12($1; $_l_CharPosition2+1; 32000)
						Else 
							$1:=Substring:C12($1; 1; $_l_CharPosition1-1)+Substring:C12($1; $_l_CharPosition2+1; 32000)
						End if 
						POP RECORD:C177([DOCUMENTS:7])
						ONE RECORD SELECT:C189([DOCUMENTS:7])
					Else 
						$_t_TextToProcess:=Replace_Length($_t_TextToProcess; $_l_Length; $_t_RLC)
						$1:=Substring:C12($1; 1; $_l_CharPosition1-1)+$_t_TextToProcess+Substring:C12($1; $_l_CharPosition2+1; 32000)
					End if 
				End if 
			End if 
		End if 
	End if 
	$_l_CharPosition1:=Position:C15("<"; $1)
	$_l_CharPosition2:=Position:C15(">"; $1)
End while 
$0:=$1
ERR_MethodTrackerReturn("Replace"; $_t_oldMethodName)
