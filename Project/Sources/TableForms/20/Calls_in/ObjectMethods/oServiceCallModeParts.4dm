If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.Variable22
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SC_lb_PROD;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	//ARRAY LONGINT(SC_al_ModeParts;0)
	//ARRAY TEXT(SC_at_ModeParts;0)
	C_LONGINT:C283($_l_SelectedLine; LB_l_RowNumber)
	C_PICTURE:C286(SC_Pi_PartsMode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.Variable22"; Form event code:C388)




If (SC_at_ModeParts>0)
	Case of 
		: (SC_al_ModeParts{SC_at_ModeParts}=1)
			//DB_SaveRecords here
			//NG TODO
			//AL_GetPrevCell (SC_PowerviewPROD;bd36;bd37)
			//AL_SetEntryOpts (SC_PowerviewPROD;4;1;0;0;1)
			If (LB_l_RowNumber=0)
				LB_l_RowNumber:=1
			End if 
			LBi_SetSelect1(->SC_lb_PROD; LB_l_RowNumber)
			//GET PICTURE FROM LIBRARY(20261; SC_Pi_PartsMode)
			SC_Pi_PartsMode:=Get_Picture(20261)
		: (SC_al_ModeParts{SC_at_ModeParts}=2)
			ARRAY LONGINT:C221($_al_Lines; 0)
			
			
			//$i:=AL_GetSelect (SC_PowerviewPROD;$_al_Lines)
			LB_GetSelect(->SC_lb_PROD; ->$_al_Lines)
			
			If (Size of array:C274($_al_Lines)>0)
				$_l_SelectedLine:=$_al_Lines{1}
			Else 
				$_l_SelectedLine:=1
			End if 
			
			//AL_SetEntryOpts (SC_PowerviewPROD;2;1;0;0;1)
			GOTO OBJECT:C206(SC_lb_PROD)
			LB_GoToCell(->SC_lb_PROD; 1; $_l_SelectedLine)
			//GET PICTURE FROM LIBRARY(20260; SC_Pi_PartsMode)
			SC_Pi_PartsMode:=Get_Picture(20260)
			
	End case 
	
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.Variable22"; $_t_oldMethodName)
