//%attributes = {}
If (False:C215)
	//Project Method Name:      SelPvs_AnalysesCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_AnalysisOnly)
	C_OBJECT:C1216($_obj_Data; $1)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName; ACC_t_AnalysisCodeFrom; vAnalCodeT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SelPvs_AnalysesCode")
If (Count parameters:C259>=1)
	$_obj_Data:=$1
	If (<>PER_bo_AnalysisOnly)
		$_obj_Data.AnalysisCodeFrom:=<>Per_t_CurrentDefaultAnalCode
		$_obj_Data.AnalysisCodeTo:=<>Per_t_CurrentDefaultAnalCode
	Else 
		$_obj_Data.AnalysisCodeFrom:=""
		$_obj_Data.AnalysisCodeTo:=""
	End if 
Else 
	If (<>PER_bo_AnalysisOnly)
		ACC_t_AnalysisCodeFrom:=<>Per_t_CurrentDefaultAnalCode
		vAnalCodeT:=<>Per_t_CurrentDefaultAnalCode
	Else 
		ACC_t_AnalysisCodeFrom:=""
		vAnalCodeT:=""
	End if 
End if 
ERR_MethodTrackerReturn("SelPvs_AnalysesCode"; $_t_oldMethodName)
