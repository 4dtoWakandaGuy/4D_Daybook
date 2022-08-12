If (False:C215)
	//object Name: [USER]SD2_EmailEntry.oEmailText
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_EmailEntry.oEmailText"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Getting Focus:K2:7)
		
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_EmailEntry.oEmailText"; $_t_oldMethodName)
