//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movements Prin2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2012 08:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_SuperreportFound; PRT_bo_NoSave; SR_bo_Validated)
	C_LONGINT:C283($_l_Printed; Vadd)
	C_TEXT:C284($_t_CurrentWindowTitle; $_t_DocumentName; $_t_oldMethodName; $_t_SRFormName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements Prin2")



SR_bo_Validated:=False:C215
//Gen_PPSingle (->[STOCK MOVEMENTS];"Movt Form";"Movements Out";DB_t_CurrentFormUsage;"Movement Form";"Movt_FormLP";0;->[STOCK MOVEMENTS]Movement Code;"Movement";[STOCK MOVEMENTS]Analysis Code)
$_t_DocumentName:="Stock Movement "+[STOCK_MOVEMENTS:40]Movement_Code:1  // 05/04/040 pb

$_t_CurrentWindowTitle:=Get window title:C450
$_bo_SuperreportFound:=(Form_SRProOK("Movement "+[STOCK_MOVEMENTS:40]Movement_Type:6+" Email"; [STOCK_MOVEMENTS:40]Analysis_Code:9))
If (Records in selection:C76([DOCUMENTS:7])=0) | ($_bo_SuperreportFound=False:C215)
	$_bo_SuperreportFound:=(Form_SRProOK("Movement "+[STOCK_MOVEMENTS:40]Movement_Type:6; [STOCK_MOVEMENTS:40]Analysis_Code:9))
End if 
If ($_bo_SuperreportFound)
	$_t_SRFormName:="Movement "+[STOCK_MOVEMENTS:40]Movement_Type:6
Else 
	$_t_SRFormName:="Movement"
End if 
SET WINDOW TITLE:C213($_t_DocumentName)
PRT_bo_NoSave:=False:C215

If (Vadd=1)
	PRT_bo_NoSave:=True:C214
End if 
$_l_Printed:=Gen_PPSingle(->[STOCK_MOVEMENTS:40]; "Movt Form"; "Movements Out"; DB_t_CurrentFormUsage; "Movement Form"; "Movt_FormLP"; 0; ->[STOCK_MOVEMENTS:40]Movement_Code:1; $_t_SRFormName; [STOCK_MOVEMENTS:40]Analysis_Code:9; False:C215; $_t_DocumentName)
SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
ERR_MethodTrackerReturn("Movements Prin2"; $_t_oldMethodName)
