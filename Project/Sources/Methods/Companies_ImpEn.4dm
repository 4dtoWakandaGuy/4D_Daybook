//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_ImpEn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  24/11/2010 11:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_ImpEn")
//Companies_ImpEnd
SET CHANNEL:C77(11)

Companies_File
If (Records in set:C195("CMaster")>0)
	Gen_Confirm("View the Companies Created?"; "Yes"; "No")
	If (OK=1)
		USE SET:C118("CMaster")
		COPY NAMED SELECTION:C331([COMPANIES:2]; "CurrentSelection")
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[COMPANIES:2]))); <>MENU_l_BarModule; "CurrentSelection")
		
	End if 
End if 

If (Records in set:C195("Master")>0)
	Gen_Confirm("View the Companies_Modified?"; "Yes"; "No")
	If (OK=1)
		USE SET:C118("Master")
		COPY NAMED SELECTION:C331([COMPANIES:2]; "CurrentSelection")
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[COMPANIES:2]))); <>MENU_l_BarModule; "CurrentSelection")
		
	End if 
End if 
ERR_MethodTrackerReturn("Companies_ImpEn"; $_t_oldMethodName)