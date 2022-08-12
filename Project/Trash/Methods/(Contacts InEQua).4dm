//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts_InEQua
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
	C_LONGINT:C283(u1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InEQua")
If (u1=1)
	If ([CONTACTS:1]Contact_Code:2="")
		REDUCE SELECTION:C351([INFORMATION:55]; 0)
	Else 
		QUERY:C277([INFORMATION:55]; [INFORMATION:55]Contact_Code:1=[CONTACTS:1]Contact_Code:2)
	End if 
Else 
	If ([CONTACTS:1]Company_Code:1="")
		REDUCE SELECTION:C351([INFORMATION:55]; 0)
	Else 
		QUERY:C277([INFORMATION:55]; [INFORMATION:55]Company_Code:7=[CONTACTS:1]Company_Code:1)
	End if 
End if 
ERR_MethodTrackerReturn("Contacts_InEQua"; $_t_oldMethodName)