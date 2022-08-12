//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_SelFOI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_SelFOI")
$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
OK:=1
If ($_l_RecordsinSelection>10000)
	Gen_Confirm("There are "+String:C10($_l_RecordsinSelection)+" records to link, which may take some time.  Proceed?"; "Yes"; "No")
End if 
If (OK=1)
	CREATE EMPTY SET:C140([CONTACTS:1]; "Master")
	FIRST RECORD:C50([ORDER_ITEMS:25])
	While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
		RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
		RELATE ONE:C42([ORDERS:24]Contact_Code:2)
		ADD TO SET:C119([CONTACTS:1]; "Master")
		NEXT RECORD:C51([ORDER_ITEMS:25])
	End while 
	INTERSECTION:C121("Master"; "OMaster"; "Master")
	USE SET:C118("Master")
Else 
	USE SET:C118("OMaster")
	CREATE SET:C116([CONTACTS:1]; "Master")
End if 
ERR_MethodTrackerReturn("Cont_SelFOI"; $_t_oldMethodName)