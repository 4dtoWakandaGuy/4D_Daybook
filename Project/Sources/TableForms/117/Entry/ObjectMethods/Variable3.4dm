If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Variable3
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
	//ARRAY INTEGER(EW_ai_ExportOrder;0)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY LONGINT(EW_al_DBTableNumbers;0)
	//ARRAY LONGINT(EW_al_ExportRecordNumbers;0)
	//ARRAY TEXT(EW_at_DBTableNames;0)
	//ARRAY TEXT(EW_at_TabControl;0)
	C_LONGINT:C283($_l_SizeofArray)
	C_REAL:C285(iLoc; OldTabControlEW)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Variable3"; Form event code:C388)
//AL_SetDrgSrc (eALDataExports;1;"")  ` disable dragging
//AL_SetDrgDst (eALDataExports;1;"")  ` disable dropping

Case of 
	: ((EW_at_TabControl=1) & (Records in selection:C76([EW_ExportSteps:118])=1) & ([EW_ExportSteps:118]BaseTablenumber:3=0))  // it's a new Export and they haven't selected a table
		FIRST RECORD:C50([EW_ExportSteps:118])  // in case it isn't the current record
		If ([EW_ExportSteps:118]BaseTablenumber:3=0)
			// so just abandon it
			DB_DeletionControl(->[EW_ExportSteps:118])
			
			DELETE RECORD:C58([EW_ExportSteps:118])
			$_l_SizeofArray:=Size of array:C274(EW_ai_ExportOrder)
			DELETE FROM ARRAY:C228(EW_ai_ExportOrder; $_l_SizeofArray)
			DELETE FROM ARRAY:C228(EW_al_DBTableNumbers; $_l_SizeofArray)
			DELETE FROM ARRAY:C228(EW_al_ExportRecordNumbers; $_l_SizeofArray)
			DELETE FROM ARRAY:C228(EW_at_DBTableNames; $_l_SizeofArray)
			
		End if 
		
	: ((EW_at_TabControl=2) & (Size of array:C274(EW_ai_ExportOrder)=0))
		DB_SaveRecord(->[EW_ExportSteps:118])
		
		EW_NewStep
		
	: ((EW_at_TabControl=2) & (Size of array:C274(EW_ai_ExportOrder)>0) & (OldTabControlEW=1))
		
		If (iLoc<1)
			iLoc:=1
			//AL_SetLine (eALDataExports;iLoc)
			LB_SetLine(->EW_lb_DataExports; iLoc)
		End if 
		EW_DisplayStep(EW_al_ExportRecordNumbers{iLoc})
		
		//  : (EW_at_TabControl=1) & (Size of array(EW_ai_StepDetailOrder)=0)
	: (OldTabControlEW=2) & (Size of array:C274(EW_ai_StepDetailOrder)=0)
		CONFIRM:C162("You haven't selected any Details for this Export."; "Delete Export"; "Add Details")
		If (OK=1)  // delete
			DB_SaveRecord(->[EW_ExportSteps:118])
			EW_DeleteStep([EW_ExportSteps:118]RecordNumber:6)
		Else 
			EW_at_TabControl:=2
			FORM GOTO PAGE:C247(2)
		End if 
		
	: (EW_at_TabControl=1)
		//    DB_SaveRecord(->[EW_ExportSteps])
		//    If (EW_bo_ModifiedStep)
		DB_SaveRecord(->[EW_ExportSteps:118])
		DB_SaveRecord(->[EW_ExportTables:120])
		EW_SaveSteps
		//   End if
		
	: (EW_at_TabControl=2) & (Size of array:C274(EW_ai_ExportOrder)>0) & (Size of array:C274(EW_ai_StepDetailOrder)=0)
		
		If (iLoc<1)
			iLoc:=1
			//AL_SetLine (eALDataExports;iLoc)
			LB_SetLine(->EW_lb_DataExports; iLoc)
		End if 
		EW_DisplayStep(EW_al_ExportRecordNumbers{iLoc})
		
End case 
OldTabControlEW:=EW_at_TabControl
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Variable3"; $_t_oldMethodName)
