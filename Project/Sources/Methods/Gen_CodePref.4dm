//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_CodePref
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/10/2010 08:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Backslash; $_bo_MultipleNos; $_t_OfficeCode)
	C_LONGINT:C283($_l_LeadingZeros; $_l_Number; $_l_OK; $_l_Process; $_l_TableNumber; $1; SYS_l_LastNumber)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_Before; $_t_oldMethodName; $_t_ProcessName; $_t_TableName; $0; $3; $4; CREATESEM2; CREATESEM3; CREATESEM4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CodePref")
If (Count parameters:C259>0)
	$_l_TableNumber:=$1
Else 
	$_l_TableNumber:=-999
End if 

READ ONLY:C145([IDENTIFIERS:16])
READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
If ([IDENTIFIERS:16]Table_Number:1#$1)
	QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$1)
End if 
If (Records in selection:C76([IDENTIFIERS:16])=0)
	CreateSem3:="CodeCrSELPREF"+String:C10($1)
	While (Semaphore:C143(CreateSem3)) & (Not:C34(<>SYS_bo_QuitCalled))
		DelayTicks(1)
	End while 
	QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$1)  // in case someone else created
	If (Records in selection:C76([IDENTIFIERS:16])=0)
		If (Not:C34(In transaction:C397))
			CreateFileRecord($1)
		Else 
			$_l_Process:=New process:C317("CreateFileRecord"; 128000; "CREATE RECORD"; $_l_TableNumber)
			While (Process state:C330($_l_Process)>=0) & ($_l_Process>0)
				$_t_ProcessName:=Process_Name($_l_Process)
				
				If ($_t_ProcessName="CREATE RECORD")
					DelayTicks(2)
				Else 
					$_l_Process:=0
				End if 
			End while 
		End if 
	End if 
	CLEAR SEMAPHORE:C144(CreateSem3)
End if 
$_t_TableName:=[IDENTIFIERS:16]Name:3
$_t_OfficeCode:=[IDENTIFIERS:16]Office_Code:4
$_bo_Backslash:=[IDENTIFIERS:16]Backslash:5
$_l_LeadingZeros:=[IDENTIFIERS:16]Leading_Zeros:6
$_t_Before:=""
Case of 
	: (Count parameters:C259=1)
		
		//we cannot pass the test values to Gen_Code because there is no file to test
		
		$_l_Number:=Gen_Code($1)
		
		If ($_t_OfficeCode)
			If ($_bo_Backslash)
				$0:=DB_GetOrganisationOfficeCode+"/"
			Else 
				$0:=DB_GetOrganisationOfficeCode
			End if 
		End if 
		If ($_l_LeadingZeros>0)
			$0:=$0+("0"*($_l_LeadingZeros-Length:C16(String:C10($_l_Number))))+String:C10($_l_Number)
		Else 
			$0:=$0+String:C10($_l_Number)
		End if 
		
	: (Count parameters:C259=2)
		If ($_t_OfficeCode)
			If ($_bo_Backslash)
				$_t_Before:=DB_GetOrganisationOfficeCode+"/"
			Else 
				$_t_Before:=DB_GetOrganisationOfficeCode
			End if 
		End if 
		If ($_t_Before#"")
			$_l_Number:=Gen_Code($1; $2; $_t_Before)
		Else 
			$_l_Number:=Gen_Code($1; $2)
		End if 
		If ($_l_LeadingZeros>0)
			If ($_t_Before#"")
				$0:=$_t_Before+("0"*($_l_LeadingZeros-Length:C16(String:C10($_l_Number))))+String:C10($_l_Number)
			Else 
				$0:=("0"*($_l_LeadingZeros-Length:C16(String:C10($_l_Number))))+String:C10($_l_Number)
			End if 
			//`HERE WE SHOULD TEST AGAIN
		Else 
			If ($_t_Before#"")
				$0:=$_t_Before+String:C10($_l_Number)
			Else 
				$0:=String:C10($_l_Number)
			End if 
			
		End if 
		
	: (Count parameters:C259=3)
		//$3 IS ADDED TO THE BEFORE(AFTER THE OFFICE CODE AND BACK SLASH...ERRR FORWARD SL
		If ($_t_OfficeCode)
			If ($_bo_Backslash)
				$_t_Before:=DB_GetOrganisationOfficeCode+"/"
			Else 
				$_t_Before:=DB_GetOrganisationOfficeCode
			End if 
		Else 
			
		End if 
		If ($_t_Before#"")
			$_l_Number:=Gen_Code($1; $2; $3+$_t_Before)
		Else 
			$_l_Number:=Gen_Code($1; $2; $3)
		End if 
		If ($_l_LeadingZeros>0)
			If ($_t_Before#"")
				$0:=$_t_Before+("0"*($_l_LeadingZeros-Length:C16(String:C10($_l_Number))))+String:C10($_l_Number)
			Else 
				$0:=("0"*($_l_LeadingZeros-Length:C16(String:C10($_l_Number))))+String:C10($_l_Number)
			End if 
			//``ERRR HERE WE SHOULD TEST AGAIN
			//!00/00/00!!00/00/00!
		Else 
			If ($_t_Before#"")
				$0:=$_t_Before+String:C10($_l_Number)
			Else 
				$0:=String:C10($_l_Number)
			End if 
			
		End if 
		
		
	: (Count parameters:C259=4)
		//$3 IS ADDED TO THE BEFORE(AFTER THE OFFICE CODE AND BACK SLASH...ERRR FORWARD SL
		If ($_t_OfficeCode)
			If ($_bo_Backslash)
				$_t_Before:=DB_GetOrganisationOfficeCode+"/"
			Else 
				$_t_Before:=DB_GetOrganisationOfficeCode
			End if 
		Else 
			$_t_Before:=""
		End if 
		If ($_t_Before#"")
			$_l_Number:=Gen_Code($1; $2; $3+$_t_Before; $4)
		Else 
			$_l_Number:=Gen_Code($1; $2; $3; $4)
		End if 
		If ($_l_LeadingZeros>0)
			If ($_t_Before#"")
				$0:=$_t_Before+("0"*($_l_LeadingZeros-Length:C16(String:C10($_l_Number))))+String:C10($_l_Number)
			Else 
				$0:=("0"*($_l_LeadingZeros-Length:C16(String:C10($_l_Number))))+String:C10($_l_Number)
			End if 
			//``ERRR HERE WE SHOULD TEST AGAIN
			//!00/00/00!!00/00/00!
		Else 
			If ($_t_Before#"")
				$0:=$_t_Before+String:C10($_l_Number)
			Else 
				$0:=String:C10($_l_Number)
			End if 
			
		End if 
		
		
		
		
End case 
ERR_MethodTrackerReturn("Gen_CodePref"; $_t_oldMethodName)