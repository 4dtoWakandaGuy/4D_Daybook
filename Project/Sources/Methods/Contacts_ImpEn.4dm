//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_ImpEn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2010 11:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule)
	C_TEXT:C284($_t_CurrentInputForm; $_t_CurrentOutputform; $_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_ImpEn")
//Contacts_ImpEnd
$_t_CurrentInputForm:=WIN_t_CurrentInputForm
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Contacts_File
If (Records in set:C195("OMaster")>0)
	Gen_Confirm("View the Contacts Created?"; "Yes"; "No")
	If (OK=1)
		USE SET:C118("OMaster")
		COPY NAMED SELECTION:C331([CONTACTS:1]; "CurrentSelection")
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[COMPANIES:2]))); <>MENU_l_BarModule; "CurrentSelection")
		
	End if 
End if 

If (Records in set:C195("Extra2")>0)
	Gen_Confirm("View the Contacts_Modified?"; "Yes"; "No")
	If (OK=1)
		USE SET:C118("Extra2")
		COPY NAMED SELECTION:C331([CONTACTS:1]; "CurrentSelection")
		DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[COMPANIES:2]))); <>MENU_l_BarModule; "CurrentSelection")
		
	End if 
End if 
WIN_t_CurrentInputForm:=$_t_CurrentInputForm
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Contacts_ImpEn"; $_t_oldMethodName)