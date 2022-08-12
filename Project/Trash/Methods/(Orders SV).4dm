//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders SV
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
	C_BOOLEAN:C305(SYS_bo_StatsView)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders SV")
vFilePtr:=->[ORDERS:24]
SYS_bo_StatsView:=True:C214
vSVCF:="Orders_SVCF"
StatsView_ArFiS("Orders/24/Orders_Sel/Order Items/25/OrderI_Sel/Diary/12/Diary_Sel/")
StatsView_ArF1S("1.2/2.1.2,5/5.11/15.90.4,2/17.11/18.5/32.71/33.36/35.3/42.33/43.65/47.76/48.41/")
ERR_MethodTrackerReturn("Orders SV"; $_t_oldMethodName)