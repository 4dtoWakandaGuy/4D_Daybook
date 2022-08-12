//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_InMidLay
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
	C_LONGINT:C283($_l_AddMode; Vadd)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $4; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_InMidLay")
If (In_Allowed($1; $3))
	CREATE SET:C116($3->; $2)
	REDUCE SELECTION:C351($3->; 0)
	OK:=1
	Open_Pro_Window($1; 0; 2; $3; WIN_t_CurrentInputForm)
	$_l_AddMode:=Vadd
	While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
		DB_t_CurrentFormUsage:=$4
		vAdd:=1
		vFromIn:=False:C215
		ADD RECORD:C56($3->; *)
		
		ADD TO SET:C119($3->; $2)
		Gen_InOne
	End while 
	Vadd:=$_l_AddMode
	Close_ProWin(Table name:C256($3)+"_"+WIN_t_CurrentInputForm)
End if 
ERR_MethodTrackerReturn("Gen_InMidLay"; $_t_oldMethodName)