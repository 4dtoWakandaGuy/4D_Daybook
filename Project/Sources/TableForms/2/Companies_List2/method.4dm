If (False:C215)
	//Table Form Method Name: [COMPANIES]Companies_List2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_TEXT:C284($_t_oldMethodName; vContName; vExtn)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Companies_List2"; Form event code:C388)
//Companies_List2

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		CompCont_Srch
		vContName:=[CONTACTS:1]Contact_Name:31
		vExtn:=[CONTACTS:1]Extn:9
		Comp_ListDry
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].Companies_List2"; $_t_oldMethodName)
