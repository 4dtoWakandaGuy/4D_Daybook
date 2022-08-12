//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_ModDisp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2010 17:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_AutoOut; SYS_bo_StatsView)
	C_LONGINT:C283(vNo)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $1; $2; $3; $6; $7; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ModDisp")
//NG this does not appear to be called

$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If (Execute_File($2))  //NG modified June 2004
	While ($5->=1)
		IDLE:C311  // 03/04/03 pb
		Execute_Sel($6)
		If ($5->=1)
			If ((Records in selection:C76($4->)>0) | ((vAutoFind) & (<>DB_bo_AutoOut)))
				If (Records in selection:C76($4->)=0)
					Gen_Alert("No "+$7+" Found."; "Cancel")
				Else 
					CREATE SET:C116($4->; $3)
					CREATE EMPTY SET:C140($4->; "Userset")
					vNo:=Records in selection:C76($4->)
					
					If (SYS_bo_StatsView)
						Open_Pro_Window($1)
						StatsView_Disp($3; $4; $7)
					Else 
						Open_Pro_Window($1; 0; 1; $4; WIN_t_CurrentOutputform)
						FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252($4))
						WIn_SetFormSize(1; $4; WIN_t_CurrentOutputform)
						DISPLAY SELECTION:C59($4->; *)
					End if 
					Close_ProWin
				End if 
				$5->:=0
			Else 
				Gen_None($7; $5)
			End if 
		End if 
	End while 
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Gen_ModDisp"; $_t_oldMethodName)