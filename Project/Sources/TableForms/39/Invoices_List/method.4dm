If (False:C215)
	//Table Form Method Name: [INVOICES]Invoices_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(v0; v31)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].Invoices_List"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Display Detail:K2:22)
		
		RELATE ONE:C42([INVOICES:39]Contact_Code:3)
		RELATE ONE:C42([INVOICES:39]Company_Code:2)
		Contact_Details
		If ([INVOICES:39]State:10<-1)
			v31:=[INVOICES:39]Total_Paid:6
			v0:=0
		Else 
			v0:=[INVOICES:39]Total_Paid:6
			v31:=0
		End if 
End case 
ERR_MethodTrackerReturn("FM [INVOICES].Invoices_List"; $_t_oldMethodName)
