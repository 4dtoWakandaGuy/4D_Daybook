//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_OutEditRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2013 22:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentDisplayedForm; $_l_FromDIsplayedForm; $2)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_OutEditRecord")

If (Count parameters:C259>=1)
	$_l_CurrentDisplayedForm:=$1
	If (Count parameters:C259>=2)
		$_l_FromDIsplayedForm:=$2
	End if 
	DB_OpenRecordFromSelection($_l_CurrentDisplayedForm; $_l_FromDIsplayedForm)
	
End if 
ERR_MethodTrackerReturn("DB_OutEditRecord"; $_t_oldMethodName)