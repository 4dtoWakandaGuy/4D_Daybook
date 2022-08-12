//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User_inLPMoR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vCompany)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_inLPMoR")
Case of 
	: ([USER:15]Main or Remote:115="M")
		vCompany:="Main System"
	: ([USER:15]Main or Remote:115="R")
		vCompany:="Remote User"
	Else 
		vCompany:=""
End case 
ERR_MethodTrackerReturn("User_inLPMoR"; $_t_oldMethodName)