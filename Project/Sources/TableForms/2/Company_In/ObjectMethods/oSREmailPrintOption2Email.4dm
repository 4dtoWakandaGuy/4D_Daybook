If (False:C215)
	//object Name: [COMPANIES]Company_In.SR_EmailPrintOption2Email
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.SR_EmailPrintOption2Email"; Form event code:C388)



Reports_PrefsOpt2EmailObjHand  //Added 23/02/09 v631b120o -kmw

//
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.SR_EmailPrintOption2Email"; $_t_oldMethodName)