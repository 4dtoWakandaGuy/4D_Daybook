//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ModMidAP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 10:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAdd; MOD_l_CurrentModuleAccess)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $1; $3; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ModMidAP")
If (Records in selection:C76($2->)=0)
	If ((MOD_l_CurrentModuleAccess<2) | (MOD_l_CurrentModuleAccess=3) | (DB_t_CurrentFormUsage="NoPlus") | (Read only state:C362($2->)))
		Gen_Alert("No "+$3+" found"; "Cancel")
	Else 
		Gen_Confirm("No "+$3+" found.  Do you want to create one?"; "Try again"; "Create it")
		If (OK=0)
			WIn_SetFormSize(2; $2; WIN_t_CurrentInputForm)
			SET WINDOW TITLE:C213("Enter "+$3)
			vAdd:=1
			ADD RECORD:C56($2->; *)
			
			ADD TO SET:C119($2->; $1)
		End if 
	End if 
Else 
	Gen_Mod2($1; $2; $3)
End if 
ERR_MethodTrackerReturn("Gen_ModMidAP"; $_t_oldMethodName)