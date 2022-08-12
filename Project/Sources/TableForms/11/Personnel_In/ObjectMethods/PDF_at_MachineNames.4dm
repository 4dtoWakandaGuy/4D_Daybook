If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.PDF_at_MachineNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PDF_at_MachineNames;0)
	C_BOOLEAN:C305($_bo_isWIndows)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.PDF_at_MachineNames"; Form event code:C388)

Case of 
	: ((Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4))
		$_bo_isWIndows:=(Is macOS:C1572=False:C215)
		Case of 
			: (PDF_at_MachineNames{PDF_at_MachineNames}="Default MacOs") & ($_bo_isWIndows)
				Gen_Alert("You cannot edit the default Mac Path on  a PC")
			: (PDF_at_MachineNames{PDF_at_MachineNames}="Default Windows") & (Not:C34($_bo_isWIndows))
				
				Gen_Alert("You cannot edit the default PC Path on  a Mac")
			Else 
				Personnel_currPrefsToArray
				Personnel_setInterface
		End case 
	Else 
End case 

ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.PDF_at_MachineNames"; $_t_oldMethodName)
