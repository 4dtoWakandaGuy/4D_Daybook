//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ListSR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/10/2012 18:59:58If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($11)
	C_LONGINT:C283($_l_OK; vNo)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName; $1; $10; $12; $2; $3; $6; $7; $8; $9; $_t_CurrentOutputform)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ListSR")
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If (Execute_File($2))  //Modified NG June 2004
	READ ONLY:C145($4->)
	While ($5->=1)
		IDLE:C311  // 03/04/03 pb
		If (Count parameters:C259>=12)
			Execute_Sel($6; $12; $11)
		Else 
			Execute_Sel($6)
		End if 
		If ($5->=1)
			If (Records in selection:C76($4->)>0)
				CREATE SET:C116($4->; $3)
				vNo:=Records in selection:C76($4->)
				DB_t_CurrentFormUsage:="Print"
				WIN_t_CurrentOutputform:=$8
				Open_Pro_Window($1; 0; 1; $4; WIN_t_CurrentOutputform)
				FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252($4))
				
				WIn_SetFormSize(1; $4; WIN_t_CurrentOutputform)
				DISPLAY SELECTION:C59($4->; *)  //NG may 2004 added $4 to this line
				If (OK=1)
					If (Not:C34(SR_ReportOK($10)))
						FORM SET OUTPUT:C54($4->; $8)  //NG may 2004 added $4 to this line
						DB_t_CurrentFormUsage:=$9
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; $8)
						If ($_l_OK>=0)
							PRINT SELECTION:C60($4->)  //NG may 2004 added $4 to this line
							PRT_SetPrinterPaperOptions($8)
						End if 
					End if 
				End if 
				Close_ProWin
				$5->:=0
			Else 
				Gen_None($7; $5)
			End if 
		End if 
	End while 
	DB_t_CurrentFormUsage:=""
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Gen_ListSR"; $_t_oldMethodName)