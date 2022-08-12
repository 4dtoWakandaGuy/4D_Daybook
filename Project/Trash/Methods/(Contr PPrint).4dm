//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contr PPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/11/2009 14:00:13If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SR_bo_Validated)
	C_LONGINT:C283($_l_Printed)
	C_TEXT:C284($_t_CurrentWindowTitle; $_t_DocumentName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contr PPrint")
//Contr PPrint
SR_bo_Validated:=False:C215
Menu_Record("Contr PPrint"; "Print a Contract")
If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	
End if 
[CONTRACTS:17]Contract_Cost:7:=Sum:C1([ORDER_ITEMS:25]Contract_Cost:30)
If (Modified record:C314([CONTRACTS:17]))
	DB_SaveRecord(->[CONTRACTS:17])
End if 
Contr_PP1
//ONE RECORD SELECT([CONTRACTS])
//OUTPUT LAYOUT([CONTRACTS];"Contracts Form")
//Gen_PPSingle (->[CONTRACTS];"Contracts Form";"Contracts Out";"";"Contract Form";"Contr_PPFormLP";0;->[CONTRACTS]Contract Code;"Contract";"")
$_t_DocumentName:="Contract  "+[CONTRACTS:17]Contract_Code:3  // 05/04/04 pb
$_t_CurrentWindowTitle:=Get window title:C450
SET WINDOW TITLE:C213($_t_DocumentName)
$_l_Printed:=Gen_PPSingle(->[CONTRACTS:17]; "Contracts Form"; "Contracts Out"; ""; "Contract Form"; "Contr_PPFormLP"; 0; ->[CONTRACTS:17]Contract_Code:3; "Contract"; ""; False:C215; $_t_DocumentName)
SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
//PRINT SELECTION([CONTRACTS])
//OUTPUT LAYOUT([CONTRACTS];"Contracts Out")
Contr_PP2
ERR_MethodTrackerReturn("Contr PPrint"; $_t_oldMethodName)