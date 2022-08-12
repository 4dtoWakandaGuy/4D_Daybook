//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_SV
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

$_t_oldMethodName:=ERR_MethodTracker("Products_SV")
//Products_SV
vFilePtr:=->[PRODUCTS:9]
SYS_bo_StatsView:=True:C214
vSVCF:="Products_SVCF"
StatsView_ArFiS("Products/9/Prod_Sel/Diary/12/Diary_Sel/"+"Order Items/25/OrderI_Sel/Stock Items/27/Stock_Sel/"+"Current Stock/62/StockCurr_Sel/Stock Levels/58/StockLev_Sel/")
StatsView_ArF1S("3.10/4.8/8/14/15/17/19/")
ERR_MethodTrackerReturn("Products_SV"; $_t_oldMethodName)