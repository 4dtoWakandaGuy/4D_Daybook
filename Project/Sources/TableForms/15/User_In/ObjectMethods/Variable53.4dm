If (False:C215)
	//object Name: [USER]User_In.Variable53
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
	C_BOOLEAN:C305($_bo_Digits)
	C_TEXT:C284($_t_oldMethodName; sms_from)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable53"; Form event code:C388)
If (Length:C16(sms_from)>8)
	$_bo_Digits:=isalldigits(sms_from)
	Case of 
		: ($_bo_Digits=False:C215) & (Length:C16(sms_from)>8)
			//      ALERT("The Sender address is limited to 8 characters.")
			Gen_Alert("The Sender address is limited to 8 characters.")
			sms_from:=Substring:C12(sms_From; 1; 8)
	End case 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable53"; $_t_oldMethodName)
