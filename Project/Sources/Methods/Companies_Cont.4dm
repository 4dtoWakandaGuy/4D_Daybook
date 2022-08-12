//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_Cont
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/05/2010 10:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vC)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_Cont")
//Companies_Cont
$_t_CurrentOutputform:=WIN_t_CurrentOutputform

Start_Process
Companies_File
READ ONLY:C145([COMPANIES:2])
READ ONLY:C145([CONTACTS:1])
While (vC=1)
	IDLE:C311  // 03/04/03 pb
	Comp_Sel
	If (vC=1)
		If (Records in selection:C76([COMPANIES:2])>0)
			CREATE SET:C116([COMPANIES:2]; "CMaster")
			While (vC=1)
				//IDLE  ` 03/04/03 pb
				//DB_t_CurrentFormUsage:="Print"
				//vNo:=Records in selection([COMPANIES])
				//vNo2:=vNo
				//ORDER BY([COMPANIES];[COMPANIES]Company Code;>)
				//Open_Pro_Window ("Address Book")
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				//WIn_SetFormSize (1;->[COMPANIES];WIN_t_CurrentOutputform)
				//DISPLAY SELECTION([COMPANIES];*)
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[COMPANIES:2])))
				
				If (OK=1)
					CO_AddressBook
				End if 
				//Close_ProWin
				vC:=0
			End while 
		Else 
			Gen_None("Companies"; ->vC)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Companies_Cont"; $_t_oldMethodName)