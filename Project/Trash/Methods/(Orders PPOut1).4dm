//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPOut1
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
	C_BOOLEAN:C305($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPOut1")
OK:=1
COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "Items")
If (Records in set:C195("Userset")>0)
	USE SET:C118("Userset")
Else 
	If (Records in selection:C76([ORDER_ITEMS:25])>20)
		Gen_Confirm("Are you sure you want to print "+String:C10(Records in selection:C76([ORDER_ITEMS:25]))+" Items?"; "Yes"; "No")
	End if 
End if 
If (OK=1)
	MESSAGES OFF:C175
	FIRST RECORD:C50([ORDER_ITEMS:25])
	RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
	//  If ($1)
	//   Orders_PPConf
	//  End if
End if 
$0:=(OK=1)
ERR_MethodTrackerReturn("Orders PPOut1"; $_t_oldMethodName)