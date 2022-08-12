If (False:C215)
	//object Name: [USER]BK_DataModel.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(BK_al_CustDataModelID;0)
	//ARRAY TEXT(BK_at_CustDataModelName;0)
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_LONGINT:C283($_l_event; BK_l_CustDataModelID)
	C_TEXT:C284($_t_oldMethodName; BK_t_CustDataModelName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Variable9"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (BK_at_CustDataModelName>0)
			BK_t_CustDataModelName:=BK_at_CustDataModelName{BK_at_CustDataModelName}
			BK_l_CustDataModelID:=BK_al_CustDataModelID{BK_at_CustDataModelName}
		End if 
		DM_Bo_BKedit:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_DataModel.Variable9"; $_t_oldMethodName)
