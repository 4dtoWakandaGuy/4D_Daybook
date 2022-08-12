//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetActionCodesbyForm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/03/2010 19:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AttributeTypes; 0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	ARRAY TEXT:C222($_at_AttributeNames; 0)
	ARRAY TEXT:C222($_at_ObjectAttributeNames; 0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryEntryForm;0)
	//ARRAY TEXT(SD2_at_FormActionCodes;0)
	C_BOOLEAN:C305($_bo_LoadAllActions)
	C_LONGINT:C283($_l_FormPosition; $_l_FormPosition2; $_l_FormsFieldPosition; $_l_Index; SD2_l_InputActionClass)
	C_POINTER:C301($_ptr_ActionCodes; $_ptr_ActionNames; $2; $3)
	C_TEXT:C284($_t_EntryForm; $_t_FieldReferenceName; $_t_FormName; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetActionCodesbyForm")

//$_t_FormName is the name of the form -this may be an actual form or a virtual form but it will be from the list of form names loaded in SD2_LoadDiaryFOrmNames
//$2 is a pointer the array o put the action codes in
//$3 is a pointer to the array to put the action names in
//Note this method is to catch calls where there is no action code or range of action codes known
$_bo_LoadAllActions:=False:C215
If (Count parameters:C259>=3)
	$_t_FormName:=$1
	$_ptr_ActionCodes:=$2
	$_ptr_ActionNames:=$3
	ARRAY TEXT:C222($2->; 0)
	ARRAY TEXT:C222($3->; 0)
	//Get all the action codes which use the name-and are contextually available
	
	If ($_t_FormName#"")
		$_l_FormPosition:=Find in array:C230(SD2_at_DiaryEntryForm; $_t_FormName)  //Just to make sure we are looking for something valid
		If ($_l_FormPosition>0)
			//SD2_at_FormActionCodes is a 2D array
			If (Size of array:C274(SD2_at_FormActionCodes)<$_l_FormPosition)
				Repeat 
					INSERT IN ARRAY:C227(SD2_at_FormActionCodes; Size of array:C274(SD2_at_FormActionCodes)+1; 1)
				Until (Size of array:C274(SD2_at_FormActionCodes)=$_l_FormPosition)
			End if 
			If (Size of array:C274(SD2_at_FormActionCodes{$_l_FormPosition})>0)
				//they are known(note this reloads for every process so no need to worry about modifications)
			Else 
				//need to find them
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]xActionTypeID:10>=0)
				
				For ($_l_Index; 1; Records in selection:C76([ACTIONS:13]))
					//we want to find if the action uses this form-only the ones with this form on will appear
					OB GET PROPERTY NAMES:C1232([DIARY:12]Attributes:79; $_at_AttributeNames; $_al_AttributeTypes)
					
					$_t_FieldReferenceName:="Data Entry Form"
					$_l_FormsFieldPosition:=Find in array:C230($_at_ObjectAttributeNames; $_t_FieldReferenceName)
					
					If ($_l_FormsFieldPosition>0)
						$_t_EntryForm:=OB Get:C1224([DIARY:12]Attributes:79; $_t_FieldReferenceName)
						If ($_t_EntryForm=$_t_FormName)
							APPEND TO ARRAY:C911(SD2_at_FormActionCodes{$_l_FormPosition}; [ACTIONS:13]Action_Code:1)
						End if 
					End if 
					NEXT RECORD:C51([ACTIONS:13])
				End for 
				UNLOAD RECORD:C212([ACTIONS:13])
			End if 
			
			If (Size of array:C274(SD2_at_FormActionCodes{$_l_FormPosition})>0)
				QUERY WITH ARRAY:C644([ACTIONS:13]Action_Code:1; SD2_at_FormActionCodes{$_l_FormPosition})
				SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_ptr_ActionCodes->; [ACTIONS:13]Action_Name:2; $_ptr_ActionNames->)
			Else 
				$_bo_LoadAllActions:=True:C214  //no actions are set that specify this this form
			End if 
		Else 
			$_bo_LoadAllActions:=True:C214  // form name is invalid so load all actions
		End if 
		
	Else 
		//we have no clue what form so set up all the action codes available
		$_bo_LoadAllActions:=True:C214
	End if 
	If ($_bo_LoadAllActions)
		If (SD2_l_InputActionClass>0)  //we know the class of the action so only select actions of that class
			// the value here is 1 for schedule 2 for workflow(todo) and 4 for tab items and 8 for a timed function-and not displayed=-1
			If (False:C215)  //This code should not be needed now as there is a mether
				CREATE EMPTY SET:C140([ACTIONS:13]; "ClassMatch")
				ALL RECORDS:C47([ACTIONS:13])
				For ($_l_Index; 1; Records in selection:C76([ACTIONS:13]))
					SD2_ActionAttributesToArrays
					$_l_FormPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
					If ($_l_FormPosition>0)  //data not setup so presume is of right class(else nothing would appear!!)
						$_l_FormPosition2:=Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_FormPosition}; SD2_l_InputActionClass)
						If ($_l_FormPosition2>0)
							ADD TO SET:C119([ACTIONS:13]; "ClassMatch")
						End if 
					Else 
						ADD TO SET:C119([ACTIONS:13]; "ClassMatch")
					End if 
					
					NEXT RECORD:C51([ACTIONS:13])
					
				End for 
				UNLOAD RECORD:C212([ACTIONS:13])
				USE SET:C118("ClassMatch")
				CLEAR SET:C117("ClassMatch")
			Else 
				Case of 
					: (SD2_l_InputActionClass=1)
						SD2_GetActionsRangeByLocation("Schedule")
					: (SD2_l_InputActionClass=2)
						SD2_GetActionsRangeByLocation("Workflow")
					: (SD2_l_InputActionClass=4)
						SD2_GetActionsRangeByLocation("Diary Tabs Only")
					: (SD2_l_InputActionClass=4)
						SD2_GetActionsRangeByLocation("Timed Function")
				End case 
				//this will set the arrays SD2_at_ActionCodes and SD2_at_ActionNames
				$_l_FormPosition:=Find in array:C230(SD2_at_DiaryEntryForm; $_t_FormName)  //Just to make sure we are looking for something valid
				If ($_l_FormPosition>0)
					If (Size of array:C274(SD2_at_FormActionCodes)<$_l_FormPosition)
						Repeat 
							INSERT IN ARRAY:C227(SD2_at_FormActionCodes; Size of array:C274(SD2_at_FormActionCodes)+1; 1)
						Until (Size of array:C274(SD2_at_FormActionCodes)=$_l_FormPosition)
					End if 
					//We know that there are no stored values for this form
					For ($_l_Index; 1; Size of array:C274(SD2_at_ActionCodes))
						APPEND TO ARRAY:C911(SD2_at_FormActionCodes{$_l_FormPosition}; SD2_at_ActionCodes{$_l_Index})
					End for 
				End if 
				
			End if 
			QUERY WITH ARRAY:C644([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes)
			//i there are no records here there are no actions avaiable!!!!!
			
		Else 
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]xActionTypeID:10>=0)
			
		End if 
		SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_ptr_ActionCodes->; [ACTIONS:13]Action_Name:2; $_ptr_ActionNames->)
	End if 
End if 
ERR_MethodTrackerReturn("SD2_GetActionCodesbyForm"; $_t_oldMethodName)
