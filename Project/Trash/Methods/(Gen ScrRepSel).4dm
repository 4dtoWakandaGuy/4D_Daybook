//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen ScrRepSel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a01Real1)
	//C_UNKNOWN(a01Real2)
	//C_UNKNOWN(a01Real3)
	//C_UNKNOWN(a01Real4)
	//C_UNKNOWN(a01Real5)
	//C_UNKNOWN(a01Real6)
	//C_UNKNOWN(a01Stri1)
	//C_UNKNOWN(a01Stri2)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	C_BOOLEAN:C305($_bo_OptionKey)
	C_LONGINT:C283($_l_Index; $_l_LineRow; $_l_SizeofArray; $_l_SizeofArray2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen ScrRepSel")
//Gen ScrRepSel

ARRAY LONGINT:C221($_al_Lines; 0)

LB_GetSelect(->GEN_lb_ItemsArea; ->$_al_Lines)

$_l_SizeofArray:=Size of array:C274($_al_Lines)
If ($_l_SizeofArray>0)
	$_bo_OptionKey:=Gen_Option
	$_l_SizeofArray2:=Size of array:C274(a01Stri1)
	For ($_l_Index; $_l_SizeofArray2; 1; -1)
		$_l_LineRow:=Find in array:C230($_al_Lines; $_l_Index)
		If ((($_l_LineRow<1) & ($_bo_OptionKey=False:C215)) | (($_l_LineRow>0) & ($_bo_OptionKey)))
			DELETE FROM ARRAY:C228(a01Stri1; $_l_Index; 1)
			DELETE FROM ARRAY:C228(a01Stri2; $_l_Index; 1)
			DELETE FROM ARRAY:C228(a01Real1; $_l_Index; 1)
			DELETE FROM ARRAY:C228(a01Real2; $_l_Index; 1)
			DELETE FROM ARRAY:C228(a01Real3; $_l_Index; 1)
			DELETE FROM ARRAY:C228(a01Real4; $_l_Index; 1)
			DELETE FROM ARRAY:C228(a01Real5; $_l_Index; 1)
			DELETE FROM ARRAY:C228(a01Real6; $_l_Index; 1)
		End if 
	End for 
End if 

//AL_UpdateArrays (eAlContI;-2)`NG THis is not needed for list box
ERR_MethodTrackerReturn("Gen ScrRepSel"; $_t_oldMethodName)