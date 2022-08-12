
If (False:C215)
	//Object Name:      [DIARY].ActionCompanion
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_SIze; $_l_width; SD2_l_Callingprocess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY]ActionCompanion"; Form event code:C388)
Case of 
	: (Form event code:C388=On Load:K2:1)
		SET TIMER:C645(1*30)
		$_l_SIze:=500
		$_l_width:=440
		SET WINDOW RECT:C444((Screen width:C187-10)-$_l_width; (Screen height:C188-10)-($_l_SIze+50); (Screen width:C187-10); (Screen height:C188-10))
		
	: (Form event code:C388=On Timer:K2:25)
		If (Process state:C330(SD2_l_Callingprocess)=Aborted:K13:1)
			CANCEL:C270
		End if 
End case 
ERR_MethodTrackerReturn("FM [DIARY]ActionCompanion"; $_t_oldMethodName)
