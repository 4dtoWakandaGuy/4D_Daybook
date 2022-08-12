//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ModAster
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_AutoOut)
	C_LONGINT:C283(vNo)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $6; $7; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ModAster")
//Gen_Mod - Asterisk for always list
Start_Process
If (Execute_File($2))  //NG modified June 2004
	While ($5->=1)
		IDLE:C311  // 03/04/03 pb
		Execute_Sel($6)
		If ($5->=1)
			If ((Records in selection:C76($4->)>0) | ((vAutoFind) & (<>DB_bo_AutoOut)))
				CREATE SET:C116($4->; $3)
				CREATE EMPTY SET:C140($4->; "Userset")
				vNo:=Records in selection:C76($4->)
				
				If ((vAutoFind) & (<>DB_bo_AutoOut))
					Open_Pro_Window($1; 0; 1; $4; $7)  //NG May 2004 added form reference
					Gen_ModMidAP($3; $4; $7)
				Else 
					Open_Pro_Window($1; 0; 1; $4; WIN_t_CurrentOutputform)
					Gen_Mod2($3; $4; $7)
				End if 
				Close_ProWin
				$5->:=0
			Else 
				Gen_None($7; $5)
			End if 
		End if 
	End while 
End if 

Process_End
ERR_MethodTrackerReturn("Gen_ModAster"; $_t_oldMethodName)