//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsOpt1ObjHandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsOpt1ObjHandler
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	C_BOOLEAN:C305(SR_bo_ReportPrefsDirty)
	C_POINTER:C301($_ptr_; $_Ptr_EmailPrintOption1; $_Ptr_EmailPrintOption2; $_ptr_EmailPrintOption2Cont; $_ptr_EmailPrintOption2Email; $_ptr_EmailPrintOption2Pers; $_ptr_EmailPrintOption2Role; $_Ptr_EmailPrintOption3; $_ptr_EmailPrintOption3Con; $_ptr_EmailPrintOption3Email; $_ptr_EmailPrintOption3Pers)
	C_POINTER:C301($_ptr_EmailPrintOption3Role; $_Ptr_EmailPrintOption4; $10; $11; $12; $13; $2; $3; $4; $5; $6)
	C_POINTER:C301($7; $8; $9)
	C_TEXT:C284($_ptr_SR_t_EmailPrintOption2Cont; $_ptr_SR_t_EmailPrintOption2Pers; $_t_oldMethodName; $_t_ReportName; $1; REP_t_CurrentSRDocReport; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption3Con)
	C_TEXT:C284(SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers; SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsOpt1ObjHandler")

//Added 13/11/08 v631b120g -kmw
If (Count parameters:C259>=1)
	$_t_ReportName:=$1
	$_Ptr_EmailPrintOption1:=$2
	$_Ptr_EmailPrintOption2:=$3
	$_Ptr_EmailPrintOption3:=$4
	$_Ptr_EmailPrintOption4:=$5
	$_ptr_EmailPrintOption2Email:=$6
	$_ptr_EmailPrintOption2Role:=$7
	$_ptr_EmailPrintOption2Pers:=$8
	$_ptr_EmailPrintOption2Cont:=$9
	$_ptr_EmailPrintOption3Email:=$10
	$_ptr_EmailPrintOption3Role:=$11
	$_ptr_EmailPrintOption3Pers:=$12
	$_ptr_EmailPrintOption3Con:=$13
Else 
	$_t_ReportName:=REP_t_CurrentSRDocReport
	$_Ptr_EmailPrintOption1:=->SR_at_EmailPrintOption1
	$_Ptr_EmailPrintOption2:=->SR_at_EmailPrintOption2
	$_Ptr_EmailPrintOption3:=->SR_at_EmailPrintOption3
	$_Ptr_EmailPrintOption4:=->SR_at_EmailPrintOption4
	$_ptr_EmailPrintOption2Email:=->SR_t_EmailPrintOption2Email
	$_ptr_EmailPrintOption2Role:=->SR_t_EmailPrintOption2Role
	$_ptr_EmailPrintOption2Pers:=->SR_t_EmailPrintOption2Pers
	$_ptr_EmailPrintOption2Cont:=->SR_t_EmailPrintOption2Cont
	$_ptr_EmailPrintOption3Email:=->SR_t_EmailPrintOption3Email
	$_ptr_EmailPrintOption3Role:=->SR_t_EmailPrintOption3Role
	$_ptr_EmailPrintOption3Pers:=->SR_t_EmailPrintOption3Pers
	$_ptr_EmailPrintOption3Con:=->SR_t_EmailPrintOption3Con
	
End if 

Case of 
	: ((Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4))
		
		Reports_PrefsSetVisibility(SR_at_EmailPrintOption1; SR_at_EmailPrintOption2; SR_at_EmailPrintOption3)
		SR_bo_ReportPrefsDirty:=True:C214  //Added 01/12/08 v631b120i -kmw
		
	Else 
		
End case 
ERR_MethodTrackerReturn("Reports_PrefsOpt1ObjHandler"; $_t_oldMethodName)
