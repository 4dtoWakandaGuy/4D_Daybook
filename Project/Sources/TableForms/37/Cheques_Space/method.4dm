If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICES]Cheques_Space
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
	C_TEXT:C284($_t_oldMethodName; vDesc)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].Cheques_Space"; Form event code:C388)
vDesc:=""
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICES].Cheques_Space"; $_t_oldMethodName)