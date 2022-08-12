//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPFull
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
	C_BOOLEAN:C305($_bo_LBActive; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPFull")
Menu_Record("Orders PPFull"; "Full Order Details")
//if this is called from a macro we dont want arealist redraws happening
If (Count parameters:C259<1)
	$_bo_LBActive:=False:C215
Else 
	$_bo_LBActive:=$1
End if 
Orders_InLPA(False:C215)
Orders_PPGen(->[ORDERS:24]; "Detailed Form"; "Orders Out"; ""; "ORDER FULL"; "Orders_PPFullL2"; 9; ->[ORDERS:24]State:15; ""; ""; $_bo_LBActive)
ERR_MethodTrackerReturn("Orders PPFull"; $_t_oldMethodName)
