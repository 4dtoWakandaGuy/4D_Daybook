//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Minor In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 06:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OpenWindow; $_bo_StartProcess; $4)
	C_LONGINT:C283($_l_AddMode; Vadd; vNo)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_CurrentInputForm; $_t_oldMethodName; $_t_WindowTitle; $2; $3; DB_t_CallOnCloseorSave; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor In")
//Minor In
If (Count parameters:C259>=4)
	$_bo_StartProcess:=$4
Else 
	$_bo_StartProcess:=False:C215
End if 
If (Count parameters:C259>=5)
	$_bo_OpenWindow:=False:C215
Else 
	$_bo_OpenWindow:=True:C214
End if 
If ($_bo_StartProcess)
	Start_Process
End if 

$_t_CurrentInputForm:=WIN_t_CurrentInputForm
FORM SET INPUT:C55($1->; $2+" In13")  //NG April 2004 removed reference to ◊screen

WIN_t_CurrentInputForm:=$2+" in13"
If (In_Allowed("Add records"; $1))
	CREATE SET:C116($1->; "Master")
	REDUCE SELECTION:C351($1->; 0)
	$_l_AddMode:=Vadd
	vAdd:=1
	OK:=1
	$_t_WindowTitle:=""
	If ($_bo_OpenWindow)
		Open_Pro_Window("Enter "+$3; 0; 2; $1; WIN_t_CurrentInputForm)
	Else 
		$_t_WindowTitle:=Get window title:C450
		SET WINDOW TITLE:C213("Enter "+$3)
	End if 
	While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
		ADD RECORD:C56($1->; *)
		ADD TO SET:C119($1->; "Master")
		Gen_InOne
	End while 
	If ($_bo_OpenWindow)
		Close_ProWin(Table name:C256($1)+"_"+WIN_t_CurrentInputForm)
	Else 
		SET WINDOW TITLE:C213($_t_WindowTitle)
	End if 
	vAdd:=$_l_AddMode
	USE SET:C118("Master")
	vNo:=Records in selection:C76($1->)
End if 
WIN_t_CurrentInputForm:=$_t_CurrentInputForm
ERR_MethodTrackerReturn("Minor In"; $_t_oldMethodName)
