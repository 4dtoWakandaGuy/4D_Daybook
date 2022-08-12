//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_ContextIDfromTable
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
	//ARRAY LONGINT(SM_al_SetContextIDs;0)
	C_BOOLEAN:C305($_bo_Exit)
	C_LONGINT:C283($_l_Repeats; $_l_TableContext; $_l_TableRow)
	C_REAL:C285($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_ContextIDfromTable")
//This method will extract a  table number from a context ID
//the context IDs are >10000
//we take the 10,000 off and then subtract 1000 until the number is
//less than 1000
If (Count parameters:C259>=1)
	If ($1<100)
		$_l_TableContext:=$1+10000
		$_bo_Exit:=False:C215
		$_l_Repeats:=0
		Repeat 
			$_l_TableRow:=Find in array:C230(SM_al_SetContextIDs; $_l_TableContext)
			$_l_Repeats:=$_l_Repeats+1
			If ($_l_TableRow>0) | ($_l_Repeats>1000)
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit)
		If ($_l_TableRow>0)
			$0:=$_l_TableContext
		Else 
			$0:=0
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SM_ContextIDfromTable"; $_t_oldMethodName)
