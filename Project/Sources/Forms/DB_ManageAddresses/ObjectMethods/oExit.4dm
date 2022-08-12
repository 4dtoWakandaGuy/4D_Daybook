
If (False:C215)
	//Object Name:      DB_ManageAddresses.oDelete
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  20/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CON_at_CoCodes;0)
	C_LONGINT:C283($_l_Column; $_l_Row)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		CANCEL:C270
End case 
