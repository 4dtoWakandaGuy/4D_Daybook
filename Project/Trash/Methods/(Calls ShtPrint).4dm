//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls ShtPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SR_bo_Validated)
	C_LONGINT:C283($_l_PrintDone)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; $_t_CurrentWindowTitle; $_t_DocumentName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls ShtPrint")
//Calls ShtPrint
SR_bo_Validated:=False:C215

Menu_Record("Calls ShtPrint"; "Print Call Sheet")
If ([SERVICE_CALLS:20]Call_Code:4="")
	Calls_Code
End if 
DB_SaveRecord(->[SERVICE_CALLS:20])
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)

COPY NAMED SELECTION:C331([SERVICE_CALLS:20]; "Calls")
ONE RECORD SELECT:C189([SERVICE_CALLS:20])
DB_t_CurrentFormUsage:="One"
//Gen_PPSingle (->[SERVICE CALLS];"ServiceReport";"Calls Out";"Call Sheet";"Call Sheet";"Calls_SerRepLP";0;->vNo;"Call Sheet";◊PersAnal)
$_t_DocumentName:="Service Call "+[SERVICE_CALLS:20]Call_Code:4  // 05/04/04 pb
$_t_CurrentWindowTitle:=Get window title:C450
SET WINDOW TITLE:C213($_t_DocumentName)
$_l_PrintDone:=Gen_PPSingle(->[SERVICE_CALLS:20]; "ServiceReport"; "Calls Out"; "Call Sheet"; "Call Sheet"; "Calls_SerRepLP"; 0; ->vNo; "Call Sheet"; <>Per_t_CurrentDefaultAnalCode; False:C215; $_t_DocumentName)
SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
//OUTPUT LAYOUT("ServiceReport")
//PRINT SELECTION([SERVICE CALLS])
//OUTPUT LAYOUT("Calls Out")
USE NAMED SELECTION:C332("Calls")
CLEAR NAMED SELECTION:C333("Calls")
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[SERVICE_CALLS:20]Call_Code:4)
ERR_MethodTrackerReturn("Calls ShtPrint"; $_t_oldMethodName)