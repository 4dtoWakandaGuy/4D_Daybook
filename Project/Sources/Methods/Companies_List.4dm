//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/05/2010 06:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vC)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_List")
//Companies_List
Start_Process
Companies_File
READ ONLY:C145([COMPANIES:2])

READ ONLY:C145([CONTACTS:1])
READ ONLY:C145([DIARY:12])
While (vC=1)
	IDLE:C311  // 03/04/03 pb
	Comp_Sel
	If (vC=1)
		If (Records in selection:C76([COMPANIES:2])>0)
			//vNo:=Records in selection([COMPANIES])
			//CREATE SET([COMPANIES];"CMaster")
			//DB_t_CurrentFormUsage:="Print"
			//Open_Pro_Window ("List Companies")
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[COMPANIES];WIN_t_CurrentOutputform)
			//DISPLAY SELECTION([COMPANIES];*)
			DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[COMPANIES:2]))))
			
			
			If (OK=1)
				CO_PrintCoList(False:C215)
			End if 
			//Close_ProWin
			vC:=0
		Else 
			Gen_None("Companies"; ->vC)
		End if 
	End if 
End while 
Process_End
ERR_MethodTrackerReturn("Companies_List"; $_t_oldMethodName)