//%attributes = {}
If (False:C215)
	//Project Method Name:      NaNFixer
	//------------------ Method Notes ------------------
	// NANFixer
	// Detects NaNs stored in real fields and fixes them
	// 10/03/04 PB
	// Parameters: Optional - $1 = table number
	// Example call: NANfixer($_l_TableNumber)
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldCount; $_l_FieldIndex; $_l_RecordNumber; $_l_TableNumber; $_l_TriggerEvent; $_l_Type; $1)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NaNFixer"; Trigger event:C369)


$_l_TableNumber:=0
Case of 
	: (Trigger level:C398>0)
		TRIGGER PROPERTIES:C399(Trigger level:C398; $_l_TriggerEvent; $_l_TableNumber; $_l_RecordNumber)
		
	: (Count parameters:C259>0)
		$_l_TableNumber:=$1
End case 

If ($_l_TableNumber>0)
	$_l_FieldCount:=Get last field number:C255($_l_TableNumber)
	For ($_l_FieldIndex; 1; $_l_FieldCount)
		$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
		$_l_Type:=Type:C295($_ptr_Field->)
		Case of 
			: ($_l_Type=Is real:K8:4)
				If ((($_ptr_Field->)<0) | (($_ptr_Field->)=0) | (($_ptr_Field->)>0)=False:C215) | (String:C10($_ptr_Field->)="i@")  // it's a NaN!
					$_ptr_Field->:=0
				End if 
			: ($_l_Type=Is text:K8:3) | ($_l_Type=Is alpha field:K8:1)  //Gremlins  Check and Fixer
				//Util_GremlinFixer($_ptr_Field)
		End case 
	End for 
End if 
ERR_MethodTrackerReturn("NaNFixer"; $_t_oldMethodName)
