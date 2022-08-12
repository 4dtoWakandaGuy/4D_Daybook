//%attributes = {}

If (False:C215)
	//Project Method Name:      JOB_LBI_JCStages
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//Array BOOLEAN(JOB_lb_Stages;0)
	//Array POINTER(JOB_aptr_LBStageSettings;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOB_LBI_JCStages")

//added 15/02/07 - kmw
//duplicate of JOB_LBI_Stages but changed (back to the way it originally was?) to be specifc to JOB COSTING jobs

//``
$_t_oldMethodName:=ERR_MethodTracker("JOB_LBI_JCStages")
LISTBOX GET CELL POSITION:C971(JOB_lb_Stages; $_l_Column; $_l_Row)


If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->JOB_aptr_LBStageSettings; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=JOB_aptr_LBStageSettings{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		JobStagesJC_inLPX($_Ptr_ThisColumnField)  //the during phase procedure
		LBi_ModUpdate(->JOB_aptr_LBStageSettings; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		//Set pointers to the fields i want from the 'sub' records
		
	End if 
End if 
ERR_MethodTrackerReturn("JOB_LBI_JCStages"; $_t_oldMethodName)