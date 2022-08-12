//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_EditCodeFormats
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/06/2010 09:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PC_bo_CancelEdits)
	C_LONGINT:C283($_l_WindowReference; $0; PC_l_CurrentLoadedFormat; PRC_l_DefaultFormatID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_EditCodeFormats")
//THis will open the code formats editor. If you pass an ID number into the function the editor will open with that format selected
PC_bo_CancelEdits:=True:C214
StartTransaction

$_l_WindowReference:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1; "Edit Product Code Formats"; "PC_CLose")

DIALOG:C40("PROD_CODE_BUILDFORMATS")
CLOSE WINDOW:C154
If (PC_bo_CancelEdits)
	//CANCEL TRANSACTION
	Transact_End(False:C215)
	$0:=0
Else 
	$0:=PC_l_CurrentLoadedFormat
	//VALIDATE TRANSACTION
	Transact_End(True:C214)
End if 
ERR_MethodTrackerReturn("PRD_EditCodeFormats"; $_t_oldMethodName)
