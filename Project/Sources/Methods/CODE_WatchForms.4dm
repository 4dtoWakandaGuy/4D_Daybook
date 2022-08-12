//%attributes = {}
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      CODE_WatchForms
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/03/2017
	//Created BY: Nigel Greenlee
	
	////28/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
	//C_UNKNOWN(DIFF_SaveForm)
	ARRAY LONGINT:C221($_al_TableMod; 0)
	ARRAY LONGINT:C221($_al_TableStampTable; 0)
	ARRAY TEXT:C222($_at_arrPaths; 0)
	ARRAY TEXT:C222($_at_FormNames; 0)
	C_BOOLEAN:C305(<>SYS_bo_InExitMode; <>UNIT_bo_UnitTesting; $_Bo_isCompiled)
	C_DATE:C307($_Dte_ModificationDate)
	C_LONGINT:C283($_l_CurrentProcess; $_l_Index; $_l_Index2; $_l_LastTableNumber; $_l_Proc; $_l_Ref; $_l_stamp; $1)
	C_OBJECT:C1216($CORE_ob_FormObject; CORE_ob_FormObject)
	C_POINTER:C301($_Ptr_ptrTablePointer)
	C_TEXT:C284($_t_TableName; $_Txt_MethodName; $_txt_TableName; CORE_T_ParseFormName)
	C_TIME:C306($_ti_ModificationTime)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)
	$_l_CurrentProcess:=$1
Else 
	
	
	If (<>UNIT_bo_UnitTesting)
		
	End if 
	
End if 

//-------------------- Main Method -------------------

If ($_l_CurrentProcess=Current process:C322)
	//$_l_Proc:=New process("CODE_WatchForms";128000;"Watch Form Changes";Current process)
	
Else 
	$_Bo_isCompiled:=Is compiled mode:C492
	If (Not:C34($_Bo_isCompiled))
		//CODE_ManagerStructureExport (2)  //Makes sure the latest version of all Forms is exported
		//CODE_ManagerStructureExport (1)  //Makes sure the latest version of all Database settings is exported
		$_l_stamp:=0
		METHOD GET PATHS FORM:C1168($_at_arrPaths; ""; $_l_stamp)
		ARRAY LONGINT:C221($_al_TableMod; 0)
		ARRAY LONGINT:C221($_al_TableStampTable; 0)
		
		APPEND TO ARRAY:C911($_al_TableMod; $_l_stamp)
		APPEND TO ARRAY:C911($_al_TableStampTable; 0)
		
		
		
		While (Not:C34(<>SYS_bo_InExitMode))  //<<-uses a variable set on exit to stop this process
			
			FORM GET NAMES:C1167($_at_FormNames; ""; $_l_stamp)  //Project Forms
			$_al_TableMod{1}:=$_l_stamp
			$_l_Index:=Find in array:C230($_at_FormNames; CORE_T_ParseFormName)
			For ($_l_Index; 1; Size of array:C274($_at_FormNames))
				
				$_t_TableName:=""
				CORE_T_ParseFormName:=$_at_FormNames{$_l_Index}
				While (Semaphore:C143("CORE_EditingCodeManager"))  //lock other methods from altering the array 
					UTIL_DelayTicks(2)
				End while 
				
				FORM LOAD:C1103($_at_FormNames{$_l_Index})
				C_OBJECT:C1216($CORE_ob_FormObject)
				CLEAR VARIABLE:C89($CORE_ob_FormObject)
				CORE_GetFormObjects($_at_FormNames{$_l_Index}; 0; ->$CORE_ob_FormObject)
				
				If (UTIL_isComponentInstalled("DIFFComponent")) | (UTIL_isComponentInstalled("DIFF"))
					//DIFF_SaveForm ($_t_TableName;$_at_FormNames{$_l_Index};->$CORE_ob_FormObject)
					
					
				End if 
				CLEAR SEMAPHORE:C144("CORE_EditingCodeManager")  //Clear other methods to alter the array 
				
				
			End for 
			
			
			$_l_LastTableNumber:=Get last table number:C254
			For ($_l_Index; 1; $_l_LastTableNumber)
				$_txt_TableName:=Table name:C256($_l_Index)
				If (Is table number valid:C999($_l_Index))
					$_l_stamp:=0
					$_l_Ref:=Find in array:C230($_al_TableStampTable; $_l_Index)
					If ($_l_Ref>0)
						$_l_stamp:=$_al_TableMod{$_l_Ref}  // get the last stamp for this table
						
					Else 
						$_Ptr_ptrTablePointer:=Table:C252($_l_Index)
						
						FORM GET NAMES:C1167($_Ptr_ptrTablePointer->; $_at_FormNames; ""; $_l_stamp; *)
						APPEND TO ARRAY:C911($_al_TableMod; $_l_stamp)  //set the stamp
						APPEND TO ARRAY:C911($_al_TableStampTable; $_l_Index)
						$_l_Ref:=Size of array:C274($_al_TableMod)
					End if 
					$_Ptr_ptrTablePointer:=Table:C252($_l_Index)
					FORM GET NAMES:C1167($_Ptr_ptrTablePointer->; $_at_FormNames; ""; $_l_stamp; *)
					$_al_TableMod{$_l_Ref}:=$_l_stamp
					For ($_l_Index2; 1; Size of array:C274($_at_FormNames))
						C_OBJECT:C1216($CORE_ob_FormObject)
						CLEAR VARIABLE:C89($CORE_ob_FormObject)
						//parse the form-note that in this context we do not handle the form method or object scripts
						//ARRAY TEXT($_at_FormNames;0)
						CORE_T_ParseFormName:=$_at_FormNames{$_l_Index2}
						While (Semaphore:C143("CORE_EditingCodeManager"))  //lock other methods from altering the array 
							UTIL_DelayTicks(2)
						End while 
						
						FORM LOAD:C1103($_Ptr_ptrTablePointer->; $_at_FormNames{$_l_Index2})
						C_OBJECT:C1216($CORE_ob_FormObject)
						CLEAR VARIABLE:C89($CORE_ob_FormObject)
						
						CORE_GetFormObjects($_at_FormNames{$_l_Index2}; $_l_Index; ->$CORE_ob_FormObject)
						If (UTIL_isComponentInstalled("DIFFComponent"))
							//DIFF_SaveForm ($_txt_TableName;$_at_FormNames{$_l_Index2};->$CORE_ob_FormObject)
						End if 
						CLEAR SEMAPHORE:C144("CORE_EditingCodeManager")  //Clear other methods to alter the array 
						
						
					End for 
				End if 
			End for 
			UTIL_DelayTicks(30*60)
			
			
		End while 
	End if 
	
End if 