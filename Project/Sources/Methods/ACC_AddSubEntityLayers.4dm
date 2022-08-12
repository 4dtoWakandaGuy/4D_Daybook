//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_AddSubEntityLayers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2012 19:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_ApplicableLayerMOD;0)
	//ARRAY BOOLEAN(ACC_lb_LBLayers;0)
	//ARRAY TEXT(ACC_at_ApplicableLayer;0)
	//ARRAY TEXT(ACC_at_ApplicableLayerNM;0)
	//ARRAY TEXT(ACC_at_LayerCodeandName;0)
	//ARRAY TEXT(ACC_at_LayerCodes;0)
	//ARRAY TEXT(ACC_at_LayerNames;0)
	C_LONGINT:C283($_l_LayerRow; $_l_LayerRow2; $_l_SizeofArray; ACC_l_CurrentLayerStatus; bACC_l_DeleteLayer; ACC_but_AnalModifyLayer)
	C_TEXT:C284($_t_oldMethodName; $1; ACC_t_curApplicableLayerCode; ACC_t_curApplicableLayerName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_AddSubEntityLayers")

//NG Feb 2004
//The method is only applicable within the form [ACCOUNTS]Accounts_in
//It is the script of the button ACC_but_AnalModifyLayer which adds a new layer(or set a highlighted one to edit)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("ACC_AddSubEntityLayers"; Form event code:C388)
Case of 
	: (ACC_l_CurrentLayerStatus=0)
		OBJECT SET VISIBLE:C603(bACC_l_DeleteLayer; True:C214)
		OBJECT SET VISIBLE:C603(ACC_at_LayerCodeandName; True:C214)
		OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerCode; True:C214)
		OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerName; True:C214)
		ACC_t_curApplicableLayerCode:=""
		ACC_t_curApplicableLayerName:=""
		ACC_at_LayerCodeandName:=0
		ACC_at_ApplicableLayer{0}:=""
		ACC_at_ApplicableLayer:=0
		ACC_at_LayerCodes{0}:=""
		ACC_at_LayerCodes:=0
		OBJECT SET TITLE:C194(bACC_l_DeleteLayer; "Clear")
		OBJECT SET TITLE:C194(ACC_but_AnalModifyLayer; "Save")
		ACC_l_CurrentLayerStatus:=2
		If (Count parameters:C259>=1)
			If ($1="Listbox")
				OBJECT SET VISIBLE:C603(bACC_l_DeleteLayer; False:C215)
				OBJECT SET VISIBLE:C603(ACC_at_LayerCodeandName; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerCode; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerName; False:C215)
				LB_SetEnterable(->ACC_lb_LBLayers; True:C214; 2)
				
				$_l_SizeofArray:=Size of array:C274(ACC_at_ApplicableLayer)
				//LISTBOX INSERT ROW(ACC_lb_Analysis;1)
				INSERT IN ARRAY:C227(ACC_at_ApplicableLayer; 1; 1)
				INSERT IN ARRAY:C227(ACC_at_ApplicableLayerNM; 1; 1)
				INSERT IN ARRAY:C227(ACC_abo_ApplicableLayerMOD; 1; 1)
				
				ACC_at_ApplicableLayer{0}:=""
				ACC_at_ApplicableLayerNM{0}:=""
				GOTO OBJECT:C206(ACC_lb_LBLayers)
				LB_SetChoiceList("aACClayers"; ->ACC_at_LayerCodeandName; ->ACC_at_ApplicableLayerNM)
				LB_GoToCell(->ACC_lb_LBLayers; 2; 1)
				OBJECT SET VISIBLE:C603(ACC_but_AnalModifyLayer; False:C215)
			End if 
		End if 
		
	: (ACC_l_CurrentLayerStatus=1)
		//item is selected not in edit mode
		//(Button text will say 'Edit')
		OBJECT SET VISIBLE:C603(ACC_at_LayerCodeandName; True:C214)
		OBJECT SET VISIBLE:C603(bACC_l_DeleteLayer; True:C214)
		ACC_l_CurrentLayerStatus:=2
		OBJECT SET TITLE:C194(ACC_but_AnalModifyLayer; "Save")
		OBJECT SET TITLE:C194(bACC_l_DeleteLayer; "Delete")
	: (ACC_l_CurrentLayerStatus=2)
		//editing (button text says save)
		
		If (ACC_at_LayerCodes{0}#ACC_t_curApplicableLayerCode)
			//item is modified
			//NOTE: the code in the pop-up prevents selection of an existing value
			Case of 
				: (ACC_at_LayerCodes{0}#"")
					//editing an existing entry
					CONFIRM:C162("Change "+ACC_at_LayerCodes{0}+" to "+ACC_t_curApplicableLayerCode)
					If (OK=1)
						$_l_LayerRow:=Find in array:C230(ACC_at_ApplicableLayer; ACC_at_LayerCodes{0})
						If ($_l_LayerRow>0)
							ACC_at_ApplicableLayer{$_l_LayerRow}:=ACC_t_curApplicableLayerCode
							$_l_LayerRow2:=Find in array:C230(ACC_at_LayerCodes; ACC_t_curApplicableLayerCode)
							ACC_at_ApplicableLayerNM{$_l_LayerRow}:=ACC_at_LayerNames{$_l_LayerRow2}
							ACC_abo_ApplicableLayerMOD{$_l_LayerRow}:=True:C214
						Else 
							//error
						End if 
						
					End if 
				: (ACC_at_LayerCodes{0}="")
					//entering a new one
					CONFIRM:C162("Save additional applicable Layer "+ACC_t_curApplicableLayerCode+"?")
					If (OK=1)
						INSERT IN ARRAY:C227(ACC_at_ApplicableLayer; Size of array:C274(ACC_at_ApplicableLayer)+1; 1)  //to hold the current subrecords
						INSERT IN ARRAY:C227(ACC_at_ApplicableLayerNM; Size of array:C274(ACC_at_ApplicableLayerNM)+1; 1)  //to hold the current subrecords
						INSERT IN ARRAY:C227(ACC_abo_ApplicableLayerMOD; Size of array:C274(ACC_abo_ApplicableLayerMOD)+1; 1)  //to track modified
						ACC_at_ApplicableLayer{Size of array:C274(ACC_at_ApplicableLayer)}:=ACC_t_curApplicableLayerCode
						$_l_LayerRow2:=Find in array:C230(ACC_at_LayerCodes; ACC_t_curApplicableLayerCode)
						ACC_at_ApplicableLayerNM{Size of array:C274(ACC_at_ApplicableLayerNM)}:=ACC_at_LayerNames{$_l_LayerRow2}
						ACC_abo_ApplicableLayerMOD{Size of array:C274(ACC_abo_ApplicableLayerMOD)}:=True:C214
						
						
						
					End if 
					
			End case 
			
			
		End if 
		OBJECT SET TITLE:C194(bACC_l_DeleteLayer; "Clear")
		OBJECT SET VISIBLE:C603(bACC_l_DeleteLayer; False:C215)
		OBJECT SET TITLE:C194(ACC_but_AnalModifyLayer; "Add")
		ACC_l_CurrentLayerStatus:=0
		OBJECT SET VISIBLE:C603(ACC_at_LayerCodeandName; False:C215)
		OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerCode; False:C215)
		OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerName; False:C215)
		ACC_t_curApplicableLayerCode:=""
		ACC_t_curApplicableLayerName:=""
		ACC_at_LayerCodeandName:=0
		ACC_at_ApplicableLayer{0}:=""
		ACC_at_ApplicableLayer:=0
		ACC_at_LayerCodes{0}:=""
		ACC_at_LayerCodes:=0
End case 
ERR_MethodTrackerReturn("ACC_AddSubEntityLayers"; $_t_oldMethodName)
