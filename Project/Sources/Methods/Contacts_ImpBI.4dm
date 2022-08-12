//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_ImpBI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Count; $_l_Process; $_l_WindowReferenceRow; vAdd; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_ContactCode; $_t_FieldDelimiter; $_t_oldMethodName; $_t_RecordDelimiter; $_t_Role; vT; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_ImpBI")
Start_Process("Companies_Import")
$_l_Process:=Current process:C322
Contacts_File
vAdd:=1
Gen_Confirm("Have you copied the names to pure Text format?"; "Yes"; "No")
Companies_ImpQs
If (OK=1)
	Open_PrD_Window("Import Companies: Command-. to Cancel")
	$_t_RecordDelimiter:=Char:C90(13)
	$_t_FieldDelimiter:=Char:C90(9)
	$_l_Count:=0
	vText:="sdfsdf"
	While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#$_l_Process))
		IDLE:C311  // 03/04/03 pb
		RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
		vT:=vText
		$_t_ContactCode:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_Role:=First_Field(->vT; $_t_FieldDelimiter)
		
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
		[CONTACTS:1]Role:11:=$_t_Role
		DB_SaveRecord(->[CONTACTS:1])
		AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		
	End while 
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("Contacts_ImpBI"; $_t_oldMethodName)