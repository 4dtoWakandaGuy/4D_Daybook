//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GETDIARYCOMPANY
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2012 10:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; $1)
	C_TEXT:C284($_T_CompanyName; $_t_oldMethodName; $0; $2; SD2_T_COMPANYNAME)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GETDIARYCOMPANY")

If (Count parameters:C259=0)
	$_l_Process:=New process:C317("SD2_GETDIARYCOMPANY"; 128000; "GET COMPANY NAME"; Current process:C322; [DIARY:12]Company_Code:1)
	While (Process state:C330($_l_Process)>=0)
		DelayTicks(2)
	End while 
	$0:=SD2_T_COMPANYNAME
Else 
	READ ONLY:C145(*)
	
	If ($2#"")
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$2)
		$_T_CompanyName:=[COMPANIES:2]Company_Name:2
	Else 
		$_T_CompanyName:=""
	End if 
	SET PROCESS VARIABLE:C370($1; SD2_T_COMPANYNAME; $_T_CompanyName)
End if 
ERR_MethodTrackerReturn("SD2_GETDIARYCOMPANY"; $_t_oldMethodName)
