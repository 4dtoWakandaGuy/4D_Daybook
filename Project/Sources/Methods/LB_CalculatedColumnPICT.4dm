//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_CalculatedColumnPICT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/11/2014 17:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_Picture)
	C_BOOLEAN:C305($_bo_addtoArrays; LB_FM_COLUMCalcsInited)
	C_LONGINT:C283($_l_ArraySize; $_l_Event; $_l_Index; $_l_KeyFieldColumn; $_l_PictureColumn; $_l_Type2)
	C_PICTURE:C286($_pic_ThisPicture; $0)
	C_POINTER:C301($_ptr_ActiveArrayColumn; $_ptr_ArrayReferences; $_ptr_IndexColumn; $_Ptr_KeyField; $_ptr_ListboxSetup; $_ptr_OtherIndexColumn; $_ptr_PictureColumn; $_ptr_ThisArray)
	C_TEXT:C284($_t_Formula; $_t_LevelID; $_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_CalculatedColumnPICT")
BASE64 DECODE:C896($4; $_blb_Picture)
$_t_Formula:=BLOB to text:C555($_blb_Picture; 0)
If (Not:C34(LB_FM_COLUMCalcsInited))
	LB_InitCacheArrays
End if 
$_ptr_ListboxSetup:=Get pointer:C304($1)

$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
$_t_LevelID:=$_ptr_ArrayReferences->{1}
$_l_Type2:=Type:C295($_Ptr_KeyField->)
If (Num:C11($2)>10)
	
	$_ptr_PictureColumn:=Get pointer:C304("LB_aPic_FMResult_"+$3+"_"+($2))
Else 
	$_ptr_PictureColumn:=Get pointer:C304("LB_aPic_FMResult_"+$3+"_0"+($2))
	
End if 
If (Type:C295($_Ptr_KeyField->)=Is longint:K8:6)
	$_ptr_IndexColumn:=Get pointer:C304("LB_al_Index_"+$3)
	$_ptr_OtherIndexColumn:=Get pointer:C304("LB_at_Index_"+$3)
Else 
	$_ptr_IndexColumn:=Get pointer:C304("LB_at_Index_"+$3)
	$_ptr_OtherIndexColumn:=Get pointer:C304("LB_al_Index_"+$3)
End if 
$_ptr_ActiveArrayColumn:=Get pointer:C304("LB_at_ActiveArrays_"+$3)
$_l_Event:=Form event code:C388
$_l_KeyFieldColumn:=Find in array:C230($_ptr_IndexColumn->; $_Ptr_KeyField->)
$_bo_addtoArrays:=False:C215
If ($_l_KeyFieldColumn<0)
	$_bo_addtoArrays:=True:C214
End if 
$_l_PictureColumn:=Find in array:C230($_ptr_ActiveArrayColumn->; $_ptr_PictureColumn)
If ($_l_PictureColumn<0)
	If (Size of array:C274($_ptr_ActiveArrayColumn->)>0)
		$_ptr_ThisArray:=$_ptr_ActiveArrayColumn->{1}
		$_l_ArraySize:=Size of array:C274($_ptr_ThisArray->)
		ARRAY DATE:C224($_ptr_PictureColumn->; $_l_ArraySize)
	End if 
	APPEND TO ARRAY:C911($_ptr_ActiveArrayColumn->; $_ptr_PictureColumn)
End if 
If ($_l_Event=On Data Change:K2:15) | ($_l_KeyFieldColumn<0)
	EXECUTE FORMULA:C63("$_pic_ThisPicture:="+$4)
	If ($_l_KeyFieldColumn<0)
		If (Type:C295($_Ptr_KeyField->)=Is longint:K8:6)
			APPEND TO ARRAY:C911($_ptr_OtherIndexColumn->; "")
			APPEND TO ARRAY:C911($_ptr_IndexColumn->; $_Ptr_KeyField->)
		Else 
			APPEND TO ARRAY:C911($_ptr_OtherIndexColumn->; 0)
			APPEND TO ARRAY:C911($_ptr_IndexColumn->; $_Ptr_KeyField->)
		End if 
		For ($_l_Index; 1; Size of array:C274($_ptr_ActiveArrayColumn->))
			$_ptr_ThisArray:=$_ptr_ActiveArrayColumn->{$_l_Index}
			$_l_ArraySize:=Size of array:C274($_ptr_ThisArray->)
			INSERT IN ARRAY:C227($_ptr_ThisArray->; $_l_ArraySize+1; 1)
		End for 
		$_ptr_PictureColumn->{Size of array:C274($_ptr_PictureColumn->)}:=$_pic_ThisPicture
	Else 
		$_ptr_PictureColumn->{$_l_KeyFieldColumn}:=$_pic_ThisPicture
	End if 
	$0:=$_pic_ThisPicture
Else 
	$0:=$_ptr_PictureColumn->{$_l_KeyFieldColumn}
End if 
ERR_MethodTrackerReturn("LB_CalculatedColumnPICT"; $_t_oldMethodName)