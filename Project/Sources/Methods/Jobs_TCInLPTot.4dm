//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_TCInLPTot
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_TCInLPTot")
[ORDERS:24]Total_Margin:12:=Round:C94((Sum:C1([DIARY:12]Units:20)); 2)
[ORDERS:24]Total_Margin_PC:13:=Round:C94((Sum:C1([DIARY:12]Value:16)); 2)
[ORDERS:24]Total_Cost:11:=Round:C94((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2)
[ORDERS:24]Total_Amount:6:=Round:C94((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2)
ERR_MethodTrackerReturn("Jobs_TCInLPTot"; $_t_oldMethodName)