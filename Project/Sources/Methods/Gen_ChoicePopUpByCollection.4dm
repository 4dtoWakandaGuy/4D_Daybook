//%attributes = {}

If (False:C215)
	//Project Method Name:      Gen_ChoicePopUpByCollection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305($_bo_ShowCreate; Gen_bo_Create; GEN_Bo_ShowCreate)
	C_COLLECTION:C1488($_Col_SelectionList; $_col_window)
	C_LONGINT:C283($_l_Bottom; $_l_CurrentWinRefOLD; $_l_Fill; $_l_Left; $_l_OBottom; $_l_OLeft; $_l_ORight; $_l_OTop; $_l_Right; $_l_Top; WIN_l_CurrentWinRef)
	C_OBJECT:C1216($_obj_PopUpParameters; $_obj_ValidationProperties; $1)
	C_TEXT:C284($_t_CancelTitle; $_t_ObjectName; $_t_OKTitle; $_t_WindowTitle)
End if 
//Code Starts Here
//this is a replacedment for Gen_ChoicePOpupCall.
//instead of a pointer to an array in $1 we have a collection passed in the object
//the selected VALUE is passed back in the object and the selected item-so either can be used and of course 'add' is also passed back in the object
If (Count parameters:C259>=1)
	$_obj_PopUpParameters:=$1
	$_bo_ShowCreate:=False:C215
	$_t_WindowTitle:=""
	$_t_OKTitle:=""
	If (Not:C34($_obj_PopUpParameters.CollectionList=Null:C1517))
		$_Col_SelectionList:=$_obj_PopUpParameters.CollectionList
	End if 
	If (Not:C34($_obj_PopUpParameters.ShowCreate=Null:C1517))
		$_bo_ShowCreate:=$_obj_PopUpParameters.ShowCreate
	End if 
	If (Not:C34($_obj_PopUpParameters.WindowTitle=Null:C1517))
		$_t_WindowTitle:=$_obj_PopUpParameters.WindowTitle
	End if 
	If (Not:C34($_obj_PopUpParameters.OkButtonText=Null:C1517))
		$_t_OKTitle:=$_obj_PopUpParameters.OkButtonText
	End if 
	If (Not:C34($_obj_PopUpParameters.CancelButtonText=Null:C1517))
		$_t_CancelTitle:=$_obj_PopUpParameters.CancelButtonText
	End if 
	If (Not:C34($_obj_PopUpParameters.WindowValues=Null:C1517))
		
		$_col_window:=$_obj_PopUpParameters.WindowValues  //this is a collection either 2 or 4 parameters left top right bottom
		Case of 
			: ($_col_window.length=2)
				$_l_Left:=$_col_window[0]
				$_l_Right:=$_l_Left
				$_l_Top:=$_col_window[1]
				$_l_Bottom:=$_l_Top
				
				
			: ($_col_window.length=4)
				$_l_Left:=$_col_window[0]
				$_l_Right:=$_col_window[1]
				$_l_Top:=$_col_window[2]
				$_l_Bottom:=$_col_window[3]
			Else 
				$_l_OLeft:=Screen width:C187/2
				$_l_OTop:=Screen height:C188/2
				$_l_ORight:=Screen width:C187/2
				$_l_OBottom:=Screen height:C188/2
		End case 
	Else 
		$_l_OLeft:=Screen width:C187/2
		$_l_OTop:=Screen height:C188/2
		$_l_ORight:=Screen width:C187/2
		$_l_OBottom:=Screen height:C188/2
		
	End if 
	//i coul make additional changes here to use not have this legacy window ref-but for the moment this is ithe first advance
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
	ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
	WIN_l_CurrentWinRef:=Open window:C153($_l_OLeft; $_l_OTop; $_l_OLeft; $_l_OTop; 1986)
	COLLECTION TO ARRAY:C1562($_Col_SelectionList; GEN_at_DropDownMenu)
	ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(GEN_al_DropDownMenuID))
	For ($_l_Fill; 1; Size of array:C274(GEN_al_DropDownMenuID))
		GEN_al_DropDownMenuID{$_l_Fill}:=$_l_Fill
	End for 
	GEN_Bo_ShowCreate:=$_bo_ShowCreate
	
	DIALOG:C40([USER:15]; "Gen_PopUpChoice")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	$_obj_PopUpParameters.Create:=Gen_bo_Create
	$_obj_PopUpParameters.ItemName:=GEN_at_DropDownMenu{GEN_at_DropDownMenu}
	//$0:=Gen_bo_Create
	//$2->:=GEN_at_DropDownMenu
End if 

