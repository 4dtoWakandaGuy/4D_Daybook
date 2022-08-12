//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices OutDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 23:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices OutDel")
If (Records in set:C195("Userset")>0)
	CREATE SET:C116([INVOICES:39]; "IMaster")
	USE SET:C118("Userset")
	QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7=0; *)
	QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=0; *)  //not posted
	QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=-1)  //pro forma
	If (Records in set:C195("Userset")#Records in selection:C76([INVOICES:39]))
		Gen_Alert("Please select only Sales Ledger records with a Total Due of zero, or are not post"+"ed"; "Cancel")
		USE SET:C118("IMaster")
		vNo:=Records in selection:C76([INVOICES:39])
		
	Else 
		Are_You_SureM(" that you want to Delete these Sales Ledger record(s) permanently")
		If (OK=1)
			DELETE SELECTION:C66([INVOICES:39])
			USE SET:C118("IMaster")
			Gen_OutNoF(->[INVOICES:39])
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Invoices OutDel"; $_t_oldMethodName)