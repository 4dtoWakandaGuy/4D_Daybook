//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI OutDel
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
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI OutDel")
If ((DB_t_CurrentFormUsage="Select") | (DB_t_CurrentFormUsage="Print"))
	CANCEL:C270
Else 
	If (Records in set:C195("Userset")>0)
		OrderI_OutDel2
		USE SET:C118("Master")
		Gen_OutNoF(->[ORDER_ITEMS:25])
	End if 
End if 
ERR_MethodTrackerReturn("OrderI OutDel"; $_t_oldMethodName)