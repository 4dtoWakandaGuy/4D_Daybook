//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_ShowDetails
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($3; $4)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $1; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_ShowDetails")
If (Count parameters:C259>=2)
	Case of 
		: (Count parameters:C259=2)
			CCM_FindPSPActivity($1; $2)
		: (Count parameters:C259=3)
			CCM_FindPSPActivity($1; $2; $3)
		: (Count parameters:C259=4)
			CCM_FindPSPActivity($1; $2; $3; $4)
		: (Count parameters:C259=5)
			CCM_FindPSPActivity($1; $2; $3; $4; $5)
			
	End case 
	
	If (Records in selection:C76([CCM_PSPTransaction:136])>0) | (True:C214)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; 8; "PSP Activity"; "Cw_Close")
		DIALOG:C40([USER:15]; "CCM_Activity")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	Else 
		Gen_Alert("No Transactions have been found")
		
	End if 
	
End if 
ERR_MethodTrackerReturn("CCM_ShowDetails"; $_t_oldMethodName)