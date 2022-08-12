//%attributes = {}
If (False:C215)
	//Project Method Name:      CAT_CreateMacroSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2010 09:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordEditProcess; $_l_RecordNumber; $_l_Retries; $_l_ScriptNumber; s1; vRecNo; xSelect)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_IncomingScriptCode; $_t_oldMethodName; $_t_ProcessName; $_t_ScriptCode; $0; $1; vProdName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_CreateMacroSearch")

If (In_Allowed("Enter Macro"; ->[PRODUCTS:9]))
	OK:=1
	MESSAGES OFF:C175
	$_l_Retries:=0
	While (Semaphore:C143("Untitled"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(20*(1+$_l_Retries))
		
	End while 
	If (Count parameters:C259>=1)
		$_t_IncomingScriptCode:=$1
	Else 
		$_t_IncomingScriptCode:=""
	End if 
	If ($_t_IncomingScriptCode="")
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="ProductSearch@")
		If (Records in selection:C76([SCRIPTS:80])>0)
			ORDER BY:C49([SCRIPTS:80]Script_Code:1; <)
			$_l_ScriptNumber:=Num:C11(Substring:C12([SCRIPTS:80]Script_Code:1; 10; 6))+1
		Else 
			$_l_ScriptNumber:=1
		End if 
		
		CREATE RECORD:C68([SCRIPTS:80])
		[SCRIPTS:80]Script_Code:1:="ProductSearch"+("0"*(3-Length:C16(String:C10($_l_ScriptNumber))))+String:C10($_l_ScriptNumber)
		If (s1=1)
			[SCRIPTS:80]Same_Process:6:=True:C214
		End if 
		[SCRIPTS:80]Table_Number:8:=Table:C252(->[PRODUCTS:9])
		[SCRIPTS:80]Person:5:=<>PER_t_CurrentUserInitials
		
		DB_SaveRecord(->[SCRIPTS:80])
		$_l_RecordNumber:=Record number:C243([SCRIPTS:80])
		CLEAR SEMAPHORE:C144("Untitled")
		MESSAGES ON:C181
		xSelect:=1
		$_t_ScriptCode:=[SCRIPTS:80]Script_Code:1
		vRecNo:=Record number:C243([SCRIPTS:80])
		UNLOAD RECORD:C212([SCRIPTS:80])
		$_l_RecordEditProcess:=New process:C317("Record_EditLst"; DB_ProcessMemoryinit(2); $_t_ScriptCode)
		vProdName:=$_t_ScriptCode
		$_l_Retries:=0
		While (Process state:C330($_l_RecordEditProcess)>=0) & ($_l_RecordEditProcess>0)
			$_t_ProcessName:=Process_Name($_l_RecordEditProcess)
			If ($_t_ProcessName=$_t_ScriptCode)
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			Else 
				$_l_RecordEditProcess:=0
			End if 
			
		End while 
	Else 
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_IncomingScriptCode)
		$_l_RecordNumber:=Record number:C243([SCRIPTS:80])
		CLEAR SEMAPHORE:C144("Untitled")
		MESSAGES ON:C181
		xSelect:=1
		$_t_ScriptCode:=[SCRIPTS:80]Script_Code:1
		vRecNo:=Record number:C243([SCRIPTS:80])
		UNLOAD RECORD:C212([SCRIPTS:80])
		$_l_RecordEditProcess:=New process:C317("Record_EditLst"; DB_ProcessMemoryinit(2); $_t_ScriptCode)
		vProdName:=$_t_ScriptCode
		$_l_Retries:=0
		While (Process state:C330($_l_RecordEditProcess)>=0) & ($_l_RecordEditProcess>0)
			$_t_ProcessName:=Process_Name($_l_RecordEditProcess)
			If ($_t_ProcessName=$_t_ScriptCode)
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			Else 
				$_l_RecordEditProcess:=0
			End if 
			
		End while 
		
	End if 
	ALL RECORDS:C47([SCRIPTS:80])
	GOTO RECORD:C242([SCRIPTS:80]; $_l_RecordNumber)
	$0:=[SCRIPTS:80]Script_Code:1
	UNLOAD RECORD:C212([SCRIPTS:80])
	
End if 
ERR_MethodTrackerReturn("CAT_CreateMacroSearch"; $_t_oldMethodName)