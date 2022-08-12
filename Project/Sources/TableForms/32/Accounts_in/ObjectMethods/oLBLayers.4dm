If (False:C215)
	//object Name: [ACCOUNTS]Accounts_in.oLBLayers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2012 08:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_lb_LBLayers;0)
	//ARRAY TEXT(ACC_at_ApplicableLayer;0)
	//ARRAY TEXT(ACC_at_ApplicableLayerNM;0)
	//ARRAY TEXT(ACC_at_LayerCodeandName;0)
	//ARRAY TEXT(ACC_at_LayerCodes;0)
	//ARRAY TEXT(ACC_at_LayerNames;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_ColumnNumber; $_l_event; $_l_FieldNumber; $_l_Index; $_l_LayerCodeRow; $_l_Row; $_l_TableNumber; ACC_l_CurrentLayerStatus; bACC_l_DeleteLayer; ACC_but_AnalModifyLayer)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; ACC_t_ApplicableLayerNM; ACC_t_curApplicableLayerCode; ACC_t_curApplicableLayerName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_in.oLBLayers"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->ACC_lb_LBLayers; $_t_VariableName)
		If ($_l_Row>0)
			LB_SetChoiceList("aACClayers"; ->ACC_at_LayerCodeandName; ->ACC_at_ApplicableLayerNM)
			LB_GoToCell(->ACC_lb_LBLayers; 2; $_l_Row)
		End if 
		
		
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->ACC_lb_LBLayers; $_t_VariableName)
		If ($_l_Row>0)
			LB_SetChoiceList("aACClayers"; ->ACC_at_LayerCodeandName; ->ACC_at_ApplicableLayerNM)
			LB_GoToCell(->ACC_lb_LBLayers; 2; $_l_Row)
		End if 
	: ($_l_event=On Data Change:K2:15)  //| ($_l_event=On Mouse Leave)
		//TRACE
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_bo_OK:=True:C214
		$_l_ColumnNumber:=LB_GetColumn(->ACC_lb_LBLayers; $_t_VariableName)
		If ($_l_Row>0) & ($_l_ColumnNumber=2)
			ACC_at_LayerCodeandName:=Find in array:C230(ACC_at_LayerCodeandName; ACC_at_ApplicableLayerNM{$_l_Row})
			If (ACC_at_LayerCodeandName<0)
				For ($_l_Index; 1; Size of array:C274(ACC_at_LayerCodeandName))
					If (Position:C15(ACC_at_ApplicableLayerNM{$_l_Row}; ACC_at_LayerNames{$_l_Index})=1)
						ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_at_LayerCodeandName{$_l_Index}
						ACC_at_LayerCodeandName:=$_l_Index
						$_l_Index:=Size of array:C274(ACC_at_LayerCodeandName)+1
					End if 
				End for 
			End if 
			If (ACC_at_LayerCodeandName>0)
				If (ACC_at_LayerCodes{ACC_at_LayerCodeandName}#ACC_t_curApplicableLayerCode)
					//different item selected
					If (ACC_at_ApplicableLayer{0}#"")
						//editing an existing record
						If (ACC_at_LayerCodes{ACC_at_LayerCodeandName}#ACC_at_ApplicableLayer{0})
							//not being set to original value either
							$_l_LayerCodeRow:=Find in array:C230(ACC_at_ApplicableLayer; ACC_at_LayerCodes{ACC_at_LayerCodeandName})
							If ($_l_LayerCodeRow>0) & ($_l_LayerCodeRow#$_l_Row)
								
								ALERT:C41("There is already an applicable layer "+ACC_at_LayerCodes{ACC_at_LayerCodeandName}; "Stop")
								ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_at_ApplicableLayerNM{0}
								ACC_at_ApplicableLayer{$_l_Row}:=ACC_at_ApplicableLayer{0}
								$_bo_OK:=False:C215
							Else 
								ACC_t_curApplicableLayerCode:=ACC_at_LayerCodes{ACC_at_LayerCodeandName}
								ACC_t_curApplicableLayerName:=ACC_at_LayerNames{ACC_at_LayerCodeandName}
								ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_t_curApplicableLayerName
								ACC_at_ApplicableLayer{$_l_Row}:=ACC_t_curApplicableLayerCode
								
							End if 
						Else 
							//setting back to saved version
							ACC_t_curApplicableLayerCode:=ACC_at_LayerCodes{ACC_at_LayerCodeandName}
							ACC_t_ApplicableLayerNM:=ACC_at_LayerNames{ACC_at_LayerCodeandName}
							ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_t_curApplicableLayerName
							ACC_at_ApplicableLayer{$_l_Row}:=ACC_t_curApplicableLayerCode
							
						End if 
					Else 
						//entering a new one
						$_l_LayerCodeRow:=Find in array:C230(ACC_at_ApplicableLayer; ACC_at_LayerCodes{ACC_at_LayerCodeandName})
						If ($_l_LayerCodeRow>0) & ($_l_LayerCodeRow#$_l_Row)
							ALERT:C41("There is already an applicable Layer "+ACC_at_LayerCodes{ACC_at_LayerCodeandName}; "Stop")
							ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_at_ApplicableLayerNM{0}
							ACC_at_ApplicableLayer{$_l_Row}:=ACC_at_ApplicableLayer{0}
							$_bo_OK:=False:C215
						Else 
							ACC_t_curApplicableLayerCode:=ACC_at_LayerCodes{ACC_at_LayerCodeandName}
							ACC_t_curApplicableLayerName:=ACC_at_LayerNames{ACC_at_LayerCodeandName}
							ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_t_curApplicableLayerName
							ACC_at_ApplicableLayer{$_l_Row}:=ACC_t_curApplicableLayerCode
							
						End if 
						
					End if 
				End if   //not selection
			Else 
				$_bo_OK:=False:C215
				ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_at_ApplicableLayerNM{0}
				
			End if 
			If ($_bo_OK)
				OBJECT SET LIST BY NAME:C237(ACC_at_ApplicableLayerNM; "")
				//Here save and set the button back to add
				OBJECT SET TITLE:C194(bACC_l_DeleteLayer; "Clear")
				OBJECT SET VISIBLE:C603(bACC_l_DeleteLayer; False:C215)
				OBJECT SET TITLE:C194(ACC_but_AnalModifyLayer; "Add")
				ACC_l_CurrentLayerStatus:=0
				OBJECT SET VISIBLE:C603(ACC_at_LayerCodeandName; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerCode; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerName; False:C215)
				OBJECT SET VISIBLE:C603(ACC_but_AnalModifyLayer; True:C214)
				ACC_t_curApplicableLayerCode:=""
				ACC_t_curApplicableLayerName:=""
				ACC_at_LayerCodeandName:=0
				ACC_at_ApplicableLayer{0}:=""
				ACC_at_ApplicableLayer:=0
				ACC_at_LayerCodes{0}:=""
				ACC_at_LayerCodes:=0
			End if 
		End if 
	: ($_l_event=On Mouse Enter:K2:33)
	: ($_l_event=On Mouse Move:K2:35)
	: ($_l_event=On Mouse Leave:K2:34)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_bo_OK:=True:C214
		$_l_ColumnNumber:=LB_GetColumn(->ACC_lb_LBLayers; $_t_VariableName)
		If ($_l_Row>0) & ($_l_Row>=Size of array:C274(ACC_at_ApplicableLayerNM))
			//& ($_l_ColumnNumber=2)
			//TRACE
			ACC_at_LayerCodeandName:=Find in array:C230(ACC_at_LayerCodeandName; ACC_at_ApplicableLayerNM{$_l_Row})
			If (ACC_at_LayerCodeandName>0)
				If (ACC_at_LayerCodes{ACC_at_LayerCodeandName}#ACC_t_curApplicableLayerCode)
					//different item selected
					If (ACC_at_ApplicableLayer{0}#"")
						//editing an existing record
						If (ACC_at_LayerCodes{ACC_at_LayerCodeandName}#ACC_at_ApplicableLayer{0})
							//not being set to original value either
							$_l_LayerCodeRow:=Find in array:C230(ACC_at_ApplicableLayer; ACC_at_LayerCodes{ACC_at_LayerCodeandName})
							If ($_l_LayerCodeRow>0) & ($_l_LayerCodeRow#$_l_Row)
								
								ALERT:C41("There is already an applicable Layer "+ACC_at_LayerCodes{ACC_at_LayerCodeandName}; "Stop")
								ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_at_ApplicableLayerNM{0}
								ACC_at_ApplicableLayer{$_l_Row}:=ACC_at_ApplicableLayer{0}
								$_bo_OK:=False:C215
							Else 
								ACC_t_curApplicableLayerCode:=ACC_at_LayerCodes{ACC_at_LayerCodeandName}
								ACC_t_curApplicableLayerName:=ACC_at_LayerNames{ACC_at_LayerCodeandName}
								ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_t_curApplicableLayerName
								ACC_at_ApplicableLayer{$_l_Row}:=ACC_t_curApplicableLayerCode
								
							End if 
						Else 
							//setting back to saved version
							ACC_t_curApplicableLayerCode:=ACC_at_LayerCodes{ACC_at_LayerCodeandName}
							ACC_t_curApplicableLayerName:=ACC_at_LayerNames{ACC_at_LayerCodeandName}
							ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_t_curApplicableLayerName
							ACC_at_ApplicableLayer{$_l_Row}:=ACC_t_curApplicableLayerCode
							
						End if 
					Else 
						//entering a new one
						$_l_LayerCodeRow:=Find in array:C230(ACC_at_ApplicableLayer; ACC_at_LayerCodes{ACC_at_LayerCodeandName})
						If ($_l_LayerCodeRow>0)
							ALERT:C41("There is already an applicable Layer "+ACC_at_LayerCodes{ACC_at_LayerCodeandName}; "Stop")
							ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_at_ApplicableLayerNM{0}
							ACC_at_ApplicableLayer{$_l_Row}:=ACC_at_ApplicableLayer{0}
							$_bo_OK:=False:C215
						Else 
							ACC_t_curApplicableLayerCode:=ACC_at_LayerCodes{ACC_at_LayerCodeandName}
							ACC_t_curApplicableLayerName:=ACC_at_LayerNames{ACC_at_LayerCodeandName}
							ACC_at_ApplicableLayerNM{$_l_Row}:=ACC_t_curApplicableLayerName
							ACC_at_ApplicableLayer{$_l_Row}:=ACC_t_curApplicableLayerCode
							
						End if 
						
					End if 
				End if   //not selection
			Else 
				$_bo_OK:=False:C215
			End if 
			If ($_bo_OK)
				OBJECT SET LIST BY NAME:C237(ACC_at_ApplicableLayerNM; "")
				//Here save and set the button back to add
				OBJECT SET TITLE:C194(bACC_l_DeleteLayer; "Clear")
				OBJECT SET VISIBLE:C603(bACC_l_DeleteLayer; False:C215)
				OBJECT SET TITLE:C194(ACC_but_AnalModifyLayer; "Add")
				ACC_l_CurrentLayerStatus:=0
				OBJECT SET VISIBLE:C603(ACC_at_LayerCodeandName; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerCode; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerName; False:C215)
				OBJECT SET VISIBLE:C603(ACC_but_AnalModifyLayer; True:C214)
				ACC_t_curApplicableLayerCode:=""
				ACC_t_curApplicableLayerName:=""
				ACC_at_LayerCodeandName:=0
				ACC_at_ApplicableLayer{0}:=""
				ACC_at_ApplicableLayer:=0
				ACC_at_LayerCodes{0}:=""
				ACC_at_LayerCodes:=0
			End if 
		End if 
		
	Else 
		//TRACE
		
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_in.oLBLayers"; $_t_oldMethodName)
