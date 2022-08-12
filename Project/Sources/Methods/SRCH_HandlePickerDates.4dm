//%attributes = {}
If (False:C215)
	//Project Method Name:      SRCH_HandlePickerDates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2012 11:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($_ptr_BooleanVar; $_ptr_FromPointer; $_ptr_ToPointer; $_ptr_Variable)
	C_TEXT:C284($_t_ObjectName; $_t_oldMethodName; $_t_ToObjectName; $_t_ToVarName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SRCH_HandlePickerDates")
$_ptr_Variable:=OBJECT Get pointer:C1124(Object current:K67:2)
$_t_ObjectName:=OBJECT Get name:C1087(Object current:K67:2)
RESOLVE POINTER:C394($_ptr_Variable; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
If ($_t_ObjectName#"")
	$_l_CharacterPosition:=Position:C15("DatePick"; $_t_ObjectName)
	If ($_l_CharacterPosition>0)
		$_t_ObjectName:=Substring:C12($_t_ObjectName; 1; $_l_CharacterPosition-1)
		$_ptr_FromPointer:=$_ptr_Variable
		Case of 
			: ($_t_VariableName[[Length:C16($_t_VariableName)]]="F")
				$_t_ToVarName:=Substring:C12($_t_VariableName; 1; Length:C16($_t_VariableName)-1)
				$_ptr_ToPointer:=Get pointer:C304($_t_ToVarName+"T")
				If ($_ptr_FromPointer->=!00-00-00!)
					$_ptr_FromPointer->:=Current date:C33-365
				End if 
				If ($_ptr_FromPointer->>!00-00-00!)
					
					If ($_ptr_ToPointer-><$_ptr_FromPointer->) & ($_ptr_ToPointer->>!00-00-00!)
						$_ptr_ToPointer->:=$_ptr_FromPointer->
						
					End if 
					
					
					If ($_t_ObjectName[[Length:C16($_t_ObjectName)]]="F")
						
						$_t_ToObjectName:=Substring:C12($_t_ObjectName; 1; Length:C16($_t_ObjectName)-1)+"T"
						
						OBJECT SET VISIBLE:C603(*; $_t_ToObjectName+"@"; True:C214)
					End if 
					
				End if 
			: ($_t_VariableName[[Length:C16($_t_VariableName)]]="T")
				Case of 
					: (Form event code:C388=On Getting Focus:K2:7)
						$_ptr_FromPointer->:=Current date:C33
						$_t_ToVarName:=Substring:C12($_t_VariableName; 1; Length:C16($_t_VariableName)-1)
						$_ptr_BooleanVar:=Get pointer:C304("SRCH_bo_"+$_t_ToVarName+"ToSet")
						$_ptr_BooleanVar->:=True:C214
						
						$_ptr_ToPointer:=Get pointer:C304($_t_ToVarName+"F")
					: (Form event code:C388=On Clicked:K2:4)
						$_t_ToVarName:=Substring:C12($_t_VariableName; 1; Length:C16($_t_VariableName)-1)
						$_ptr_ToPointer:=Get pointer:C304($_t_ToVarName+"F")
						If ($_ptr_FromPointer->>!00-00-00!)
							If ($_ptr_ToPointer->>!00-00-00!) & ($_ptr_ToPointer->>$_ptr_FromPointer->)
								$_ptr_ToPointer->:=$_ptr_FromPointer->
							End if 
						End if 
				End case 
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("SRCH_HandlePickerDates"; $_t_oldMethodName)
