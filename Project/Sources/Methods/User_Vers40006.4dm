//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers40006
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
	ARRAY TEXT:C222($_at_Codes; 0)
	C_LONGINT:C283($_l_CountRecords; $_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Vers40006")
If (Records in table:C83([INFORMATION:55])>0)
	MESSAGE:C88(Char:C90(13)+"      Allocating Codes to Qualities")
	READ WRITE:C146([INFORMATION:55])
	ALL RECORDS:C47([INFORMATION:55])
	$_l_CountRecords:=Records in selection:C76([INFORMATION:55])
	ARRAY TEXT:C222($_at_Codes; $_l_CountRecords)
	For ($_l_Index; 1; $_l_CountRecords)
		$_at_Codes{$_l_Index}:="S"+String:C10($_l_Index)
	End for 
	ARRAY TO SELECTION:C261($_at_Codes; [INFORMATION:55]Information_Code:9)
	READ ONLY:C145([INFORMATION:55])
	UNLOAD RECORD:C212([INFORMATION:55])
End if 
ERR_MethodTrackerReturn("User_Vers40006"; $_t_oldMethodName)