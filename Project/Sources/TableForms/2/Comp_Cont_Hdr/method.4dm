If (False:C215)
	//Table Form Method Name: [COMPANIES]Comp_Cont_Hdr
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Comp_Cont_Hdr"; Form event code:C388)
ERR_MethodTrackerReturn("FM [COMPANIES].Comp_Cont_Hdr"; $_t_oldMethodName)