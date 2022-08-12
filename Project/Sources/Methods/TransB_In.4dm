//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 06:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_bo_ConsilidatedView; vFromIn)
	C_LONGINT:C283($_l_addMode; Vadd; vCM; vTr)
	C_TEXT:C284($_t_actionName; $_t_oldMethodName; DB_t_CallOnCloseorSave; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_In")
//TransB in
$_t_actionName:="Enter Trans Batch"
ACC_bo_ConsilidatedView:=True:C214
Start_Process
TransB_File
If (vTr=1)
	If (In_Allowed($_t_actionName; ->[TRANSACTION_BATCHES:30]))
		If (DB_GetLedgerVatInputACC#"")
			$_l_addMode:=Vadd
			vAdd:=1
			vFromIn:=False:C215
			//Tell TransactionBatch_Post this is a Nom Trans Batch
			vCM:=99
			//  START TRANSACTION
			StartTransaction  // 13/05/02 pb
			
			Open_Pro_Window($_t_actionName; 0; 2; ->[TRANSACTION_BATCHES:30]; WIN_t_CurrentInputForm)
			
			ADD RECORD:C56([TRANSACTION_BATCHES:30]; *)
			If (DB_t_CallOnCloseorSave="AS")  //for Access Switch
				OK:=1  //Necessary cos it wrongly returns 0
			End if 
			Transact_End
			Close_ProWin(Table name:C256(->[TRANSACTION_BATCHES:30])+"_"+WIN_t_CurrentInputForm)
			
			vAdd:=$_l_addMode
		Else 
			Gen_Alert("The VAT Return Account must first be specified in Preferences"; "Cancel")
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("TransB_In"; $_t_oldMethodName)