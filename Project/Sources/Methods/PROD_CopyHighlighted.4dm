//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_CopyHighlighted
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/03/2011 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_lb_Products;0)
	//ARRAY BOOLEAN(PROD_abo_PVCopied;0)
	ARRAY LONGINT:C221($_al_LBDraggedRows; 0)
	C_BLOB:C604(<>PROD_BL_DataBlob)
	C_LONGINT:C283($_l_CurrentRow; $_l_FieldNumber; $_l_LineIndex; $_l_offset; $_l_RecordNumber; $_l_TableNumber; $1; DB_l_ButtonClickedFunction; PROD_l_CallBackMProcess; vrow)
	C_TEXT:C284($_t_DiaryRecordCode; $_t_FormName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_CopyHighlighted")
//This button copies the highlighted lines to the order
ARRAY LONGINT:C221($_al_LBDraggedRows; 0)

//vrow:=AL_GetLine (CAT_PowerViewProds)
vrow:=$1
//$Result:=AL_GetSelect (CAT_PowerViewProds;$_al_LBDraggedRows)
LB_GetSelect(->CAT_lb_Products; ->$_al_LBDraggedRows)
If (Size of array:C274($_al_LBDraggedRows)=0)
	INSERT IN ARRAY:C227($_al_LBDraggedRows; 99; 1)
	$_al_LBDraggedRows{1}:=vRow
End if 


While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
	DelayTicks(60)
End while 
SET BLOB SIZE:C606(<>PROD_BL_DataBlob; 0)
$_l_offset:=0
For ($_l_LineIndex; 1; Size of array:C274($_al_LBDraggedRows))
	$_l_CurrentRow:=$_al_LBDraggedRows{$_l_LineIndex}
	VARIABLE TO BLOB:C532(PROD_at_ProductCodes{$_l_CurrentRow}; <>PROD_BL_DataBlob; *)
	VARIABLE TO BLOB:C532(PROD_ar_ActualQty{$_l_CurrentRow}; <>PROD_BL_DataBlob; *)
	VARIABLE TO BLOB:C532(PROD_ar_ActualSalesPrice{$_l_CurrentRow}; <>PROD_BL_DataBlob; *)
	//PROD_abo_PVCopied{$_l_CurrentRow}:=1
	PROD_abo_PVCopied{$_l_CurrentRow}:=True:C214
End for 
CLEAR SEMAPHORE:C144("$DataBlobinUse")  //release everyone
//the copied lines are now in a BLOB
//AL_UpdateArrays (CAT_PowerviewPRODS;-2)
If (PROD_l_CallBackMProcess>0)
	//SET PROCESS VARIABLE(PROD_l_CallBackMProcess;DB_l_ButtonClickedFunction;700)
	SET PROCESS VARIABLE:C370(PROD_l_CallBackMProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("CopyProduct"))
	POST OUTSIDE CALL:C329(PROD_l_CallBackMProcess)
End if 
ERR_MethodTrackerReturn("PROD_CopyHighlighted"; $_t_oldMethodName)
