If (False:C215)
	//Table Form Method Name: [COMPANIES]Companies_Pros
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
	C_REAL:C285($dum)
	C_TEXT:C284($_t_oldMethodName; vContName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Companies_Pros"; Form event code:C388)
//Comp Prospects

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		
		CompCont_Srch
		vContName:=[CONTACTS:1]Contact_Name:31
	: (Form event code:C388=On Printing Break:K2:19)
		
		
		$Dum:=Subtotal:C97([COMPANIES:2]Size:15; 1)
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].Companies_Pros"; $_t_oldMethodName)
