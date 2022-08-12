//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 11:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(COM_at_CompanyTypes;0)
	C_BOOLEAN:C305(<>DB_bo_AutoOut; <>SearchNewStyle; $_bo_AutoOut; $_bo_AutoSearch)
	C_LONGINT:C283(<>ButtProc; $_l_BarProcess; $_l_TableNumber; vC)
	C_TEXT:C284($_t_AutoSearchCode; $_t_oldMethodName; $1; $2; SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_Mod")
If (Count parameters:C259>=2)
	$_bo_AutoSearch:=($2="TRUE")
	
	$_t_AutoSearchCode:=$1
	$_bo_AutoOut:=<>DB_bo_AutoOut
	<>DB_bo_AutoOut:=False:C215
Else 
	$_bo_AutoSearch:=False:C215
	$_t_AutoSearchCode:=""
	$_bo_AutoOut:=<>DB_bo_AutoOut
End if 
Start_Process
Companies_File
Macro_FileUpd(Table:C252(->[COMPANIES:2]))

While (vC=1)
	IDLE:C311  // 03/04/03 pb
	//Rollo 8/7/2004 - introduced the word individuals
	ARRAY TEXT:C222(COM_at_CompanyTypes; 4)
	COM_at_CompanyTypes{1}:="Show Companies only"
	COM_at_CompanyTypes{2}:="Show Private Individuals only"
	COM_at_CompanyTypes{3}:="-"
	COM_at_CompanyTypes{4}:="Show Companies and Private Individuals"
	COM_at_CompanyTypes:=0
	If ($_bo_AutoSearch)
		Comp_Sel($_t_AutoSearchCode; $_bo_AutoSearch)
		COPY NAMED SELECTION:C331([COMPANIES:2]; "CoPreselection")
	Else 
		ALL RECORDS:C47([COMPANIES:2])
		//Set a filter for companies only...
		COPY NAMED SELECTION:C331([COMPANIES:2]; "CoPreselection")
	End if 
	
	//If (◊SearchNewStyle)
	//Srch_resetUnfilteredSelection (->[COMPANIES])
	//End if
	//TRACE
	If (True:C214)
		If (Gen_Option)
			SYS_t_AccessType:=""  //temporary
			
			Gen_ModMidAL("View Companies"; "CMaster"; ->[COMPANIES:2]; ->vC; "Companies"; ""; ->[COMPANIES:2]; "dBlue Out")
		Else 
			Gen_ModMid("View Companies"; "CMaster"; ->[COMPANIES:2]; ->vC; "Companies"; "")
		End if 
	Else 
		Vc:=0
		$_l_TableNumber:=Table:C252(->[COMPANIES:2])
		DBI_DisplayRecords($_l_TableNumber; "CoPreselection"; ""; 1)
		$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
		If ($_l_BarProcess>0)
			SHOW PROCESS:C325($_l_BarProcess)
			
		End if 
		If (<>ButtProc>0)
			SHOW PROCESS:C325(<>ButtProc)
		End if 
		
		
	End if 
End while 
<>DB_bo_AutoOut:=$_bo_AutoOut
Comp_Unload
Process_End
ERR_MethodTrackerReturn("Companies_Mod"; $_t_oldMethodName)
