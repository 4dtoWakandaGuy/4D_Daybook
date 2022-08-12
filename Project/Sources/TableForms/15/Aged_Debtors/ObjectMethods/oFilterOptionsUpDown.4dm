If (False:C215)
	//object Name: [USER]Aged_Debtors.oFilterOptionsUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 09:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; Acc_D_CutOffDate; VcdateFBASE)
	C_LONGINT:C283($_l_event; VcDateFupDown; VeDateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Aged_Debtors.oFilterOptionsUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (Acc_D_CutOffDate=!00-00-00!)
			Acc_D_CutOffDate:=<>DB_d_CurrentDate
		End if 
		If (VcdateFBASE=!00-00-00!)
			VcdateFBASE:=Acc_D_CutOffDate
		End if 
		Acc_D_CutOffDate:=VcdateFBASE+VcDateFupDown
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].Aged_Debtors.oFilterOptionsUpDown"; $_t_oldMethodName)
