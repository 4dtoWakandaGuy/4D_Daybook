If (False:C215)
	//object Name: [USER]User_In.oSREmailPrintOption3Email
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:16
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oSREmailPrintOption3Email"; Form event code:C388)

Reports_PrefsOpt3EmailObjHand  //Added 23/02/09 v631b120o -kmw
ERR_MethodTrackerReturn("OBJ [USER].User_In.oSREmailPrintOption3Email"; $_t_oldMethodName)