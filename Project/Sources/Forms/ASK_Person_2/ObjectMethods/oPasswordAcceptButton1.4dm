If (False:C215)
	//object Method Name: Object Name:      ASK_Person_2.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 12:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ASK_Person_2.Variable7")

$_t_oldMethodName:=ERR_MethodTracker("OBJ ASK_Person_2.Variable7"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		<>PER_t_CurrentUserInitials:=GEN_at_RecordCode{GEN_at_Name}
		If ((GEN_at_Name<=Size of array:C274(GEN_at_Name)) & (GEN_at_Name>0))
			If (GEN_at_Identity{GEN_at_Name}#"^G@")
				Ask_PersonOK
			Else 
				Ask_PersonSel
			End if 
		End if 
		BRING TO FRONT:C326(Current process:C322)  //bsw 22/07/04
End case 
ERR_MethodTrackerReturn("OBJ ASK_Person_2.Variable7"; $_t_oldMethodName)
