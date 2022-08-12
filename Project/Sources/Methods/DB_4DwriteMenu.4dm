//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_4DwriteMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_4DwriteMenu")
Case of 
		
	: ($2=103) | ($2=104)  //save or Save as
		//save the area back to the picture field?
		
		//save the record
		DB_SaveRecord(->[DOCUMENTS:7])
		
	Else 
		
		WR EXECUTE COMMAND:P12000:113($1; $2)
End case 
ERR_MethodTrackerReturn("DB_4DwriteMenu"; $_t_oldMethodName)