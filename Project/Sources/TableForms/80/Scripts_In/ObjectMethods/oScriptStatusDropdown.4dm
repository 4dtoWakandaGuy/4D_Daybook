If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.Variable1
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
	//ARRAY LONGINT(SMC_al_ScriptStatus;0)
	//ARRAY TEXT(SMC_at_ScriptStatus;0)
	C_LONGINT:C283($_l_event; $_l_offset; SMC_l_OwnerID)
	C_TEXT:C284($_t_oldMethodName; SMC_t_OwnerINIT)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.Variable1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SMC_at_ScriptStatus>0)
			[SCRIPTS:80]Script_status:13:=SMC_al_ScriptStatus{SMC_at_ScriptStatus}
		End if 
		If (SMC_at_ScriptStatus{SMC_at_ScriptStatus}="ACTIVE Locked")
			$_l_offset:=0
			BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_l_OwnerID; $_l_offset)
			If (SMC_l_OwnerID>0)
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SMC_l_OwnerID)
				SMC_t_OwnerINIT:=[PERSONNEL:11]Name:2
				Gen_Alert("After saving only "+SMC_t_OwnerINIT+" will be able to modify the macro")
			Else 
				Gen_Alert("After saving only you"+" will be able to  modify the macro")
			End if 
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.Variable1"; $_t_oldMethodName)
