If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICES]Purchases_List
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
	C_REAL:C285(v0; v31)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].Purchases_List"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
		If ([PURCHASE_INVOICES:37]State:24<-1)
			v31:=[PURCHASE_INVOICES:37]Total_Paid:8
			v0:=0
		Else 
			v0:=[PURCHASE_INVOICES:37]Total_Paid:8
			v31:=0
		End if 
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICES].Purchases_List"; $_t_oldMethodName)
