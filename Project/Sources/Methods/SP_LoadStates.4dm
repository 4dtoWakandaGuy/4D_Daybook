//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_LoadStates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	C_LONGINT:C283($_l_AddedItemID; $_l_ListID; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_LoadStates")
Case of 
	: (Count parameters:C259>=1)
		Case of 
			: ($1=1)
				ARRAY TEXT:C222(SP_at_ListPipelineStatus; 0)
				ARRAY LONGINT:C221(SP_al_ListPipelineStatus; 0)
				$_l_ListID:=AA_LoadList(->[SALES_PROJECTION:113]Status:20; ->SP_at_ListPipelineStatus; ->SP_al_ListPipelineStatus; False:C215)
				If (Size of array:C274(SP_al_ListPipelineStatus)=0)
					$_l_AddedItemID:=AA_ListAddItem(->[SALES_PROJECTION:113]Status:20; "Projected Sale"; "Completed Sale"; "Lost Sale")
					$_l_ListID:=AA_LoadList(->[SALES_PROJECTION:113]Status:20; ->SP_at_ListPipelineStatus; ->SP_al_ListPipelineStatus; False:C215)
				End if 
			: ($1=2)
				$_l_ListID:=AA_GetListID(-1; -1; "Target Status"; "SP_S55_TargetStatus")
				ARRAY TEXT:C222(SP_at_ListPipelineStatus; 0)
				ARRAY LONGINT:C221(SP_al_ListPipelineStatus; 0)
				AA_LoadListbyID($_l_ListID; ->SP_at_ListPipelineStatus; ->SP_al_ListPipelineStatus; False:C215)
				If (Size of array:C274(SP_al_ListPipelineStatus)=0)
					$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Projection Target"; "Completed Target")
					AA_LoadListbyID($_l_ListID; ->SP_at_ListPipelineStatus; ->SP_al_ListPipelineStatus; False:C215)
				End if 
		End case 
		
	Else 
		ARRAY TEXT:C222(SP_at_ListPipelineStatus; 0)
		ARRAY LONGINT:C221(SP_al_ListPipelineStatus; 0)
		$_l_ListID:=AA_LoadList(->[SALES_PROJECTION:113]Status:20; ->SP_at_ListPipelineStatus; ->SP_al_ListPipelineStatus; False:C215)
		If (Size of array:C274(SP_al_ListPipelineStatus)=0)
			$_l_AddedItemID:=AA_ListAddItem(->[SALES_PROJECTION:113]Status:20; "Projected Sale"; "Completed Sale"; "Lost Sale")
			$_l_ListID:=AA_LoadList(->[SALES_PROJECTION:113]Status:20; ->SP_at_ListPipelineStatus; ->SP_al_ListPipelineStatus; False:C215)
		End if 
End case 
ERR_MethodTrackerReturn("SP_LoadStates"; $_t_oldMethodName)
