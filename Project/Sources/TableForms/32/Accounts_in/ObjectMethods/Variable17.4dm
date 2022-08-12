If (False:C215)
	//object Name: [ACCOUNTS]Accounts_in.Variable17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_ApplicableLayer;0)
	//ARRAY TEXT(ACC_at_LayerCodeandName;0)
	//ARRAY TEXT(ACC_at_LayerCodes;0)
	//ARRAY TEXT(ACC_at_LayerNames;0)
	C_LONGINT:C283($_l_event; $_l_LayerRow)
	C_TEXT:C284($_t_oldMethodName; ACC_t_curApplicableLayerCode; ACC_t_curApplicableLayerName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_in.Variable17"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (ACC_at_LayerCodes{ACC_at_LayerCodeandName}#ACC_t_curApplicableLayerCode)
			//different item selected
			If (ACC_at_ApplicableLayer{0}#"")
				//editing an existing record
				If (ACC_at_LayerCodes{ACC_at_LayerCodeandName}#ACC_at_ApplicableLayer{0})
					//not being set to original value either
					$_l_LayerRow:=Find in array:C230(ACC_at_ApplicableLayer; ACC_at_LayerCodes{ACC_at_LayerCodeandName})
					If ($_l_LayerRow>0)
						ALERT:C41("There is already an applicable Layer "+ACC_at_LayerCodes{ACC_at_LayerCodeandName}; "Stop")
					Else 
						ACC_t_curApplicableLayerCode:=ACC_at_LayerCodes{ACC_at_LayerCodeandName}
						ACC_t_curApplicableLayerName:=ACC_at_LayerNames{ACC_at_LayerCodeandName}
					End if 
				Else 
					//setting back to saved version
					ACC_t_curApplicableLayerCode:=ACC_at_LayerCodes{ACC_at_LayerCodeandName}
					ACC_t_curApplicableLayerName:=ACC_at_LayerNames{ACC_at_LayerCodeandName}
				End if 
			Else 
				//entering a new one
				$_l_LayerRow:=Find in array:C230(ACC_at_ApplicableLayer; ACC_at_LayerCodes{ACC_at_LayerCodeandName})
				If ($_l_LayerRow>0)
					ALERT:C41("There is already an applicable Layer "+ACC_at_LayerCodes{ACC_at_LayerCodeandName}; "Stop")
				Else 
					ACC_t_curApplicableLayerCode:=ACC_at_LayerCodes{ACC_at_LayerCodeandName}
					ACC_t_curApplicableLayerName:=ACC_at_LayerNames{ACC_at_LayerCodeandName}
				End if 
				
			End if 
		End if   //not selection
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_in.Variable17"; $_t_oldMethodName)
