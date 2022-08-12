If (False:C215)
	//object Name: [SCRIPTS]dMacros_Sel.oVsDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/07/2012 08:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_vSdateToSet)
	C_DATE:C307(vSdateF; vSdateFBASE; vSdateT)
	C_LONGINT:C283($_l_event; $_l_offset; VeDateFupDown; vSdateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].dMacros_Sel.oVsDateFUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vSdateF=!00-00-00!)
			vSdateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
		End if 
		If (vSdateFBASE=!00-00-00!)
			vSdateFBASE:=vSdateF
		End if 
		vSdateF:=vSdateFBASE+vSdateFupDown
		If (vSdateF>!00-00-00!)
			If (SRCH_bo_vSdateToSet=False:C215)
				//vSdateT:=vSdateF
			End if 
			If (vSdateF>vSdateT) & (vSdateT>!00-00-00!)
				vSdateT:=vSdateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [SCRIPTS].dMacros_Sel.oVsDateFUpDown"; $_t_oldMethodName)
