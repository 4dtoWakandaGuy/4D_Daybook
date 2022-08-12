//%attributes = {}
If (False:C215)
	//Project Method Name:      Mailsort_CoUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 04:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_SSCOK)
	C_LONGINT:C283($_l_ApplicationType; $_l_CountUsers; vC)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mailsort_CoUp")
//Mailsort_CoUp
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
$_l_ApplicationType:=Application type:C494
If (Application type:C494=4D Remote mode:K5:5)
	
	$_l_CountUsers:=Count users:C342-1
Else 
	$_l_CountUsers:=Count users:C342
End if 
If ($_l_CountUsers=1)
	Gen_Confirm("This function checks and updates the Mailsort Standard Selection Codes"+" of each selected Company"; "Proceed"; "Cancel")
	If (OK=1)
		Start_Process
		Companies_File
		While (vC=1)
			Comp_Sel
			If (vC=1)
				If (Records in selection:C76([COMPANIES:2])>0)
					//vNo:=Records in selection([COMPANIES])
					//CREATE SET([COMPANIES];"CMaster")
					//DB_t_CurrentFormUsage:="Print"
					//Open_Pro_Window ("Update Comp SSCs";0;1;->[COMPANIES];WIN_t_CurrentOutputform)
					
					//FS_SetFormSort (WIN_t_CurrentOutputform)
					//WIn_SetFormSize (1;->[COMPANIES];WIN_t_CurrentOutputform)
					//zISPLAY SELECTION([COMPANIES];*)  `NG May 2004 added table
					
					DBI_MenuSelectRecords(Table name:C256(Table:C252(->[COMPANIES:2])))
					If (OK=1)
						Gen_Confirm("Update "+String:C10(Records in selection:C76)+" Companies?"; "Yes"; "No")
						If (OK=1)
							
							FIRST RECORD:C50([COMPANIES:2])
							While (Not:C34(End selection:C36([COMPANIES:2])))
								$_bo_SSCOK:=Check_Postcode([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Mailsort_OFN:50)
								$_bo_SSCOK:=Check_SSC([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Town_or_City:5; ->[COMPANIES:2]Mailsort_SSC:49)
								DB_SaveRecord(->[COMPANIES:2])
								AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
								NEXT RECORD:C51([COMPANIES:2])
							End while 
							
						End if 
					End if 
					//Close_ProWin
					vC:=0
				Else 
					Gen_None("Companies"; ->vC)
				End if 
			End if 
		End while 
	End if 
Else 
	Gen_Alert("This only be used when you are the sole Daybook user"; "Cancel")
End if 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Mailsort_CoUp"; $_t_oldMethodName)
