//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Reports In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283($_l_AddMode; Vadd)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports In")
Start_Process
READ WRITE:C146([DOCUMENTS:7])
FORM SET INPUT:C55([DOCUMENTS:7]; "Reports In13")
WIN_t_CurrentInputForm:="Reports In13"
FORM SET OUTPUT:C54([DOCUMENTS:7]; "Reports Out")
WIN_t_CurrentOutputform:="Reports Out"
CREATE SET:C116([DOCUMENTS:7]; "Master")
REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
OK:=1
Open_Pro_Window("Create a SuperReport"; 0; 2; ->[DOCUMENTS:7]; WIN_t_CurrentInputForm)

While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
	$_l_AddMode:=Vadd
	vAdd:=1
	vFromIn:=False:C215
	ADD RECORD:C56([DOCUMENTS:7]; *)
	//DEFAULT TABLE([DOCUMENTS])
	ADD TO SET:C119([DOCUMENTS:7]; "Master")
	Gen_InOne
	Vadd:=$_l_AddMode
End while 
Close_ProWin(Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm)

vAdd:=0
Process_End
ERR_MethodTrackerReturn("Reports In"; $_t_oldMethodName)