//%attributes = {}
If (False:C215)
	//Project Method Name:      Postcodes_Def
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
	C_LONGINT:C283(<>PCN)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Postcodes_Def")
ALL RECORDS:C47([POSTAL_CODES:50])

//NG Modified the ◊PCN value so default(which was 1) is now  0
If (Num:C11([POSTAL_CODES:50]Postal_Code_From:1)>0)
	<>PCN:=0
Else 
	<>PCN:=1
End if 
UNLOAD RECORD:C212([POSTAL_CODES:50])
ERR_MethodTrackerReturn("Postcodes_Def"; $_t_oldMethodName)