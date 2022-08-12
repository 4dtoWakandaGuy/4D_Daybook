If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable24
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
	//ARRAY BOOLEAN(SP_lb_Target;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	//ARRAY TEXT(SP_at_ListboxEditMode;0)
	//ARRAY TEXT(SP_at_TargetOwner;0)
	C_LONGINT:C283($_l_SelectedRow)
	C_PICTURE:C286(SP_pic_LbEditModePicture)
	C_REAL:C285(SP_PowerviewTarget)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable24"; Form event code:C388)




If (SP_at_ListboxEditMode>0)
	Case of 
		: (SP_at_ListboxEditMode=1)
			//DB_SaveRecords here
			
			If (SP_lb_Target=0)
				SP_lb_Target:=1
			End if 
			LBi_SetSelect1(->SP_PowerviewTarget; SP_lb_Target)
			//GET PICTURE FROM LIBRARY(20261; SP_pic_LbEditModePicture)
			SP_pic_LbEditModePicture:=Get_Picture(20261)
		: (SP_at_ListboxEditMode=2)
			ARRAY LONGINT:C221($_al_Lines; 0)
			//$i:=AL_GetSelect (SP_PowerviewTarget;$_al_Lines)
			LB_GetSelect(->SP_lb_Target; ->$_al_Lines)
			
			If (Size of array:C274($_al_Lines)>0)
				$_l_SelectedRow:=$_al_Lines{1}
			Else 
				$_l_SelectedRow:=1
			End if 
			
			//AL_SetEntryOpts (SP_PowerviewTarget;2;1;0;0;1)
			GOTO OBJECT:C206(SP_lb_Target)
			
			EDIT ITEM:C870(SP_at_TargetOwner; $_l_SelectedRow)
			OBJECT SET SCROLL POSITION:C906(SP_lb_Target; $_l_SelectedRow)
			
			//GET PICTURE FROM LIBRARY(20260; SP_pic_LbEditModePicture)
			SP_pic_LbEditModePicture:=Get_Picture(20260)
			
	End case 
	
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable24"; $_t_oldMethodName)
