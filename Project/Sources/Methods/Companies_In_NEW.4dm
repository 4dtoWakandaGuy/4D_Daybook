//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_In_NEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   17/05/2010 22:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(SD_at_CompanyCodes;0)
	//ARRAY TEXT(SD_at_CompanyNames;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_inAllowed; $_bo_OpenWindow; $_bo_ProcessStart; $1; $2; COM_bo_AddingCompany; vFromIn)
	C_LONGINT:C283($_l_AddMode; Vadd)
	C_TEXT:C284($_t_ForeName; $_t_FormReference; $_t_oldMethodName; $_t_WindowTitle; COM_t_OpenCompanyName; vCompName; vForename; vPostcode; vSurname; vTitle; vTitle1)
	C_TEXT:C284(vTown; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_In_NEW")
If (Count parameters:C259>=1)
	$_bo_ProcessStart:=$1
Else 
	$_bo_ProcessStart:=True:C214
End if 
If (Count parameters:C259>=2)
	$_bo_OpenWindow:=$2
Else 
	$_bo_OpenWindow:=True:C214
End if 

//Companies_In
ARRAY TEXT:C222(SD_at_CompanyCodes; 0)
ARRAY TEXT:C222(SD_at_CompanyNames; 0)
SD_at_CompanyNames:=0
$_t_WindowTitle:="Enter Companies"
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If ($_bo_ProcessStart)
	Start_Process
End if 
$_l_AddMode:=Vadd
vAdd:=1
Companies_File
$_bo_inAllowed:=True:C214

If (Size of array:C274(<>SYS_at_RecStateCodes{Table:C252(->[COMPANIES:2])})>2)
	$_bo_inAllowed:=False:C215
	If (<>SYS_al_RecStateRestriction{Table:C252(->[ORDERS:24])}{3}%2=1)
		$_bo_inAllowed:=True:C214
		
	End if 
End if 

If (In_Allowed($_t_WindowTitle; ->[COMPANIES:2])) & ($_bo_inAllowed)
	
	vAdd:=1
	OK:=1
	
	
	vFromIn:=False:C215
	vTitle1:="Company_Details for duplicate check:"
	vCompName:=""
	vTown:=""
	vTitle:=""
	vForename:=""
	vSurname:=""
	vPostcode:=""
	COM_bo_AddingCompany:=True:C214
	CREATE SET:C116([COMPANIES:2]; "CMaster")
	REDUCE SELECTION:C351([COMPANIES:2]; 0)
	If ($_bo_OpenWindow)
		Open_Pro_Window($_t_WindowTitle; 0; 2; ->[COMPANIES:2]; WIN_t_CurrentInputForm)  //NG may 2004 added input form
	End if 
	$_t_FormReference:=""  //added NG may 2004
	COM_t_OpenCompanyName:=""
	ADD RECORD:C56([COMPANIES:2]; *)
	$_t_FormReference:=Table name:C256(->[COMPANIES:2])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
	
	ADD TO SET:C119([COMPANIES:2]; "CMaster")
	If (COM_t_OpenCompanyName#"")
		QUERY:C277([COMPANIES:2]Company_Name:2=COM_t_OpenCompanyName)
		If ([COMPANIES:2]Deleted:61#0)
			[COMPANIES:2]Deleted:61:=0
			DB_SaveRecord(->[COMPANIES:2])
		End if 
		Vadd:=0
		MODIFY RECORD:C57([COMPANIES:2]; *)
		
	End if 
	
	If ($_bo_OpenWindow)
		If ($_t_FormReference="")
			Close_ProWin
		Else 
			Close_ProWin($_t_FormReference)
		End if 
	End if 
	
	//Gen_InOne  Not needed in here because handled in company form for speed
	
End if 
vAdd:=$_l_AddMode
If ($_bo_ProcessStart)
	Process_End
End if 
ERR_MethodTrackerReturn("Companies_In_NEW"; $_t_oldMethodName)