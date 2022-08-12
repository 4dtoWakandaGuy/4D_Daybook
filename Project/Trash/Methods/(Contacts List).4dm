//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Contacts List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vO)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts List")

// see CONT_ContactsReport
$_t_oldMethodName:=ERR_MethodTracker("Contacts List")
//Contacts List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Contacts_File
READ ONLY:C145([COMPANIES:2])
READ ONLY:C145([CONTACTS:1])
While (vO=1)
	Cont_Sel
	If (vO=1)
		If (Records in selection:C76([CONTACTS:1])>0)
			//vNo:=Records in selection([CONTACTS])
			//DB_t_CurrentFormUsage:="Print"
			//CREATE SET([CONTACTS];"OMaster")
			//Open_Pro_Window ("List Contacts")
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[CONTACTS];WIN_t_CurrentOutputform)
			//DISPLAY SELECTION([CONTACTS];*)
			DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[CONTACTS:1]))))
			
			If (OK=1)
				CONT_ContactsReport(False:C215)
				
				
			End if 
			//Close_ProWin
			vO:=0
		Else 
			Gen_None("Contacts"; ->vO)
		End if 
	End if 
End while 
DB_t_CurrentFormUsage:=""
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Contacts List"; $_t_oldMethodName)