//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_DelSubEntityLayers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_ApplicableLayerMOD;0)
	//ARRAY TEXT(ACC_at_ApplicableLayer;0)
	//ARRAY TEXT(ACC_at_ApplicableLayerDel;0)
	//ARRAY TEXT(ACC_at_ApplicableLayerNM;0)
	//ARRAY TEXT(ACC_at_LayerCodeandName;0)
	//ARRAY TEXT(ACC_at_LayerCodes;0)
	C_LONGINT:C283($_l_LayerRow; ACC_l_CurrentLayerStatus; bACC_l_DeleteLayer; ACC_but_AnalModifyLayer)
	C_TEXT:C284($_t_oldMethodName; ACC_t_curApplicableLayerCode; ACC_t_curApplicableLayerName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_DelSubEntityLayers")

//NG Feb 2004
//The method is only applicable within the form [ACCOUNTS]Accounts_in
//It is the script of the button bACC_l_DeleteLayer which adds an analyses(or clears an entry)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("ACC_DelSubEntityLayers"; Form event code:C388)
Case of 
	: (ACC_l_CurrentLayerStatus=0)
		//this button is not visible in this state
		// i am just putting it here for completness
	: (ACC_l_CurrentLayerStatus=1)
		//Item selected not edit
		//just clear back to status 0
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
		
	: (ACC_l_CurrentLayerStatus=2)
		//editing record
		//if existing ask user about clearing
		//else just clear
		//both go to status 0
		If (ACC_at_LayerCodes{0}#"")
			CONFIRM:C162("Are you sure you wish to delete this applicable Layer?")
			If (OK=1)
				
				$_l_LayerRow:=Find in array:C230(ACC_at_LayerCodes; ACC_at_LayerCodes{0})
				If ($_l_LayerRow>0)
					INSERT IN ARRAY:C227(ACC_at_ApplicableLayerDel; Size of array:C274(ACC_at_ApplicableLayerDel)+1; 1)
					ACC_at_ApplicableLayerDel{Size of array:C274(ACC_at_ApplicableLayerDel)}:=ACC_at_LayerCodes{0}
					DELETE FROM ARRAY:C228(ACC_at_ApplicableLayer; $_l_LayerRow; 1)
					DELETE FROM ARRAY:C228(ACC_at_ApplicableLayerNM; $_l_LayerRow; 1)
					DELETE FROM ARRAY:C228(ACC_abo_ApplicableLayerMOD; $_l_LayerRow; 1)
					
				Else 
					//error
				End if 
				
			End if 
			
		Else 
			//do nothing just clear
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
ERR_MethodTrackerReturn("ACC_DelSubEntityLayers"; $_t_oldMethodName)
