//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 06:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283(vAdd)
	C_POINTER:C301($4)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; DB_t_CallOnCloseorSave; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen In")
Start_Process
//C_POINTER($3)
If (Count parameters:C259>=4)
	If (Execute_File($2))  //NG modified June 2004
		If (In_Allowed($1; $4))
			CREATE SET:C116($4->; $3)
			REDUCE SELECTION:C351($4->; 0)
			OK:=1
			Open_Pro_Window($1; 0; 2; $4; WIN_t_CurrentInputForm)
			While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
				vAdd:=1
				vFromIn:=False:C215
				ADD RECORD:C56($4->; *)
				
				ADD TO SET:C119($4->; $3)
				Gen_InOne
			End while 
			Close_ProWin(Table name:C256($4)+"_"+WIN_t_CurrentInputForm)
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Gen In"; $_t_oldMethodName)