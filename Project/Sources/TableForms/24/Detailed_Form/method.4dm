If (False:C215)
	//Table Form Method Name: [ORDERS]Detailed_Form
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].Detailed_Form"; Form event code:C388)
TRACE:C157
Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		Orders_PPFullL2
End case 
ERR_MethodTrackerReturn("FM [ORDERS].Detailed_Form"; $_t_oldMethodName)
