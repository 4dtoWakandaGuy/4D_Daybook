//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_In
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
	C_BOOLEAN:C305($_bo_OpenWindow; $_bo_StartProcess; $_bo_UseDialog; $4)
	C_LONGINT:C283($_l_AddMode; $_l_TableNumber; Vadd; vNo)
	C_OBJECT:C1216($_obj_FormData; $_obj_InputData; $1)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_CurrentInputForm; $_t_FormName; $_t_oldMethodName; $_t_RecordTitle; $_t_WindowTitle; $2; $3; DB_t_CallOnCloseorSave; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_In")
//Minor_In
$_obj_InputData:=$1
If (Not:C34($_obj_InputData.StartProcess=Null:C1517))
	$_bo_StartProcess:=$_obj_InputData.StartProcess
Else 
	$_bo_StartProcess:=False:C215
End if 
If (Not:C34($_obj_InputData.OpenWindow=Null:C1517))
	$_bo_OpenWindow:=$_obj_InputData.OpenWindow
Else 
	$_bo_OpenWindow:=True:C214
End if 
If (Not:C34($_obj_InputData.RecordTitle=Null:C1517))
	$_t_RecordTitle:=$_obj_InputData.RecordTitle
End if 
If (Not:C34($_obj_InputData.FormName=Null:C1517))
	$_t_FormName:=$_obj_InputData.FormName
End if 
If (Not:C34($_obj_InputData.TableNumber=Null:C1517))
	$_l_TableNumber:=$_obj_InputData.TableNumber
End if 
$_bo_UseDialog:=True:C214
If (Not:C34($_obj_InputData.FormData=Null:C1517))
	$_obj_FormData:=$_obj_InputData.FormData
	$_bo_UseDialog:=True:C214
End if 

If ($_l_TableNumber>0) & ($_t_FormName#"")
	$_ptr_Table:=Table:C252($_l_TableNumber)
	If ($_bo_StartProcess)
		Start_Process
	End if 
	
	$_t_CurrentInputForm:=WIN_t_CurrentInputForm
	FORM SET INPUT:C55($_ptr_Table->; $_t_FormName+"_In")  //NG April 2004 removed reference to ◊screen
	WIN_t_CurrentInputForm:=$_t_FormName+"_In"
	
	If (In_Allowed("Add records"; $_ptr_Table))
		CREATE SET:C116($_ptr_Table->; "Master")
		REDUCE SELECTION:C351($_ptr_Table->; 0)
		$_l_AddMode:=Vadd
		vAdd:=1
		OK:=1
		$_t_WindowTitle:=""
		If ($_bo_OpenWindow)
			Open_Pro_Window("Enter "+$_t_RecordTitle; 0; 2; $_ptr_Table; WIN_t_CurrentInputForm)
		Else 
			$_t_WindowTitle:=Get window title:C450
			SET WINDOW TITLE:C213("Enter "+$_t_RecordTitle)
		End if 
		While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
			If ($_bo_UseDialog)
				DIALOG:C40($_ptr_Table->; WIN_t_CurrentInputForm; $_obj_FormData)
				
			Else 
				ADD RECORD:C56($_ptr_Table->; *)
			End if 
			ADD TO SET:C119($_ptr_Table->; "Master")
			Gen_InOne
		End while 
		If ($_bo_OpenWindow)
			Close_ProWin(Table name:C256($_ptr_Table)+"_"+WIN_t_CurrentInputForm)
		Else 
			SET WINDOW TITLE:C213($_t_WindowTitle)
		End if 
		vAdd:=$_l_AddMode
		USE SET:C118("Master")
		vNo:=Records in selection:C76($_ptr_Table->)
	End if 
	
	WIN_t_CurrentInputForm:=$_t_CurrentInputForm
End if 
ERR_MethodTrackerReturn("Minor_In"; $_t_oldMethodName)
