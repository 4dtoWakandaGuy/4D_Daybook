If (False:C215)
	//object Method Name: Object Name:      TestObjectAlignment.oTesterbutton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2013 08:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(avariable)
	//C_UNKNOWN(MtypeMax)
	C_LONGINT:C283($_l_MaxTest; $_l_Nul; $_l_Test; TST_l_NextTest; $_l_Event; $_l_MaxTest; $_l_Nul; $_l_Test; TST_l_NextTest)
	C_REAL:C285(MtypeMax; MType)
	C_TEXT:C284(avariable; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ TestObjectAlignment.oTesterbutton"; Form event code:C388)
$_l_MaxTest:=28

MtypeMax:=32
$_l_Nul:=0
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Clicked:K2:4)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		If (TST_l_NextTest/2=Int:C8(TST_l_NextTest/2))
			$_l_Test:=TST_l_NextTest/2
			Gen_SetobjectPositionRelativity(->$_l_Nul; ->avariable; "olabel"; "ovariable"; $_l_Test; MType; 10)
			//its an even number
		Else 
			//an odd number
			$_l_Test:=Int:C8(TST_l_NextTest/2)+1
			Gen_SetobjectPositionRelativity(->$_l_Nul; ->avariable; "olabel"; ""; $_l_Test; MType; 10)
		End if 
		
		TST_l_NextTest:=TST_l_NextTest+1
		If (TST_l_NextTest>=$_l_MaxTest)
			TST_l_NextTest:=1
			MType:=MType+1
			If (Mtype>MtypeMax)
				Mtype:=1
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ TestObjectAlignment.oTesterbutton"; $_t_oldMethodName)
