If (False:C215)
	//object Name: [USER]PURCH_ItemSelector.iReceived1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2010 12:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PI_abo_CopyItem;0)
	//ARRAY BOOLEAN(PI_abo_MarkItem;0)
	//ARRAY LONGINT(PI_al_dCopyItem;0)
	//ARRAY LONGINT(PI_al_dMarkItem;0)
	C_LONGINT:C283($_l_Index; $_l_Settings)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PURCH_ItemSelector.iReceived1"; Form event code:C388)

If (Size of array:C274(PI_al_dMarkItem)>0)
	$_l_Settings:=Abs:C99(PI_al_dMarkItem{1}-1)
	For ($_l_Index; 1; Size of array:C274(PI_al_dMarkItem))
		PI_al_dMarkItem{$_l_Index}:=$_l_Settings
		PI_abo_MarkItem{$_l_Index}:=(PI_al_dMarkItem{$_l_Index}=1)
		If (PI_abo_MarkItem{$_l_Index})
			PI_al_dCopyItem{$_l_Index}:=$_l_Settings
			PI_abo_CopyItem{$_l_Index}:=(PI_al_dCopyItem{$_l_Index}=1)
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("OBJ [USER].PURCH_ItemSelector.iReceived1"; $_t_oldMethodName)
