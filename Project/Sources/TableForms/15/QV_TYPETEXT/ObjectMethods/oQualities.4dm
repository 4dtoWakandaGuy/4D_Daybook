If (False:C215)
	//object Name: [USER]QV_TYPETEXT.oQualities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY BOOLEAN(QV_LB_Items;0)
	C_LONGINT:C283($_l_Column; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_SelectedRow; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_TYPETEXT.oQualities"; Form event code:C388)
//MESSAGE(String(ALProEvt))
$_l_Event:=Form event code:C388
$_l_Column:=LB_GetColumn(Self:C308)
$_l_SelectedRow:=Self:C308->
Case of 
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->QV_LB_Items; ""; $_t_VariableName)
		
	: ($_l_event=On Clicked:K2:4)  //did user single-click on a line?
		$_l_Column:=LB_GetColumn(->QV_LB_Items)
		$_l_SelectedRow:=Self:C308->
		//$_l_Column:=AL_GetColumn (QV_l_Powerview)
		//$_l_SelectedRow:=AL_GetLine (QV_l_Powerview)  `get the line the user selected
		Case of 
			: ($_l_Column=1) & ($_l_SelectedRow>0)
				QV_abo_include{$_l_SelectedRow}:=Not:C34(QV_abo_include{$_l_SelectedRow}=True:C214)
				//AL_UpdateArrays (QV_l_Powerview;-2)
		End case 
		
		
	: ($_l_Event=On Data Change:K2:15)  // is that right?
		$_l_Column:=LB_GetColumn(->QV_LB_Items)
		$_l_SelectedRow:=Self:C308->
		
		Case of 
			: (($_l_Column=3) | ($_l_Column=4)) & ($_l_SelectedRow>0)
				QV_abo_include{$_l_SelectedRow}:=Not:C34(QV_abo_include{$_l_SelectedRow}=True:C214)
				
		End case 
		
	Else 
		
		
End case 

LB_SetScroll(->QV_LB_Items; -2; -3)
ERR_MethodTrackerReturn("OBJ [USER].QV_TYPETEXT.oQualities"; $_t_oldMethodName)
