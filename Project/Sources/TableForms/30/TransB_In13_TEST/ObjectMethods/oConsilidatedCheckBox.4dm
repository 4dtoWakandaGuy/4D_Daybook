If (False:C215)
	//object Name: [TRANSACTION_BATCHES]TransB_In13_TEST.oConsilidatedCheckBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_BatchItemAnalysisCode;0)
	C_BOOLEAN:C305(ACC_bo_ConsilidatedView)
	C_LONGINT:C283($_l_SizeofArray; ACC_l_ConsilidatedView)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].TransB_In13_TEST.oConsilidatedCheckBox"; Form event code:C388)
ACC_bo_ConsilidatedView:=(ACC_l_ConsilidatedView=1)
$_l_SizeofArray:=Size of array:C274(ACC_at_BatchItemAnalysisCode)

ACC_TransSetDisplay("Trans_SetDisplay"; $_l_SizeofArray)
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].TransB_In13_TEST.oConsilidatedCheckBox"; $_t_oldMethodName)
