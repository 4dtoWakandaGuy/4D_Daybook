//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_TableFromContextID
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
	C_LONGINT:C283($_l_TableContext; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_TableFromContextID")
//This method will extract a  table number from a context ID
//the context IDs are >10000
//we take the 10,000 off and then subtract 1000 until the number is
//less than 1000
$0:=0
If (Count parameters:C259>=1)
	If ($1>10000)
		$_l_TableContext:=$1-10000
		Repeat 
			If ($_l_TableContext>1000)
				$_l_TableContext:=$_l_TableContext-1000
			End if 
		Until ($_l_TableContext<1000)
		$0:=$_l_TableContext
	End if 
End if 
ERR_MethodTrackerReturn("SM_TableFromContextID"; $_t_oldMethodName)
