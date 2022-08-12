If (False:C215)
	//object Name: [USER]Aged_Debtors.oasAtOptionsUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 08:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; Vdate; VdateFBASE)
	C_LONGINT:C283($_l_event; PRD_l_UpDown; VDateFupDown; VeDateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Aged_Debtors.oasAtOptionsUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (PRD_l_UpDown>0)
			Prod_SupUp
		Else 
			Prod_SupDown
		End if 
		
		PRD_l_UpDown:=0
End case 
ERR_MethodTrackerReturn("OBJ [USER].Aged_Debtors.oasAtOptionsUpDown"; $_t_oldMethodName)
