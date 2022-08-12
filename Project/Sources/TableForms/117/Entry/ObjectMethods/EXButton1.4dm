If (False:C215)
	//object Name: [EW_ExportProjects]Entry.EXButton1
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
	//ARRAY BOOLEAN(EW_lb_DataExports;0)
	//ARRAY BOOLEAN(EW_lb_StepDetails;0)
	ARRAY LONGINT:C221($_al_Selected; 0)
	//ARRAY LONGINT(EW_al_StepDetailRecordnos;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep)
	C_LONGINT:C283($_l_Index; $i)
	C_REAL:C285(iLoc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.EXButton1"; Form event code:C388)


ARRAY LONGINT:C221($_al_Selected; 0)
//$_l_Number:=AL_GetSelect (eALStepdetails;$_al_Selected)
LB_GetSelect(->EW_lb_StepDetails; ->$_al_Selected)
If (Size of array:C274($_al_Selected)<1)
	//  ALERT("Please select one or more Details to delete!")
	Gen_Alert("Please select one or more Details to delete!")
Else 
	If (Size of array:C274($_al_Selected)=1)
		CONFIRM:C162("Delete the selected Detail?"; "No"; "Yes")
	Else 
		CONFIRM:C162("Delete the selected Details?"; "No"; "Yes")
	End if 
	If (OK=0)
		CREATE SET:C116([EW_StepActions:119]; "use")
		CREATE SET:C116([EW_StepActions:119]; "delete")
		For ($_l_Index; 1; Size of array:C274($_al_Selected))
			QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]RecordNumber:2=EW_al_StepDetailRecordnos{$_al_Selected{$_l_Index}})
			ADD TO SET:C119([EW_StepActions:119]; "delete")
			DB_DeletionControl(->[EW_StepActions:119])
			
			DELETE RECORD:C58([EW_StepActions:119])
		End for 
		INTERSECTION:C121("use"; "delete"; "use")
		USE SET:C118("use")
		EW_DetailsArrays
		//AL_SetLine (eALStepdetails;1)
		LB_SetLine(->EW_lb_DataExports; iLoc)
		
		EW_bo_ModifiedStep:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.EXButton1"; $_t_oldMethodName)
