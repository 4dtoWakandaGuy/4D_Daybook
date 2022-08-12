If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable22
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SP_LB_Pipeline;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	//ARRAY TEXT(SP_at_ListboxEditMode;0)
	C_LONGINT:C283($_l_SelectedLine; LB_l_RowNumber)
	C_PICTURE:C286(SP_pic_LbEditModePicture)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable22"; Form event code:C388)

//LB_l_RowNumber is the last clicked row


If (SP_at_ListboxEditMode>0)
	Case of 
		: (SP_at_ListboxEditMode=1)
			//DB_SaveRecords here
			//AL_GetPrevCell (SP_PowerviewPIPE;bd36;bd37) ` todo: what to do about this?
			//AL_SetEntryOpts (SP_PowerviewPIPE;4;1;0;0;1)
			If (LB_l_RowNumber=0)
				LB_l_RowNumber:=1
			End if 
			//ALSetSelect1 (->SP_PowerviewPIPE;bd37)
			SP_LB_Pipeline:=LB_l_RowNumber
			LB_SetLine(->SP_LB_Pipeline; LB_l_RowNumber)
			OBJECT SET ENTERABLE:C238(SP_LB_Pipeline; False:C215)
			//GET PICTURE FROM LIBRARY(20261; SP_pic_LbEditModePicture)
			SP_pic_LbEditModePicture:=Get_Picture(20261)
			
		: (SP_at_ListboxEditMode=2)
			ARRAY LONGINT:C221($_al_Lines; 0)
			//$i:=AL_GetSelect (SP_PowerviewPIPE;$_al_Lines)
			LB_GetSelect(->SP_LB_Pipeline; ->$_al_Lines)
			
			If (Size of array:C274($_al_Lines)>0)
				$_l_SelectedLine:=$_al_Lines{1}
			Else 
				$_l_SelectedLine:=1
			End if 
			OBJECT SET ENTERABLE:C238(SP_LB_Pipeline; True:C214)
			//AL_SetEntryOpts (SP_PowerviewPIPE;2;1;0;0;1)
			GOTO OBJECT:C206(SP_LB_Pipeline)  // not ssure if this is really needed
			LB_GoToCell(->SP_LB_Pipeline; 1; $_l_SelectedLine)
			//AL_GotoCell (SP_PowerviewPIPE;1;$_l_SelectedLine)
			//GET PICTURE FROM LIBRARY(20260; SP_pic_LbEditModePicture)
			
			SP_pic_LbEditModePicture:=Get_Picture(20260)
	End case 
	
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable22"; $_t_oldMethodName)
