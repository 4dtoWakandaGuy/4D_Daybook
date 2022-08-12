//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_LoqateAddressing)
	C_LONGINT:C283(<>BAR; <>Mod_l_MaxModules; $_l_AddMode; $_l_Process; $_l_Number; MOD_l_CurrentModuleAccess; SD3_l_CalendarStartDayNumber; Vadd; vCreate)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User Mod")
//User Mod
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
Start_Process

vFilePtr:=->[USER:15]
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
If ((DB_GetModuleSettingByNUM(1)=5) & (MOD_l_CurrentModuleAccess<2))
	Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
	//ABORT
Else 
	If ((MOD_l_CurrentModuleAccess<2) | (MOD_l_CurrentModuleAccess=3))
		READ ONLY:C145([USER:15])
		READ ONLY:C145([IDENTIFIERS:16])
	Else 
		READ WRITE:C146([USER:15])
		READ WRITE:C146([IDENTIFIERS:16])
	End if 
	If (<>Bar=47)
		FORM SET INPUT:C55([USER:15]; "User In13")  //NG April 2004 Removed ◊Screen and "S"
		WIN_t_CurrentInputForm:="User In13"
	Else 
		FORM SET INPUT:C55([USER:15]; "User In13")  //NG April 2004 Removed ◊Screen
		WIN_t_CurrentInputForm:="User In13"
	End if 
	ALL RECORDS:C47([USER:15])
	vCreate:=0
	Open_Pro_Window("Preferences"; 0; 3; ->[USER:15]; "User In13")
	If (Records in selection:C76([USER:15])=0)
		$_l_AddMode:=Vadd
		vAdd:=1
		ADD RECORD:C56([USER:15]; *)  //NG may 2004 added table
	Else 
		$_l_AddMode:=Vadd
		vAdd:=0
		MODIFY RECORD:C57([USER:15]; *)  //NG may 2004 added table
	End if 
	Vadd:=$_l_AddMode
	Close_ProWin
	User_CurrCheck
	DB_t_CurrentFormUsage:="Mod"
	SD3_l_CalendarStartDayNumber:=0
	
	
	//here set the process variables on the server
	If (Application type:C494=4)
		
		$_l_Number:=1
		UNLOAD RECORD:C212([USER:15])
		READ ONLY:C145([USER:15])
		$_l_Process:=Execute on server:C373("User_Details"; DB_ProcessMemoryinit(1); "Update Variables"; $_l_Number)
		
	Else 
		UNLOAD RECORD:C212([USER:15])
		READ ONLY:C145([USER:15])
		//TRACE
		User_Details
	End if 
	<>SYS_bo_LoqateAddressing:=False:C215
	If (<>SYS_bo_LoqateAddressing)  //reset QA a/c Person
		If ((DB_GetModuleSettingByNUM(35))<2)
			<>SYS_bo_LoqateAddressing:=False:C215
		End if 
	End if 
	DB_t_CurrentFormUsage:=""
	If (vCreate=1)
		Check_Modules
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("User Mod"; $_t_oldMethodName)