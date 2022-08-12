If (False:C215)
	//object Name: [DOCUMENTS]Report_in.SR_EmailPrintOption8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Report_in.SR_EmailPrintOption8"; Form event code:C388)

//Added 13/11/08 v631b120g -kmw

Reports_PrefsOpt1ObjHandler
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].Report_in.SR_EmailPrintOption8"; $_t_oldMethodName)
