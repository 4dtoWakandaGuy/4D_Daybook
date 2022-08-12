If (False:C215)
	//object Name: [USER]User_In.Field198
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
	C_LONGINT:C283(<>SMS_Activate; $_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Field198"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If ([USER:15]SMS_Active:241=True:C214)
			<>SMS_Activate:=1  //SMS messaging is active
		Else 
			<>SMS_Activate:=0  //SMS messaging is inactive
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Field198"; $_t_oldMethodName)
