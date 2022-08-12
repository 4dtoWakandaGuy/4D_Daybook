//%attributes = {}
If (False:C215)
	//Project Method Name:      Start ProcCount
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
	C_BOOLEAN:C305(vNoEnd)
	C_LONGINT:C283($_l_Process; vProc; vStPos; vWPosNo2; VWPOSNOH2)
	C_TEXT:C284(<>vMacroCode; $_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SCPT_t_Description1; SCPT_t_Description2; SCPT_t_Description3; SCPT_t_Description4; SCPT_t_Description5)
	C_TEXT:C284(vMT; vMTitle2; vStPrev; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Start ProcCount")
//Start ProcCount
//vProc:=Current process-3
vProc:=Current process:C322
//$_l_Process:=Count user processes
//If (◊SinProc=False)
// If ($_l_Process>◊ProcMax)
//   Gen_Alert ("Only "+String(◊ProcMax)+" Processes are allowed";"Cancel")
//  ABORT
//  Else
//  If (vProc>0)
//  ◊aPN{vProc}:=$1
//  End if

DB_SetMenuBar(""; 9)

// End if
//End if
vNoEnd:=False:C215
vStPrev:=""
vStPos:=0
vWPosNo2:=0
vWPosNoH2:=0
DB_t_CurrentFormUsage:=""
DB_t_CurrentFormUsage2:=""
DB_t_CurrentFormUsage3:=""
vMTitle2:=""
vMT:=""
SCPT_t_Description1:=""
SCPT_t_Description2:=""
SCPT_t_Description3:=""
SCPT_t_Description4:=""
SCPT_t_Description5:=""
vTitle:=""
<>vMacroCode:=""
ERR_MethodTrackerReturn("Start ProcCount"; $_t_oldMethodName)