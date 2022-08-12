//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_SplitSrc
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SplitSrc")
$0:=(([ORDER_ITEMS:25]Quantity:3>[ORDER_ITEMS:25]Allocated:28) & ([ORDER_ITEMS:25]Allocated:28>0))
ERR_MethodTrackerReturn("OrderI_SplitSrc"; $_t_oldMethodName)